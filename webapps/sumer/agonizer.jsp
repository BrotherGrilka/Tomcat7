<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	String yevvysXML = request.getParameter("Transliteration");
	String mannysXML = request.getParameter("Translation");

	if (yevvysXML == null && mannysXML == null)	{
		yevvysXML = "c.1.1.1.xml";
		mannysXML = "t.1.1.1.xml";
	} else if (mannysXML == null) {
		mannysXML = "t." + yevvysXML;
		yevvysXML = "c." + yevvysXML;
	} else {
		yevvysXML = "c." + mannysXML;
		mannysXML = "t." + mannysXML;
	}

	pageContext.setAttribute("yevvysXML", yevvysXML);
	pageContext.setAttribute("mannysXML", mannysXML);
%>

<a href="#" onclick="return hiYevvy(this)" id="yevvysLink">Say Hi Yevvy</a>

<script type="text/javascript">
	hiYevvy = function(link) {
		yevversMessage = new Dialog(Dialog.DIALOG_POP);
		yevversMessage.showMessage("Yevvers Title", "Hi Manny", "Hi");
		link.setStyle({color: 'magenta', fontWeight: 'bold'});
		return false;
	}
</script>

<%--
<table>
	<tr>
		<td valign="top" colspan="3" class="lorelei">
			<c:import url="http://exweerdo.boldlygoingnowhere.org:8080/sumer/guapoTran?XML=transliterations/${yevvysXML}&XSL=xsl/gemineye.xsl"/>
		</td>
	</tr>
	<tr>
		<td valign="top" class="pandora">
			<div id="yevvyCorpus"><c:import url="http://exweerdo.boldlygoingnowhere.org:8080/sumer/guapoTran?XML=transliterations/${yevvysXML}&XSL=xsl/yevvy.xsl"/></div>
		</td>
		<td valign="top" class="pandora">
			<div id="mannyCorpus"><c:import url="http://exweerdo.boldlygoingnowhere.org:8080/sumer/guapoTran?XML=translations/${mannysXML}&XSL=xsl/manny.xsl"/></div>
		</td>
	</tr>
</table>
--%>