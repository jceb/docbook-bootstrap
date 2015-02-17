#!/usr/bin/make -f

# Adjust these variables to fit your environment
# PATH_TO_DBOOTSTRAP="../docbook-bootstrap"
PATH_TO_DBOOTSTRAP=$(DOCBOOK_BOOTSTRAP_PATH)
ifndef
PATH_TO_DBOOTSTRAP=x
endif
OUPUT_DIR=build

# change in to the main file of the project
# it can also be passed to make as an argument:
# make in=FILE
ifndef
in=article.xml
endif

# you might want to specify some more ant options like additional/overridden
# properties, i.e. a custom FO stylesheet -Dfo.stylesheet=$(PWD)/docbook.xsl
# PROJECT_OPTIONS="-Dfo.stylesheet=$(PWD)/docbook.xsl"
PROJECT_OPTIONS=

#######################################
# DON'T CHANGE ANYTHING BELOW THIS LINE
#######################################

# trigger the ant default target
default:

# withouth this rule, the wildcard rule below would break the makefile
$(in):
	test -f $@

FORMAT=docbook
SUFFIX=$(suffix $(in))
ifeq ($(SUFFIX), .adoc)
 FORMAT=asciidoc
else
ifeq ($(SUFFIX), .mkd)
 FORMAT=markdown
else
ifeq ($(SUFFIX), .md)
 FORMAT=markdown
else
ifeq ($(SUFFIX), .tex)
 FORMAT=latex
else
 # use the file extension as file type - see `pandoc --help` for supported input
 # formats, i.e. docx, epub, haddock, html, json, opml, org, rst, t2t, textile,
 # twiki and several markdown dialects
 FORMAT=$(subst .,,$(SUFFIX))
endif
endif
endif
endif

# Targets like pdf, epub, epub3, xhtml, xhtmlchunk, xhtml5, xhtml5chunk,
# validate, clean and test all work, you just have to type them.  The default
# target is pdf or whatever you have specified to be the default
%: $(in)
	ant -buildfile $(PATH_TO_DBOOTSTRAP)/build.xml -Dfile=$(PWD)/$< -Dfile.format=$(FORMAT) -Dfile.suffix=$(SUFFIX) -Doutput.dir=$(PWD)/$(OUPUT_DIR) $(PROJECT_OPTIONS) $@

.PHONY: Makefile
