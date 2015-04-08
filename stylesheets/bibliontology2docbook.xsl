<?xml version='1.0'?>
<!-- Convert bibliontology bibliography entries to docbook  -->
<!-- vi: ft=xslt:tw=80:sw=4:ts=4:noet
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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns='http://docbook.org/ns/docbook'
	xmlns:fn='http://www.w3.org/2005/xpath-functions'
	xmlns:xlink="http://www.w3.org/1999/xlink"

	xmlns:sioct="http://rdfs.org/sioc/types#"
	xmlns:address="http://schemas.talis.com/2005/address/schema#"
	xmlns:bibo="http://purl.org/ontology/bibo/"
	xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
	xmlns:z="http://www.zotero.org/namespaces/export#"
	xmlns:res="http://purl.org/vocab/resourcelist/schema#"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	version='1.0'>

	<xsl:template match="rdf:RDF">
		<bibliography>
			<xsl:apply-templates select="bibo:Book | bibo:Article | bibo:Report | bibo:Webpage | bibo:Document | sioct:BlogPost | bibo:AcademicArticle"/>
		</bibliography>
	</xsl:template>

	<xsl:template match="bibo:Book | bibo:Article | bibo:Report | bibo:Webpage | bibo:Document | sioct:BlogPost | bibo:AcademicArticle">
		<biblioentry>
			<!-- <xsl:apply-templates select="*"/> -->
			<xsl:attribute name="xml:id">REFLABEL</xsl:attribute>
			<xsl:attribute name="xreflabel">REFLABEL</xsl:attribute>
			<abbrev>REFLABEL</abbrev>
			<xsl:apply-templates select="dcterms:title"/>
			<xsl:apply-templates select="bibo:shortTitle"/>
			<xsl:apply-templates select="bibo:authorList"/>
			<xsl:apply-templates select="bibo:numPages"/>
			<xsl:apply-templates select="bibo:pages"/>
			<xsl:apply-templates select="dcterms:date"/>
			<xsl:apply-templates select="bibo:edition"/>
			<xsl:apply-templates select="dcterms:publisher"/>
			<xsl:apply-templates select="dcterms:isPartOf/bibo:Issue"/>
			<xsl:apply-templates select="bibo:isbn10 | bibo:isbn13"/>
			<xsl:call-template name="access-date"/>
			<xsl:apply-templates select="bibo:uri"/>
		</biblioentry>
	</xsl:template>

	<!-- <xsl:template match="Article"> -->
		<!-- 	<xsl:apply-templates select="*"/> -->
		<!-- </xsl:template> -->

	<!-- <xsl:template match="Webpage"> -->
		<!-- 	<xsl:apply-templates select="*"/> -->
		<!-- </xsl:template> -->

	<xsl:template match="dcterms:title">
		<title><xsl:value-of select="."/></title>
	</xsl:template>

	<xsl:template match="bibo:shortTitle">
		<titleabbrev><xsl:value-of select="."/></titleabbrev>
	</xsl:template>

	<xsl:template match="bibo:uri">
		<biblioid class="uri">
			<link>
				<xsl:attribute name="xlink:href"><xsl:value-of select="."/></xsl:attribute>
			</link>
		</biblioid>
	</xsl:template>

	<xsl:template match="bibo:isbn10 | bibo:isbn13">
		<biblioid class="isbn"><xsl:value-of select="."/></biblioid>
	</xsl:template>

	<xsl:template match="bibo:volume">
		<volumenum><xsl:value-of select="."/></volumenum>
	</xsl:template>

	<xsl:template match="bibo:issue">
		<issuenum><xsl:value-of select="."/></issuenum>
	</xsl:template>

	<xsl:template match="bibo:Issue">
			<xsl:apply-templates select="bibo:volume"/>
			<xsl:apply-templates select="bibo:issue"/>
			<xsl:apply-templates select="dcterms:date"/>
	</xsl:template>

	<xsl:template match="dcterms:publisher">
		<xsl:if test="count(foaf:Organization/foaf:name) or count(foaf:Organization/address:localityName)">
			<publisher>
				<xsl:apply-templates select="foaf:Organization/foaf:name"/>
				<xsl:apply-templates select="foaf:Organization/address:localityName"/>
			</publisher>
		</xsl:if>
	</xsl:template>

	<xsl:template match="foaf:Organization/foaf:name">
		<publishername><xsl:value-of select="."/></publishername>
	</xsl:template>

	<xsl:template match="foaf:Organization/address:localityName">
		<address><city><xsl:value-of select="."/></city></address>
	</xsl:template>

	<xsl:template match="bibo:numPages | bibo:pages">
		<pagenums><xsl:value-of select="."/></pagenums>
	</xsl:template>

	<xsl:template match="bibo:edition">
		<edition><xsl:value-of select="."/></edition>
	</xsl:template>

	<xsl:template match="bibo:authorList">
		<authorgroup>
			<xsl:apply-templates select="//foaf:Person[@rdf:nodeID = current()/rdf:Seq/rdf:li/@rdf:nodeID]"/>
		</authorgroup>
	</xsl:template>

	<xsl:key name="pid" match="foaf:Person" use="@rdf:nodeID"/>
	<xsl:template match="foaf:Person">
		<author>
			<personname>
				<surname><xsl:value-of select="foaf:surname"/></surname>
				<firstname><xsl:value-of select="foaf:givenname"/></firstname>
			</personname>
		</author>
	</xsl:template>

	<xsl:template match="dcterms:date">
		<pubdate><xsl:value-of select="."/></pubdate>
	</xsl:template>

	<xsl:template name="access-date">
		<xsl:apply-templates select="//z:UserItem/res:resource[@rdf:resource = current()/@rdf:about]/../z:accessDate"/>
	</xsl:template>

	<xsl:template match="z:accessDate">
		<bibliomisc role="access"><xsl:value-of select="."/></bibliomisc>
	</xsl:template>
</xsl:stylesheet>
