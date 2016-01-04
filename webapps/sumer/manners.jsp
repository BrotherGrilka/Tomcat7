<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Manfredd</title>
<link rel="Shortcut Icon" href="/yevie/favicon.ico">
<link href='css/manners.css' rel='stylesheet' type='text/css'/>
<script src="js/prototype.js" type="text/javascript"></script>
<script src="js/scriptaculous.js" type="text/javascript"></script>
<script src="js/effects.js" type="text/javascript"></script>
<script type="text/javascript">
function swapImages(myDiv) {
	var currentYevvy = document.getElementById("yevvy");

	if (myDiv.style.backgroundImage.indexOf("units") != -1)
		myDiv.style.backgroundImage = "url(/manners/images/maps.gif)";
	else
		myDiv.style.backgroundImage = "url(/manners/images/units.gif)";
}
</script>
<style type="text/css">
.watchlar {
	width: 140px;
	height: 140px;
	margin-top: 3ex;
	text-align: center;
}
#poopexHolder {
	border: 1px solid goldenrod;
	width: 140px;
	height: 140px;
	background: url('images/manners/ddpat2.gif');
}
#poopexHolder img {
	margin: 2ex 0 0 0;
}
#evangeline {
	border: 2px dashed skyblue;
	float: right;
	padding: 1ex 1em;
}
#evangeline #bluebeards { 
	list-style-type: none;
	margin: 0;
	padding: 0;
}
#evangeline #bluebeards li { 
	width: 120px;
	margin: 0;
	margin-left: 20px;
	padding-left: 20px;
	padding: 4px;
	cursor: move;
}
#myrkass {
	position: absolute;
	top: 180px;
	left: 598px;
	border: 1px solid skyblue;
}
#donimo {
	float: right;
	margin-right: 200px;
}
div.page_name_auto_complete {
	background: skyblue none repeat scroll 0%;
	display: inline;
	width: 100px;
	margin-top: 18px;
	font-size: 10pt;
	color: black;
}
div.page_name_auto_complete ul {
	border: 1px solid skyblue;
	list-style-type: none;
	margin: 0pt;
	padding: 0pt;
	width: 100%;
	z-index: 79;
}
div.page_name_auto_complete ul li {
	margin: 0pt;
	padding: 3px;
}
div.page_name_auto_complete ul li.selected {
	background-color: goldenrod;
	color: deeppink;
}
div.page_name_auto_complete ul strong.highlight {
	color: goldenrod;
	margin: 0pt;
	padding: 0pt;
}
#yevvysDrop {
	border: 2px dashed goldenrod;
	width: 377px;
	height: 190px;
	margin: 8ex 0;
	font-style: italic;
}
.yevvysDropHover {
	background: deeppink url('images/manners/pat0.gif');;
}
.yevvysThumb {
	width: 60px;
	height: 60px;
	border: 1px solid black;
}
#mannyAppears {
	background: url('images/manners/theend.jpg') no-repeat;
	width: 230px;
	height: 150px;
	position: absolute;
	top: 18px;
	left: 480px;
	z-index: 78;
	text-align: right;
	padding-top: 1ex;
}
#mannyFinish {
	position: absolute;
	top: 500px;
	left: 500px;
}
</style>
</head>
<body>

<div id="ivo"></div>

<div id="aloysius">

<div valign="bottom" id="mannyAppears" style="display: none;"><div></div></div>
<div id="mannyFinish" onclick="Effect.toggle('mannyAppears', 'slide', {duration: .3});">
	<img src="images/manners/help.jpg">
</div>

<div id="evangeline">
	<ul id="bluebeards">
		<li>Watchlar</li>
		<li>Evangeline</li>
		<li>Ivo</li>
		<li>Pandora</li>
		<li>Lorelei</li>
		<li>Beatrix</li>
		<li>Aloysius
		<li>Persephone</li>
		<li>Amelia</li>
		<li>Cicely</li>
		<li>Otterley</li>
		<li>Donimo</li>
		<li>Violane</li>
		<li>Mizake</li>
		<li>Alice</li>
		<li>Melonella</li>
		<li>Hazel</li>
		<li>Eperdu</li>
	</ul>
</div>

<script type="text/javascript" language="javascript">
	Sortable.create('bluebeards',{ghosting: true, constraint: false})
</script>

<div id="donimo">
	<p>
		<label for="bands_from_the_70s">Rock of the 70's:</label><br />
		<input id="bands_from_the_70s" autocomplete="off" size="40" type="text" value="" />
	</p>
	<div class="page_name_auto_complete" id="band_list"></div>

<script type="text/javascript">
	new Autocompleter.Local('bands_from_the_70s', 'band_list', ['ABBA', 'AC/DC', 'Aerosmith', 'America', 'Bay City Rollers', 'Black Sabbath', 'Boston', 'David Bowie', 'Can', 'The Carpenters', 'Chicago', 'The Commodores', 'Crass', 'Deep Purple', 'The Doobie Brothers', 'Eagles', 'Fleetwood Mac', 'Haciendo Punto en Otro Son', 'Heart', 'Iggy Pop and the Stooges', 'Journey', 'Judas Priest', 'KC and the Sunshine Band', 'Kiss', 'Kraftwerk', 'Led Zeppelin', 'Lindisfarne (band)', 'Lipps, Inc', 'Lynyrd Skynyrd', 'Pink Floyd', 'Queen', 'Ramones', 'REO Speedwagon', 'Rhythm Heritage', 'Rush', 'Sex Pistols', 'Slade', 'Steely Dan', 'Stillwater', 'Styx', 'Supertramp', 'Sweet', 'Three Dog Night', 'The Village People', 'Wings (fronted by former Beatle Paul McCartney)', 'Yes'], {fullSearch: true, partialChars: 1});
</script>
</div>

<div class="watchlar">
	<div id="poopexHolder" onclick="new Effect.Fold(this); window.setTimeout('Effect.Appear(\'poopexHolder\', {duration:.3})',2500);">
		<img src="images/manners/poopex.gif" alt="" />
	</div>
</div>

<img src="images/manners/myrkass.jpg" id="myrkass" class="myrk" alt="Myrkridian Assasin">

<div id="yevvysDrop"></div>

<script type="text/javascript" language="javascript">
	Droppables.add('yevvysDrop', {
			accept: 'myrk',
			hoverclass: 'yevvysDropHover',
			onDrop: function(element) {
						$('yevvysDrop').innerHTML += '<img src="' + element.src + '" class="yevvysThumb">';
						shallIReturn = true;
					}
			});
</script>

<div id="track1" style="width: 200px; background-color: deeppink; height: 11px;">
	<div id="handle1" style="width: 8px; height: 18px; background-color: orange; cursor: move;"></div>
</div>
<div id="debug1" style="padding-top: 15px;"></div>

<script type="text/javascript" language="javascript">
// <![CDATA[
	var shallIReturn = false;
	new Draggable('myrkass', {
			revert: function() {
						var mannysReturn = shallIReturn;
						shallIReturn = false;
						return mannysReturn;
					}
			});
	new Control.Slider('handle1','track1',{
			onSlide:function(v){$('debug1').innerHTML='slide: '+v},
			onChange:function(v){$('debug1').innerHTML='changed! '+v}});
// ]]>
</script>

</div>
</body>
</html>