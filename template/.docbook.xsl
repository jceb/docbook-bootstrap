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
<!-- - FO output http://docbook.sourceforge.net/release/xsl/1.79.2/doc/fo/index.html -->
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
    <xsl:import href="{$dbootstrap.dir}/stylesheets/fo/{$dbootstrap.xsl}" />

    <!-- ########## Customizations ########## -->
    <!-- WARNING: only customize file .docbook.xsl the other one is auto
         generated -->

    <!-- ########## ToC/LoT/Index Generation ########## -->
    <!-- Table of Contents, enabled or disabled -->
    <!-- <xsl:param name="generate.toc">article</xsl:param> -->
    <!-- <xsl:param name="generate.toc">book</xsl:param> -->

    <!-- ########## Automatic labeling ########## -->
    <!-- <xsl:param name='section.autolabel'>1</xsl:param> -->
    <!-- <xsl:param name='section.autolabel.max.depth'>1</xsl:param> -->
    <!-- <xsl:param name='section.label.includes.component.label'>1</xsl:param> -->

    <!-- uncomment this to suppress toc when using XSL 2.0 -->
    <!-- <xsl:param name="generate.toc"> -->
    <!--     article nop -->
    <!--     book nop -->
    <!-- </xsl:param> -->

    <!-- Pagination and General Styles: -->
    <!-- <xsl:param name='paper.type'>A4</xsl:param> -->
    <!-- <xsl:param name='page.orientation'>portrait</xsl:param> -->
    <!-- <xsl:param name='double.sided'>1</xsl:param> -->
    <!-- <xsl:param name="column.count.body" select="2"/> -->
    <!-- <xsl:param name="header.column.widths">1 3 1</xsl:param> -->

    <!-- <xsl:attribute&#45;set name="component.title.properties"> -->
    <!--     <xsl:attribute name="font&#45;family"> -->
    <!--         <xsl:value&#45;of select="$title.font.family"/> -->
    <!--     </xsl:attribute> -->
    <!--     <xsl:attribute name="font&#45;size"> -->
    <!--         <xsl:value&#45;of select="$body.font.master * 2"/> -->
    <!--         <xsl:text>pt</xsl:text> -->
    <!--     </xsl:attribute> -->
    <!--     <xsl:attribute name="font&#45;weight">bold</xsl:attribute> -->
    <!--         <!&#45;&#45; font size is calculated dynamically by section.heading template &#45;&#45;> -->
    <!--     <xsl:attribute name="keep&#45;with&#45;next.within&#45;column">always</xsl:attribute> -->
    <!--     <xsl:attribute name="text&#45;align">left</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;before.minimum">0.3em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;before.optimum">0.4em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;before.maximum">0.8em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;after.minimum">0.2em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;after.optimum">0.3em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;after.maximum">0.7em</xsl:attribute> -->
    <!-- </xsl:attribute&#45;set> -->

    <!-- <xsl:param name="body.margin.top">0.7in</xsl:param> -->
    <!-- Font Options: -->
    <!-- <xsl:param name='title.font.family'>Carlito,Calibri,sans-serif</xsl:param> -->
    <!-- <xsl:param name='body.font.family'>Carlito,Calibri,sans-serif</xsl:param> -->
    <!-- <xsl:param name='title.font.family'>Caladea,Cambria,serif,ARPLZenKaiUni,ARPLShanHeiSunUni,MSSong</xsl:param> -->
    <!-- <xsl:param name='body.font.family'>Caladea,Cambria,serif,ARPLZenKaiUni,ARPLShanHeiSunUni,MSSong</xsl:param> -->
    <!-- <xsl:param name='monospace.font.family'>Hack,monospace</xsl:param> -->
    <!-- <xsl:param name='symbol.font.family'>Symbol,ZapfDingbats,unifont</xsl:param> -->

    <!-- Font size: -->
    <!-- <xsl:param name='body.font.master'>11</xsl:param> -->
    <!-- <xsl:param name='footnote.font.size'>9</xsl:param> -->
    <!-- <xsl:param name='line-height'>1.3</xsl:param> -->

    <!-- <xsl:attribute&#45;set name="section.title.properties"> -->
    <!--     <xsl:attribute name="font&#45;family"> -->
    <!--         <xsl:value&#45;of select="$title.font.family"/> -->
    <!--     </xsl:attribute> -->
    <!--     <xsl:attribute name="font&#45;size"> -->
    <!--         <xsl:value&#45;of select="$body.font.master * 1.2"/> -->
    <!--         <xsl:text>pt</xsl:text> -->
    <!--     </xsl:attribute> -->
    <!--     <xsl:attribute name="font&#45;weight">bold</xsl:attribute> -->
    <!--         <!&#45;&#45; font size is calculated dynamically by section.heading template &#45;&#45;> -->
    <!--     <xsl:attribute name="keep&#45;with&#45;next.within&#45;column">always</xsl:attribute> -->
    <!--     <xsl:attribute name="text&#45;align">left</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;before.minimum">0.2em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;before.optimum">0.4em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;before.maximum">0.6em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;after.minimum">0.2em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;after.optimum">0.4em</xsl:attribute> -->
    <!--     <xsl:attribute name="space&#45;after.maximum">0.6em</xsl:attribute> -->
    <!-- </xsl:attribute&#45;set> -->
    <!--  -->
    <!-- <xsl:attribute&#45;set name="section.title.level1.properties"> -->
    <!--     <xsl:attribute name="font&#45;size"> -->
    <!--         <xsl:value&#45;of select="$body.font.master * 1.2"/> -->
    <!--         <xsl:text>pt</xsl:text> -->
    <!--     </xsl:attribute> -->
    <!-- </xsl:attribute&#45;set> -->
    <!--  -->
    <!-- <xsl:attribute&#45;set name="section.title.level2.properties"> -->
    <!--     <xsl:attribute name="font&#45;size"> -->
    <!--         <xsl:value&#45;of select="$body.font.master * 1.1"/> -->
    <!--         <xsl:text>pt</xsl:text> -->
    <!--     </xsl:attribute> -->
    <!-- </xsl:attribute&#45;set> -->

    <!-- More parameters can be found here: -->
    <!-- - FO output http://docbook.sourceforge.net/release/xsl/1.78.1/doc/fo/index.html -->
    <!-- - HTML output http://www.sagehill.net/docbookxsl/HtmlOutput.html -->
    <!-- - Print output http://www.sagehill.net/docbookxsl/PrintOutput.html -->
    <!-- - General http://www.sagehill.net/docbookxsl/GeneralCustoms.html -->
    <!-- - XSL-FO reference http://zvon.org/xxl/xslfoReference/Output/index.html -->
    <!-- - XSL-FO tutorial http://www.cafeconleche.org/books/bible2/chapters/ch18.html -->
    <!-- - XSL-FO tutorial http://www.renderx.com/tutorial.html -->

    <!-- custom title page -->
    <!-- copy from stylesheets/fo/titlepage.xsl the relevant parts and modify them manually using XSL-FO -->

    <!-- <xsl:param name="body.margin.top">0.7in</xsl:param> -->
    <xsl:param name="img.src.path">{$current.dir}/</xsl:param>
</xsl:stylesheet>
