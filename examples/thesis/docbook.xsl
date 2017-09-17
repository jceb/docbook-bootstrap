<?xml version='1.0'?>
<!-- vi: ft=xslt:tw=80:sw=4:ts=4:et
     -->
<!--
  Copyright (C) 2015 Jan Christoph Ebersbach <jceb@e-jc.de>

  Licensed to the Apache Software Foundation (ASF) under one
  or more contributor license agreements.  See the NOTICE file
  distributed with this work for additional information
  regarding copyright ownership.  The ASF licenses this file
  to you under the Apache License, Version 2.0 (the
  "License"); you may not use this file except in compliance
  with the License.  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an
  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  KIND, either express or implied.  See the License for the
  specific language governing permissions and limitations
  under the License.
-->

<!-- Parameters can be found here: -->
<!-- - FO output http://docbook.sourceforge.net/release/xsl/1.78.1/doc/fo/index.html -->
<!-- - HTML output http://www.sagehill.net/docbookxsl/HtmlOutput.html -->
<!-- - Print output http://www.sagehill.net/docbookxsl/PrintOutput.html -->
<!-- - General http://www.sagehill.net/docbookxsl/GeneralCustoms.html -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

    <!-- ########## Import the fo-Stylesheet ########## -->
    <!-- dynamic imports are not allowed until xslt 3.0 therefore this file is
         used as a template and the variable is expanded by the build target -->
    <!-- <xsl:param name="dbootstrap.dir">.</xsl:param> -->
    <xsl:import href="/home/jceb/Documents/Projects/docbook-bootstrap/stylesheets/fo/docbook.xsl" />

    <!-- ########## Customizations ########## -->
    <!-- WARNING: only customize file .docbook.xsl the other one is auto
         generated -->

    <!-- Pagination and General Styles: -->
    <!-- <xsl:param name='paper.type'>A4</xsl:param> -->
    <!-- <xsl:param name='page.orientation'>portrait</xsl:param> -->
    <!-- <xsl:param name='double.sided'>1</xsl:param> -->
    <!-- <xsl:param name="header.column.widths">1 3 1</xsl:param> -->

    <!-- <xsl:param name="body.margin.top">0.7in</xsl:param> -->
    <!-- Font Options: -->
    <!-- <xsl:param name='title.font.family'>sans-serif,unifont</xsl:param> -->
    <!-- <xsl:param name='body.font.family'>sans-serif,unifont</xsl:param> -->
    <!-- <xsl:param name='title.font.family'>sans-serif,ARPLZenKaiUni,ARPLShanHeiSunUni,MSSong</xsl:param> -->
    <!-- <xsl:param name='body.font.family'>serif,ARPLZenKaiUni,ARPLShanHeiSunUni,MSSong</xsl:param> -->
    <!-- <xsl:param name='monospace.font.family'>monospace</xsl:param> -->
    <!-- <xsl:param name='symbol.font.family'>Symbol,ZapfDingbats,unifont</xsl:param> -->

    <!-- Font size: -->
    <!-- <xsl:param name='body.font.master'>11</xsl:param> -->
    <!-- <xsl:param name='footnote.font.size'>9</xsl:param> -->
    <!-- <xsl:param name='line-height'>1.3</xsl:param> -->

    <!-- More parameters can be found here: -->
    <!-- - FO output http://docbook.sourceforge.net/release/xsl/1.78.1/doc/fo/index.html -->
    <!-- - HTML output http://www.sagehill.net/docbookxsl/HtmlOutput.html -->
    <!-- - Print output http://www.sagehill.net/docbookxsl/PrintOutput.html -->
    <!-- - General http://www.sagehill.net/docbookxsl/GeneralCustoms.html -->
    <!-- - XSL-FO reference http://zvon.org/xxl/xslfoReference/Output/index.html -->
    <!-- - XSL-FO tutorial http://www.cafeconleche.org/books/bible2/chapters/ch18.html -->
    <!-- - XSL-FO tutorial http://www.renderx.com/tutorial.html -->

    <!-- custom title page -->
    <!-- copy from titlepage.xsl the relevant parts and modify them manually
         using XSL-FO -->
    <xsl:template name="book.titlepage.recto">
        <xsl:choose>
            <xsl:when test="bookinfo/title">
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="bookinfo/title"/>
            </xsl:when>
            <xsl:when test="info/title">
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="info/title"/>
            </xsl:when>
            <xsl:when test="title">
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="title"/>
            </xsl:when>
        </xsl:choose>

        <xsl:choose>
            <xsl:when test="bookinfo/subtitle">
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="bookinfo/subtitle"/>
            </xsl:when>
            <xsl:when test="info/subtitle">
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="info/subtitle"/>
            </xsl:when>
            <xsl:when test="subtitle">
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="subtitle"/>
            </xsl:when>
        </xsl:choose>

        <!-- <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="bookinfo/corpauthor"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="info/corpauthor"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="bookinfo/authorgroup"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="info/authorgroup"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="bookinfo/author"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="info/author"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="bookinfo/itermset"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="info/itermset"/> -->

        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.5in</xsl:attribute>
            <xsl:attribute name="text-align">center</xsl:attribute>
            <xsl:attribute name="font-size">18.8832pt</xsl:attribute>
            Master's Thesis
        </xsl:element>

        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.5in</xsl:attribute>
            <xsl:attribute name="text-align">center</xsl:attribute>
            <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.3in</xsl:attribute>
                Author
            </xsl:element>
            <xsl:element name="fo:block">
                John Doe
            </xsl:element>
            <xsl:element name="fo:block">
                My Street 3
            </xsl:element>
            <xsl:element name="fo:block">
                12345 Somewhere
            </xsl:element>
            <xsl:element name="fo:block">
                Phone: +1 1234567
            </xsl:element>
            <xsl:element name="fo:block">
                E-Mail: john.doe@example.org
            </xsl:element>
        </xsl:element>

        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.0in</xsl:attribute>
            <xsl:attribute name="text-align">center</xsl:attribute>
            <xsl:attribute name="font-size">18.8832pt</xsl:attribute>
            <xsl:element name ="fo:external-graphic">
                <xsl:attribute name="content-type">content-type:image/jpeg</xsl:attribute>
                <xsl:attribute name="width">auto</xsl:attribute>
                <xsl:attribute name="height">auto</xsl:attribute>
                <xsl:attribute name="content-height">70%</xsl:attribute>
                <xsl:attribute name="content-width">70%</xsl:attribute>
                <xsl:attribute name="src">url(/home/jceb/Documents/Projects/docbook-bootstrap/examples/thesis/figures/logo.svg)</xsl:attribute>
            </xsl:element>
            Graduate Center Somewhere
        </xsl:element>

        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.2in</xsl:attribute>
            <xsl:element name="fo:table">
                <xsl:attribute name="table-layout">fixed</xsl:attribute>
                <xsl:attribute name="width">100%</xsl:attribute>
                <xsl:element name="fo:table-column">
                    <xsl:attribute name="column-number">1</xsl:attribute>
                    <xsl:attribute name="column-width">proportional-column-width(1)</xsl:attribute>
                </xsl:element>
                <xsl:element name="fo:table-column">
                    <xsl:attribute name="column-number">2</xsl:attribute>
                    <xsl:attribute name="column-width">proportional-column-width(1)</xsl:attribute>
                </xsl:element>
                <xsl:element name="fo:table-body">
                    <xsl:element name="fo:table-row">
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                First assessment supervisor
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                Prof. Dr. Oliver Smart
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="fo:table-row">
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                Second assessment supervisor
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                Prof. Dr. George Skilled
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="fo:table-row">
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                Closing date
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                2017-10-03
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="fo:table-row">
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                Course of studies
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                Business Administration MBA
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="fo:table-row">
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                Matriculation number
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="fo:table-cell">
                            <xsl:element name="fo:block">
                                12345
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>

        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.2in</xsl:attribute>
            Note: Thesis submitted to obtain the qualification "Master of
            Business Administration (MBA)" at the University of Somewhere in the
            study program "Business Administration".
        </xsl:element>

    </xsl:template>

    <xsl:template name="book.titlepage.verso">
        <!-- <xsl:choose> -->
        <!--     <xsl:when test="bookinfo/title"> -->
        <!--         <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/title"/> -->
        <!--     </xsl:when> -->
        <!--     <xsl:when test="info/title"> -->
        <!--         <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/title"/> -->
        <!--     </xsl:when> -->
        <!--     <xsl:when test="title"> -->
        <!--         <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="title"/> -->
        <!--     </xsl:when> -->
        <!-- </xsl:choose> -->

        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/corpauthor"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/corpauthor"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/authorgroup"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/authorgroup"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/author"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/author"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/othercredit"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/othercredit"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/releaseinfo"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/releaseinfo"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/pubdate"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/pubdate"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/copyright"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/copyright"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/abstract"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/abstract"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="bookinfo/legalnotice"/> -->
        <!-- <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="info/legalnotice"/> -->

        <xsl:element name="fo:block">
            I herewith declare that I am the sole author of the current master´s
            thesis according to the regulation of University of Somewhere and
            that I have conducted all works connected with the Master thesis on
            my own.
        </xsl:element>
        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.1in</xsl:attribute>
            Furthermore, I declare that I only used those resources that are
            referenced in the work.  All formulations and concepts taken from
            printed, verbal or online sources be they word-for-word quotations
            or corresponding in their meaning are quoted according to the rules
            of good scientific conduct and are indicated by footnotes, in the
            text or other forms of detailed references.  Support during the work
            including significant supervision is indicated accordingly.
        </xsl:element>
        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.1in</xsl:attribute>
            The master´s thesis has not been presented to any other examination
            authority.  The work has been submitted in printed and electronic
            form.
        </xsl:element>
        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.1in</xsl:attribute>
            I am aware of the legal consequences of a false declaration of
            honor.
        </xsl:element>

        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.2in</xsl:attribute>
            Somewhere, 2017-09-17
        </xsl:element>
        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.8in</xsl:attribute>
            John Doe
        </xsl:element>

        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">4.7in</xsl:attribute>
            Confidentiality clause
        </xsl:element>
        <xsl:element name="fo:block">
            <xsl:attribute name="space-before">0.1in</xsl:attribute>
            This assessment contains confidential data of My Company Ltd.  This
            work may only be made available to the reviewer and authorized
            members of the board of examiners.  Any publication and duplication
            of this assessment - even in part - is prohibited.
        </xsl:element>

    </xsl:template>

    <xsl:template match="section/para|section/simpara|chapter/para|chapter/simpara">
        <xsl:variable name="keep.together">
            <xsl:call-template name="pi.dbfo_keep-together"/>
        </xsl:variable>
        <fo:block xsl:use-attribute-sets="normal.para.spacing">
            <!-- indent first line: http://www.oxygenxml.com/forum/topic8795.html -->
            <xsl:attribute name="text-indent">0em</xsl:attribute>
            <xsl:if test="$keep.together != ''">
                <xsl:attribute name="keep-together.within-column"><xsl:value-of
                        select="$keep.together"/></xsl:attribute>
            </xsl:if>
            <xsl:call-template name="anchor"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- <xsl:param name="body.margin.top">0.7in</xsl:param> -->
    <xsl:param name="img.src.path">/home/jceb/Documents/Projects/docbook-bootstrap/examples/thesis/</xsl:param>
</xsl:stylesheet>
