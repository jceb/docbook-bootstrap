<?xml version='1.0'?>
<!-- An attempt to implement APA style bibliography entries for DocBook fo -->
<!-- output.  Templates were taken from ../../lib/docbook-xsl/fo/biblio-iso690.xsl -->
<!-- See http://www.apastyle.org/ for more details -->
<!--
  Copyright (C) 2014 Jan Christoph Ebersbach <jceb@e-jc.de>

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
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version='1.0'>

<!-- <xsl:template match="pubdate|copyright/year" mode="iso690.mode"> -->
<!--   <xsl:param name="sep"/> -->
<!--   <xsl:param name="upd" select="1"/> -->
<!--   <xsl:param name="datecit2"> -->
<!--     <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'datecit2'"/></xsl:call&#45;template> -->
<!--   </xsl:param> -->
<!--   <xsl:variable name="substr" select="substring(string(.),string&#45;length(string(.)))"/> -->
<!--   <xsl:if test="name(.)!='pubdate'"> -->
<!--     <xsl:value&#45;of select="'&#38;#x00A9;'"/><!&#45;&#45; copyright &#45;&#45;> -->
<!--   </xsl:if> -->
<!--   <!&#45;&#45; add braces &#45;&#45;> -->
<!--   <xsl:text>(</xsl:text> -->
<!--   <xsl:apply&#45;templates mode="iso690.mode"/> -->
<!--   <xsl:text>)</xsl:text> -->
<!--   <xsl:call&#45;template name="iso690.space"> -->
<!--       <xsl:with&#45;param name="text" select="$substr"/> -->
<!--   </xsl:call&#45;template> -->
<!--   <xsl:if test="$upd!=0"> -->
<!--     <xsl:choose> -->
<!--       <xsl:when test="name(.)='pubdate'"> -->
<!--         <xsl:apply&#45;templates mode="iso690.mode" select="../date[@role='upd']"/> -->
<!--         <xsl:apply&#45;templates mode="iso690.mode" select="../date[@role='cit']"/> -->
<!--       </xsl:when> -->
<!--       <xsl:otherwise> -->
<!--         <xsl:apply&#45;templates mode="iso690.mode" select="../../date[@role='upd']"/> -->
<!--         <xsl:apply&#45;templates mode="iso690.mode" select="../../date[@role='cit']"/> -->
<!--       </xsl:otherwise> -->
<!--     </xsl:choose> -->
<!--   </xsl:if> -->
<!--   <xsl:choose> -->
<!--     <xsl:when test="../date[@role='cit']|../../date[@role='cit'] and $upd!=0"> -->
<!--       <xsl:call&#45;template name="iso690.endsep"> -->
<!--         <xsl:with&#45;param name="text" select="$datecit2"/> -->
<!--         <xsl:with&#45;param name="sep" select="$sep"/> -->
<!--       </xsl:call&#45;template> -->
<!--     </xsl:when> -->
<!--     <xsl:when test="../date[@role='upd']|../../date[@role='upd'] and $upd!=0"> -->
<!--       <xsl:call&#45;template name="iso690.endsep"> -->
<!--         <xsl:with&#45;param name="text" select="string(../date[@role='upd'])"/> -->
<!--         <xsl:with&#45;param name="sep" select="$sep"/> -->
<!--       </xsl:call&#45;template> -->
<!--     </xsl:when> -->
<!--     <xsl:when test="$substr='&#45;'"> -->
<!--       <xsl:call&#45;template name="iso690.endsep"> -->
<!--         <xsl:with&#45;param name="text" select="' '"/> -->
<!--         <xsl:with&#45;param name="sep" select="$sep"/> -->
<!--       </xsl:call&#45;template> -->
<!--     </xsl:when> -->
<!--     <xsl:otherwise> -->
<!--       <xsl:call&#45;template name="iso690.endsep"> -->
<!--         <xsl:with&#45;param name="text" select="string(.)"/> -->
<!--         <xsl:with&#45;param name="sep" select="$sep"/> -->
<!--       </xsl:call&#45;template> -->
<!--     </xsl:otherwise> -->
<!--   </xsl:choose> -->
<!-- </xsl:template> -->

<!-- <xsl:template name="iso690.location"> -->
<!--   <xsl:param name="location.sep"> -->
<!--     <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'location.sep'"/></xsl:call&#45;template> -->
<!--   </xsl:param> -->
<!--   <xsl:choose> -->
<!--     <xsl:when test="./volumenum and not(./issuenum) and not(./pagenums)"> -->
<!--       <!&#45;&#45; add braces &#45;&#45;> -->
<!--       <xsl:text>(</xsl:text> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./volumenum"> -->
<!--         <xsl:with&#45;param name="sep" select="concat(')', $location.sep)"/> -->
<!--       </xsl:apply&#45;templates> -->
<!--     </xsl:when> -->
<!--     <xsl:when test="./issuenum and not(./pagenums)"> -->
<!--       <!&#45;&#45; add braces &#45;&#45;> -->
<!--       <xsl:text>(</xsl:text> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./volumenum"/> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./issuenum"> -->
<!--         <xsl:with&#45;param name="sep" select="concat(')', $location.sep)"/> -->
<!--       </xsl:apply&#45;templates> -->
<!--     </xsl:when> -->
<!--     <xsl:when test="./pagenums"> -->
<!--       <!&#45;&#45; add braces &#45;&#45;> -->
<!--       <xsl:text>(</xsl:text> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./volumenum"/> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./issuenum"/> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./pagenums"> -->
<!--         <xsl:with&#45;param name="sep" select="concat(')', $location.sep)"/> -->
<!--       </xsl:apply&#45;templates> -->
<!--     </xsl:when> -->
<!--   </xsl:choose> -->
<!-- </xsl:template> -->

<!-- <!&#45;&#45; Place of publication, Publisher, Year/Date of publication, Date of update/revision, Date of citation &#45;&#45;> -->
<!-- <xsl:template name="iso690.pub"> -->
<!--   <xsl:param name="onlydate" select="0"/> -->
<!--   <xsl:param name="placesep"> -->
<!--     <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'placepubl.sep'"/></xsl:call&#45;template> -->
<!--   </xsl:param> -->
<!--   <xsl:param name="pubsep"> -->
<!--     <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'publyear.sep'"/></xsl:call&#45;template> -->
<!--   </xsl:param> -->
<!--   <xsl:param name="endsep"> -->
<!--     <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'pubinfo.sep'"/></xsl:call&#45;template> -->
<!--   </xsl:param> -->
<!--   <xsl:choose> -->
<!--     <xsl:when test="(./publisher/publishername|./publishername|./publisher/address/city)and($onlydate=0)and(./pubdate[not(@role='issuing')]|./copyright/year|./date[@role='upd']|./date[@role='upd'])"> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./publisher/address/city"> -->
<!--         <xsl:with&#45;param name="sep" select="$placesep"/> -->
<!--       </xsl:apply&#45;templates> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./publisher/publishername|./publishername"> -->
<!--         <xsl:with&#45;param name="sep" select="$endsep"/> -->
<!--       </xsl:apply&#45;templates> -->
<!--       <!&#45;&#45; <xsl:if test="not(./pubdate[not(@role='issuing')]|./copyright/year)"> &#45;&#45;> -->
<!--       <!&#45;&#45;   <xsl:call&#45;template name="iso690.data"> &#45;&#45;> -->
<!--       <!&#45;&#45;     <xsl:with&#45;param name="sep" select="$endsep"/> &#45;&#45;> -->
<!--       <!&#45;&#45;   </xsl:call&#45;template> &#45;&#45;> -->
<!--       <!&#45;&#45; </xsl:if> &#45;&#45;> -->
<!--     </xsl:when> -->
<!--     <!&#45;&#45; <xsl:when test="($onlydate=1)or(./pubdate[not(@role='issuing')]|./copyright/year)"> &#45;&#45;> -->
<!--     <!&#45;&#45;   <xsl:apply&#45;templates mode="iso690.mode" select="./pubdate[not(@role='issuing')]|./copyright/year"> &#45;&#45;> -->
<!--     <!&#45;&#45;     <xsl:with&#45;param name="sep" select="$endsep"/> &#45;&#45;> -->
<!--     <!&#45;&#45;   </xsl:apply&#45;templates> &#45;&#45;> -->
<!--     <!&#45;&#45;   <xsl:if test="$onlydate=1"> &#45;&#45;> -->
<!--     <!&#45;&#45;     <xsl:call&#45;template name="iso690.location"> &#45;&#45;> -->
<!--     <!&#45;&#45;       <xsl:with&#45;param name="onlypages" select="1"/> &#45;&#45;> -->
<!--     <!&#45;&#45;     </xsl:call&#45;template> &#45;&#45;> -->
<!--     <!&#45;&#45;   </xsl:if> &#45;&#45;> -->
<!--     <!&#45;&#45; </xsl:when> &#45;&#45;> -->
<!--     <xsl:when test="(./publisher/publishername|./publishername)and(./publisher/address/city)and($onlydate=0)"> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./publisher/address/city"> -->
<!--         <xsl:with&#45;param name="sep" select="$placesep"/> -->
<!--       </xsl:apply&#45;templates> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./publisher/publishername|./publishername"> -->
<!--         <xsl:with&#45;param name="sep" select="$endsep"/> -->
<!--       </xsl:apply&#45;templates> -->
<!--     </xsl:when> -->
<!--     <!&#45;&#45; <xsl:when test="not(./pubdate[not(@role='issuing')]|./copyright/year)"> &#45;&#45;> -->
<!--     <!&#45;&#45;   <xsl:call&#45;template name="iso690.data"> &#45;&#45;> -->
<!--     <!&#45;&#45;     <xsl:with&#45;param name="sep" select="$endsep"/> &#45;&#45;> -->
<!--     <!&#45;&#45;   </xsl:call&#45;template> &#45;&#45;> -->
<!--     <!&#45;&#45; </xsl:when> &#45;&#45;> -->
<!--   </xsl:choose> -->
<!-- </xsl:template> -->

<!-- <xsl:template name="apa.pubdate"> -->
<!--   <xsl:param name="endsep"> -->
<!--     <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'pubinfo.sep'"/></xsl:call&#45;template> -->
<!--   </xsl:param> -->
<!--   <xsl:choose> -->
<!--     <xsl:when test="(./pubdate[not(@role='issuing')]|./copyright/year)"> -->
<!--       <xsl:apply&#45;templates mode="iso690.mode" select="./pubdate[not(@role='issuing')]|./copyright/year"> -->
<!--         <xsl:with&#45;param name="sep" select="$endsep"/> -->
<!--       </xsl:apply&#45;templates> -->
<!--     </xsl:when> -->
<!--   </xsl:choose> -->
<!-- </xsl:template> -->

<!-- <xsl:template name="iso690.author.list"> -->
<!--   <xsl:param name="person.list" -->
<!--              select="author|corpauthor|orgname|editor"/> -->
<!--   <xsl:param name="person.count" select="count($person.list)"/> -->
<!--   <xsl:param name="count" select="1"/> -->
<!--   <xsl:param name="group" select="./authorgroup[@role='many']"/> -->
<!--   <xsl:param name="many" select="0"/> -->
<!--  -->
<!--   <xsl:param name="primary.many"> -->
<!--     <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'primary.many'"/></xsl:call&#45;template> -->
<!--   </xsl:param> -->
<!--   <xsl:param name="primary.editor"> -->
<!--     <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'primary.editor'"/></xsl:call&#45;template> -->
<!--   </xsl:param> -->
<!--   <xsl:param name="primary.sep"> -->
<!--     <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'primary.sep'"/></xsl:call&#45;template> -->
<!--   </xsl:param> -->
<!--  -->
<!--   <xsl:choose> -->
<!--     <xsl:when test="$count &#38;gt; $person.count"></xsl:when> -->
<!--     <xsl:otherwise> -->
<!--       <xsl:choose> -->
<!--         <xsl:when test="$person.count &#38;lt; 4 and not($group)"> -->
<!--           <xsl:call&#45;template name="iso690.author"> -->
<!--             <xsl:with&#45;param name="node" select="$person.list[position()=$count]"/> -->
<!--           </xsl:call&#45;template> -->
<!--           <xsl:choose> -->
<!--             <xsl:when test="$person.count = 2 and $count = 1 and $biblioentry.alt.primary.seps != 0"> -->
<!--               <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'alt.person.two.sep'"/></xsl:call&#45;template> -->
<!--             </xsl:when> -->
<!--             <xsl:when test="$person.count = 2 and $count = 1"> -->
<!--               <xsl:call&#45;template name="gentext.template"> -->
<!--                 <xsl:with&#45;param name="context" select="'authorgroup'"/> -->
<!--                 <xsl:with&#45;param name="name" select="'sep2'"/> -->
<!--               </xsl:call&#45;template> -->
<!--             </xsl:when> -->
<!--             <xsl:when test="$person.count &#38;gt; 2 and $count+1 = $person.count and $biblioentry.alt.primary.seps != 0"> -->
<!--               <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'alt.person.last.sep'"/></xsl:call&#45;template> -->
<!--             </xsl:when> -->
<!--             <xsl:when test="$person.count &#38;gt; 2 and $count+1 = $person.count"> -->
<!--               <xsl:call&#45;template name="gentext.template"> -->
<!--                 <xsl:with&#45;param name="context" select="'authorgroup'"/> -->
<!--                 <xsl:with&#45;param name="name" select="'seplast'"/> -->
<!--               </xsl:call&#45;template> -->
<!--             </xsl:when> -->
<!--             <xsl:when test="$count &#38;lt; $person.count and $biblioentry.alt.primary.seps != 0"> -->
<!--               <xsl:call&#45;template name="gentext.template"><xsl:with&#45;param name="context" select="'iso690'"/><xsl:with&#45;param name="name" select="'alt.person.more.sep'"/></xsl:call&#45;template> -->
<!--             </xsl:when> -->
<!--             <xsl:when test="$count &#38;lt; $person.count"> -->
<!--               <xsl:call&#45;template name="gentext.template"> -->
<!--                 <xsl:with&#45;param name="context" select="'authorgroup'"/> -->
<!--                 <xsl:with&#45;param name="name" select="'sep'"/> -->
<!--               </xsl:call&#45;template> -->
<!--             </xsl:when> -->
<!--             <xsl:when test="($count = $person.count)"> -->
<!--               <xsl:choose> -->
<!--                 <xsl:when test="$many!=0"> -->
<!--                   <xsl:if test="name($person.list[position()=$count])='editor'"> -->
<!--                     <xsl:value&#45;of select="$primary.editor"/> -->
<!--                   </xsl:if> -->
<!--                   <xsl:value&#45;of select="$primary.many"/> -->
<!--                   <xsl:text> </xsl:text> -->
<!--                 </xsl:when> -->
<!--                 <xsl:when test="name($person.list[position()=$count])='editor'"> -->
<!--                   <xsl:value&#45;of select="$primary.editor"/> -->
<!--                   <xsl:value&#45;of select="$primary.sep"/> -->
<!--                 </xsl:when> -->
<!--                 <xsl:when test="name($person.list[position()=$count])='corpauthor'"> -->
<!--                   <xsl:text> </xsl:text> -->
<!--                 </xsl:when> -->
<!--                 <xsl:when test="name($person.list[position()=$count])='orname'"> -->
<!--                   <xsl:text> </xsl:text> -->
<!--                 </xsl:when> -->
<!--                 <xsl:otherwise> -->
<!--                   <xsl:text> </xsl:text> -->
<!--                 </xsl:otherwise> -->
<!--               </xsl:choose> -->
<!--             </xsl:when> -->
<!--           </xsl:choose> -->
<!--  -->
<!--           <xsl:call&#45;template name="iso690.author.list"> -->
<!--             <xsl:with&#45;param name="person.list" select="$person.list"/> -->
<!--             <xsl:with&#45;param name="person.count" select="$person.count"/> -->
<!--             <xsl:with&#45;param name="count" select="$count+1"/> -->
<!--             <xsl:with&#45;param name="many" select="$many"/> -->
<!--             <xsl:with&#45;param name="group"/> -->
<!--           </xsl:call&#45;template> -->
<!--         </xsl:when> -->
<!--  -->
<!--         <xsl:otherwise> -->
<!--           <xsl:choose> -->
<!--             <xsl:when test="($biblioentry.primary.count&#38;gt;=3) and ($person.count&#38;gt;=3)"> -->
<!--               <xsl:call&#45;template name="iso690.author.list"> -->
<!--                 <xsl:with&#45;param name="person.list" select="$person.list[1]|$person.list[2]|$person.list[3]"/> -->
<!--                 <xsl:with&#45;param name="person.count" select="3"/> -->
<!--                 <xsl:with&#45;param name="count" select="1"/> -->
<!--                 <xsl:with&#45;param name="many" select="1"/> -->
<!--                 <xsl:with&#45;param name="group"/> -->
<!--               </xsl:call&#45;template> -->
<!--             </xsl:when> -->
<!--             <xsl:when test="($biblioentry.primary.count&#38;gt;1) and  ($person.count&#38;gt;1)"> -->
<!--               <xsl:call&#45;template name="iso690.author.list"> -->
<!--                 <xsl:with&#45;param name="person.list" select="$person.list[1]|$person.list[2]"/> -->
<!--                 <xsl:with&#45;param name="person.count" select="2"/> -->
<!--                 <xsl:with&#45;param name="count" select="1"/> -->
<!--                 <xsl:with&#45;param name="many" select="1"/> -->
<!--                 <xsl:with&#45;param name="group"/> -->
<!--               </xsl:call&#45;template> -->
<!--             </xsl:when> -->
<!--             <xsl:otherwise> -->
<!--               <xsl:call&#45;template name="iso690.author.list"> -->
<!--                 <xsl:with&#45;param name="person.list" select="$person.list[1]"/> -->
<!--                 <xsl:with&#45;param name="person.count" select="1"/> -->
<!--                 <xsl:with&#45;param name="count" select="1"/> -->
<!--                 <xsl:with&#45;param name="many" select="1"/> -->
<!--                 <xsl:with&#45;param name="group"/> -->
<!--               </xsl:call&#45;template> -->
<!--             </xsl:otherwise> -->
<!--           </xsl:choose> -->
<!--         </xsl:otherwise> -->
<!--       </xsl:choose> -->
<!--     </xsl:otherwise> -->
<!--   </xsl:choose> -->
<!-- </xsl:template> -->

<xsl:template match="d:corpauthor|d:orgname|d:firstname|d:surname" mode="iso690.mode">
  <xsl:apply-templates mode="iso690.mode"/>
</xsl:template>

<xsl:template name="iso690.author">
  <xsl:param name="node" select="."/>
  <xsl:param name="lastfirst.sep">
    <xsl:call-template name="gentext.template"><xsl:with-param name="context" select="'iso690'"/><xsl:with-param name="name" select="'lastfirst.sep'"/></xsl:call-template>
  </xsl:param>
  <xsl:choose>
    <xsl:when test="$node//d:orgname">
        <!-- <xsl:value&#45;of select="$node//d:orgname[1]" /> -->
        <fo:inline text-transform="uppercase">
            <xsl:apply-templates mode="iso690.mode" select="$node//d:orgname[1]"/>
        </fo:inline>
    </xsl:when>
    <xsl:when test="$node//d:surname">
      <fo:inline text-transform="uppercase">
        <xsl:apply-templates mode="iso690.mode" select="$node//d:surname[1]"/>
      </fo:inline>
      <xsl:if test="$node//d:surname and $node//d:firstname">
        <xsl:value-of select="$lastfirst.sep"/>
      </xsl:if>
      <xsl:apply-templates mode="iso690.mode" select="$node//d:firstname[1]"/>
    </xsl:when>
    <xsl:otherwise>
      <fo:inline text-transform="uppercase">
        <xsl:apply-templates mode="iso690.mode" select="$node"/>
      </fo:inline>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- <xsl:template match="firstname" mode="iso690.mode"> -->
<!--     <xsl:value&#45;of select="concat(substring(string(.), 1, 1), '.')" /> -->
<!-- </xsl:template> -->

<!-- <xsl:template name="biblioentry.label"> -->
<!--     <xsl:param name="node" select="."/> -->
<!--     <xsl:choose> -->
<!--         <xsl:when test="$bibliography.numbered != 0"> -->
<!--             <xsl:text>[</xsl:text> -->
<!--             <xsl:number from="bibliography" count="biblioentry|bibliomixed" -->
<!--                 level="any" format="1"/> -->
<!--             <xsl:text>] </xsl:text> -->
<!--         </xsl:when> -->
<!--         <xsl:when test="local&#45;name($node/child::*[1]) = 'abbrev'"> -->
<!--             <!&#45;&#45; nop &#45;&#45;> -->
<!--             <!&#45;&#45; <xsl:text>[</xsl:text> &#45;&#45;> -->
<!--             <!&#45;&#45; <xsl:apply&#45;templates select="$node/abbrev[1]"/> &#45;&#45;> -->
<!--             <!&#45;&#45; <xsl:text>] </xsl:text> &#45;&#45;> -->
<!--         </xsl:when> -->
<!--         <xsl:when test="$node/@xreflabel"> -->
<!--             <xsl:text>[</xsl:text> -->
<!--             <xsl:value&#45;of select="$node/@xreflabel"/> -->
<!--             <xsl:text>] </xsl:text> -->
<!--         </xsl:when> -->
<!--         <xsl:when test="$node/@id or $node/@xml:id"> -->
<!--             <xsl:text>[</xsl:text> -->
<!--             <xsl:value&#45;of select="($node/@id|$node/@xml:id)[1]"/> -->
<!--             <xsl:text>] </xsl:text> -->
<!--         </xsl:when> -->
<!--         <xsl:otherwise><!&#45;&#45; nop &#45;&#45;></xsl:otherwise> -->
<!--     </xsl:choose> -->
<!-- </xsl:template> -->

<!-- <xsl:template match="biblioid[@class='uri']|bibliomisc[@role='access']" mode="iso690.mode"> -->
<!--   <xsl:param name="firstacc" select="1"/> -->
<!--   <xsl:param name="access"> -->
<!--     <xsl:call-template name="gentext.template"><xsl:with-param name="context" select="'iso690'"/><xsl:with-param name="name" select="'access'"/></xsl:call-template> -->
<!--   </xsl:param> -->
<!--   <xsl:param name="acctoo"> -->
<!--     <xsl:call-template name="gentext.template"><xsl:with-param name="context" select="'iso690'"/><xsl:with-param name="name" select="'acctoo'"/></xsl:call-template> -->
<!--   </xsl:param> -->
<!--   <xsl:param name="onwww"> -->
<!--     <xsl:call-template name="gentext.template"><xsl:with-param name="context" select="'iso690'"/><xsl:with-param name="name" select="'onwww'"/></xsl:call-template> -->
<!--   </xsl:param> -->
<!--   <xsl:param name="oninet"> -->
<!--     <xsl:call-template name="gentext.template"><xsl:with-param name="context" select="'iso690'"/><xsl:with-param name="name" select="'oninet'"/></xsl:call-template> -->
<!--   </xsl:param> -->
<!--   <xsl:param name="access.end"> -->
<!--     <xsl:call-template name="gentext.template"><xsl:with-param name="context" select="'iso690'"/><xsl:with-param name="name" select="'access.end'"/></xsl:call-template> -->
<!--   </xsl:param> -->
<!--   <xsl:param name="access.sep"> -->
<!--     <xsl:call-template name="gentext.template"><xsl:with-param name="context" select="'iso690'"/><xsl:with-param name="name" select="'access.sep'"/></xsl:call-template> -->
<!--   </xsl:param> -->
<!--   <xsl:choose> -->
<!--     <xsl:when test="$firstacc=1"> -->
<!--       <xsl:value-of select="$access"/> -->
<!--     </xsl:when> -->
<!--     <xsl:otherwise> -->
<!--       <xsl:value-of select="$acctoo"/> -->
<!--     </xsl:otherwise> -->
<!--   </xsl:choose> -->
<!--   <xsl:choose> -->
<!--       <xsl:when test="./link/@xlink:href != ''"> -->
<!--       <xsl:choose> -->
<!--         <xsl:when test="(starts-with(./link/@xlink:href,'http://')or(starts-with(./link/@xlink:href,'https://')))"> -->
<!--           <xsl:value-of select="$onwww"/> -->
<!--           <xsl:value-of select="$access.end"/> -->
<!--           <xsl:apply-templates mode="iso690.mode" select="./link/@xlink:href"/> -->
<!--         </xsl:when> -->
<!--         <xsl:otherwise> -->
<!--           <xsl:value-of select="$oninet"/> -->
<!--           <xsl:value-of select="$access.end"/> -->
<!--           <xsl:apply-templates mode="iso690.mode" select="./ulink"/> -->
<!--         </xsl:otherwise> -->
<!--       </xsl:choose> -->
<!--     </xsl:when> -->
<!--     <xsl:when test="(./ulink)and(string(./ulink)!=string(.))"> -->
<!--       <xsl:value-of select="text()[1]"/> -->
<!--       <xsl:call-template name="iso690.endsep"> -->
<!--         <xsl:with-param name="text" select="text()[1]"/> -->
<!--         <xsl:with-param name="sep" select="$access.end"/> -->
<!--       </xsl:call-template> -->
<!--       <xsl:apply-templates mode="iso690.mode" select="./ulink"/> -->
<!--     </xsl:when> -->
<!--     <xsl:otherwise> -->
<!--       <xsl:apply-templates mode="iso690.mode"/> -->
<!--     </xsl:otherwise> -->
<!--   </xsl:choose> -->
<!--   <xsl:value-of select="$access.sep"/> -->
<!-- </xsl:template> -->

<!-- <!&#45;&#45; MONOGRAPHS &#45;&#45;> -->
<!-- <xsl:template name="iso690.monogr"> -->
<!--   <!&#45;&#45; Primary responsibility &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.primary"/> -->
<!--   <!&#45;&#45; Publication date &#45;&#45;> -->
<!--   <xsl:call&#45;template name="apa.pubdate"/> -->
<!--   <!&#45;&#45; Title and Type of medium &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.title"/> -->
<!--   <xsl:call&#45;template name="iso690.location"/> -->
<!--   <!&#45;&#45; Subordinate responsibility &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.secondary"/> -->
<!--   <!&#45;&#45; Edition &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.edition"/> -->
<!--   <!&#45;&#45; Place of publication, Publisher, Year/Date of publication, Date of update/revision, Date of citation &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.pub"/> -->
<!--   <!&#45;&#45; Extent &#45;&#45;> -->
<!--   <!&#45;&#45; <xsl:call&#45;template name="iso690.extent"/> &#45;&#45;> -->
<!--   <!&#45;&#45; Series &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.serie"/> -->
<!--   <!&#45;&#45; Notes &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.notice"/> -->
<!--   <!&#45;&#45; Avaibility and access &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.access"/> -->
<!--   <!&#45;&#45; Standard number &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.isbn"/> -->
<!-- </xsl:template> -->

<!-- <xsl:template match="biblioset" mode="iso690.article.art"> -->
<!-- <!&#45;&#45; Article &#45;&#45;> -->
<!--   <!&#45;&#45; Primary responsibility &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.primary"/> -->
<!--   <!&#45;&#45; Publication date &#45;&#45;> -->
<!--   <xsl:call&#45;template name="apa.pubdate"/> -->
<!--   <!&#45;&#45; Title &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.title"> -->
<!--     <xsl:with&#45;param name="italic" select="0"/> -->
<!--   </xsl:call&#45;template> -->
<!--   <!&#45;&#45; Subordinate responsibility [nonEL] &#45;&#45;> -->
<!--   <xsl:if test="not(../*/bibliomisc[@role='medium'])"> -->
<!--     <xsl:call&#45;template name="iso690.secondary"/> -->
<!--   </xsl:if> -->
<!-- </xsl:template> -->

<!-- <xsl:template match="biblioset" mode="iso690.article.jour"> -->
<!-- <!&#45;&#45; Serial &#45;&#45;> -->
<!--   <!&#45;&#45; Title and Type of medium &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.title"/> -->
<!--   <!&#45;&#45; Edition &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.edition"> -->
<!--     <xsl:with&#45;param name="after" select="./pubdate[not(@role='issuing')]|./volumenum|./issuenum|./pagenums"/> -->
<!--   </xsl:call&#45;template> -->
<!--   <!&#45;&#45; Number designation [EL] &#45;&#45;> -->
<!--   <!&#45;&#45; Place of publication, Publisher, Year/Date of publication, Date of update/revision, Date of citation &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.pub"/> -->
<!--   <!&#45;&#45; Location within host &#45;&#45;> -->
<!--   <xsl:call&#45;template name="iso690.article.location"/> -->
<!--   <!&#45;&#45; I've no clue what bibliomisc is all about.  Apparently I should embed the -->
<!--        following elements .. but that's not allowed? &#45;&#45;> -->
<!--   <!&#45;&#45; <xsl:if test="./bibliomisc[@role='medium']"> &#45;&#45;> -->
<!--   <!&#45;&#45; Notes [EL] &#45;&#45;> -->
<!--     <xsl:call&#45;template name="iso690.notice"/> -->
<!--   <!&#45;&#45; Avaibility and access [EL] &#45;&#45;> -->
<!--     <xsl:call&#45;template name="iso690.access"/> -->
<!--   <!&#45;&#45; Standard number [EL] &#45;&#45;> -->
<!--     <xsl:call&#45;template name="iso690.issn"/> -->
<!--   <!&#45;&#45; </xsl:if> &#45;&#45;> -->
<!-- </xsl:template> -->

</xsl:stylesheet>
