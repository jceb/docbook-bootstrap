#!/bin/bash
# set up or update docbook build environment

set -e

dir="$(readlink -f "$(dirname $0)")"
cd "${dir}"

echo 'Downloading docbook-bootstrap dependencies.'
echo

which java &> /dev/null || (echo "Unable to locate java.  Please make sure it's installed." && exit 1)

mkdir -p lib/fonts
cd lib
cat > fonts/compile.sh <<"END"
#!/bin/sh
for font in *.ttf; do
	java -cp "../fop/build/fop.jar:../fop/lib/avalon-framework-4.2.0.jar:../fop/lib/batik-all-1.7.jar:../fop/lib/commons-io-1.3.1.jar:../fop/lib/commons-logging-1.0.4.jar:../fop/lib/serializer-2.7.0.jar:../fop/lib/xalan-2.7.0.jar:../fop/lib/xercesImpl-2.7.1.jar:../fop/lib/xml-apis-1.3.04.jar:../fop/lib/xml-apis-ext-1.3.04.jar:../fop/lib/xmlgraphics-commons-1.5.jar" org.apache.fop.fonts.apps.TTFReader "${font}" "${font%.ttf}.xml"
done
END
chmod a+x fonts/compile.sh

mkdir -p ISO690_bibliography
wget -O ISO690_bibliography/doc.html "http://markmail.org/download.xqy?id=n2qumyhk2togibuf&number=1"

[ -e ant-contrib ] && rm -rf ant-contrib
wget -O ant-contrib-1.0b3-src.tar.gz 'http://downloads.sourceforge.net/project/ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fant-contrib%2Ffiles%2Fant-contrib%2F1.0b3%2F&ts=1410288260&use_mirror=kent'
tar xzf ant-contrib-1.0b3-src.tar.gz
rm ant-contrib-1.0b3-src.tar.gz

[ -e fop-1.1 ] && rm -rf fop-1.1
[ -e fop ] && rm fop
wget 'http://mirror.sdunix.com/apache/xmlgraphics/fop/binaries/fop-1.1-bin.tar.gz'
tar xzf fop-1.1-bin.tar.gz
rm fop-1.1-bin.tar.gz
ln -sf fop-1.1 fop

[ -e offo-hyphenation-binary ] && rm -rf offo-hyphenation-binary
wget -O offo-hyphenation-binary.zip 'http://downloads.sourceforge.net/project/offo/offo-hyphenation/2.1/offo-hyphenation-binary.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Foffo%2F&ts=1409909292&use_mirror=softlayer-ams'
unzip offo-hyphenation-binary.zip
rm offo-hyphenation-binary.zip

[ -e saxon9 ] && rm -rf saxon9
wget -O SaxonHE9-5-1-7J.zip 'http://downloads.sourceforge.net/project/saxon/Saxon-HE/9.5/SaxonHE9-5-1-7J.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsaxon%2Ffiles%2FSaxon-HE%2F9.5%2F&ts=1409909692&use_mirror=netcologne'
mkdir saxon9
cd saxon9
unzip ../SaxonHE9-5-1-7J.zip
ln -sf saxon9he.jar saxon9.jar
cd ..
rm SaxonHE9-5-1-7J.zip

[ -e jing-20091111 ] && rm -rf jing-20091111
[ -e jing ] && rm jing
wget 'https://jing-trang.googlecode.com/files/jing-20091111.zip'
unzip jing-20091111.zip
rm jing-20091111.zip
ln -sf jing-20091111 jing

[ -e docbook-xsl-1.78.1 ] && rm -rf docbook-xsl-1.78.1
[ -e docbook-xsl ] && rm docbook-xsl
wget -O docbook-xsl-1.78.1.zip 'http://downloads.sourceforge.net/project/docbook/docbook-xsl/1.78.1/docbook-xsl-1.78.1.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fdocbook%2Ffiles%2Fdocbook-xsl%2F1.78.1%2F&ts=1409909425&use_mirror=cznic'
unzip docbook-xsl-1.78.1.zip
rm docbook-xsl-1.78.1.zip
ln -sf docbook-xsl-1.78.1 docbook-xsl

[ -e jeuclid-fop-3.1.9 ] && rm -rf jeuclid-fop-3.1.9
[ -e jeuclid-fop ] && rm jeuclid-fop
wget -O jeuclid-fop-3.1.9.zip 'http://downloads.sourceforge.net/project/jeuclid/3.1.x/3.1.9/jeuclid-fop-3.1.9-distribution.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fjeuclid%2Ffiles%2F3.1.x%2F3.1.9%2F&ts=1422986063&use_mirror=softlayer-ams'
unzip jeuclid-fop-3.1.9.zip
rm jeuclid-fop-3.1.9.zip
ln -sf jeuclid-fop-3.1.9 jeuclid-fop
ln -s $PWD/jeuclid-fop/*.jar fop/lib/

mkdir -p docbook.rng
wget -O docbook.rng/docbook.rng 'http://www.docbook.org/xml/5.0/rng/docbook.rng'

wget -O db4-upgrade.xsl 'https://docbook.svn.sourceforge.net/svnroot/docbook/trunk/docbook/relaxng/tools/db4-upgrade.xsl'

# finally, generate a titlepage template
cd ..
stylesheets/fo/generate-titlepage
