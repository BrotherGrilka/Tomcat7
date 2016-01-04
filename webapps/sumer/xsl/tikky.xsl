<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="ISO-8859-1"/>

<xsl:template match="*|/">
	<xsl:apply-templates select="TEI.2/teiHeader/fileDesc/titleStmt/title"/>
</xsl:template>

<xsl:template match="text()|@*"><xsl:value-of select="."/></xsl:template>

<xsl:template match="TEI.2/teiHeader/fileDesc/titleStmt/title">
	<xsl:variable name="poohTitle">
		<xsl:value-of select="text()"/>
		<xsl:apply-templates select="foreign"/>
	</xsl:variable>
	<xsl:choose>
		<xsl:when test="string-length($poohTitle) &gt; 18">
			<xsl:value-of select="substring($poohTitle, 1, 18)"/>
			<xsl:text> ...</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$poohTitle"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="foreign">
	<em><xsl:value-of select="text()"/></em>
	<xsl:value-of select="following-sibling::node()[1][self::text()]"/>
</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c)1998-2003. Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\transliterations\c.2.4.1.6.xml" htmlbaseurl="" outputurl="" processortype="internal" profilemode="0" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/></scenarios><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
</metaInformation>
-->