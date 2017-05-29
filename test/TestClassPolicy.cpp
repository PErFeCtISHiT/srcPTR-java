#include <srcSAXEventDispatcher.hpp>
#include <srcSAXHandler.hpp>
#include <srcSAXHandler.hpp>
#include <srcPtrUtilities.hpp>
#include <ClassPolicy.hpp>
#include <cassert>
#include <srcml.h>

std::string StringToSrcML(std::string str){
	struct srcml_archive* archive;
	struct srcml_unit* unit;
	size_t size = 0;

	char *ch = new char[str.size()];

	archive = srcml_archive_create();
	srcml_archive_enable_option(archive, SRCML_OPTION_POSITION);
	srcml_archive_write_open_memory(archive, &ch, &size);

	unit = srcml_unit_create(archive);
	srcml_unit_set_language(unit, SRCML_LANGUAGE_CXX);
	srcml_unit_set_filename(unit, "testClassPolicy.cpp");

	srcml_unit_parse_memory(unit, str.c_str(), str.size());
	srcml_archive_write_unit(archive, unit);
	
	srcml_unit_free(unit);
	srcml_archive_close(archive);
	srcml_archive_free(archive);
	//TrimFromEnd(ch, size);
	return std::string(ch);
}

class TestClassPolicy : public srcSAXEventDispatch::PolicyDispatcher, public srcSAXEventDispatch::PolicyListener{
    public:

        ~TestClassPolicy() { }

        TestClassPolicy(std::initializer_list<srcSAXEventDispatch::PolicyListener *> listeners = {}) : srcSAXEventDispatch::PolicyDispatcher(listeners) { }

        void Notify(const PolicyDispatcher * policy, const srcSAXEventDispatch::srcSAXEventContext & ctx) override {
            classdata = *policy->Data<Class>();
            datatotest.push_back(classdata);
        }

		void RunTest(){
			assert(datatotest[0].className == "foo");
			assert(datatotest[0].members[0].nameofidentifier == "x");
			assert(datatotest[0].methods[0].functionName == "f");
		}
    protected:

        void * DataInner() const override {
            return (void*)0;
        }

    private:

        ClassPolicy classpolicy;
        Class classdata;
        std::vector<Class> datatotest;

};

int main(int argc, char** filename){
	std::string codestr = "class foo { \n public: \n void f() { int y; } \n int x;};";
	std::string srcmlstr = StringToSrcML(codestr);
	
	try {
    	TestClassPolicy classdata;
    	srcSAXController control(srcmlstr);
    	srcSAXEventDispatch::srcSAXEventDispatcher<ClassPolicy> handler { &classdata };
    	control.parse(&handler); //Start parsing
    	classdata.RunTest();
    } catch(SAXError e) {
		std::cerr << e.message;
	}
}
