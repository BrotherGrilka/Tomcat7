<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Maussollos at Halicarnassus</title>
<link rel="Shortcut Icon" href="/yevie/favicon.ico">
<script src="/maussollos/js/sifr.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
startList = function()
{
	if (document.all && document.getElementById)
	{
		navRoot = document.getElementById("artemisia");
		for (i=0; i<navRoot.childNodes.length; i++)
		{
			node = navRoot.childNodes[i];
			if (node.nodeName == "LI")
			{
				node.onmouseover = function()
				{
					this.className += " over";
				}
				node.onmouseout = function()
				{
					this.className = this.className.replace(" over", "");
				}
			
				for (k=0; k<node.childNodes.length; k++)
					if (node.childNodes[k].nodeName == "UL")
						jnavRoot = node.childNodes[k];
				
				for (j=0; j<jnavRoot.childNodes.length; j++)
				{
					jnode = jnavRoot.childNodes[j];
					if (jnode.nodeName == "LI")
					{
						jnode.onmouseover = function()
						{
							this.className += " over";
						}
						jnode.onmouseout = function()
						{
							this.className = this.className.replace(" over", "");
						}
					}
				}
			}
		}
	}
}

window.onload = startList;
</script>
<style type="text/css">
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
	border-top: 9px solid deeppink;
	color: aquamarine;
}
#ivo
{
	margin: 0;
	padding: 0;
	width: 100%;
	height: 9px;
	border-top: 9px solid lavender;
	overflow: hidden;
}
#aloysius
{
	margin-left: 14px;
	width: 850px;
}
ul#artemisia, ul#artemisia li ul
{
	font-size: 8pt;
	padding: 0;
	margin: 0;
	list-style: none;
}
ul#artemisia li
{
	float: left;
	position: relative;
	width: 7em;
	border-top: 1px solid deeppink;
	border-right: 1px solid deeppink;
	border-bottom: 1px solid deeppink;
	background-color: black;
	color: lavender;
	text-align: center;
	padding: .5em 0;
}
ul#artemisia li a
{
	display: block;
	text-decoration: none;
	color: lavender;
}
ul#artemisia li a:hover
{
	display: block;
	text-decoration: none;
	color: aquamarine;
	background-color: #333333;
}
ul#artemisia li#winterfell
{
	border-left: 1px solid deeppink;
}
ul#artemisia li ul
{
	display: none;
	position: absolute; 
	top: 1em;
	left: 0;
	clear: left;
	margin: .6em 0 0 -.1em;
}
* html ul#artemisia li ul
{
	margin: 1.3em 0 0 -.1em;
}
ul#artemisia li ul li
{
	float: left;
	position: relative;
	width: 6em;
	border-top: 0;
	border-right: 1px solid deeppink;
	border-bottom: 1px solid deeppink;
	border-left: 1px solid deeppink;
	background-color: black;
	color: lavender;
	text-align: center;
	padding: 1ex .5em;
}
* html * ul#artemisia li ul li
{
	padding: 1ex .5em;
}
ul#artemisia li > ul
{
	top: auto;
	left: auto;
}
ul#artemisia li:hover, ul#artemisia li.over
{
	background-color: #333333;
	color: aquamarine;
}
ul#artemisia li:hover ul, ul#artemisia li.over ul
{
	display: block;
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
}
.sIFR-hasFlash h2
{
	visibility: hidden;
	letter-spacing: -9px;
	font-size: 55px;
}
.sIFR-hasFlash h3
{
	visibility: hidden;
	letter-spacing: -6px;
	font-size: 25px;
}
.sIFR-hasFlash h4
{
	visibility: hidden;
	letter-spacing: -5px;
	font-size: 21px;
}
.sIFR-hasFlash h5#pullquote
{
	letter-spacing: -4px;
	visibility: hidden;
	font-size: 24px;
}
#hazel
{
	margin-top: 28ex;
	padding: 2em;
}
#hazel h4
{
	font-family: Impact;
	color: darkorange;
	font-size: 28pt;
}
</style>
</head>
<body>
<div id="ivo"></div>
<div id="aloysius">
	<ul id="artemisia">
		<li id="winterfell">
			Winterfell
			<ul>
				<li><a href="/maussollos/guapoTran">Torrhen's Square</a></li>
				<li><a href="/yevie/exweerdo.jsp">Last Hearth</a></li>
				<li><a href="/maussollos/aidanupload.jsp">Deepwood Motte</a></li>
				<li><a href="/maussollos/lights.jsp">The Dreadfort</a></li>
			</ul>
		</li>
		<li>
			The Eyrie
			<ul>
				<li><a href="/sumer/">Gulltown</a></li>
				<li><a href="/sumer/tourmaline.jsp">Tourmaline Brotherhood</a></li>
			</ul>
		</li>
		<li>
			Oldtown
			<ul>
				<li><a href="/maussollos/guapoTran">Guapo's Transform Servlet</a></li>
				<li><a href="/maussollos/gTrans.jsp?PMA=HiTikke!&XML=xml/solarsystem.xml&XSL=xsl/guapo.xsl">Gaupo's Transform Scriptlet</a></li>
				<li><a href="/maussollos/mannyTrans.jsp">Gaupo's Transform JSP</a></li>
				<li><a href="/maussollos/guapoVal">Guapo's Validation Servlet</a></li>
			</ul>
		</li>
		<li>
			Riverrun
			<ul>
				<li><a href="http://www.exweerdo.com/">Pinkmaiden</a></li>
				<li><a href="/maussollos/aegypta.jsp">High Heart</a></li>
				<li><a href="/maussollos/stockings.jsp">Acorn Hall</a></li>
				<li><a href="/sumer/dunc.jsp">Lord Harroway's Town</a></li>
				<li><a href="/maussollos/mannysFO?XML=xml/solarsystem.xml&XSL=xsl/manny.xsl">Manny's FO Servlet</a></li>
			</ul>
		</li>
		<li>
			King's Landing
			<ul>
				<li><a href="/sumer/manfredd/manfredd.jsp">Dragonstone</a></li>
			</ul>
		</li>
		<li>
			Highgarden
			<ul>
				<li><a href="/yevie/exweerdo.jsp">Old Oak</a></li>
				<li><a href="#">Horn Hill</a></li>
				<li><a href="#">Brightwater Keep</a></li>
				<li><a href="#">Honeyholt</a></li>
				<li><a href="#">Goldengrove</a></li>
				<li><a href="#">Ashford</a></li>
			</ul>
		</li>
		<li>
			Storm's End
			<ul>
				<li><a href="#">Griffin's Roost</a></li>
				<li><a href="#">Evenfall Hall</a></li>
				<li><a href="#">Crow's Nest</a></li>
				<li><a href="#">Stonehelm</a></li>
				<li><a href="#">Haystack Hall</a></li>
			</ul>
		</li>
		<li>
			The Arbor
			<ul>
				<li><a href="#">Blossom</a></li>
				<li><a href="#">Blossom Admin</a></li>
				<li><a href="#">Foodie</a></li>
				<li><a href="#">Foodie Admin</a></li>
				<li><a href="/yevie/">Yevie</a></li>
				<li><a href="/illustrator/oxtiern.jsp">Oxtiern</a></li>
			</ul>
		</li>
		<li>
			Sunspear
			<ul id="sunspear">
				<li><a href="#">Yronwood</a></li>
				<li><a href="#">Godsgrace</a></li>
				<li><a href="#">Lemonwood</a></li>
				<li><a href="#">Vaith</a></li>
				<li><a href="#">Hellholt</a></li>
				<li><a href="#">Starfall</a></li>
			</ul>
		</li>
		<li>
			Casterly Rock
			<ul>
				<li><a href="/blojsom/blog/sumer">Kayce</a></li>
				<li><a href="/blojsom/blog/sumer/?flavor=admin">Faircastle</a></li>
				<li><a href="/blojsom/blog/manny" style="color: burlywood;">Lannisport</a></li>
				<li><a href="/blojsom/blog/manny/?flavor=admin">Crakehall</a></li>
				<li><a href="/luceneweb">Ashemark</a></li>
				<li><a href="/solr/admin">The Crag</a></li>
			</ul>
		</li>
		<li>
			Pyke
			<ul>
				<li><a href="/maussollos/artemisia.jsp">Harlow</a></li>
				<li><a href="/blojsom/blog/default">Great Wyck</a></li>
				<li><a href="/blojsom/blog/default/?flavor=admin">Old Wyck</a></li>
				<li><a href="/blojsom/blog/foodie">Saltcliffe</a></li>
				<li><a href="/blojsom/blog/foodie/?flavor=admin">Orkmont</a></li>
				<li><a href="/yevie/">Blacktyde</a></li>
				<li><a href="/illustrator/oxtiern.jsp">Ten Towers</a></li>
			</ul>
		</li>
	</ul>
</div>
<br/>

<div id="hazel">
	<h4>Boatmen</h4>
	<h4>World of Salt</h4>
	<h4>Sea Creature</h4>
	<h4>Purple Gang</h4>
	<h4>Zombi</h4>
	<h4>Mariamene</h4>
	<h4>Sky Child</h4>
	<h4>Sephora</h4>
	<h4>Manfredd</h4>
	<h4>coiins</h4>
	<h4>Cheyenne, Arapaho, Caddo</h4>
	<h4>Lectroluxxe</h4>
</div>

<script type="text/javascript">
if(typeof sIFR == "function")
{
    sIFR();
	sIFR.replaceElement("#hazel h4", named({sFlashSrc: "/maussollos/swf/babyjeepers.swf", sColor: "#FFFFFF", sBgColor: "#000000"}));
};
</script>

</body>
</html>