<?xml version="1.0" encoding="UTF-8"?>
<!-- XSL Sheet for removing XML comments -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output omit-xml-declaration="yes" encoding="UTF-8" indent="yes" method="xml"/>

    <!-- This element removes indentation with Xalan 2.7.1 (indentation preserved with Saxon 9.6.0.4). -->
  <xsl:strip-space elements="*" />
  <xsl:template match="comment()"/>
  <xsl:template match="*">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
    
</xsl:stylesheet>