<?xml version='1.0'?>
<!-- Convert Endnote bibliography entries to docbook  -->
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
	version='1.0'>

	<xsl:template match="xml/records">
		<bibliography>
			<xsl:apply-templates select="record"/>
		</bibliography>
	</xsl:template>

	<xsl:template match="record">
		<!-- create a specific bibliography entry -->
		<biblioentry>
			<xsl:attribute name="xml:id">REFLABEL</xsl:attribute>
			<xsl:attribute name="xreflabel">REFLABEL</xsl:attribute>
			<abbrev>REFLABEL</abbrev>
			<xsl:apply-templates select="titles/title"/>
			<xsl:apply-templates select="titles/short-title"/>
			<xsl:apply-templates select="contributors/authors"/>
			<xsl:apply-templates select="pages"/>
			<xsl:apply-templates select="dates"/>
			<xsl:apply-templates select="edition"/>
			<xsl:call-template name="publisher"/>
			<xsl:apply-templates select="isbn"/>
			<xsl:apply-templates select="access-date"/>
			<xsl:apply-templates select="urls/web-urls/url"/>
		</biblioentry>
	</xsl:template>

	<xsl:template match="urls/web-urls/url">
		<biblioid class="uri">
			<link>
				<xsl:attribute name="xlink:href"><xsl:value-of select="."/></xsl:attribute>
			</link>
		</biblioid>
	</xsl:template>

	<xsl:template match="isbn">
		<biblioid class="isbn"><xsl:value-of select="."/></biblioid>
	</xsl:template>

	<xsl:template name="publisher">
		<xsl:if test="count(publisher) or count(pub-location)">
			<publisher>
				<xsl:apply-templates select="publisher"/>
				<xsl:apply-templates select="pub-location"/>
			</publisher>
		</xsl:if>
	</xsl:template>

	<xsl:template match="publisher">
		<publishername><xsl:value-of select="."/></publishername>
	</xsl:template>

	<xsl:template match="pub-location">
		<address><city><xsl:value-of select="."/></city></address>
	</xsl:template>

	<xsl:template match="titles/title">
		<title><xsl:value-of select="."/></title>
	</xsl:template>

	<xsl:template match="titles/short-title">
		<titleabbrev><xsl:value-of select="."/></titleabbrev>
	</xsl:template>

	<xsl:template match="pages">
		<pagenums><xsl:value-of select="."/></pagenums>
	</xsl:template>

	<xsl:template match="edition">
		<edition><xsl:value-of select="."/></edition>
	</xsl:template>

	<xsl:template match="contributors/authors">
		<authorgroup>
			<xsl:apply-templates select="author"/>
		</authorgroup>
	</xsl:template>

	<xsl:template match="author">
		<author>
			<personname>
				<surname><xsl:value-of select="substring-before(string(.), ',')"/></surname>
				<firstname><xsl:value-of select="substring-after(string(.), ', ')"/></firstname>
			</personname>
		</author>
	</xsl:template>

	<xsl:template match="dates">
		<xsl:choose>
			<xsl:when test="string(pub-dates/date) != ''">
				<pubdate><xsl:value-of select="pub-dates/date"/></pubdate>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="string(year) != ''">
						<pubdate><xsl:value-of select="year"/></pubdate>
					</xsl:when>
					<xsl:otherwise>
						<pubdate>n.d.</pubdate>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="access-date">
		<bibliomisc role="access"><xsl:value-of select="."/></bibliomisc>
	</xsl:template>
</xsl:stylesheet>
