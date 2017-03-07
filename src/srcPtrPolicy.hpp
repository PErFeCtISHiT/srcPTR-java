#ifndef INCLUDED_SRC_PTR_POLICY_HPP
#define INCLUDED_SRC_PTR_POLICY_HPP

#include <DeclTypePolicy.hpp>
#include <FunctionCallPolicy.hpp>
#include <FunctionSignaturePolicy.hpp>
#include <srcSAXEventDispatcher.hpp>
#include <srcSAXHandler.hpp>

#include <srcPtrDeclPolicy.hpp>
#include <srcPtrUtilities.hpp>

#include <algorithm>
#include <exception>
#include <iostream>
#include <map>
#include <string>
#include <vector>

/*
Template must implement:
   virtual void AddPointsToRelationship(srcPtrVar, srcPtrVar);
   virtual void AddAssignmentRelationship(srcPtrVar, srcPtrVar);
   virtual void Print();
   virtual void PrintGraphViz();
   virtual std::vector<srcPtrVar> GetPointsTo(srcPtrVar);
   virtual std::vector<srcPtrVar> GetPointers();
   virtual srcPtrData *Clone();
*/

template <class T>
class srcPtrPolicy : public srcSAXEventDispatch::EventListener, public srcSAXEventDispatch::PolicyDispatcher, public srcSAXEventDispatch::PolicyListener {
public:
   ~srcPtrPolicy() {
      delete data;
      delete declTypePolicy;
      delete callPolicy;
      delete funcSigPolicy;
   }
   srcPtrPolicy(srcPtrDeclPolicy::srcPtrDeclData decldata, std::initializer_list<srcSAXEventDispatch::PolicyListener *> listeners = {}) : srcSAXEventDispatch::PolicyDispatcher(listeners) {
      declData = decldata;
      declared.CreateFrame();

      declTypePolicy = new DeclTypePolicy({this});
      callPolicy = new CallPolicy({this});
      funcSigPolicy = new FunctionSignaturePolicy({this});

      InitializeEventHandlers();
   }

   void Notify(const PolicyDispatcher *policy, const srcSAXEventDispatch::srcSAXEventContext &ctx) override {
      if (typeid(DeclTypePolicy) == typeid(*policy)) {
         DeclTypePolicy::DeclTypeData declarationData = *policy->Data<DeclTypePolicy::DeclTypeData>();
         declared.AddVarToFrame(srcPtrVar(declarationData));

         if(withinDeclAssignment)   //Pointer assignment on initialization
            ResolveAssignment(declarationData, "", lhs, "");   //TODO: take into account modifiers
      } else if (typeid(CallPolicy) == typeid(*policy)) {
         CallPolicy::CallData callData = *policy->Data<CallPolicy::CallData>();

         std::string calledFuncName;
         std::vector<std::string> params;
         bool pickedUpFuncName = false;
         for(auto it = callData.callargumentlist.begin(); it != callData.callargumentlist.end(); ++it) {
            if((*it != "(") && (*it != ")")) {
               if(!pickedUpFuncName) {
                  pickedUpFuncName = true;
                  calledFuncName = *it;
               }
               else
                  params.push_back(*it);
            }
         }

         srcPtrFunction called = declData.functionTracker.GetFunction(calledFuncName, params.size());

         int i = 0;
         for(auto it = params.begin(); it != params.end(); ++it) {
            if(called.parameters.size() < i) {
               std::string name = *it;
               srcPtrVar var1 = called.parameters[i];
               srcPtrVar var2 = declared.GetPreviousOccurence(name);

               ResolveAssignment(var1, "", var2, ""); //TODO: take into account modifiers
               ++i;
            }
         }
      } else if (typeid(FunctionSignaturePolicy) == typeid(*policy)) {
         FunctionSignaturePolicy::SignatureData signatureData = *policy->Data<FunctionSignaturePolicy::SignatureData>();
         srcPtrFunction funcSig = signatureData;
         for(srcPtrVar var : funcSig.parameters) {
            declared.AddVarToFrame(var);
         }
      }
   }

   T *GetData() {
      T *p = &data;
      return p;
   }

protected:
   void *DataInner() const override {
      return data.Clone();
   }

private:
   T data;

   // Code information
   srcPtrDeclPolicy::srcPtrDeclData declData;
   srcPtrDeclStack declared;

   // Policies
   DeclTypePolicy *declTypePolicy;
   CallPolicy *callPolicy;
   FunctionSignaturePolicy *funcSigPolicy;

   // For use in collecting assignments
   srcPtrVar lhs;
   std::string modifierlhs;
   srcPtrVar rhs;
   std::string modifierrhs;

   bool assignmentOperator = false;
   bool withinDeclAssignment = false;

   void ResetVariables() {
      lhs.Clear();
      rhs.Clear();
      assignmentOperator = false;
      modifierlhs = "";
      modifierrhs = "";
      withinDeclAssignment = false;
   }

   void ResolveAssignment(srcPtrVar left, std::string modifierleft, srcPtrVar right, std::string modifierright) {
      if(!rhs.empty()) {
         if(left.isPointer && (modifierleft != "*")) {
            if(modifierright == "&")
               data.AddPointsToRelationship(left, right);
            else
               data.AddAssignmentRelationship(left, right);
         }
         else if (left.isReference) {
            data.AddPointsToRelationship(left, right);
         }
      }
   }

   void InitializeEventHandlers() {
      using namespace srcSAXEventDispatch;

      openEventMap[ParserState::archive] = [this](srcSAXEventContext &ctx) {
         ctx.dispatcher->AddListenerDispatch(declTypePolicy);
         ctx.dispatcher->AddListenerDispatch(callPolicy);
         ctx.dispatcher->AddListenerDispatch(funcSigPolicy);
      };

      openEventMap[ParserState::block] = [this](srcSAXEventContext &ctx) { declared.CreateFrame(); };

      closeEventMap[ParserState::block] = [this](srcSAXEventContext &ctx) { declared.PopFrame(); };

      //
      // Collecting pointer assignment data
      //

      openEventMap[ParserState::exprstmt] = [this](srcSAXEventContext &ctx) { ResetVariables(); };
      openEventMap[ParserState::declstmt] = [this](srcSAXEventContext &ctx) { ResetVariables(); };

      closeEventMap[ParserState::name] = [this](srcSAXEventContext &ctx) {
         if (ctx.IsOpen(ParserState::expr)) {
            if (lhs.nameofidentifier == "") {
               srcPtrVar decl = declared.GetPreviousOccurence(ctx.currentToken);
               lhs = decl;

            } else {
               srcPtrVar decl = declared.GetPreviousOccurence(ctx.currentToken);
               rhs = decl;
            }
         }
      };

      closeEventMap[ParserState::op] = [this](srcSAXEventContext &ctx) {
         if ((ctx.currentToken == "=") && (lhs.nameofidentifier != ""))
            assignmentOperator = true;
         else if ((lhs.nameofidentifier == ""))
            modifierlhs = ctx.currentToken;
         else if ((rhs.nameofidentifier == ""))
            modifierrhs = ctx.currentToken;
      };

      closeEventMap[ParserState::init] = [this](srcSAXEventContext &ctx) {
         withinDeclAssignment = true;
      };

      closeEventMap[ParserState::exprstmt] = [this](srcSAXEventContext &ctx) {
         if(assignmentOperator)
            ResolveAssignment(lhs, modifierlhs, rhs, modifierrhs);
         ResetVariables();
      };

      closeEventMap[ParserState::archive] = [this](srcSAXEventContext &ctx) { // End of Policy
         ctx.dispatcher->RemoveListenerDispatch(declTypePolicy);
         ctx.dispatcher->RemoveListenerDispatch(callPolicy);
         ctx.dispatcher->RemoveListenerDispatch(funcSigPolicy);
         NotifyAll(ctx);
      };
   }
};

#endif
