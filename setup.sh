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
	java -cp "../fop/build/fop.jar:../fop/lib/avalon-framework-api-4.3.1.jar:../fop/lib/batik-all-1.8.jar:../fop/lib/commons-io-1.3.1.jar:../fop/lib/commons-logging-1.0.4.jar:../fop/lib/serializer-2.7.0.jar:../fop/lib/xalan-2.7.2.jar:../fop/lib/xercesImpl-2.9.1.jar:../fop/lib/xml-apis-1.3.04.jar:../fop/lib/xml-apis-ext-1.3.04.jar:../fop/lib/xmlgraphics-commons-2.1.jar" org.apache.fop.fonts.apps.TTFReader "${font}" "${font%.ttf}.xml"
done
END
chmod a+x fonts/compile.sh

mkdir -p ISO690_bibliography
curl -L -o ISO690_bibliography/doc.html "http://markmail.org/download.xqy?id=n2qumyhk2togibuf&number=1"

# http://ant-contrib.sourceforge.net/
[ -e ant-contrib ] && rm -rf ant-contrib
curl -L -o ant-contrib-1.0b3-src.tar.gz 'http://downloads.sourceforge.net/project/ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fant-contrib%2Ffiles%2Fant-contrib%2F1.0b3%2F&ts=1477924772&use_mirror=freefr'
tar xzf ant-contrib-1.0b3-src.tar.gz
rm ant-contrib-1.0b3-src.tar.gz

# https://xmlgraphics.apache.org/fop/
[ -e fop-1.1 ] && rm -rf fop-1.1
[ -e fop-2.0 ] && rm -rf fop-2.0
[ -e fop-2.1 ] && rm -rf fop-2.1
[ -e fop-2.2 ] && rm -rf fop-2.2
[ -h fop ] && rm fop
curl -L -O 'http://ftp.halifax.rwth-aachen.de/apache/xmlgraphics/fop/binaries/fop-2.2-bin.tar.gz'
tar xzf fop-2.2-bin.tar.gz
rm fop-2.2-bin.tar.gz
ln -sf fop-2.2 fop

# http://offo.sourceforge.net/
[ -e offo-hyphenation-binary ] && rm -rf offo-hyphenation-binary
curl -L -o offo-hyphenation-binary.zip 'http://downloads.sourceforge.net/project/offo/offo-hyphenation/2.2/offo-hyphenation-compiled.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Foffo%2F&ts=1461219320&use_mirror=netix'
unzip offo-hyphenation-binary.zip
rm offo-hyphenation-binary.zip

# http://saxon.sourceforge.net/
[ -e saxon9 ] && rm -rf saxon9
curl -L -O 'http://netcologne.dl.sourceforge.net/project/saxon/Saxon-HE/9.7/SaxonHE9-7-0-4J.zip'
mkdir saxon9
cd saxon9
unzip ../SaxonHE9-7-0-4J.zip
ln -sf saxon9he.jar saxon9.jar
cd ..
rm SaxonHE9-7-0-4J.zip

# https://github.com/relaxng/jing-trang
[ -e jing-20091111 ] && rm -rf jing-20091111
[ -h jing ] && rm jing
curl -L -O 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/jing-trang/jing-20091111.zip'
unzip jing-20091111.zip
rm jing-20091111.zip
ln -sf jing-20091111 jing

# https://github.com/docbook/xslt10-stylesheets
[ -e docbook-xsl-1.78.1 ] && rm -rf docbook-xsl-1.78.1
[ -e docbook-xsl-1.79.0 ] && rm -rf docbook-xsl-1.79.0
[ -e docbook-xsl-1.79.1 ] && rm -rf docbook-xsl-1.79.1
[ -e docbook-xsl-1.79.2 ] && rm -rf docbook-xsl-1.79.2
[ -h docbook-xsl ] && rm docbook-xsl
curl -L -O 'https://github.com/docbook/xslt10-stylesheets/releases/download/release%2F1.79.2/docbook-xsl-1.79.2.zip'
unzip docbook-xsl-1.79.2.zip
rm docbook-xsl-1.79.2.zip
ln -sf docbook-xsl-1.79.2 docbook-xsl

# http://jeuclid.sourceforge.net/
[ -e jeuclid-fop-3.1.9 ] && rm -rf jeuclid-fop-3.1.9
[ -h jeuclid-fop ] && rm jeuclid-fop
curl -L -o jeuclid-fop-3.1.9.zip 'http://downloads.sourceforge.net/project/jeuclid/3.1.x/3.1.9/jeuclid-fop-3.1.9-distribution.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fjeuclid%2Ffiles%2F3.1.x%2F3.1.9%2F&ts=1422986063&use_mirror=softlayer-ams'
unzip jeuclid-fop-3.1.9.zip
rm jeuclid-fop-3.1.9.zip
ln -sf jeuclid-fop-3.1.9 jeuclid-fop
ln -s $PWD/jeuclid-fop/*.jar fop/lib/

mkdir -p docbook.rng
curl -L -o docbook.rng/docbook.rng 'http://www.docbook.org/xml/5.0/rng/docbook.rng'

curl -L -O 'https://svn.code.sf.net/p/docbook/code/trunk/docbook/relaxng/tools/db4-upgrade.xsl'

# finally, generate a titlepage template
cd ..
stylesheets/fo/generate-titlepage
