<?xml version='1.0'?>
<!-- vi: ft=xslt:tw=80:sw=4:ts=4:et
-->
<!--
  Copyright (C) 2013 Jan Christoph Ebersbach <jceb@e-jc.de>

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
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!--<param name='docbookxsl.dir' select='.' />-->

    <!-- ########## Import the fo-Stylesheet ########## -->
    <xsl:import href="../../lib/docbook-xsl/fo/docbook.xsl"/>

    <!--<param name='fop.extensions' expression='1' />-->

    <!-- ########## ToC/LoT/Index Generation ########## -->
    <!-- Table of Contents, enabled or disabled -->
    <xsl:param name='generate.toc'></xsl:param>

    <!-- ########## Pagination and General Styles ########## -->
    <xsl:param name='paper.type'>A4</xsl:param>
    <xsl:param name='page.orientation'>portrait</xsl:param>
    <!--<xsl:param name='double.sided' select='1' />-->

    <!-- ########## Font Options ######### -->
	<xsl:param name='title.font.family'>sans-serif</xsl:param>
	<xsl:param name='body.font.family'>serif</xsl:param>
    <!--<xsl:param name='title.font.family'>sans-serif,ARPLZenKaiUni,ARPLShanHeiSunUni,MSSong</xsl:param>-->
    <!--<xsl:param name='body.font.family'>serif,ARPLZenKaiUni,ARPLShanHeiSunUni,MSSong</xsl:param>-->
    <!--<xsl:param name='monospace.font.family'>monospace</xsl:param>-->
    <!--<xsl:param name='symbol.font.family'>Symbol,ZapfDingbats</xsl:param>-->
    <!-- Font size -->
    <!--<xsl:param name='body.font.master'>12</xsl:param>-->
    <!--<xsl:param name='footnote.font.size'>9</xsl:param>-->

    <!--<xsl:attribute-set name="section.title.properties">-->
        <!--<xsl:attribute name="font-family">Garamond</xsl:attribute>-->
        <!--<xsl:attribute name="font-weight">bold</xsl:attribute>-->
    <!--</xsl:attribute-set>-->

    <!-- ########## Bibliography Style ########## -->
    <!--<xsl:param name="bibliography.style">iso690</xsl:param>-->

    <!-- ########## Add Customization Layer ########## -->
    <!--<xsl:param name="local.l10n.xml" select="document('../common/mygentextmods.xml')"/>-->
</xsl:stylesheet>
