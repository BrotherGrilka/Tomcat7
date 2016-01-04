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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Manfredd</title>
<link rel="Shortcut Icon" href="/yevie/favicon.ico">
<link href='css/ext-all.css' rel='stylesheet' type='text/css'/>
<link href='css/manners.css' rel='stylesheet' type='text/css'/>
<link href='css/ext-sumer.css' rel='stylesheet' type='text/css'/>
<script src="js/ext-base.js" type="text/javascript"></script>
<script src="js/ext-all.js" type="text/javascript"></script>
<script src="js/ext-sumer.js" type="text/javascript"></script>
</head>
<body>
	<div id="west" class="contentsLinks">
		<a href="javascript: mShowTrans('c.0.1.1.xml')">Ur III catalogue from Nibru (N1)</a>
		<a href="javascript: mShowTrans('c.0.1.2.xml')">Ur III catalogue at Yale (Y1)</a>
		<a href="javascript: mShowTrans('c.0.2.01.xml')">OB catalogue from Nibru (N2)</a>
		<a href="javascript: mShowTrans('c.0.2.02.xml')">OB catalogue in the Louvre (L)</a>
		<a href="javascript: mShowTrans('c.0.2.03.xml')">OB catalogue from Urim (U1)</a>
		<a href="javascript: mShowTrans('c.0.2.04.xml')">OB catalogue from Urim (U2)</a>
		<a href="javascript: mShowTrans('c.0.2.05.xml')">OB catalogue from Urim (U3)</a>
		<a href="javascript: mShowTrans('c.0.2.06.xml')">OB catalogue from Nibru (N3)</a>
		<a href="javascript: mShowTrans('c.0.2.07.xml')">OB catalogue possibly from Zimbir (B1)</a>
		<a href="javascript: mShowTrans('c.0.2.08.xml')">OB catalogue from Nibru (N4)</a>
		<a href="javascript: mShowTrans('c.0.2.11.xml')">OB catalogue at Andrews University (B4)</a>
		<a href="javascript: mShowTrans('c.0.2.12.xml')">OB catalogue at Yale (Y2)</a>
		<a href="javascript: mShowTrans('c.0.2.13.xml')">OB catalogue from Nibru (N6)</a>
	</div>
	<div id="westNarrative" class="contentsLinks"></div>
	<div id="westHistorical" class="contentsLinks"></div>
	<div id="westLetters" class="contentsLinks"></div>
	<div id="westHymns" class="contentsLinks"></div>
	<div id="westOther" class="contentsLinks"></div>
	<div id="westProverbs" class="contentsLinks"></div>
	<div id="north"><p>north - generally for menus, toolbars and/or advertisements</p></div>
	<div id="center2"><c:import url="guapoTran?XML=transliterations/${yevvysXML}&XSL=xsl/extYevvy.xsl"/></div>
	<div id="center1">
		<p><b>Done reading me? Close me by clicking the X in the top right corner.</b></p>
		<p>Vestibulum semper. Nullam non odio. Aliquam quam. Mauris eu lectus non nunc auctor ullamcorper. Sed tincidunt molestie enim. Phasellus lobortis justo sit amet quam. Duis nulla erat, varius a, cursus in, tempor sollicitudin, mauris. Aliquam mi velit, consectetuer mattis, consequat tristique, pulvinar ac, nisl. Aliquam mattis vehicula elit. Proin quis leo sed tellus scelerisque molestie. Quisque luctus. Integer mattis. Donec id augue sed leo aliquam egestas. Quisque in sem. Donec dictum enim in dolor. Praesent non erat. Nulla ultrices vestibulum quam.</p>
		<p>Duis hendrerit, est vel lobortis sagittis, tortor erat scelerisque tortor, sed pellentesque sem enim id metus. Maecenas at pede. Nulla velit libero, dictum at, mattis quis, sagittis vel, ante. Phasellus faucibus rutrum dui. Cras mauris elit, bibendum at, feugiat non, porta id, neque. Nulla et felis nec odio mollis vehicula. Donec elementum tincidunt mauris. Duis vel dui. Fusce iaculis enim ac nulla. In risus.</p>
		<p>Donec gravida. Donec et enim. Morbi sollicitudin, lacus a facilisis pulvinar, odio turpis dapibus elit, in tincidunt turpis felis nec libero. Nam vestibulum tempus ipsum. In hac habitasse platea dictumst. Nulla facilisi. Donec semper ligula. Donec commodo tortor in quam. Etiam massa. Ut tempus ligula eget tellus. Curabitur id velit ut velit varius commodo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla facilisi. Fusce ornare pellentesque libero. Nunc rhoncus. Suspendisse potenti. Ut consequat, leo eu accumsan vehicula, justo sem lobortis elit, ac sollicitudin ipsum neque nec ante.</p>
		<p>Aliquam elementum mauris id sem. Vivamus varius, est ut nonummy consectetuer, nulla quam bibendum velit, ac gravida nisi felis sit amet urna. Aliquam nec risus. Maecenas lacinia purus ut velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse sit amet dui vitae lacus fermentum sodales. Donec varius dapibus nisl. Praesent at velit id risus convallis bibendum. Aliquam felis nibh, rutrum nec, blandit non, mattis sit amet, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam varius dignissim nibh. Quisque id orci ac ante hendrerit molestie. Aliquam malesuada enim non neque.</p>
	</div>
	<div id="props-panel" style="width:200px;height:200px;overflow:hidden;"></div>
	<div id="south">
		<div align="center" id="mannysDef"></div>
	</div>
 <%--
	<table>
		<tr>
			<td align="right" colspan="2" id="mannysDef"></div>
		</tr>
		<tr>
			<td valign="top" colspan="2" class="lorelei">
				<c:import url="guapoTran?XML=transliterations/${yevvysXML}&XSL=xsl/gemineye.xsl"/>
			</td>
		</tr>
		<tr>
			<td valign="top" class="pandora">
				<div id="yevvyCorpus"><c:import url="guapoTran?XML=transliterations/${yevvysXML}&XSL=xsl/extYevvy.xsl"/></div>
			</td>
			<td valign="top" class="pandora">
				<div id="mannyCorpus"><c:import url="guapoTran?XML=translations/${mannysXML}&XSL=xsl/extManny.xsl"/></div>
			</td>
		</tr>
	</table>
--%>
<script type="text/javascript">
	Ext.onReady(mannysLayout);
</script>
</body>
</html>