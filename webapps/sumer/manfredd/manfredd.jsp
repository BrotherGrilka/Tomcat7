<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="str" uri="http://jakarta.apache.org/taglibs/taglibs-string" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Manfredd's File Sharing Centre</title>
<link rel="Shortcut Icon" href="/yevie/favicon.ico">
<link href='css/manfredd.css' rel='stylesheet' type='text/css'/>
<script language="javascript">
document.write(getYeveBrowser());

function getYeveBrowser() {
	var tikkeBrowser = navigator.userAgent;
	var aidanBrowser = "";
	
	if (tikkeBrowser.indexOf("Firefox") != -1)
		aidanBrowser += "<link href='css/ff.css' rel='stylesheet' type='text/css'/>";
	else if (tikkeBrowser.indexOf("Camino") != -1)
		aidanBrowser += "<link href='css/ca.css' rel='stylesheet' type='text/css'/>";
	else if (tikkeBrowser.indexOf("Safari") != -1)
		aidanBrowser += "<link href='css/sa.css' rel='stylesheet' type='text/css'/>";
	else if (tikkeBrowser.indexOf("Shiira") != -1)
		aidanBrowser += "<link href='css/sh.css' rel='stylesheet' type='text/css'/>";
	else if (tikkeBrowser.indexOf("Netscape") != -1)
		aidanBrowser += "<link href='css/ne.css' rel='stylesheet' type='text/css'/>";
	else if (tikkeBrowser.indexOf("Opera") != -1)
		aidanBrowser += "<link href='css/op.css' rel='stylesheet' type='text/css'/>";
	else if (tikkeBrowser.indexOf("MSIE") != -1)
		aidanBrowser += "<link href='css/ie.css' rel='stylesheet' type='text/css'/>";

	return aidanBrowser;
}
</script>
<script src="/sumer/js/sifr.js" type="text/javascript"></script>
<script type="text/javascript">
if(typeof sIFR == "function")
{
    sIFR();
	sIFR.replaceElement("#watchlar h1", named({sFlashSrc: "/sumer/manfredd/swf/glyph1.swf", sColor: "#FFA500", sBgColor: "#000000", sFlashVars: "textalign=center&offsetTop=20"}));
	sIFR.replaceElement("#watchlar h2", named({sFlashSrc: "/sumer/manfredd/swf/glyph2.swf", sColor: "#FFA500", sBgColor: "#000000", sFlashVars: "textalign=center&offsetTop=20"}));
	sIFR.replaceElement("#watchlar h3", named({sFlashSrc: "/sumer/manfredd/swf/glyph3.swf", sColor: "#87CEEB", sBgColor: "#000000", sFlashVars: "textalign=center&offsetTop=20"}));
	sIFR.replaceElement("#watchlar h4", named({sFlashSrc: "/sumer/manfredd/swf/glyph4.swf", sColor: "#9ACD32", sBgColor: "#000000", sFlashVars: "textalign=center&offsetTop=20"}));
	sIFR.replaceElement("#pandora h1", named({sFlashSrc: "/sumer/manfredd/swf/glyph1.swf", sColor: "#FFA500", sBgColor: "#000000", sFlashVars: "textalign=center&offsetTop=20"}));
	sIFR.replaceElement("#pandora h2", named({sFlashSrc: "/sumer/manfredd/swf/glyph2.swf", sColor: "#FFA500", sBgColor: "#000000", sFlashVars: "textalign=center&offsetTop=20"}));
	sIFR.replaceElement("#pandora h3", named({sFlashSrc: "/sumer/manfredd/swf/glyph3.swf", sColor: "#87CEEB", sBgColor: "#000000", sFlashVars: "textalign=center&offsetTop=20"}));
	sIFR.replaceElement("#pandora h4", named({sFlashSrc: "/sumer/manfredd/swf/glyph4.swf", sColor: "#9ACD32", sBgColor: "#000000", sFlashVars: "textalign=center&offsetTop=20"}));
};
</script>
</head>
<body>

<div id="ivo"></div>

<div id="aloysius">
	<table>
		<tr>
			<td valign="top" id="pandora">
<jsp:useBean id="gemineyeDice" class="beans.aegyptaBean"/>
<jsp:setProperty name="gemineyeDice" property="die"/>
<c:set var="gemineyeRoll" value="${gemineyeDice.tag}"/>
					<c:out value="${gemineyeRoll}" escapeXml="false"/>
			</td>
			<td valign="top" id="eperdu">
				<form name="newMannersFile" method="post" action="/sumer/manfreddsAddition" enctype="multipart/form-data" onsubmit="if (this.mannersFile.value.length == 0) return false;">
					<div class="fakefile">
						<input type="file" name="mannersFile" id="browse"/>
						<input value="Browse" id="fakeBrowse"/>
						<br><br>
						<input type="submit" name="Submit" value="Upload" id="upload"/>
					</div>
				</form>
				<br>
<sql:query var="files" dataSource="jdbc/manfreddsDB">
	select name from files
</sql:query>
				<form name="mannersRemoval" method="get" action="/sumer/manfreddsRemoval" id="satanRemover">
					<input type="submit" name="Submit" value="Remove" id="removerButton"/>
					<br/><br/>
<c:set var="i" value="1"/>
					<table>
<c:forEach var="file" items="${files.rows}">
	<c:if test="${i mod 2 == 1}">
						<tr>
	</c:if>
							<td valign="top" class="imageBox">
								<a href="/sumer/manfreddsDownload?pic=<c:out value='${file.name}'/>">
<c:set var="mannysFileType"><str:prechomp delimiter="."><c:out value="${file.name}"/></str:prechomp></c:set>
<c:if test="${mannysFileType == 'jpg'}">
									<img src="mannysFiles/<c:out value='${file.name}'/>" width="200"/><br/>
</c:if>
<c:if test="${mannysFileType != 'jpg'}">
									<img src="images/poopex.gif" width="200"/><br/>
</c:if>
								</a>
								<div class="imageName"><c:out value="${file.name}"/></div>
								<input type="radio" name="remover" value="<c:out value='${file.name}'/>" id="mannysRadio"/>
								remove
							</td>
	<c:if test="${i mod 2 == 0}">
						</tr>
	</c:if>
	<c:set var="i" value="${i + 1}"/>
</c:forEach>
						</table>
					</form>
	<div id="mannysInstructions">
		The <em>Browse</em> button will look for your files to upload.<br>
		The <em>Upload</em> button will commence your upload.<br>
		The <em>Remove</em> button will remove thy radioed file.
	</div>	
				</td>
				<td valign="top" id="watchlar">
<jsp:useBean id="tikkeDice" class="beans.aegyptaBean"/>
<jsp:setProperty name="tikkeDice" property="die"/>
<c:set var="tikkeRoll" value="${tikkeDice.tag}"/>
					<c:out value="${tikkeRoll}" escapeXml="false"/>
				</td>
	  </tr>
		</table>
</div>
</body>
</html>