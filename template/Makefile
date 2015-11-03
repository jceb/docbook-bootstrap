#!/usr/bin/make -f

# Adjust these variables to fit your environment
# PATH_TO_DBOOTSTRAP="../docbook-bootstrap"
PATH_TO_DBOOTSTRAP=$(value DOCBOOK_BOOTSTRAP_PATH)
ifeq ($(PATH_TO_DBOOTSTRAP),)
PATH_TO_DBOOTSTRAP=x
endif
OUPUT_DIR=build

# change "in" to the main file of the project it can also be passed to make as
# an argument to quickly convert another file:
# make in=FILE
ifndef in
in=article.xml
endif

# change "id" to the XML id of the new root element.  This makes it easy to
# build only parts of a larger document.  An empty id will build the whole
# document.  It can also be passed to make as a parameter:
# make id=XMLID
ifndef id
id=
endif

# you might want to specify some more ant options like additional/overridden
# properties, i.e. a custom doctype -Dfile.doctype=book for Asciidoc
# PROJECT_OPTIONS="-Dfile.doctype=book"
PROJECT_OPTIONS=

#######################################
# DON'T CHANGE ANYTHING BELOW THIS LINE
#######################################

# trigger the ant default target
default:

# start watchman to autobuild project
watch:
	echo '["trigger", "${PWD}", {"append_files": false, "command": ["make", "in=$(in)", "id=$(id)"], "expression": ["anyof", ["match", ".docbook.xsl", "wholename"], ["match", "*.xsl", "wholename"], ["match", "*.adoc", "wholename"], ["match", "*.svg", "wholename"], ["match", "*.png", "wholename"]], "name": "build"}]' | watchman -j

stopwatch:
	watchman watch-del .

# Expand dbootstrap.dir variable in xslt stylesheet .. since it's not
# possible/allowed for xslt to do it
docbook.xsl: .docbook.xsl
	sed -e 's|{$$dbootstrap.dir}|$(PATH_TO_DBOOTSTRAP)|' "$<" > "$@"

.docbook.xsl:
	test -f $@

# withouth this rule, the wildcard rule below would break the makefile
$(in):
	test -f $@

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
ifeq ($(SUFFIX), .xml)
 FORMAT=docbook
else
 # use the file extension as file type - see `pandoc --help` for supported input
 # formats, i.e. docx, epub, haddock, html, json, opml, org, rst, t2t, textile,
 # twiki and several markdown dialects
 FORMAT=$(subst .,,$(SUFFIX))
endif
endif
endif
endif
endif

# Targets like pdf, epub, epub3, xhtml, xhtmlchunk, xhtml5, xhtml5chunk,
# validate, clean and test all work, you just have to type them.  The default
# target is pdf or whatever you have specified to be the default
%: $(in) docbook.xsl
	ant -buildfile $(PATH_TO_DBOOTSTRAP)/build.xml -Dfile="$(PWD)/$<" -Dfo.stylesheet="$(PWD)/docbook.xsl" -Ddbootstrap.dir="$(PATH_TO_DBOOTSTRAP)" -Dfile.format="$(FORMAT)" -Dfile.suffix="$(SUFFIX)" -Doutput.dir="$(PWD)/$(OUPUT_DIR)" -Doutput.rootid=$(id) $(PROJECT_OPTIONS) $@

.PHONY: Makefile
