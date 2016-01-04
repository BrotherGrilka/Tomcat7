var windowIndex = 0;var xPosWin = 200;var yPosWin = 20;yevvyColor = function() {}yevvyUnColor = function() {}MannersDesktop = new Ext.app.App({	init : function(){		Ext.QuickTips.init();		mShowTrans('c.1.1.1.xml');		loadImages();	},	getModules : function(){		return [			new MannersDesktop.MannySearch(),			new MannersDesktop.MannyGlossary(),            new MannersDesktop.ContentsModule({title: 'Ancient literary catalogues', cat: 'westCatalogues'}),            new MannersDesktop.ContentsModule({title: 'Narrative & mythological', cat: 'westNarrative'}),            new MannersDesktop.ContentsModule({title: 'Royal praise poetry', cat: 'westHistorical'}),            new MannersDesktop.ContentsModule({title: 'Literary letters & letter-prayers', cat: 'westLetters'}),            new MannersDesktop.ContentsModule({title: 'Hymns & cult songs', cat: 'westHymns'}),            new MannersDesktop.ContentsModule({title: 'Other literature', cat: 'westOther'}),            new MannersDesktop.ContentsModule({title: 'Proverb collections', cat: 'westProverbs'})		];	},    getStartConfig : function(){        return {            title: 'Corpus Contents',            iconCls: 'user',            toolItems: [{                text: 'Settings',                iconCls: 'settings',                scope: this            },'-',{                text: 'Logout',                iconCls: 'logout',                scope: this            }]        };    }});hiManny = function() {	alert("Hi Manny");}loadImages = function() {	cecily = new Image();	cecily.src = "images/waitManny.gif";}aScroll = function(aOther) {	var yTop = Ext.get(aOther).getOffsetsTo(document.body)[1] - Ext.get('p1').getOffsetsTo(document.body)[1];	Ext.select('#mScroller .x-panel-body').scrollTo('top', yTop, {duration: .5});}iScroll = function(iOther) {	var yMax = iOther.replace(/\.p.*/, '.p1');	var yTop = Ext.get(iOther).getOffsetsTo(document.body)[1] - Ext.get(yMax).getOffsetsTo(document.body)[1];	Ext.select('#yScroller .x-panel-body').scrollTo('top', yTop, {duration: .5});}iOver = function(mDiv, yId) {	Ext.get(mDiv).addClass('highlight');	Ext.get(yId).addClass('highlight');}iOut = function(mDiv, yId) {	Ext.get(mDiv).removeClass('highlight');	Ext.get(yId).removeClass('highlight');}yPositionWindow = function(win) {/*	if (xPosWin > 300 || xPosWin < 200) {		xPosWin = 200;		yPosWin = 20;	}	if (!win.isVisible()) {		win.setPosition(xPosWin, yPosWin);		xPosWin += 20;		yPosWin += 20;	}*/}showMannysDef = function(lemma, pos, label, gId) {	var mannysDef = Ext.get('mannysDef');	var yevvysDef = Ext.get(gId);	if(mannysDef)		mannysDef.update("<div class='lemma'>" + lemma + ":</div><div class='def'><span class='pos'>" + pos + "</span>" + label + "</div>");	if(yevvysDef)		yevvysDef.update("<div class='lemma'>" + lemma + ":</div><div class='def'><span class='pos'>" + pos + "</span>" + label + "</div>");}mannysX = 130;mannysY = 30;mShowTrans = function(mTrans) {	var mTitle, mTransI, mTransA;	var mId = mTrans.replace(/\./g, "").replace(/xml/, "");	var yTrans = mTrans.replace(/c/g, "t");	var iId = 'i' + mId;	var aId = 'a' + mId;	var gId = 'g' + mId;		createWindow = function() {        var desktop = MannersDesktop.getDesktop();        var win = desktop.getWindow('y' + mId);		if (!win) {			var mToolbar = new Ext.Toolbar({						});						var transI = new Ext.Panel({				title: 'Tranliteration',				region: 'center',				html: '<div id="' + iId + '" class="waitManny"></div>',				split: true,				autoScroll: true,				iconCls: 'boy',				layout: 'fit',				width: 300,				id: 'yScroller',				collapsible: true,				margins: '3 3 0 3',				cmargins: '3 3 3 3'			});			var transA = new Ext.Panel({				title: 'Translation',				region: 'east',				html: '<div id="' + aId + '" class="waitManny"></div>',				split: true,				autoScroll: true,				id: 'mScroller',				iconCls: 'girl',				layout: 'fit',				width: 354,				collapsible: true,				margins: '3 3 0 3',				cmargins: '3 3 3 3'			});			var tabs = new Ext.TabPanel({				region: 'center',				margins: '3 3 3 0', 				activeTab: 0,				defaults: {autoScroll: true},				items:[{					title: 'Translation and Transliteration',					iconCls: 'userGreen',					layout: 'border',					items: [transI, transA],				},{					title: 'Bibliography',					iconCls: 'userGray',					html: 'Hi'				},{					title: 'Hi',					iconCls: 'userRed',					html: 'Hi'				},{					title: 'Notes',					iconCls: 'userOrange',					html: 'Hi',					closable: true				}]			});			var toolbar = {				header: false,				region: 'north',				tbar: [{					tooltip: 'Glossary',					cls: 'yGloss',					id: gId				}, '-',				new Ext.form.Checkbox({					boxLabel: 'Scroll Texts',//					listeners: {'check': hiManny},					checked: true				}), '-', {					text: 'Create Pdf',					tooltip: 'Generate Pdf',					iconCls: 'option'				}, '-', {					text: 'Scroll Texts',					enableToggle: true,					toggleHandler: hiManny,					pressed: true				}, '-', {					text: 'Remove Something',					tooltip: 'Remove the selected item',					iconCls: 'remove'				}, '-', {					text: 'Add Something',					tooltip: 'Add a new row',					iconCls: 'add'				}]			};						win = desktop.createWindow({                title: mTitle,				id: 'y' + mId,				closable: true,				iconCls: 'suit',                width: 754,                height: 380,				x: mannysX,				y: mannysY,				plain: true,				layout: 'border',				items: [toolbar, tabs]/*				autoScroll: true,                html : '<div id="' + iId + '" class="tDiv"></div><div id="' + aId + '" class="tDiv"></div>',                iconCls: 'bogus',                shim: false,                animCollapse: false,                constrainHeader: true*/			});        }		yPositionWindow(win);        win.show();				mannysX += 30;		mannysY += 30;			if (mannysY >= 180 && mannysX == 430) {			mannysX = 130;			mannysY = 30;		} else if (mannysY >= 180) {			mannysX = 430;			mannysY = 30;		}    }	loader = new Ext.data.Connection();	loader.request({		url: 'guapo.jsp?XML=transliterations/' + mTrans + '&XSL=xsl/gemineye.xsl',		method: 'GET',		callback: function(options, success, response) {			mTitle = response.responseText;			createWindow();			loader.request({				url: 'guapo.jsp?XML=transliterations/' + mTrans + '&XSL=xsl/iExt.xsl',				method: 'GET',				callback: function(options, success, response) {					Ext.get(iId).removeClass('waitManny');					Ext.get(iId).update(response.responseText);					loader.request({						url: 'guapo.jsp?XML=translations/' + yTrans + '&XSL=xsl/aExt.xsl',						method: 'GET',						callback: function(options, success, response) {							Ext.get(aId).removeClass('waitManny');							Ext.get(aId).update(response.responseText);						}					});				}			});		}	});}MannersDesktop.MannyGlossary = Ext.extend(Ext.app.Module, {	init : function(config){		this.launcher = {			text: 'Glossary',			cat: 'View Glossary',			iconCls: 'bogus',			handler: this.createWindow,			scope: this,			windowId: 'mannysDef'		}//		this.createWindow(this.launcher);	},    createWindow : function(source){		var desktop = MannersDesktop.getDesktop();		var win = desktop.getWindow('yevvysDef');		if (!win) {			win = desktop.createWindow({				id: 'yevvysDef',				title: source.text,				width: 280,				height: 70,				autoScroll: true,				html: '<div id="mannysDef"></div>',				iconCls: 'bogus',				shim: false,				animCollapse: false,				constrainHeader: true			});			Ext.get('mannysDef').update('Hi Manners');		}		yPositionWindow(win);		win.show();	}});MannersDesktop.MannySearch = Ext.extend(Ext.app.Module, {	init : function(config){		this.launcher = {			text: 'Search Corpus',			cat: 'Search Corpus',			iconCls: 'bogus',			handler: this.createWindow,			scope: this,			windowId: 'mSearch'		}	},    createWindow : function(source){		var desktop = MannersDesktop.getDesktop();		var win = desktop.getWindow('mSearch');		if (!win) {			win = desktop.createWindow({				id: 'mSearch',				title: source.text,				width: 377,				height: 190,				autoScroll: true,				html: '<div id="ySearch"></div>',				iconCls: 'bogus',				shim: false,				animCollapse: false,				constrainHeader: true			});			Ext.get('ySearch').update('<form name="search" action="javascript: hiManny();" method="get">Search<br><input name="query" size="44" class="matchbox"/>Results Per Page<br><input name="maxresults" size="4" value="100" class="hotwheels"/><br><input type="submit" value="Search"/></form>');		}		yPositionWindow(win);		win.show();	}});MannersDesktop.ContentsModule = Ext.extend(Ext.app.Module, {    init : function(config){        this.launcher = {            text: config.title,			cat: config.cat,            iconCls: 'bogus',            handler : this.createWindow,            scope: this,            windowId: windowIndex++        }    },	loadContentsSection : function(section) {		loader = new Ext.data.Connection();		loader.request({			url: 'inc/' + section + '.html',			method: 'GET',			callback: function(options, success, response) {				Ext.get(section).update(response.responseText);			}		});	},    createWindow : function(source) {        var desktop = this.app.getDesktop();        var win = desktop.getWindow('hiManny' + source.windowId);		if (!win) {			win = desktop.createWindow({                id: 'hiManny' + source.windowId,                title: source.text,                width: 377,                height: 190,				autoScroll: true,                html : '<div id="' + source.cat + '"></div>',                iconCls: 'bogus',                shim: false,                animCollapse: false,                constrainHeader: true            });			this.loadContentsSection(source.cat);        }        win.show();		yPositionWindow(win);    }});