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
	border-top: 9px solid magenta;
	color: aquamarine;
}
#ivo
{
	margin: 0;
	padding: 0;
	width: 100%;
	height: 9px;
	border-top: 9px solid chartreuse;
	overflow: hidden;
}
#aloysius
{
	margin-left: 14px;
	width: 850px;
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
	font-size: 8px;
}
.sIFR-hasFlash h2
{
	visibility: hidden;
	font-size: 8px;
}
.sIFR-hasFlash h3
{
	visibility: hidden;
	font-size: 8px;
}
.sIFR-hasFlash h4
{
	visibility: hidden;
	font-size: 8px;
}
#hazel
{
	padding-top: 12px;
}
.gb1 {font-family:"GlyphBasic1"; font-size: 36pt; font-weight: bold;}
.gb2 {font-family:"GlyphBasic2"; font-size: 36pt; font-weight: bold;}
.gb3 {font-family:"GlyphBasic3"; font-size: 36pt; font-weight: bold;}
.gb4 {font-family:"GlyphBasic4"; font-size: 36pt; font-weight: bold;}
.donimo
{
	width: 18px;
	height: 2px;
	text-align: center;
	background-color: dodgerblue;
	color: black;
	border-top: 5px solid black;
	border-bottom: 5px solid black;
	font-size: 1px;
}
.persephone
{
}
#manny
{
	color: charteuse;
	width: 100px;
}
</style>
<script language="javascript">
var mannyGlyph = "<iframe src='aegyptaglyph.jsp?glyph=33'></iframe>";

function mannyChange(glyph, hwhat)
{
	document.getElementById('manny').innerHTML = "<iframe src='aegyptaglyph.jsp?glyph=" + glyph + "&hwhat=" + hwhat + "' frameborder='0' allowtransparency='true' height='400px' width='160px'></iframe>";
}
</script>
</head>
<body>
<div id="ivo"></div>

<div id="hazel">
<table><tr>
<td valign="top" id="manny" width="100px">
	<iframe src='aegyptaglyph.jsp?glyph=33' frameborder='0' allowtransparency='true' height='400px' width='160px'></iframe>
</td>
<td valign="top">
<table>

<!-- Yevvy's Section -->

	<tr><td><h1>
		<table><tr>
			<c:set var="mannyStarter" value="33"/>
			<c:forEach begin="33" end="230" var="mannysIt">
				<c:if test="${mannysIt != 34 
						&& mannysIt != 39
						&& mannysIt != 44
						&& mannysIt != 45
						&& mannysIt != 127
						&& mannysIt != 128
						&& mannysIt != 129
						&& mannysIt != 141
						&& mannysIt != 142
						&& mannysIt != 143
						&& mannysIt != 144
						&& mannysIt != 157
						&& mannysIt != 158
						&& mannysIt != 160
						&& mannysIt != 181
						&& mannysIt != 183}">
					<td>&#<c:out value="${mannysIt}"/>;</td>
				</c:if>
				<c:if test="${(mannysIt - 2) % 30 == 0}">
					</tr></table></h1>
						<table class="persephone"><tr>
							<c:forEach begin="${mannyStarter}" end="${mannysIt}" var="yevvysIt">
								<c:if test="${yevvysIt != 34 
										&& yevvysIt != 39
										&& yevvysIt != 44
										&& yevvysIt != 45
										&& yevvysIt != 127
										&& yevvysIt != 128
										&& yevvysIt != 129
										&& yevvysIt != 141
										&& yevvysIt != 142
										&& yevvysIt != 143
										&& yevvysIt != 144
										&& yevvysIt != 157
										&& yevvysIt != 158
										&& yevvysIt != 160
										&& yevvysIt != 181
										&& yevvysIt != 183}">
									<td class="donimo" onmouseover="mannyChange(<c:out value='${yevvysIt}'/>, 'h1');"></td>
								</c:if>
							</c:forEach>
						</tr></table>
					<h1><table><tr>
					<c:set var="mannyStarter" value="${mannysIt + 1}"/>
				</c:if>
			</c:forEach>
		</tr></table></h1>
		<table><tr>
			<c:forEach begin="${mannyStarter}" end="230" var="yevvysIt">
				<c:if test="${yevvysIt != 34 
						&& yevvysIt != 39
						&& yevvysIt != 44
						&& yevvysIt != 45
						&& yevvysIt != 127
						&& yevvysIt != 128
						&& yevvysIt != 129
						&& yevvysIt != 141
						&& yevvysIt != 142
						&& yevvysIt != 143
						&& yevvysIt != 144
						&& yevvysIt != 157
						&& yevvysIt != 158
						&& yevvysIt != 160
						&& yevvysIt != 181
						&& yevvysIt != 183}">
					<td class="donimo" onmouseover="mannyChange(<c:out value='${yevvysIt}'/>, 'h1');"></td>
				</c:if>
			</c:forEach>
		</tr></table>
	</td></tr>

<!-- Manny's Section -->

	<tr><td><h2>
		<table><tr>
			<c:set var="mannyStarter" value="33"/>
			<c:forEach begin="33" end="239" var="mannysIt">
				<c:if test="${mannysIt != 34
						&& mannysIt != 39
						&& mannysIt != 45
						&& mannysIt != 127
						&& mannysIt != 128
						&& mannysIt != 129
						&& mannysIt != 141
						&& mannysIt != 142
						&& mannysIt != 143
						&& mannysIt != 144
						&& mannysIt != 157
						&& mannysIt != 158
						&& mannysIt != 160
						&& mannysIt != 173
						&& mannysIt != 181
						&& mannysIt != 183}">
					<td>&#<c:out value="${mannysIt}"/>;</td>
				</c:if>
				<c:if test="${(mannysIt - 2) % 30 == 0}">
					</tr></table></h2>
						<table><tr>
							<c:forEach begin="${mannyStarter}" end="${mannysIt}" var="yevvysIt">
								<c:if test="${yevvysIt != 34
										&& yevvysIt != 39
										&& yevvysIt != 45
										&& yevvysIt != 127
										&& yevvysIt != 128
										&& yevvysIt != 129
										&& yevvysIt != 141
										&& yevvysIt != 142
										&& yevvysIt != 143
										&& yevvysIt != 144
										&& yevvysIt != 157
										&& yevvysIt != 158
										&& yevvysIt != 160
										&& yevvysIt != 173
										&& yevvysIt != 181
										&& yevvysIt != 183}">
									<td class="donimo" onmouseover="mannyChange(<c:out value='${yevvysIt}'/>, 'h2');"></td>
								</c:if>
							</c:forEach>
						</tr></table>
					<h2><table><tr>
					<c:set var="mannyStarter" value="${mannysIt + 1}"/>
				</c:if>
			</c:forEach>
		</tr></table></h2>
		<table><tr>
			<c:forEach begin="${mannyStarter}" end="239" var="yevvysIt">
				<c:if test="${yevvysIt != 34
						&& yevvysIt != 39
						&& yevvysIt != 45
						&& yevvysIt != 127
						&& yevvysIt != 128
						&& yevvysIt != 129
						&& yevvysIt != 141
						&& yevvysIt != 142
						&& yevvysIt != 143
						&& yevvysIt != 144
						&& yevvysIt != 157
						&& yevvysIt != 158
						&& yevvysIt != 160
						&& yevvysIt != 173
						&& yevvysIt != 181
						&& yevvysIt != 183}">
					<td class="donimo" onmouseover="mannyChange(<c:out value='${yevvysIt}'/>, 'h2');"></td>
				</c:if>
			</c:forEach>
		</tr></table>
	</td></tr>

<!-- Guapo Jr's Section -->

	<tr><td><h3>
		<table><tr>
			<c:set var="mannyStarter" value="33"/>
			<c:forEach begin="${mannyStarter}" end="232" var="mannysIt">
				<c:if test="${mannysIt != 34
						&& mannysIt != 39
						&& mannysIt != 45
						&& mannysIt != 127
						&& mannysIt != 128
						&& mannysIt != 129
						&& mannysIt != 141
						&& mannysIt != 142
						&& mannysIt != 143
						&& mannysIt != 144
						&& mannysIt != 157
						&& mannysIt != 158
						&& mannysIt != 160
						&& mannysIt != 173
						&& mannysIt != 181
						&& mannysIt != 183}">
					<td>&#<c:out value="${mannysIt}"/>;</td>
				</c:if>
				<c:if test="${(mannysIt - 2) % 30 == 0}">
					</tr></table></h3>
						<table><tr>
							<c:forEach begin="${mannyStarter}" end="${mannysIt}" var="yevvysIt">
								<c:if test="${yevvysIt != 34
										&& yevvysIt != 39
										&& yevvysIt != 45
										&& yevvysIt != 127
										&& yevvysIt != 128
										&& yevvysIt != 129
										&& yevvysIt != 141
										&& yevvysIt != 142
										&& yevvysIt != 143
										&& yevvysIt != 144
										&& yevvysIt != 157
										&& yevvysIt != 158
										&& yevvysIt != 160
										&& yevvysIt != 173
										&& yevvysIt != 181
										&& yevvysIt != 183}">
									<td class="donimo" onmouseover="mannyChange(<c:out value='${yevvysIt}'/>, 'h3');"></td>
								</c:if>
							</c:forEach>
						</tr></table>
					<h3><table><tr>
					<c:set var="mannyStarter" value="${mannysIt + 1}"/>
				</c:if>
			</c:forEach>
		</tr></table></h3>
		<table><tr>
			<c:forEach begin="${mannyStarter}" end="232" var="yevvysIt">
				<c:if test="${yevvysIt != 34
						&& yevvysIt != 39
						&& yevvysIt != 45
						&& yevvysIt != 127
						&& yevvysIt != 128
						&& yevvysIt != 129
						&& yevvysIt != 141
						&& yevvysIt != 142
						&& yevvysIt != 143
						&& yevvysIt != 144
						&& yevvysIt != 157
						&& yevvysIt != 158
						&& yevvysIt != 160
						&& yevvysIt != 173
						&& yevvysIt != 181
						&& yevvysIt != 183}">
					<td class="donimo" onmouseover="mannyChange(<c:out value='${yevvysIt}'/>, 'h3');"></td>
				</c:if>
			</c:forEach>
		</tr></table>
	</td></tr>

<!-- Tikke's Section -->

	<tr><td><h4>
		<table><tr>
			<c:set var="mannyStarter" value="33"/>
			<c:forEach begin="${mannyStarter}" end="249" var="mannysIt">
				<c:if test="${mannysIt != 34
						&& mannysIt != 39
						&& mannysIt != 45
						&& mannysIt != 127
						&& mannysIt != 128
						&& mannysIt != 129
						&& mannysIt != 141
						&& mannysIt != 142
						&& mannysIt != 143
						&& mannysIt != 144
						&& mannysIt != 157
						&& mannysIt != 158
						&& mannysIt != 160
						&& mannysIt != 173
						&& mannysIt != 181
						&& mannysIt != 183}">
					<td>&#<c:out value="${mannysIt}"/>;</td>
				</c:if>
				<c:if test="${(mannysIt - 2) % 30 == 0}">
					</tr></table></h4>
						<table><tr>
							<c:forEach begin="${mannyStarter}" end="${mannysIt}" var="yevvysIt">
								<c:if test="${yevvysIt != 34
										&& yevvysIt != 39
										&& yevvysIt != 45
										&& yevvysIt != 127
										&& yevvysIt != 128
										&& yevvysIt != 129
										&& yevvysIt != 141
										&& yevvysIt != 142
										&& yevvysIt != 143
										&& yevvysIt != 144
										&& yevvysIt != 157
										&& yevvysIt != 158
										&& yevvysIt != 160
										&& yevvysIt != 173
										&& yevvysIt != 181
										&& yevvysIt != 183}">
									<td class="donimo" onmouseover="mannyChange(<c:out value='${yevvysIt}'/>, 'h4');"></td>
								</c:if>
							</c:forEach>
						</tr></table>
					<h4><table><tr>
					<c:set var="mannyStarter" value="${mannysIt + 1}"/>
				</c:if>
			</c:forEach>
		</tr></table></h4>
		<table><tr>
			<c:forEach begin="${mannyStarter}" end="249" var="yevvysIt">
				<c:if test="${yevvysIt != 34
						&& yevvysIt != 39
						&& yevvysIt != 45
						&& yevvysIt != 127
						&& yevvysIt != 128
						&& yevvysIt != 129
						&& yevvysIt != 141
						&& yevvysIt != 142
						&& yevvysIt != 143
						&& yevvysIt != 144
						&& yevvysIt != 157
						&& yevvysIt != 158
						&& yevvysIt != 160
						&& yevvysIt != 173
						&& yevvysIt != 181
						&& yevvysIt != 183}">
					<td class="donimo" onmouseover="mannyChange(<c:out value='${yevvysIt}'/>, 'h4');"></td>
				</c:if>
			</c:forEach>
		</tr></table>
	</td></tr>
</table>
</td></tr></table>
</div>

<script type="text/javascript">
if(typeof sIFR == "function")
{
    sIFR();
	sIFR.replaceElement("#hazel h1", named({sFlashSrc: "/maussollos/swf/glyph1.swf", sColor: "#7FFF00", sBgColor: "#000000"}));
	sIFR.replaceElement("#hazel h2", named({sFlashSrc: "/maussollos/swf/glyph2.swf", sColor: "#7FFF00", sBgColor: "#000000"}));
	sIFR.replaceElement("#hazel h3", named({sFlashSrc: "/maussollos/swf/glyph3.swf", sColor: "#7FFF00", sBgColor: "#000000"}));
	sIFR.replaceElement("#hazel h4", named({sFlashSrc: "/maussollos/swf/glyph4.swf", sColor: "#7FFF00", sBgColor: "#000000"}));
};
</script>

</body>
</html>