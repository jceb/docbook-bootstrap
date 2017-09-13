<?xml version='1.0'?>
<!-- vi: ft=xslt:tw=80:sw=4:ts=4:et
     -->
<!--
  Copyright (C) 2013,2014 Jan Christoph Ebersbach <jceb@e-jc.de>

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
<!-- - FO output http://docbook.sourceforge.net/release/xsl/1.79.1/doc/fo/index.html -->
<!-- - HTML output http://www.sagehill.net/docbookxsl/HtmlOutput.html -->
<!-- - Print output http://www.sagehill.net/docbookxsl/PrintOutput.html -->
<!-- - General http://www.sagehill.net/docbookxsl/GeneralCustoms.html -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

    <!-- <param name='docbookxsl.dir'>.</xsl:param> -->

    <!-- ########## Import the fo-Stylesheet ########## -->
    <xsl:import href="../../lib/docbook-xsl/fo/docbook.xsl" />
    <!-- Use APA style bibliography entries - "bibliography.style" must be -->
    <!-- set to "iso690" -->
    <xsl:import href="apa.xsl" />

    <!-- custom title page -->
    <xsl:import href="titlepage.xsl" />

    <xsl:param name="fop1.extensions" select="1" />

    <!-- ########## ToC/LoT/Index Generation ########## -->
    <!-- Table of Contents, enabled or disabled -->
    <!-- <xsl:param name='generate.toc'></xsl:param> -->

    <!-- ########## Automatic labeling ########## -->
    <xsl:param name='section.autolabel'>1</xsl:param>
    <!-- <xsl:param name='section.autolabel.max.depth'>1</xsl:param> -->
    <xsl:param name='section.label.includes.component.label'>1</xsl:param>

    <!-- ########## Pagination and General Styles ########## -->
    <xsl:param name='paper.type'>A4</xsl:param>
    <xsl:param name='page.orientation'>portrait</xsl:param>
    <!-- <xsl:param name='double.sided'>1</xsl:param> -->
    <xsl:param name="header.column.widths">1 3 1</xsl:param>
    <!-- <xsl:param name="body.margin.top">0.7in</xsl:param> -->

    <!-- Hypenation -->
    <xsl:template name="set.flow.properties">
        <!-- See http://www.sagehill.net/docbookxsl/PrintCustomEx.html#Hyphenation -->
        <!-- <xsl:param name="element" select="local-name(.)"/> -->
        <!-- <xsl:param name="master-reference" select="''"/> -->

        <!-- <xsl:choose> -->
        <!--     <xsl:when test="starts-with($master-reference, 'index') or -->
        <!--         starts-with($master-reference, 'titlepage') or -->
        <!--         starts-with($master-reference, 'lot') or -->
        <!--         starts-with($master-reference, 'front')"> -->
        <!--         <xsl:attribute name="hyphenate">false</xsl:attribute> -->
        <!--     </xsl:when> -->
        <!--     <xsl:otherwise> -->
        <!--         <xsl:attribute name="hyphenate"> -->
        <!--             <xsl:value-of select="$hyphenate"/> -->
        <!--         </xsl:attribute> -->
        <!--     </xsl:otherwise> -->
        <!-- </xsl:choose> -->
        <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:template>

    <!-- Author: include address/otheraddr -->
    <xsl:template match="author" mode="titlepage.mode">
        <fo:block>
            <xsl:call-template name="anchor"/>
            <xsl:choose>
                <xsl:when test="orgname">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="person.name"/>
                    <xsl:if test="affiliation/orgname">
                        <xsl:text>, </xsl:text>
                        <xsl:apply-templates select="affiliation/orgname" mode="titlepage.mode"/>
                    </xsl:if>
                    <xsl:if test="email|affiliation/address/email">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="(email|affiliation/address/email)[1]"/>
                    </xsl:if>
                    <xsl:if test="address/otheraddr">
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="address/otheraddr"/>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </fo:block>
    </xsl:template>

    <!-- Indent first line only for paragraphs below section and chapter
         elements:
         https://www.sourceware.org/ml/docbook-apps/2004-q2/msg00105.html -->
    <xsl:template match="section/para|section/simpara|chapter/para|chapter/simpara">
        <xsl:variable name="keep.together">
            <xsl:call-template name="pi.dbfo_keep-together"/>
        </xsl:variable>
        <fo:block xsl:use-attribute-sets="normal.para.spacing">
            <!-- indent first line: http://www.oxygenxml.com/forum/topic8795.html -->
            <xsl:attribute name="text-indent">2em</xsl:attribute>
            <xsl:if test="$keep.together != ''">
                <xsl:attribute name="keep-together.within-column"><xsl:value-of
                        select="$keep.together"/></xsl:attribute>
            </xsl:if>
            <xsl:call-template name="anchor"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- <xsl:attribute-set name="normal.para.spacing"> -->
    <!--     <xsl:attribute name="text-indent">2em</xsl:attribute> -->
    <!--     <xsl:attribute name="space-before.optimum">1em</xsl:attribute> -->
    <!--     <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute> -->
    <!--     <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute> -->
    <!-- </xsl:attribute-set> -->

    <!-- handle indentation of list items differently -->
    <xsl:attribute-set name="list.item.spacing">
        <xsl:attribute name="margin-left">1em</xsl:attribute>
        <!-- <xsl:attribute name="text-indent">1em</xsl:attribute> -->
        <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template match="address/otheraddr"
        mode="titlepage.mode" priority="2">
        <fo:block>
            <xsl:call-template name="gentext">
                <xsl:with-param name="key" select="'address/otheraddr'"/>
            </xsl:call-template>
            <xsl:text> </xsl:text>
            <xsl:apply-templates mode="titlepage.mode"/>
        </fo:block>
    </xsl:template>

    <!-- ########## Font Options ######### -->
    <xsl:param name='title.font.family'>sans-serif,unifont</xsl:param>
    <xsl:param name='body.font.family'>sans-serif,unifont</xsl:param>
    <!-- <xsl:param name='title.font.family'>sans-serif,ARPLZenKaiUni,ARPLShanHeiSunUni,MSSong</xsl:param> -->
    <!-- <xsl:param name='body.font.family'>serif,ARPLZenKaiUni,ARPLShanHeiSunUni,MSSong</xsl:param> -->
    <!-- <xsl:param name='monospace.font.family'>monospace</xsl:param> -->
    <xsl:param name='symbol.font.family'>Symbol,ZapfDingbats,unifont</xsl:param>
    <!-- Font size -->
    <xsl:param name='body.font.master'>11</xsl:param>
    <!-- <xsl:param name='footnote.font.size'>9</xsl:param> -->
    <xsl:param name='line-height'>1.3</xsl:param>

    <!-- <xsl:attribute-set name="section.title.properties"> -->
    <!-- <xsl:attribute name="font-family">Garamond</xsl:attribute> -->
    <!-- <xsl:attribute name="font-weight">bold</xsl:attribute> -->
    <!-- </xsl:attribute-set> -->

    <!-- ########## Bibliography Style ########## -->
    <!-- See also http://www.sagehill.net/docbookxsl/CustomBiblio.html -->
    <xsl:param name="bibliography.style">iso690</xsl:param>

    <!-- ########## Add Customization Layer ########## -->
    <!-- <xsl:param name="local.l10n.xml">document('../common/mygentextmods.xml')</xsl:param> -->
</xsl:stylesheet>
