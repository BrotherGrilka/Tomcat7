<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="ISO-8859-1"/>

<xsl:template match="text()|@*"><xsl:value-of select="."/></xsl:template>

<xsl:variable name="yevvysInc">
	<xsl:value-of select="yevvy.xsl"/>
</xsl:variable>

<xsl:include href="$yevvysInc"/>

</xsl:stylesheet>