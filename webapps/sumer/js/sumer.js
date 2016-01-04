function Yevvygo()
{
	var popup = eval("document.YevvyForm.elements['Yevvytron']");
	var dest  = popup[popup.selectedIndex].value;
	if (dest == '') popup.selectedIndex = 0;
	else window.open(dest, '_top');
}
function Mannygo()
{
	var popup = eval("document.MannyForm.elements['Mannytron']");
	var dest  = popup[popup.selectedIndex].value;
	if (dest == '') popup.selectedIndex = 0;
	else window.open(dest, '_top');
}
function yevvyColor(tag, id)
{
	tag.style.color = 'lightpink';
	
	idRoot = document.getElementById(id);
	for (i=0; i<idRoot.childNodes.length; i++)
	{
		node = idRoot.childNodes[i];
		if (node.nodeName == 'DIV')
			node.style.color = 'lightpink';
	}
}
function yevvyUnColor(tag, id)
{
	tag.style.color = 'mistyrose';

	idRoot = document.getElementById(id);
	for (i=0; i<idRoot.childNodes.length; i++)
	{
		node = idRoot.childNodes[i];
		if (node.nodeName == 'DIV')
			node.style.color = 'mistyrose';
	}
}
function viewTab(tab)
{
	if (tab == "blog")
		document.getElementById("blog").style.visibility = "visible";
	else
	{
		document.getElementById("blog").style.visibility = "hidden";
		if (tab == "corpus")
		{
			document.getElementById("yevvyCorpus").style.visibility = "visible";
			document.getElementById("mannyCorpus").style.visibility = "visible";
			document.getElementById("yevvyContents").style.visibility = "hidden";
			document.getElementById("mannyContents").style.visibility = "hidden";
			document.getElementById("yevvyGlossary").style.visibility = "hidden";
			document.getElementById("mannyGlossary").style.visibility = "hidden";
		}
		else if (tab == "glossary")
		{
			document.getElementById("yevvyCorpus").style.visibility = "hidden";
			document.getElementById("mannyCorpus").style.visibility = "hidden";
			document.getElementById("yevvyContents").style.visibility = "hidden";
			document.getElementById("mannyContents").style.visibility = "hidden";
			document.getElementById("yevvyGlossary").style.visibility = "visible";
			document.getElementById("mannyGlossary").style.visibility = "visible";
		}
		else
		{
			document.getElementById("yevvyCorpus").style.visibility = "hidden";
			document.getElementById("mannyCorpus").style.visibility = "hidden";
			document.getElementById("yevvyContents").style.visibility = "visible";
			document.getElementById("mannyContents").style.visibility = "visible";
			document.getElementById("yevvyGlossary").style.visibility = "hidden";
			document.getElementById("mannyGlossary").style.visibility = "hidden";
		}
	}
}
function showMannysDef(lemma, pos, label)
{
	document.getElementById("mannysDef").innerHTML = "<div class='lemma'>" + lemma + ":</div><div class='def'><span class='pos'>" + pos + "</span>" + label + "</div>";
}