<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="ISO-8859-1"/>

<xsl:template match="*|/">
	<xsl:apply-templates select="TEI.2/text/body | TEI.2/text/body/div1 | TEI.2/text/body/lg | TEI.2/text/body/div1/lg"/>
</xsl:template>

<xsl:template match="text()|@*"><xsl:value-of select="."/></xsl:template>

<xsl:template match="TEI.2/text/body | TEI.2/text/body/div1 | TEI.2/text/body/lg | TEI.2/text/body/div1/lg">
	<xsl:apply-templates select="l"/>
</xsl:template>

<xsl:template match="l">
	<br/>
</xsl:template>

</xsl:stylesheet>