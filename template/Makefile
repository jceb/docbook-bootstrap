#!/usr/bin/make

# Adjust these variables
PATH_TO_DBOOTSTRAP=..
INPUT_FILE=article.xml
OUPUT_DIR=build
# you might want to specify some more options like
PROJECT_OPTIONS=

default: $(INPUT_FILE)
	ant -buildfile $(PATH_TO_DBOOTSTRAP)/build.xml -Dfile=$(PWD)/$< -Doutput.dir=$(PWD)/$(OUPUT_DIR) $(PROJECT_OPTIONS) $@

# Targets like pdf, epub, epub3, xhtml, xhtmlchunk, xhtml5, xhtml5chunk,
# validate, clean and test all work, you just have to type them.  Default target
# is pdf or whatever you have specified to be the default
%: $(INPUT_FILE)
	ant -buildfile $(PATH_TO_DBOOTSTRAP)/build.xml -Dfile=$(PWD)/$< -Doutput.dir=$(PWD)/$(OUPUT_DIR) $(PROJECT_OPTIONS) $@
