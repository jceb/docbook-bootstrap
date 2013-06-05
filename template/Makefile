#!/usr/bin/make

# Adjust these variables to fit your environment
PATH_TO_DBOOTSTRAP=..
INPUT_FILE=article.xml
OUPUT_DIR=build

# you might want to specify some more ant options like additional/overridden
# properties, i.e. a custom FO stylesheet -Dfo.stylesheet=$(PWD)/docbook.xsl
PROJECT_OPTIONS=

# trigger the ant default target
default:

# withouth this rule, the wildcard rule below would break the makefile
$(INPUT_FILE):
	test -f $@

# Targets like pdf, epub, epub3, xhtml, xhtmlchunk, xhtml5, xhtml5chunk,
# validate, clean and test all work, you just have to type them.  Default target
# is pdf or whatever you have specified to be the default
%: $(INPUT_FILE)
	ant -buildfile $(PATH_TO_DBOOTSTRAP)/build.xml -Dfile=$(PWD)/$< -Doutput.dir=$(PWD)/$(OUPUT_DIR) $(PROJECT_OPTIONS) $@
