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
    <xsl:import href="{$dbootstrap.dir}/stylesheets/fo/docbook.xsl" />

    <!-- ########## Customizations ########## -->
    <!-- WARNING: only customize file .docbook.xsl the other one is auto
         generated -->

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

    <!-- <xsl:param name="body.margin.top">0.7in</xsl:param> -->
</xsl:stylesheet>
