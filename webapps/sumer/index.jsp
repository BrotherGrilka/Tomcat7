<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:directive.page isELIgnored="false"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>The Heron and the Turtle</title>
	<link rel="Shortcut Icon" href="favicon.ico"/>
	<link rel="stylesheet" rev="stylesheet" href="css/sumer.css" type="text/css" media="screen"/>
	<link rel="stylesheet" rev="stylesheet" href="css/sifr.css" type="text/css" media="screen"/>
	<script src="js/sumer.js" type="text/javascript"></script>
	<script src="js/sifr.js" type="text/javascript"></script>
	<script type="text/javascript">
		if (typeof sIFR == "function")
		{
	    	sIFR();
			sIFR.replaceElement("#cecily h1", named({sFlashSrc: "swf/RKPersian.swf", sColor: "#87CEEB", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
		};
	</script>
</head>
<body>
	<div id="ivo"></div>
	
	<div id="aloysius">

		<div id="cecily">
				<jsp:useBean id="tikkeDice" class="beans.glyphBean"/>
				<jsp:setProperty name="tikkeDice" property="die"/>
				<jsp:setProperty name="tikkeDice" property="glyph" value="Persian"/>
				<c:set var="tikkeRoll" value="${tikkeDice.dieRoll}"/>
			<h1>
				<c:forEach begin="1" end="10">
					<c:set var="tikkeRoll" value="${tikkeDice.dieRoll}"/>
					&#<c:out value="${tikkeRoll}"/>;
				</c:forEach>
			</h1>
		</div>

<%
	String yevvysXML = request.getParameter("Transliteration");
	String mannysXML = request.getParameter("Translation");

	if (yevvysXML == null && mannysXML == null)
	{
		yevvysXML = "c.1.1.1.xml";
		mannysXML = "t.1.1.1.xml";
	}
	else if (mannysXML == null)
	{
		mannysXML = "t." + yevvysXML;
		yevvysXML = "c." + yevvysXML;
	}
	else
	{
		yevvysXML = "c." + mannysXML;
		mannysXML = "t." + mannysXML;
	}

	pageContext.setAttribute("yevvysXML", yevvysXML);
	pageContext.setAttribute("mannysXML", mannysXML);
%>

		<div align="right" id="toptabs">
			<div align="center" id="mannysDef"></div>
			<a href="#" style="margin-right: 1em;" class="rounded" onclick="viewTab('corpus');"><span>View Corpus</span></a>
			<a href="#" style="margin-right: 1em;" class="rounded" onclick="viewTab('glossary');"><span>Corpus Glossary</span></a>
			<a href="#" style="margin-right: 1em;" class="rounded" onclick="viewTab('contents');"><span>Corpus Contents</span></a>
			<a href="#" class="rounded" onclick="viewTab('blog');"><span>View Blog</span></a>
		</div>

		<div id="corpus">
			<table>
				<tr>
					<td valign="top" colspan="3" class="lorelei">
						<c:import url="guapoTran?XML=transliterations/${yevvysXML}&XSL=xsl/gemineye.xsl"/>
					</td>
				</tr>
				<tr>
					<td valign="top" class="pandora">
						<div id="yevvyCorpus"><c:import url="guapoTran?XML=transliterations/${yevvysXML}&XSL=xsl/yevvy.xsl"/></div>
						<div id="yevvyContents"><c:import url="inc/cat_cat.html"/></div>
						<div id="yevvyGlossary"><c:import url="guapoTran?XML=transliterations/${yevvysXML}&XSL=xsl/poopy.xsl"/></div>
						<div><c:import url="guapoTran?XML=transliterations/${yevvysXML}&XSL=xsl/br.xsl"/></div>
					</td>
					<td valign="top" class="pandora">
						<div id="mannyCorpus"><c:import url="guapoTran?XML=translations/${mannysXML}&XSL=xsl/manny.xsl"/></div>
						<div id="mannyContents"><c:import url="inc/kat_kat.html"/></div>
						<div id="mannyGlossary"></div>
					</td>
					<td valign="top" id="amelia">
						<c:import url="inc/right_menu.jsp"/>
					</td>
				</tr>
			</table>
		</div>

		<div id="blog">
			<iframe src='/blojsom/blog/sumer/' frameborder='0' scrolling='no' style='width: 820px; height: 2980px; border: 0;'></iframe>
		</div>
	</div>
	<br/>
</body></html>