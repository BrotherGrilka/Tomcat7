<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Duncan Davidson</title>
	<link rel="Shortcut Icon" href="/sumer/favicon.ico"/>
	<link rel="stylesheet" rev="stylesheet" href="/sumer/css/sifr.css" type="text/css" media="screen"/>
	<script src="/sumer/js/sumer.js" type="text/javascript"></script>
	<script src="/sumer/js/sifr.js" type="text/javascript"></script>
	<script type="text/javascript">
		if (typeof sIFR == "function") {
	    	sIFR();
			sIFR.replaceElement(".deeppink", named({sFlashSrc: "/sumer/swf/<c:out value="${param.Typeface}"/>.swf", sColor: "#FF1493", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
			sIFR.replaceElement(".lavender", named({sFlashSrc: "/sumer/swf/<c:out value="${param.Typeface}"/>.swf", sColor: "#E6E6FA", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
			sIFR.replaceElement(".aquamarine", named({sFlashSrc: "/sumer/swf/<c:out value="${param.Typeface}"/>.swf", sColor: "#7FFFD4", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
			sIFR.replaceElement(".burlywood", named({sFlashSrc: "/sumer/swf/<c:out value="${param.Typeface}"/>.swf", sColor: "#DEB887", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
			sIFR.replaceElement(".chartreuse", named({sFlashSrc: "/sumer/swf/<c:out value="${param.Typeface}"/>.swf", sColor: "#7FFF00", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
			sIFR.replaceElement(".magenta", named({sFlashSrc: "/sumer/swf/<c:out value="${param.Typeface}"/>.swf", sColor: "#FF00FF", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
			sIFR.replaceElement(".gold", named({sFlashSrc: "/sumer/swf/<c:out value="${param.Typeface}"/>.swf", sColor: "#FFD700", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
			sIFR.replaceElement(".dodgerblue", named({sFlashSrc: "/sumer/swf/<c:out value="${param.Typeface}"/>.swf", sColor: "#1E90FF", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));
			sIFR.replaceElement(".white", named({sFlashSrc: "/sumer/swf/<c:out value="${param.Typeface}"/>.swf", sColor: "#FFFFFF", sBgColor: "#000000", sFlashVars: "textalign=left", nPaddingTop: "0", nPaddingBottom: "0"}));};
	</script>
	<style type="text/css">
		body {
			margin: 0;
			padding: 0;
			background-color: black;
			border-top: 9px solid magenta;
		}
		select,
		option {
			font: 8pt 'Franklin Gothic Medium', sans-serif;
		}
		#ivo {
			margin: 0;
			padding: 0;
			width: 100%;
			height: 9px;
			border-top: 9px solid chartreuse;
			overflow: hidden;
		}
		#aloysius {
			color: lavender;
			margin: 0 0 0 2em;
		}
		#eperdu {
			width: 800px;
		}
		#watchlar a {
			color: black;
			text-decoration: none;
			font-size: 10px;
		}
		#watchlar a:hover {
			color: white;
		}
		.sIFR-hasFlash .deeppink {
			visibility: hidden;
			font-size: 24px;
			color: deeppink;
		}
		.sIFR-hasFlash .lavender {
			visibility: hidden;
			font-size: 12px;
			color: lavender;
		}
		.sIFR-hasFlash .aquamarine {
			visibility: hidden;
			font-size: 12px;
			color: aquamarine;
		}
		.sIFR-hasFlash .burlywood {
			visibility: hidden;
			font-size: 8px;
			color: burlywood;
		}
		.sIFR-hasFlash .magenta {
			visibility: hidden;
			font-size: 36px;
			color: magenta;
		}
		.sIFR-hasFlash .chartreuse {
			visibility: hidden;
			font-size: 36px;
			color: charteuse;
		}
		.sIFR-hasFlash .gold {
			visibility: hidden;
			font-size: 36px;
			color: golc;
		}
		.sIFR-hasFlash .dodgerblue {
			visibility: hidden;
			font-size: 36px;
			color: dodgerblue;
		}
		.sIFR-hasFlash .white {
			visibility: hidden;
			font-size: 36px;
			color: white;
		}
		.smallwhite {
			font-size: 12px;
			color: white;
		}
	</style>	
</head>
<body>
	<div id="ivo"></div>
	
	<div id="aloysius">
		<table>
			<tr>
				<td valign="top" id="eperdu">
<!--
					<div class="deeppink">Boatmen</div>
					<div class="lavender">Manny</div>
					<div class="aquamarine">Yevvy</div>
					<div class="burlywood">Guapo Jr</div>
-->
					<div class="magenta">Magenta</div>
					<div class="chartreuse">Chartreuse</div>
					<div class="gold">Gold</div>
					<div class="dodgerblue">Dodgerblue</div>
					<div class="white">White</div>
				<td valign="top" id="watchlar">
					<c:import url="/MannersTypefaceSelector"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
