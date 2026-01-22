<?xml version="1.0" encoding="UTF-8"?>
<!-- XML Schema 1.1 to XML Schema 1.0 Conversion XSL Sheet -->
<!-- Tested with Saxon XSLT processor. -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning" exclude-result-prefixes="vc">
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>

    <!-- This element removes indentation with Xalan 2.7.1 (indentation preserved with Saxon 9.6.0.4). -->
    <!-- <xsl:strip-space elements="*" /> -->
  
  <xsl:variable name="target.vc" select="number(1.0)"/>
  <xsl:template match="*[@vc:*]">
    <xsl:if test="(not(@vc:minVersion) or $target.vc ge number(@vc:minVersion)) and (not(@vc:maxVersion) or $target.vc le number(@vc:maxVersion))">
        <xsl:copy>
          <xsl:apply-templates select="@*"/>
          <xsl:apply-templates/>
        </xsl:copy>
    </xsl:if>
  </xsl:template>
  <xsl:template match="*|text()|@*">
      <xsl:copy>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates/>
      </xsl:copy>
  </xsl:template>

</xsl:stylesheet>