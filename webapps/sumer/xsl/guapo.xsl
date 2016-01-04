<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="ISO-8859-1"/>

<xsl:template match="*|/">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="text()|@*"><xsl:value-of select="."/></xsl:template>

<xsl:template match="solarsystem">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Guapo's Transformation</title>
<link rel="stylesheet" rev="stylesheet" href="css/sifr.css" type="text/css" media="screen"/>
<link rel="Shortcut Icon" href="/yevie/favicon.ico"/>
<script src="/maussollos/js/sifr.js" type="text/javascript">Hi Tikke</script>
</head>
<body style="background-color: black; padding: 1em;">
	<h3>Planets</h3>
	<xsl:apply-templates select="planet"/>
	<div style="border-bottom: 1px dashed yellow;">Hi Tikke</div>
	<h3>Dwarf Planets</h3>
	<xsl:apply-templates select="minorplanet"/>
	<div style="border-bottom: 1px dashed yellow;">Hi Tikke</div>
	<h3>Icy Rocks</h3>
	<xsl:apply-templates select="icyrocks"/>
	<xsl:apply-templates select="solarmisc"/>
<div style="border-bottom: 1px dashed skyblue;">Hi Tikke</div>
<script type="text/javascript">
if(typeof sIFR == "function")
{
    sIFR();
	sIFR.replaceElement("h4", named({sFlashSrc: "/maussollos/swf/babyjeepers.swf", sColor: "#FF8C00", sBgColor: "#000000"}));
	sIFR.replaceElement("h3", named({sFlashSrc: "/maussollos/swf/babyjeepers.swf", sColor: "#FF8C00", sBgColor: "#000000"}));
};
</script>
</body>
</html>
</xsl:template>

<xsl:template match="planet | minorplanet">

<xsl:if test="position() = 1">
	<div style="border-bottom: 1px dashed yellow;"></div>
</xsl:if>

<xsl:if test="position() != 1">
	<div style="border-bottom: 1px dashed darkorange;"></div>
</xsl:if>

<div style="color: darkorange;">
	<h4 style="margin-bottom: 0;"><xsl:value-of select="text()"/></h4>
	<p style="color: darkorange;">
		<xsl:choose>
			<xsl:when test="@volcanism and @retrograde">
				<xsl:text> (volcanic and retrograde)</xsl:text>
			</xsl:when>
			<xsl:when test="@volcanism">
				<xsl:text> (volcanic)</xsl:text>
			</xsl:when>
			<xsl:when test="@retrograde">
				<xsl:text> (retrograde orbit)</xsl:text>
			</xsl:when>
		</xsl:choose>
	</p>
<xsl:if test="@nickname">
	<p style="color: lightgrey; font-style: italic;"><xsl:text>"</xsl:text><xsl:value-of select="@nickname"/><xsl:text>"</xsl:text></p>
</xsl:if>
	<p><xsl:apply-templates select="images"/></p>
	<p>
		<p style="color: darkorange; font-weight: bold;"><xsl:value-of select="stats/@label"/></p>
		<table>
		<xsl:apply-templates select="stats"/>
		</table>
	</p>
<xsl:if test="atmosphere/*">
	<p>
		<p style="color: darkorange; font-weight: bold;"><xsl:value-of select="atmosphere/@label"/></p>
		<p style="color: skyblue;"><xsl:apply-templates select="atmosphere/component"/></p>
	</p>
</xsl:if>
	<p>
		<p style="color: darkorange; font-weight: bold;"><xsl:value-of select="magneticfield/@label"/></p>
		<table>
			<xsl:apply-templates select="magneticfield"/>
		</table>
	</p>

<xsl:if test="funfacts/resonance">
	<p>
		<table>
			<tr>
				<td style="color: darkorange; font-weight: bold;"><xsl:text>Resonances</xsl:text></td>
				<td style="color: darkorange;"><xsl:text>Ratio</xsl:text></td>
		<xsl:if test="funfacts/resonance/degrees">
				<td style="color: yellow;"><xsl:text>Degrees</xsl:text></td>
		</xsl:if>
			</tr>
			<xsl:apply-templates select="funfacts/resonance"/>
		</table>
	</p>
</xsl:if>

<xsl:if test="moonsystem">
	<p style="color: skyblue;">
		<p style="color: darkorange; font-weight: bold;"><xsl:value-of select="moonsystem/@label"/></p>
		<p style="color: darkorange;"><xsl:apply-templates select="moonsystem/moon[resonance]"/></p>
		<p style="color: darkorange;"><xsl:apply-templates select="moonsystem/moon[not(resonance)]"/></p>
	</p>
</xsl:if>

<xsl:if test="ringsystem and ringsystem/*">
	<p style="color: skyblue;">
		<p style="color: darkorange; font-weight: bold;">Ring System</p>
		<p style="color: darkorange;"><xsl:apply-templates select="ringsystem/ring"/></p>
	</p>
</xsl:if>

<xsl:if test="funfacts/planetaryphenomena">
	<p style="font-weight: bold;"><xsl:value-of select="funfacts/planetaryphenomena/text()"/></p>
</xsl:if>

</div>

</xsl:template>

<xsl:template match="images/image">
	<img src="/maussollos/{.}"/>
</xsl:template>

<xsl:template match="stats/* | magneticfield/*">
<xsl:if test="./text() != ''">
	<tr>
		<td style="color: skyblue; width: 15em;"><xsl:value-of select="./@label"/></td>
		<td style="color: yellow;"><xsl:value-of select="./text()"/></td>
	</tr>
</xsl:if>
</xsl:template>

<xsl:template match="atmosphere/component">
	<xsl:value-of select="."/>
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="moonsystem/moon[resonance]">
	<xsl:value-of select="normalize-space(./text())"/>
	<xsl:if test="@volcanism">
		<xsl:text> (volcanic)</xsl:text>
	</xsl:if>
	<xsl:if test="@retrograde">
		<xsl:text> (retrograde orbit)</xsl:text>
	</xsl:if>
	<table>
		<tr>
			<td style="color: skyblue; padding-left: 1em; width: 8em; font-style: italic;"><xsl:text>Resonances</xsl:text></td>
			<td style="color: yellow; padding-left: 1em; font-style: italic;"><xsl:text>Ratio</xsl:text></td>
	<xsl:if test="./resonance/degrees">
			<td style="color: yellow; padding-left: 1em; font-style: italic;"><xsl:text>Degrees</xsl:text></td>
	</xsl:if>
		</tr>
		<xsl:apply-templates select="./resonance"/>
	</table>
</xsl:template>

<xsl:template match="resonance">
	<tr>
		<td valign="top" style="color: skyblue; padding-left: 1em; width: 8em;"><xsl:apply-templates select="./bondmate"/></td>
		<td valign="top" style="color: yellow; padding-left: 1em;"><xsl:value-of select="normalize-space(./ratio/text())"/></td>
<xsl:if test="./degrees">
		<td valign="top" style="color: yellow; padding-left: 1em;"><xsl:value-of select="normalize-space(./degrees/text())"/></td>
</xsl:if>
	</tr>
</xsl:template>

<xsl:template match="funfacts/resonance">
	<tr>
		<td valign="top" style="color: skyblue; width: 8em;"><xsl:apply-templates select="./bondmate"/></td>
		<td valign="top" style="color: yellow;"><xsl:value-of select="normalize-space(./ratio/text())"/></td>
<xsl:if test="./degrees">
		<td valign="top" style="color: yellow;"><xsl:value-of select="normalize-space(./degrees/text())"/></td>
</xsl:if>
	</tr>
</xsl:template>

<xsl:template match="bondmate">
	<xsl:value-of select="./text()"/><br/>
</xsl:template>

<xsl:template match="moonsystem/moon[not(resonance)]">
	<xsl:value-of select="normalize-space(./text())"/>
	<xsl:if test="@volcanism">
		<xsl:text> (volcanic)</xsl:text>
	</xsl:if>
	<xsl:if test="@retrograde">
		<xsl:text> (retrograde orbit)</xsl:text>
	</xsl:if>
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="ringsystem/ring">
	<xsl:value-of select="normalize-space(./text())"/>
	<table>
		<tr>
			<td style="color: yellow; padding-left: 1em; width: 8em; font-style: italic;"><xsl:text>Inner Radius</xsl:text></td>
			<td style="color: yellow; padding-left: 1em; font-style: italic;"><xsl:text>Outer Radius</xsl:text></td>
			<td style="color: yellow; padding-left: 1em; font-style: italic;"><xsl:text>Width</xsl:text></td>
		</tr>
		<tr>
			<td style="color: yellow; padding-left: 1em; width: 8em;"><xsl:value-of select="./innerradius"/></td>
			<td style="color: yellow; padding-left: 1em;"><xsl:value-of select="./outerradius"/></td>
			<td style="color: yellow; padding-left: 1em;"><xsl:value-of select="./width"/></td>
		</tr>
	<xsl:if test="resonance">
		<table>
			<tr>
				<td style="color: skyblue; padding-left: 1em; width: 8em; font-style: italic;"><xsl:text>Resonances</xsl:text></td>
				<td style="color: yellow; padding-left: 1em; font-style: italic;"><xsl:text>Ratio</xsl:text></td>
	<xsl:if test="./resonance/degrees">
				<td style="color: yellow; padding-left: 1em; font-style: italic;"><xsl:text>Degrees</xsl:text></td>
	</xsl:if>
			</tr>
		<xsl:apply-templates select="./resonance"/>
		</table>
	</xsl:if>
	</table>
</xsl:template>

<xsl:template match="icyrocks">

<xsl:if test="position() = 1">
	<div style="border-bottom: 1px dashed yellow;"></div>
</xsl:if>
	<h4 style="margin-bottom: 0;"><xsl:value-of select="text()"/></h4>
<xsl:if test="position() = last">
	<div style="margin-bottom: 2ex;">Hi Tikke!</div>
</xsl:if>

</xsl:template>

<xsl:template match="solarmisc">
	<h4><xsl:value-of select="name(comets)"/></h4>
	<h4><xsl:value-of select="name(centaurs/planetoid)"/></h4>
	<xsl:apply-templates select="centaurs"/>
</xsl:template>

<xsl:template match="centaurs">
	<xsl:apply-templates select="planetoid"/>
</xsl:template>

<xsl:template match="planetoid">
	<p style="color: darkorange; font-weight: bold;"><xsl:value-of select="text()"/></p>
	<xsl:if test="resonance">
		<table>
			<tr>
				<td style="color: skyblue; padding-left: 1em; width: 8em; font-style: italic;"><xsl:text>Resonances</xsl:text></td>
				<td style="color: yellow; padding-left: 1em; font-style: italic;"><xsl:text>Ratio</xsl:text></td>
	<xsl:if test="./resonance/degrees">
				<td style="color: yellow; padding-left: 1em; font-style: italic;"><xsl:text>Degrees</xsl:text></td>
	</xsl:if>
			</tr>
		<xsl:apply-templates select="./resonance"/>
		</table>
	</xsl:if>
</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c)1998-2003. Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\xml\solarsystem.xml" htmlbaseurl="" outputurl="" processortype="internal" profilemode="0" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/></scenarios><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
</metaInformation>
-->