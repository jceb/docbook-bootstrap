#!/usr/bin/env make -f
.POSIX:
.SUFFIXES:

WATCHLOG="${XDG_RUNTIME_DIR}/watchman/log$(shell echo "${PWD}" | sed -e 's/ //g;s#/#_#g')"

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

ifndef xsl
xsl=docbook.xsl
endif

ifndef validate
validate=true
endif

# change "id" to the XML id of the new root element.  This makes it easy to
# build only parts of a larger document.  An empty id will build the whole
# document.  It can also be passed to make as a parameter:
# make id=XMLID
ifndef id
id=
endif

# you might want to specify some more ant options like additional/overridden
# properties.  Possible values are found in the build.properties files.
# PROJECT_OPTIONS="-Dsome.property=value"
ifndef PROJECT_OPTIONS
PROJECT_OPTIONS=
endif

# enable ant debugging by specifying
# DEBUG="-d"
ifndef DEBUG
DEBUG=
endif

#######################################
# DON'T CHANGE ANYTHING BELOW THIS LINE
#######################################

.PHONY: help
help:
	@ant -buildfile $(PATH_TO_DBOOTSTRAP)/build.xml $(DEBUG) -Dvalidate="$(validate)" -Dinput.dir="$(PWD)" -Dfile="$(PWD)/$<" -Dfo.stylesheet="$(PWD)/docbook.xsl" -Ddbootstrap.dir="$(PATH_TO_DBOOTSTRAP)" -Dfile.format="$(FORMAT)" -Dfile.suffix="$(SUFFIX)" -Dinput.dir="$(PWD)" -Doutput.dir="$(PWD)/$(OUPUT_DIR)" -Doutput.rootid=$(id) $(PROJECT_OPTIONS) help
	@echo
	@echo "Additional targets:"
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "     \033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: default ## Trigger ant's build (default) target

.PHONY: watch
watch: ## Start watchman to autobuild project
	mkdir -p $$(dirname "$(WATCHLOG)")
	echo '["watch", "${PWD}"]' | watchman -j
	echo '["trigger", "${PWD}", {"append_files": false, "command": ["make", "build", "in=$(in)", "id=$(id)"], "expression": ["anyof", ["match", ".docbook.xsl", "wholename"], ["match", "*.xsl", "wholename"], ["match", "*.adoc", "wholename"], ["match", "*.svg", "wholename"], ["match", "*.png", "wholename"]], "name": "build"}]' | watchman -j --logfile="$(WATCHLOG)"

.PHONY: watchlog
watchlog: ## Watch watchman log output
	tail -f "$(WATCHLOG)"

.PHONY: stopwatch
stopwatch: ## Stop watchman
	watchman watch-del "${PWD}"

# Expand dbootstrap.dir variable in xslt stylesheet .. since it's not
# possible/allowed for xslt to do it
docbook.xsl: .docbook.xsl
	cp "$<" "$@"
	sed -i \
		-e 's|{$$dbootstrap.dir}|$(PATH_TO_DBOOTSTRAP)|' \
		-e 's|{$$dbootstrap.xsl}|$(xsl)|' \
		-e 's|{$$current.dir}|${PWD}|' "$@"

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
	ant -buildfile $(PATH_TO_DBOOTSTRAP)/build.xml $(DEBUG) -Dvalidate="$(validate)" -Dinput.dir="$(PWD)" -Dfile="$(PWD)/$<" -Dfo.stylesheet="$(PWD)/docbook.xsl" -Ddbootstrap.dir="$(PATH_TO_DBOOTSTRAP)" -Dfile.format="$(FORMAT)" -Dfile.suffix="$(SUFFIX)" -Dinput.dir="$(PWD)" -Doutput.dir="$(PWD)/$(OUPUT_DIR)" -Doutput.rootid=$(id) $(PROJECT_OPTIONS) $@

.PHONY: Makefile
