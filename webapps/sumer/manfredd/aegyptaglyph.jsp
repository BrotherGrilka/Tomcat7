<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Maussollos at Halicarnassus</title>
<link rel="Shortcut Icon" href="/yevie/favicon.ico">
<script src="/maussollos/js/sifr.js" type="text/javascript"></script>
<style>
*
{
	padding: 0;
	margin: 0;
}
body
{
	margin: 0;
	padding: 0;
	background-color: black;
	color: aquamarine;
}
/* These are standard sIFR styles... do not modify */
.sIFR-flash
{
	visibility: visible !important;
	margin: 0;
}
.sIFR-replaced
{
	visibility: visible !important;
}
span.sIFR-alternate
{
	position: absolute;
	left: 0;
	top: 0;
	width: 0;
	height: 0;
	display: block;
	overflow: hidden;
}
/* Hide Adblock Object tab: the text should show up just fine, not poorly with a tab laid over it. */
.sIFR-flash + div[adblocktab=true]
{
  display: none !important;
}
/* These "decoy" styles are used to hide the browser text before it is replaced... the negative-letter spacing in this case is used to make the browser text metrics match up with the sIFR text metrics since the sIFR text in this example is so much narrower... your own settings may vary... any weird sizing issues you may run into are usually fixed by tweaking these decoy styles */
.sIFR-hasFlash h1
{
	visibility: hidden;
	font-size: 144px;
}
.sIFR-hasFlash h2
{
	visibility: hidden;
	font-size: 144px;
}
.sIFR-hasFlash h3
{
	visibility: hidden;
	font-size: 144px;
}
.sIFR-hasFlash h4
{
	visibility: hidden;
	font-size: 144px;
}
#hazel
{
	width: 160px;
}
</style>
</head>
<body>

<div id="hazel">

<c:choose>
	<c:when test="${!empty param.glyph}">
		<c:set var="mannyGlyph" value="${param.glyph}"/>
	</c:when>
	<c:otherwise>
		<c:set var="mannyGlyph" value="230"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${param.hwhat == 'h4'}">
		<h4>&#<c:out value="${mannyGlyph}"/>;</h4>
	</c:when>
	<c:when test="${param.hwhat == 'h3'}">
		<h3>&#<c:out value="${mannyGlyph}"/>;</h3>
	</c:when>
	<c:when test="${param.hwhat == 'h2'}">
		<h2>&#<c:out value="${mannyGlyph}"/>;</h2>
	</c:when>
	<c:otherwise>
		<h1>&#<c:out value="${mannyGlyph}"/>;</h1>
	</c:otherwise>
</c:choose>

</div>

<script type="text/javascript">
if(typeof sIFR == "function")
{
    sIFR();
	sIFR.replaceElement("#hazel h1", named({sFlashSrc: "/maussollos/swf/glyph1.swf", sColor: "#7FFF00", sBgColor: "#000000", sFlashVars: "textalign=center"}));
	sIFR.replaceElement("#hazel h2", named({sFlashSrc: "/maussollos/swf/glyph2.swf", sColor: "#7FFF00", sBgColor: "#000000", sFlashVars: "textalign=center"}));
	sIFR.replaceElement("#hazel h3", named({sFlashSrc: "/maussollos/swf/glyph3.swf", sColor: "#7FFF00", sBgColor: "#000000", sFlashVars: "textalign=center"}));
	sIFR.replaceElement("#hazel h4", named({sFlashSrc: "/maussollos/swf/glyph4.swf", sColor: "#7FFF00", sBgColor: "#000000", sFlashVars: "textalign=center"}));
};
</script>

</body>
</html>