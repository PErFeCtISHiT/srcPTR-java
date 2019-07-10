/**
 * @file srcptr.cpp
 *
 * @copyright Copyright (C) 2015-2016 srcML, LLC. (www.srcML.org)
 *
 * This file is part of srcPtr.
 *
 * srcPtr is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * srcPtr is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with srcPtr.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <srcSAXEventDispatcher.hpp>
#include <srcSAXHandler.hpp>
#include <srcSAXHandler.hpp>

#include <srcPtrDeclPolicy.hpp>
#include <srcPtrPolicy.hpp>
#include <srcPtrPolicyTemplates.hpp>
#include <srcPtrUtilities.hpp>
#include <fstream>
#include <iostream>
#include <string>
#include <chrono>

#include <boost/program_options.hpp>
#include <dirent.h>
int fileCount = 0;
char childpath[1000][512];
void lsDir(const char *path,std::vector<char *> * files){
    DIR *dp = opendir(path);
    if(dp == nullptr){
        return;
    }
    struct dirent * filename;
    while ((filename = readdir(dp)) != nullptr){
        if(filename->d_type & DT_DIR){
            if(strcmp(filename->d_name,".")==0 || strcmp(filename->d_name,"..")==0)
                continue;
            fileCount++;
            sprintf(childpath[fileCount],"%s/%s",path,filename->d_name);
            lsDir(childpath[fileCount],files);
        } else if(strstr(filename->d_name,".java.xml")){
            fileCount++;
            sprintf(childpath[fileCount],"%s/%s",path,filename->d_name);
            files->push_back(childpath[fileCount]);
        }
    }
}
int main(int argc, char *argv[]) {

   namespace po = boost::program_options;
    memset(childpath,0,sizeof(childpath));
   po::options_description generic("Options");
   generic.add_options()
      ("help", "produce help message")
      ("graphviz,g", "generate graphViz output")
      ("timer,t", "measure time it takes srcPtr to execute")
      ("input", po::value<std::vector<std::string>>()->required(), "name of srcML file to analyze");

   po::options_description algorithms("Pointer Analysis Algorithms");
   algorithms.add_options()
      ("andersen,a", "use Andersen's pointer analysis algorithm.")
      ("steensgaard,s", "use Steensgaard's pointer analysis algorithm.");

   po::options_description desc;
   desc.add(generic).add(algorithms);

   po::positional_options_description p;
   p.add("input", -1);

   po::variables_map vm;
   po::store(po::command_line_parser(argc, argv).options(desc).positional(p).run(), vm); 

   if(vm.count("help")) {
      std::cout << desc << std::endl;
      return 0;
   }

   if(vm.count("input")) {
      auto start = std::chrono::high_resolution_clock::now();

      srcPtrDeclPolicy *declpolicy = new srcPtrDeclPolicy();
       std::vector<char *> files;
      lsDir(vm["input"].as<std::vector<std::string>>()[0].c_str(),&files);
      // First Run
       srcSAXEventDispatch::srcSAXEventDispatcher<> handler{declpolicy}; //TODO: correct policy usage
      for(const std::string& str : files) {
          srcSAXController control(str.c_str());
          declpolicy->data.filename = str;
          control.parse(&handler);
      }


      if(vm.count("timer")) {
         auto end = std::chrono::high_resolution_clock::now();
         std::cerr << "\n\n" << std::chrono::duration<double, std::milli>(end-start).count() << "ms passed from the first policy's execution." << std::endl;
         start = std::chrono::high_resolution_clock::now();
      }

      if(vm.count("andersen")) {
         srcPtrDeclPolicy::srcPtrDeclData declData = declpolicy->GetData();

         srcPtrAndersen *data;
         srcPtrPolicy<srcPtrAndersen> *policy = new srcPtrPolicy<srcPtrAndersen>(declData);

         // Second Run
          srcSAXEventDispatch::srcSAXEventDispatcher<> handler2{policy};
          for(const std::string& str : files) {
              srcSAXController control(str.c_str());
              control.parse(&handler2);
          }

          // Third Run
          int dbflag = sqlite3_open("srcptr.db",&srcDB);
          if(dbflag){
              fprintf(stderr, "Can't open database: %s \n", sqlite3_errmsg(srcDB));
              sqlite3_close(srcDB);
              exit(1);
          }
          int tableflag = sqlite3_exec(srcDB, "CREATE TABLE fieldAccess(accepterClass,accepterVariableName,senderClass,senderVariableName,\
							  constraint cons_01 unique (accepterClass,accepterVariableName,senderClass,senderVariableName));"
                  , nullptr, nullptr, reinterpret_cast<char **>(&srcDB));
          if (tableflag) printf("%s\n", srcDB);
          sqlite3_close(srcDB);
          policy->setThirdRun();
          for(const std::string& str : files) {
              srcSAXController control(str.c_str());
              control.parse(&handler2);
              policy->printResult();
          }
//         data = policy->GetData();
//          std::vector<DataDependency> *dependencies = policy->GetDataDependencies();
//         if(vm.count("graphviz"))
//            data->PrintGraphViz();
//         else
//            data->Print();

      } else if(vm.count("steensgaard")) {

         srcPtrDeclPolicy::srcPtrDeclData declData = declpolicy->GetData();

         srcPtrSteensgaard *data;
         srcPtrPolicy<srcPtrSteensgaard> *policy = new srcPtrPolicy<srcPtrSteensgaard>(declData);

         // Second Run
         srcSAXController control2(vm["input"].as<std::vector<std::string>>()[0].c_str());
         srcSAXEventDispatch::srcSAXEventDispatcher<> handler2{policy};
         control2.parse(&handler2);

         data = policy->GetData();
         if(vm.count("graphviz"))
            data->PrintGraphViz();
         else
            data->Print();   

      } else {
         srcPtrPolicy<srcPtrEmptyAlgorithm> *policy = new srcPtrPolicy<srcPtrEmptyAlgorithm>(declpolicy->GetData());


         // Second Run
         srcSAXController control2(vm["input"].as<std::vector<std::string>>()[0].c_str());
         srcSAXEventDispatch::srcSAXEventDispatcher<> handler2{policy};
         control2.parse(&handler2);

         std::cout << "You specified no algorithm so no pointer data was collected. Please specify an algorithm as defined in --help." << std::endl;
      }

      if(vm.count("timer")) {
         auto end = std::chrono::high_resolution_clock::now();
         std::cerr << "\n\n" << std::chrono::duration<double, std::milli>(end-start).count() << "ms passed from the second policy's execution." << std::endl;
      }
   }

   return 0;
}