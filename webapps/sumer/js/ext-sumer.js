var mannysTabs = new Ext.TabPanel({
	region: 'center',
	deferredRender: false,
	enableTabScroll: true,
	activeTab: 0,
	items: [{
		contentEl: 'center1',
		title: 'Close Me',
		autoScroll: true
	},{
		contentEl: 'center2',
		title: 'Enki and Nin&#7723;ursa&#285;a -- a composite transliteration',
		closable: true,
		autoScroll: true
	}]
})

mShowTrans = function(mTrans){
	var mannysMarkup = "Hi Yevvy";

	loader = new Ext.data.Connection();
	loader.request({
		url: 'guapoTran?XML=transliterations/' + mTrans + '&XSL=xsl/gemineye.xsl',
		method: 'GET',
		callback: function(options, success, response) {
			var mTitle = response.responseText;
			loader.request({
				url: 'guapoTran?XML=transliterations/' + mTrans + '&XSL=xsl/extYevvy.xsl',
				method: 'GET',
				callback: function(options, success, response) {
					mannysMarkup = response.responseText;
					mannysTabs.add({
						title: mTitle,
						iconCls: 'tabs',
						html: mannysMarkup,
						autoScroll: true,
						closable: true
					}).show();
				}
			});
		}
	});
}
	
mannysLayout = function(){
	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
     
	var viewport = new Ext.Viewport({
		layout: 'border',
		listeners: 	{'afterlayout': loadContentsTable},
		items:[
			new Ext.BoxComponent({
				region: 'north',
				el: 'north',
				height: 32
			}),{
				region: 'south',
				contentEl: 'south',
				split: true,
				height: 100,
				minSize: 100,
				maxSize: 200,
				collapsible: true,
				title: 'Glossary',
				margins: '0 0 0 0'
			}, {
				region: 'east',
				title: 'East Side',
				collapsible: true,
				split: true,
				width: 225,
				minSize: 175,
				maxSize: 400,
				layout: 'fit',
				margins: '0 5 0 0',
				items:
					new Ext.TabPanel({
						border: false,
						activeTab: 1,
						tabPosition: 'bottom',
						items:[{
							html: '<p>A TabPanel component can be a region.</p>',
							title: 'A Tab',
							autoScroll: true
						},
						new Ext.grid.PropertyGrid({
							title: 'Property Grid',
							closable: true,
							source: {
								"(name)": "Properties Grid",
								"grouping": false,
								"autoFitColumns": true,
								"productionQuality": false,
								"created": new Date(Date.parse('10/15/2006')),
								"tested": false,
								"version": .01,
								"borderWidth": 1
							}
						})]
					})
			},{
				region: 'west',
				id: 'west-panel',
				title: 'Corpus Contents',
				split: true,
				width: 200,
				minSize: 175,
				maxSize: 400,
				collapsible: true,
				margins: '0 0 0 5',
				layout: 'accordion',
				layoutConfig: {
					animate: true
				},
				items: [{
					contentEl: 'west',
					title: 'Ancient literary catalogues',
					autoScroll: true,
					border: false,
					iconCls: 'nav'
				},{
					contentEl: 'westNarrative',
					title: 'Narrative and mythological compositions',
					border: false,
					autoScroll: true,
					iconCls: 'settings'
				},{
					contentEl: 'westHistorical',
					title: 'Compositions with a historical background & Royal praise poetry',
					border: false,
					autoScroll: true,
					iconCls: 'settings'
				},{
					contentEl: 'westLetters',
					title: 'Literary letters and letter-prayers',
					border: false,
					autoScroll: true,
					iconCls: 'settings'
				},{
					contentEl: 'westHymns',
					title: 'Hymns and cult songs',
					border: false,
					autoScroll: true,
					iconCls: 'settings'
				},{
					contentEl: 'westOther',
					title: 'Other literature',
					border: false,
					autoScroll: true,
					iconCls: 'settings'
				},{
					contentEl: 'westProverbs',
					title: 'Proverb collections',
					border: false,
					autoScroll: true,
					iconCls: 'settings'
				}]
			},
			mannysTabs
		]
	});
}

loadContentsSection = function(section) {
	loader = new Ext.data.Connection();
	loader.request({
		url: 'inc/' + section + '.html',
		method: 'GET',
		callback: function(options, success, response) {
			Ext.get(section).update(response.responseText);
		}
	});
}

loadContentsTable = function() {
	loadContentsSection('westNarrative');
	loadContentsSection('westHistorical');
	loadContentsSection('westLetters');
	loadContentsSection('westHymns');
	loadContentsSection('westOther');
	loadContentsSection('westProverbs');
}

hiYevvy = function() {
	return "Hi Yevvy";
}

hiManny = function() {
	Ext.Msg.alert("Say Hi", "Hi Manny");
}

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
	tag.style.color = 'ivory';
	
	idRoot = document.getElementById(id);
	for (i=0; i<idRoot.childNodes.length; i++)
	{
		node = idRoot.childNodes[i];
		if (node.nodeName == 'DIV')
			node.style.color = 'ivory';
	}
}
function yevvyUnColor(tag, id)
{
	tag.style.color = 'yellowgreen';

	idRoot = document.getElementById(id);
	for (i=0; i<idRoot.childNodes.length; i++)
	{
		node = idRoot.childNodes[i];
		if (node.nodeName == 'DIV')
			node.style.color = 'yellowgreen';
	}
}
function showMannysDef(lemma, pos, label)
{
	document.getElementById("mannysDef").innerHTML = "<div class='lemma'>" + lemma + ":</div><div class='def'><span class='pos'>" + pos + "</span>" + label + "</div>";
}