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
					<xsl:variable name="mannysCorresp">
						<xsl:value-of select="substring-after(@corresp, '.')"/>
					</xsl:variable>
					<div id="{@corresp}" onclick="aScroll('{substring-after(@corresp, '.')}');">
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
	<xsl:variable name="lemma">
		<xsl:call-template name="tikkysOutput">
			<xsl:with-param name="sign">
				<xsl:value-of select="@lemma"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="iId">
		<xsl:text>g</xsl:text><xsl:value-of select="translate(//@id, '.', '')"/>
	</xsl:variable>
	<span title="{$lemma} {@pos} {@label}" onmouseover="showMannysDef('{$lemma}', '{@pos}', '{@label}', '{$iId}')"><xsl:call-template name="yevvysDiacriticAnalyzer"/></span>
	<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="l">
	<xsl:choose>
		<xsl:when test="not(@corresp)">
			<div class="persephone" onmouseover="this.style.color = 'skyblue';" onmouseout="this.style.color = 'lavender';">
				<span class="beatrix"><xsl:value-of select="@n"/></span>
				<xsl:text> - </xsl:text>
				<xsl:apply-templates select="w"/>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<xsl:variable name="yevvysId" select="substring-after(@corresp, '.')"/>
			<div class="persephone" onmouseover="iOver(this, '{$yevvysId}');" onmouseout="iOut(this, '{$yevvysId}')">
				<span class="beatrix"><xsl:value-of select="@n"/></span>
				<xsl:text> - </xsl:text>
				<xsl:apply-templates select="w"/>
			</div>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="yevvysDiacriticAnalyzer">
	<xsl:if test="not(contains(., '-'))">
		<xsl:call-template name="tikkysOutput">
			<xsl:with-param name="sign">
				<xsl:value-of select="."/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:if>
	<xsl:if test="contains(., '-')">
		<xsl:call-template name="tikkysOutput">
			<xsl:with-param name="sign">
				<xsl:value-of select="substring-before(., '-')"/>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="mannysDiacriticAnalyzer">
			<xsl:with-param name="translFrag">
				<xsl:value-of select="substring-after(., '-')"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="mannysDiacriticAnalyzer">
	<xsl:param name="translFrag"/>
	<xsl:text>-</xsl:text>
	<xsl:if test="not(contains($translFrag, '-'))">
		<xsl:call-template name="tikkysOutput">
			<xsl:with-param name="sign">
				<xsl:value-of select="$translFrag"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:if>
	<xsl:if test="contains($translFrag, '-')">
		<xsl:call-template name="tikkysOutput">
			<xsl:with-param name="sign">
				<xsl:value-of select="substring-before($translFrag, '-')"/>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="mannysDiacriticAnalyzer">
			<xsl:with-param name="translFrag">
				<xsl:value-of select="substring-after($translFrag, '-')"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:include href="xsl/tikkysOutput.xsl"/>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c)1998-2003. Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\transliterations\c.1.4.3.xml" htmlbaseurl="" outputurl="" processortype="internal" profilemode="0" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/></scenarios><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
</metaInformation>
-->