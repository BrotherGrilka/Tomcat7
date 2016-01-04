<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="ISO-8859-1"/>

<xsl:template match="*|/">
	<xsl:apply-templates select="TEI.2/text/body | TEI.2/text/body/div1 | TEI.2/text/body/lg | TEI.2/text/body/div1/lg"/>
</xsl:template>

<xsl:template match="text()|@*"><xsl:value-of select="."/></xsl:template>

<xsl:template match="TEI.2/text/body | TEI.2/text/body/div1 | TEI.2/text/body/lg | TEI.2/text/body/div1/lg">
	<xsl:choose>
		<xsl:when test="not(l[position() = 1]/@corresp | l[position() = 2]/@corresp)">
			<xsl:apply-templates select="l | gap"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:for-each select="l | gap">
				<xsl:if test="position() = 1 or not(@corresp = preceding-sibling::node()/@corresp)">
					<xsl:variable name="yevvysCorresp" select="@corresp"/>
					<div id="{@corresp}">
						<xsl:apply-templates select="../l[@corresp = $yevvysCorresp]"/>
					</div>
				</xsl:if>
			</xsl:for-each>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gap">
	<div class="persephone"><xsl:text> ...</xsl:text></div>
</xsl:template>

<xsl:template match="w">
	<span title="{@lemma} {@pos} {@label}"><xsl:value-of select="."/></span>
	<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="l">
	<xsl:choose>
		<xsl:when test="not(@corresp)">
			<div class="persephone" onmouseover="this.style.color = 'skyblue';" onmouseout="this.style.color = 'lavenderblush';">
				<xsl:value-of select="@n"/>
				<xsl:text> - </xsl:text>
				<xsl:apply-templates select="w"/>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<xsl:variable name="yevvysId" select="substring-after(@corresp, '.')"/>
			<div class="persephone" onmouseover="this.style.color = 'skyblue'; document.getElementById('{$yevvysId}').style.color = 'skyblue';" onmouseout="this.style.color = 'lavenderblush'; document.getElementById('{$yevvysId}').style.color = 'lavenderblush';">
				<xsl:value-of select="@n"/>
				<xsl:text> - </xsl:text>
				<xsl:apply-templates select="w"/>
			</div>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c)1998-2003. Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\transliterations\c.1.1.1.xml" htmlbaseurl="" outputurl="" processortype="internal" profilemode="0" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/><scenario default="no" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\transliterations\c.1.1.1.manny.xml" htmlbaseurl="" outputurl="" processortype="internal" profilemode="0" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/><scenario default="no" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\transliterations\c.1.1.1.manny.xml" htmlbaseurl="" outputurl="" processortype="internal" profilemode="0" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/></scenarios><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
</metaInformation>
-->