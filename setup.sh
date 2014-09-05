#!/bin/bash
# set up or update docbook build environment

set -e

echo 'Downloading docbook-bootstrap dependencies.'
echo

java -version &> /dev/null || echo "Unable to locate java.  Please make sure it's installed." && exit 1

mkdir -p lib/fonts
cd lib

mkdir -p ISO690_bibliography
wget -O ISO690_bibliography/doc.html "http://markmail.org/download.xqy?id=n2qumyhk2togibuf&number=1"

[ -e apache-ant-1.9.4 ] && rm -rf apache-ant-1.9.4
[ -e apache-ant ] && rm apache-ant
wget 'http://mirror.nexcess.net/apache//ant/binaries/apache-ant-1.9.4-bin.tar.gz'
tar xzf apache-ant-1.9.4-bin.tar.gz
rm apache-ant-1.9.4-bin.tar.gz
ln -s apache-ant-1.9.4 apache-ant

[ -e ant-contrib ] && rm -rf ant-contrib
wget -O ant-contrib-1.0b3-src.tar.gz 'http://downloads.sourceforge.net/project/ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3-src.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fant-contrib%2Ffiles%2Fant-contrib%2F1.0b3%2F&ts=1409909120&use_mirror=sunet'
tar xzf ant-contrib-1.0b3-src.tar.gz
rm ant-contrib-1.0b3-src.tar.gz

[ -e fop-1.1 ] && rm -rf fop-1.1
[ -e fop ] && rm fop
wget 'http://mirror.sdunix.com/apache/xmlgraphics/fop/binaries/fop-1.1-bin.tar.gz'
tar xzf fop-1.1-bin.tar.gz
rm fop-1.1-bin.tar.gz
ln -s fop-1.1 fop

[ -e offo-hyphenation-binary ] && rm -rf offo-hyphenation-binary
wget -O offo-hyphenation-binary.zip 'http://downloads.sourceforge.net/project/offo/offo-hyphenation/2.1/offo-hyphenation-binary.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Foffo%2F&ts=1409909292&use_mirror=softlayer-ams'
unzip offo-hyphenation-binary.zip
rm offo-hyphenation-binary.zip

[ -e saxon9 ] && rm -rf saxon9
wget -O SaxonHE9-5-1-7J.zip 'http://downloads.sourceforge.net/project/saxon/Saxon-HE/9.5/SaxonHE9-5-1-7J.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsaxon%2Ffiles%2FSaxon-HE%2F9.5%2F&ts=1409909692&use_mirror=netcologne'
mkdir saxon9
cd saxon9
unzip ../SaxonHE9-5-1-7J.zip
ln -s saxon9he.jar saxon9.jar
cd ..
rm SaxonHE9-5-1-7J.zip

[ -e jing-20091111 ] && rm -rf jing-20091111
[ -e jing ] && rm jing
wget 'https://jing-trang.googlecode.com/files/jing-20091111.zip'
unzip jing-20091111.zip
rm jing-20091111.zip
ln -s jing-20091111 jing

[ -e docbook-xsl-1.78.1 ] && rm -rf docbook-xsl-1.78.1
[ -e docbook-xsl ] && rm docbook-xsl
wget -O docbook-xsl-1.78.1.zip 'http://downloads.sourceforge.net/project/docbook/docbook-xsl/1.78.1/docbook-xsl-1.78.1.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fdocbook%2Ffiles%2Fdocbook-xsl%2F1.78.1%2F&ts=1409909425&use_mirror=cznic'
unzip docbook-xsl-1.78.1.zip
rm docbook-xsl-1.78.1.zip
ln -s docbook-xsl-1.78 docbook-xsl

mkdir -p docbook.rng
wget -O docbook.rng/docbook.rng 'http://www.docbook.org/xml/5.0/rng/docbook.rng'
