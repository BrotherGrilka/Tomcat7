<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>Bruins Game Videos</title>
<link rel="Shortcut Icon" href="favicon.ico">
<script src="js/sifr.js" type="text/javascript"></script>
<script src="../js/swfobject.js" type="text/javascript"></script>
</head>
<body onload="mLoadFlash();">
<div id="donimo" class="eperdu">
	<div id="movieHolder"></div>
</div>
<br/>
<script type="text/javascript">
mLoadFlash = function() {
	swfobject.embedSWF("swf/mVideo.swf", "movieHolder", "500", "500", "8", "#336699", {mFlv: '../monties/movies/Penguins.flv'});
}
</script>
</body>
</html>