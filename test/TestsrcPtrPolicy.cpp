#include <srcSAXEventDispatcher.hpp>
#include <srcSAXHandler.hpp>
#include <srcSAXHandler.hpp>

#include <srcPtrDeclPolicy.hpp>
#include <srcPtrPolicy.hpp>
#include <srcPtrPolicyData.hpp>

#include <fstream>
#include <iostream>
#include <string>
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
	srcml_unit_set_filename(unit, "testsrcType.cpp");

	srcml_unit_parse_memory(unit, str.c_str(), str.size());
	srcml_archive_write_unit(archive, unit);

	srcml_unit_free(unit);
	srcml_archive_close(archive);
	srcml_archive_free(archive);
	
	return std::string(ch);
}

int main() {
	std::string codestr = "int main() {\nint x;\nint * y;\ny = &x;\n}";
	std::string srcmlstr = StringToSrcML(codestr);
	//std::cout<< srcmlstr;

	// First Run
	srcPtrDeclPolicy *declpolicy = new srcPtrDeclPolicy();
	srcSAXController control(srcmlstr);
	srcSAXEventDispatch::srcSAXEventDispatcher<> handler{declpolicy};
	control.parse(&handler);

	// Second Run
	srcPtrPolicy *policy = new srcPtrPolicy(declpolicy->GetData(), new srcPtrDataMap());
	srcSAXController control2(srcmlstr);
	srcSAXEventDispatch::srcSAXEventDispatcher<> handler2{policy};
	control2.parse(&handler2);

	srcPtrData const *data = policy->GetData();
	assert(data->GetPointers().size() == 1);
	assert(data->GetPointsTo(data->GetPointers()[0]).size() == 1);
	assert(data->GetPointsTo(data->GetPointers()[0])[0].nameofidentifier == "x");
	 

	return 0;
}