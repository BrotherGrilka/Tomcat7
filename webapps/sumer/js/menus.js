/*
 * Ext JS Library 2.0
 * Copyright(c) 2006-2007, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

mToolbar = function() {
    Ext.QuickTips.init();

    // Menus can be prebuilt and passed by reference
    var dateMenu = new Ext.menu.DateMenu({
        handler : function(dp, date){
            Ext.example.msg('Date Selected', 'You chose {0}.', date.format('M j, Y'));
        }
    });

    var colorMenu = new Ext.menu.ColorMenu({
        handler : function(cm, color){
            Ext.example.msg('Color Selected', 'You chose {0}.', color);
        }
    });

    var menu = new Ext.menu.Menu({
        id: 'mainMenu',
        items: [
            {
                text: 'I like Ext',
                checked: true,       // when checked has a boolean value, it is assumed to be a CheckItem
                checkHandler: onItemCheck
            },
            {
                text: 'Ext for jQuery',
                checked: true,
                checkHandler: onItemCheck
            },
            {
                text: 'I donated!',
                checked:false,
                checkHandler: onItemCheck
            }, '-', {
                text: 'Radio Options',
                menu: {        // <-- submenu by nested config object
                    items: [
                        // stick any markup in a menu
                        '<b class="menu-title">Choose a Theme</b>',
                        {
                            text: 'Aero Glass',
                            checked: true,
                            group: 'theme',
                            checkHandler: onItemCheck
                        }, {
                            text: 'Vista Black',
                            checked: false,
                            group: 'theme',
                            checkHandler: onItemCheck
                        }, {
                            text: 'Gray Theme',
                            checked: false,
                            group: 'theme',
                            checkHandler: onItemCheck
                        }, {
                            text: 'Default Theme',
                            checked: false,
                            group: 'theme',
                            checkHandler: onItemCheck
                        }
                    ]
                }
            },{
                text: 'Choose a Date',
                iconCls: 'calendar',
                menu: dateMenu // <-- submenu by reference
            },{
                text: 'Choose a Color',
                menu: colorMenu // <-- submenu by reference
            }
        ]
    });

    var tb = new Ext.Toolbar();
    tb.render('gc111');

    tb.add({
            text:'Button w/ Menu',
            iconCls: 'bmenu',  // <-- icon
            menu: menu  // assign menu by instance
        }, 
        new Ext.Toolbar.MenuButton({
            text: 'Split Button',
            handler: onButtonClick,
            tooltip: {text:'This is a QuickTip with autoHide set to false and a title', title:'Tip Title', autoHide:false},
            iconCls: 'blist',
            // Menus can be built/referenced by using nested menu config objects
            menu : {items: [
                        {text: '<b>Bold</b>', handler: onItemClick},
                        {text: '<i>Italic</i>', handler: onItemClick},
                        {text: '<u>Underline</u>', handler: onItemClick}, '-',{
                        text: 'Pick a Color', handler: onItemClick, menu: {
                        items: [
                                new Ext.menu.ColorItem({selectHandler:function(cp, color){
                                    Ext.example.msg('Color Selected', 'You chose {0}.', color);
                                }}), '-',
                                {text:'More Colors...', handler:onItemClick}
                        ]
                    }},
                    {text: 'Extellent!', handler: onItemClick}
                ]}
        }), '-', {
        text: 'Toggle Me',
        enableToggle: true,
        toggleHandler: onItemToggle,
        pressed: true
    });

    menu.addSeparator();
    // Menus have a rich api for
    // adding and removing elements dynamically
    var item = menu.add({
        text: 'Dynamically added Item'
    });
    // items support full Observable API
    item.on('click', onItemClick);

    // items can easily be looked up
    menu.add({
        text: 'Disabled Item',
        id: 'disableMe'  // <-- Items can also have an id for easy lookup
        // disabled: true   <-- allowed but for sake of example we use long way below
    });
    // access items by id or index
    menu.items.get('disableMe').disable();

    // They can also be referenced by id in or components
    tb.add('-', {
        icon: 'list-items.gif', // icons can also be specified inline
        cls: 'x-btn-icon',
        tooltip: '<b>Quick Tips</b><br/>Icon only button with tooltip'
    }, '-');

    // add a combobox to the toolbar
    var store = new Ext.data.SimpleStore({
        fields: ['abbr', 'state'],
        data : Ext.exampledata.states // from states.js
    });
    var combo = new Ext.form.ComboBox({
        store: store,
        displayField:'state',
        typeAhead: true,
        mode: 'local',
        triggerAction: 'all',
        emptyText:'Select a state...',
        selectOnFocus:true,
        width:135
    });
    tb.addField(combo);

    // functions to display feedback
    function onButtonClick(btn){
        Ext.example.msg('Button Click','You clicked the "{0}" button.', btn.text);
    }

    function onItemClick(item){
        Ext.example.msg('Menu Click', 'You clicked the "{0}" menu item.', item.text);
    }

    function onItemCheck(item, checked){
        Ext.example.msg('Item Check', 'You {1} the "{0}" menu item.', item.text, checked ? 'checked' : 'unchecked');
    }

    function onItemToggle(item, pressed){
        Ext.example.msg('Button Toggled', 'Button "{0}" was toggled to {1}.', item.text, pressed);
    }
}

/*
 * Ext JS Library 2.0
 * Copyright(c) 2006-2007, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.BLANK_IMAGE_URL = '../../resources/images/default/s.gif';

Ext.example = function(){
    var msgCt;

    function createBox(t, s){
        return ['<div class="msg">',
                '<div class="x-box-tl"><div class="x-box-tr"><div class="x-box-tc"></div></div></div>',
                '<div class="x-box-ml"><div class="x-box-mr"><div class="x-box-mc"><h3>', t, '</h3>', s, '</div></div></div>',
                '<div class="x-box-bl"><div class="x-box-br"><div class="x-box-bc"></div></div></div>',
                '</div>'].join('');
    }
    return {
        msg : function(title, format){
            if(!msgCt){
                msgCt = Ext.DomHelper.insertFirst(document.body, {id:'msg-div'}, true);
            }
            msgCt.alignTo(document, 't-t');
            var s = String.format.apply(String, Array.prototype.slice.call(arguments, 1));
            var m = Ext.DomHelper.append(msgCt, {html:createBox(title, s)}, true);
            m.slideIn('t').pause(1).ghost("t", {remove:true});
        },

        init : function(){
            var t = Ext.get('exttheme');
            if(!t){ // run locally?
                return;
            }
            var theme = Cookies.get('exttheme') || 'aero';
            if(theme){
                t.dom.value = theme;
                Ext.getBody().addClass('x-'+theme);
            }
            t.on('change', function(){
                Cookies.set('exttheme', t.getValue());
                setTimeout(function(){
                    window.location.reload();
                }, 250);
            });

            var lb = Ext.get('lib-bar');
            if(lb){
                lb.show();
            }
        }
    };
}();

Ext.example.shortBogusMarkup = '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed metus nibh, sodales a, porta at, vulputate eget, dui. Pellentesque ut nisl. Maecenas tortor turpis, interdum non, sodales non, iaculis ac, lacus. Vestibulum auctor, tortor quis iaculis malesuada, libero lectus bibendum purus, sit amet tincidunt quam turpis vel lacus. In pellentesque nisl non sem. Suspendisse nunc sem, pretium eget, cursus a, fringilla vel, urna.';
Ext.example.bogusMarkup = '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed metus nibh, sodales a, porta at, vulputate eget, dui. Pellentesque ut nisl. Maecenas tortor turpis, interdum non, sodales non, iaculis ac, lacus. Vestibulum auctor, tortor quis iaculis malesuada, libero lectus bibendum purus, sit amet tincidunt quam turpis vel lacus. In pellentesque nisl non sem. Suspendisse nunc sem, pretium eget, cursus a, fringilla vel, urna.<br/><br/>Aliquam commodo ullamcorper erat. Nullam vel justo in neque porttitor laoreet. Aenean lacus dui, consequat eu, adipiscing eget, nonummy non, nisi. Morbi nunc est, dignissim non, ornare sed, luctus eu, massa. Vivamus eget quam. Vivamus tincidunt diam nec urna. Curabitur velit.</p>';

Ext.onReady(Ext.example.init, Ext.example);


// old school cookie functions grabbed off the web
var Cookies = {};
Cookies.set = function(name, value){
     var argv = arguments;
     var argc = arguments.length;
     var expires = (argc > 2) ? argv[2] : null;
     var path = (argc > 3) ? argv[3] : '/';
     var domain = (argc > 4) ? argv[4] : null;
     var secure = (argc > 5) ? argv[5] : false;
     document.cookie = name + "=" + escape (value) +
       ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
       ((path == null) ? "" : ("; path=" + path)) +
       ((domain == null) ? "" : ("; domain=" + domain)) +
       ((secure == true) ? "; secure" : "");
};

Cookies.get = function(name){
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	var j = 0;
	while(i < clen){
		j = i + alen;
		if (document.cookie.substring(i, j) == arg)
			return Cookies.getCookieVal(j);
		i = document.cookie.indexOf(" ", i) + 1;
		if(i == 0)
			break;
	}
	return null;
};

Cookies.clear = function(name) {
  if(Cookies.get(name)){
    document.cookie = name + "=" +
    "; expires=Thu, 01-Jan-70 00:00:01 GMT";
  }
};

Cookies.getCookieVal = function(offset){
   var endstr = document.cookie.indexOf(";", offset);
   if(endstr == -1){
       endstr = document.cookie.length;
   }
   return unescape(document.cookie.substring(offset, endstr));
};

/*
 * Ext JS Library 2.0
 * Copyright(c) 2006-2007, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

// some data used in the examples
Ext.namespace('Ext.exampledata');

Ext.exampledata.states = [
        ['AL', 'Alabama', 'The Heart of Dixie'],
        ['AK', 'Alaska', 'The Land of the Midnight Sun'],
        ['AZ', 'Arizona', 'The Grand Canyon State'],
        ['AR', 'Arkansas', 'The Natural State'],
        ['CA', 'California', 'The Golden State'],
        ['CO', 'Colorado', 'The Mountain State'],
        ['CT', 'Connecticut', 'The Constitution State'],
        ['DE', 'Delaware', 'The First State'],
        ['DC', 'District of Columbia', "The Nation's Capital"],
        ['FL', 'Florida', 'The Sunshine State'],
        ['GA', 'Georgia', 'The Peach State'],
        ['HI', 'Hawaii', 'The Aloha State'],
        ['ID', 'Idaho', 'Famous Potatoes'],
        ['IL', 'Illinois', 'The Prairie State'],
        ['IN', 'Indiana', 'The Hospitality State'],
        ['IA', 'Iowa', 'The Corn State'],
        ['KS', 'Kansas', 'The Sunflower State'],
        ['KY', 'Kentucky', 'The Bluegrass State'],
        ['LA', 'Louisiana', 'The Bayou State'],
        ['ME', 'Maine', 'The Pine Tree State'],
        ['MD', 'Maryland', 'Chesapeake State'],
        ['MA', 'Massachusetts', 'The Spirit of America'],
        ['MI', 'Michigan', 'Great Lakes State'],
        ['MN', 'Minnesota', 'North Star State'],
        ['MS', 'Mississippi', 'Magnolia State'],
        ['MO', 'Missouri', 'Show Me State'],
        ['MT', 'Montana', 'Big Sky Country'],
        ['NE', 'Nebraska', 'Beef State'],
        ['NV', 'Nevada', 'Silver State'],
        ['NH', 'New Hampshire', 'Granite State'],
        ['NJ', 'New Jersey', 'Garden State'],
        ['NM', 'New Mexico', 'Land of Enchantment'],
        ['NY', 'New York', 'Empire State'],
        ['NC', 'North Carolina', 'First in Freedom'],
        ['ND', 'North Dakota', 'Peace Garden State'],
        ['OH', 'Ohio', 'The Heart of it All'],
        ['OK', 'Oklahoma', 'Oklahoma is OK'],
        ['OR', 'Oregon', 'Pacific Wonderland'],
        ['PA', 'Pennsylvania', 'Keystone State'],
        ['RI', 'Rhode Island', 'Ocean State'],
        ['SC', 'South Carolina', 'Nothing Could be Finer'],
        ['SD', 'South Dakota', 'Great Faces, Great Places'],
        ['TN', 'Tennessee', 'Volunteer State'],
        ['TX', 'Texas', 'Lone Star State'],
        ['UT', 'Utah', 'Salt Lake State'],
        ['VT', 'Vermont', 'Green Mountain State'],
        ['VA', 'Virginia', 'Mother of States'],
        ['WA', 'Washington', 'Green Tree State'],
        ['WV', 'West Virginia', 'Mountain State'],
        ['WI', 'Wisconsin', "America's Dairyland"],
        ['WY', 'Wyoming', 'Like No Place on Earth']
    ];