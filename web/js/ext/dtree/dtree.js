/*--------------------------------------------------|

 | dTree 2.05 | www.destroydrop.com/javascript/tree/ |

 |---------------------------------------------------|

 | Copyright (c) 2002-2003 Geir Landr               |

 |                                                   |

 | This script can be used freely as long as all     |

 | copyright messages are intact.                    |

 |                                                   |

 | Updated: 17.04.2003                               |

 |--------------------------------------------------*/

var crudAddMethod = 'dtreeAdd';
var crudRemoveMethod = 'dtreeRemove';
var crudRemoveAllMethod = 'dtreeRemoveAll';
var crudEditMethod = 'dtreeEdit';

var crudAddImg = '/security/js/ext/dtree/img/more_small.gif';
var crudAddOffImg = '/security/js/ext/dtree/img/more_small_off.gif';
var crudRemoveImg = '/security/js/ext/dtree/img/error_obj.gif';
var crudEditImg = '/security/js/ext/dtree/img/up.gif';
var crudRemoveAllImg = '/security/js/ext/dtree/img/errorwarning_tab.gif';



// Node object

function Node(id, pid, name, url, crudMethod ,title, target, icon, iconOpen, open, isAction, checkboxes, ticketCheckbox) {

    this.id = id;

    this.pid = pid;

    this.name = name;

    this.url = url;

    this.title = title;

    this.target = target;

    this.icon = icon;

    this.iconOpen = iconOpen;

    this._io = open || false;

    this._is = false;

    this._ls = false;

    this._hc = false;//indica si es hoja

    this._ai = 0;

    this._p;

    this.isAction = isAction || false;

    this.checkboxes = checkboxes || false;

    this.crudMethod = crudMethod || 'none';

    this.ticketCheckbox = ticketCheckbox || false;
};



// Tree object

function dTree(objName) {

    this.config = {

        target					: null,

        folderLinks			: true,

        useSelection		: true,

        useCookies			: true,

        useLines				: true,

        useIcons				: true,

        useStatusText		: false,

        closeSameLevel	: false,

        inOrder					: false

    }

    this.icon = {

        root				: '/security/js/ext/dtree/img/base.gif',

        folder			: '/security/js/ext/dtree/img/folder.gif',

        folderOpen	: '/security/js/ext/dtree/img/folderopen.gif',

        node				: '/security/js/ext/dtree/img/page.gif',

        empty				: '/security/js/ext/dtree/img/empty.gif',

        line				: '/security/js/ext/dtree/img/line.gif',

        join				: '/security/js/ext/dtree/img/join.gif',

        joinBottom	: '/security/js/ext/dtree/img/joinbottom.gif',

        plus				: '/security/js/ext/dtree/img/plus.gif',

        plusBottom	: '/security/js/ext/dtree/img/plusbottom.gif',

        minus				: '/security/js/ext/dtree/img/minus.gif',

        minusBottom	: '/security/js/ext/dtree/img/minusbottom.gif',

        nlPlus			: '/security/js/ext/dtree/img/nolines_plus.gif',

        nlMinus			: '/security/js/ext/dtree/img/nolines_minus.gif'

    };

    this.obj = objName;

    this.aNodes = [];

    this.aIndent = [];

    this.root = new Node(-1);

    this.selectedNode = null;

    this.selectedFound = false;

    this.completed = false;

};



// Adds a new node to the node array

dTree.prototype.add = function(id, pid, name, url, crudMethod, title, target, icon, iconOpen, open, isAction, checkboxes, ticketCheckbox) {

    this.aNodes[this.aNodes.length] = new Node(id, pid, name, url, crudMethod, title, target, icon, iconOpen, open, isAction, checkboxes, ticketCheckbox);

};



// Open/close all nodes

dTree.prototype.openAll = function() {

    this.oAll(true);

};

dTree.prototype.closeAll = function() {

    this.oAll(false);

};



// Outputs the tree to the page

dTree.prototype.toString = function() {

    var str = '<div class="dtree">\n';

    if (document.getElementById) {

        if (this.config.useCookies) this.selectedNode = this.getSelected();

        str += this.addNode(this.root);

    } else str += 'Browser not supported.';

    str += '</div>';

    if (!this.selectedFound) this.selectedNode = null;

    this.completed = true;

    return str;

};



// Creates the tree structure

dTree.prototype.addNode = function(pNode) {

    var str = '';

    var n=0;

    if (this.config.inOrder) n = pNode._ai;

    for (n; n<this.aNodes.length; n++) {

        if (this.aNodes[n].pid == pNode.id) {

            var cn = this.aNodes[n];

            cn._p = pNode;

            cn._ai = n;

            this.setCS(cn);

            if (!cn.target && this.config.target) cn.target = this.config.target;

            if (cn._hc && !cn._io && this.config.useCookies) cn._io = this.isOpen(cn.id);

            if (!this.config.folderLinks && cn._hc) cn.url = null;

            if (this.config.useSelection && cn.id == this.selectedNode && !this.selectedFound) {

                cn._is = true;

                this.selectedNode = n;

                this.selectedFound = true;

            }

            str += this.node(cn, n);

            if (cn._ls) break;

        }

    }

    return str;

};

dTree.prototype.findNodeById = function(nodeId) {
    for (var i=0 ; this.aNodes.length>i ; i++) {
        if (this.aNodes[i].id == nodeId) return this.aNodes[i];
    }
    return null;
};

dTree.prototype.findNodesFather = function(nodeId) {
    var status = true;
    var id = nodeId;

    var nodesFather = id;
    while (status) {
        var nodeTmp = this.findNodeById(id);

        if (nodeTmp.id != 0) {
            nodesFather = nodesFather + "||" + nodeTmp.pid;
        } else {
            status = false;
        }
        id = nodeTmp.pid;
    }
    return nodesFather;
};

dTree.prototype.isLeave = function(nodeId) {
    for (var i=0 ; this.aNodes.length>i ; i++) {
        if (this.aNodes[i].pid == nodeId) return false;
    }
    return true;
};

/*
 varifica si tienen nodos hijos que no sean del tipo action
 */
dTree.prototype.haveNodesChildren = function(nodeId) {
    for (var i=0 ; this.aNodes.length>i ; i++) {
        if (this.aNodes[i].pid == nodeId && !this.aNodes[i].isAction) {
            return true;
        }
    }
    return false;
};

dTree.prototype.findNodesChildren = function(nodeId) {
    if (nodeId == '' || nodeId == ' ' || nodeId == 'undefined' || nodeId == 0) return ''
    var id = nodeId;

    var nodesChildren = id;
    for (var i=0 ; this.aNodes.length>i ; i++) {
        if (this.aNodes[i].pid == nodeId) {
            nodesChildren = nodesChildren + "||" + this.aNodes[i].id;
            nodesChildren = nodesChildren + "||" + this.findNodesChildren(this.aNodes[i].id);
        }
    }
    return nodesChildren;
};

dTree.prototype.findNodesByLevel = function(nodeId) {
    var nodesByLevel = '';
    var node = this.findNodeById(nodeId);
    for (var i=0 ; this.aNodes.length>i ; i++) {
        if (this.aNodes[i].pid == node.pid) {
            nodesByLevel = nodesByLevel + "||" + this.aNodes[i].id;
        }
    }
    return nodesByLevel;
};


function changeCheckboxDTree(checkbox, id, pid, nodeIdFather, nodeIdChildren, nodeByLevel) {
    if (checkbox.checked) {
        //marca los nodos padres
        if (nodeIdFather != '') {
            var nodeIdFatherArray = nodeIdFather.split("||");
            for (var i=0 ; nodeIdFatherArray.length>i ; i++) {
                if (nodeIdFatherArray[i] != 0) document.getElementById('dtree_' + nodeIdFatherArray[i]).checked = true;
            }
        }

        //marca los nodos hijos
        if (nodeIdChildren != '') {
            var nodeIdChildrenArray = nodeIdChildren.split("||");
            for (var i=0 ; nodeIdChildrenArray.length>i ; i++) {
                if (nodeIdChildrenArray[i] != '') document.getElementById('dtree_' + nodeIdChildrenArray[i]).checked = true;
            }
        }
    } else {
        //desmarca los nodos hijos
        if (nodeIdChildren != '') {
            var nodeIdChildrenArray = nodeIdChildren.split("||");
            for (var i=0 ; nodeIdChildrenArray.length>i ; i++) {
                if (nodeIdChildrenArray[i] != '') document.getElementById('dtree_' + nodeIdChildrenArray[i]).checked = false;
            }
        }
        // si se desmarcaron todos los nodos de un mismo nivel, se desmarca el padre
        /*
         if (nodeByLevel != '') {
         var nodeByLevelArray = nodeByLevel.split("||");
         var bool = true;
         for (var i=0 ; nodeByLevelArray.length>i ; i++) {
         if (nodeByLevelArray[i] != '' && document.getElementById('dtree_' + nodeByLevelArray[i]).checked) {
         bool = false;
         break;
         }
         }
         if (bool) document.getElementById('dtree_' + pid).checked = false;
         }
         */
    }
}

// Creates the node icon, url and text
dTree.prototype.node = function(node, nodeId) {

    var str = "<div class='dTreeNode'>" + this.indent(node, nodeId);

    //TODO: pone checkbox cuando es hoja
    /*
     if (node.checkboxes && !node._hc && node.pid != this.root.id) {
     str += '<input type="checkbox" style="width:12px;height:12px;" name="dtreeCheckboxes" id="dtree_'+node.id+'" value="'+node.id+'" src="' + ( (this.config.useLines) ? ((node._ls) ? this.icon.joinBottom : this.icon.join ) : this.icon.empty) + '" />';
     str += '&nbsp;';
     }
     */
    //TODO: pone checkbox a todas las funcionalidades
    if (node.checkboxes) {
        str += '<span style="position:absolute;left:65%;"><input type="checkbox" style="width:12px;height:12px;" name="dtreeCheckboxes" id="dtree_'+node.id+'" value="'+node.id+'" src="' + ( (this.config.useLines) ? ((node._ls) ? this.icon.joinBottom : this.icon.join ) : this.icon.empty) + '"';
        if (node.ticketCheckbox) {
            str += ' checked="checked" ';
        }
        //busca nodos padres
        var nodeIdFather = this.findNodesFather(node.id);
        //alert(nodeIdFather)

        //busca nodos hijos
        var nodeIdChildren = this.findNodesChildren(node.id);
        //alert(nodeIdChildren);

        //busca nodos del mismo nivel
        var nodeIdLevel = this.findNodesByLevel(node.id);
        //alert(nodeIdLevel);

        str += ' onclick="changeCheckboxDTree(this, \''+node.id+'\', \''+node.pid+'\', \''+nodeIdFather+'\', \''+nodeIdChildren+'\', \''+nodeIdLevel+'\')"; />&nbsp;</span>';
    }

    if (this.config.useIcons) {

        if (!node.icon) node.icon = (this.root.id == node.pid) ? this.icon.root : ((node._hc) ? this.icon.folder : this.icon.node);

        if (!node.iconOpen) node.iconOpen = (node._hc) ? this.icon.folderOpen : this.icon.node;

        if (this.root.id == node.pid || nodeId == 0) {

            node.icon = this.icon.root;

            node.iconOpen = this.icon.root;

        }

        //para que deje el icono de carpeta cerrada en caso que tenga hijos no action en su interior
        var haveChidren = this.haveNodesChildren(node.id);
        var iconClose = node.icon;
        if (haveChidren) iconClose = this.icon.folder;

        //para que deje el icono por parametro en caso que sus hijos sean solo del tipo action
        var iconOpen = node.iconOpen;
        if (!haveChidren) iconOpen = node.icon;

        str += '<img id="i' + this.obj + nodeId + '" src="' + ((node._io) ? iconOpen : iconClose) + '" alt="" />';
    }

    if (node.url) {

        str += '<a id="s' + this.obj + nodeId + '" class="' + ((this.config.useSelection) ? ((node._is ? 'nodeSel' : 'node')) : 'node') + '" href="' + node.url + '"';

        if (node.title) str += ' title="' + node.title + '"';

        if (node.target) str += ' target="' + node.target + '"';

        if (this.config.useStatusText) str += ' onmouseover="window.status=\'' + node.name + '\';return true;" onmouseout="window.status=\'\';return true;" ';

        if (this.config.useSelection && ((node._hc && this.config.folderLinks) || !node._hc))

            str += ' onclick="javascript: ' + this.obj + '.s(' + nodeId + ');"';

        str += '>';

    } else if ((!this.config.folderLinks || !node.url) && node._hc && node.pid != this.root.id) {

        str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');" class="node">';
    }

    str += node.name;

    if (node.url || ((!this.config.folderLinks || !node.url) && node._hc)) str += '</a>';

    //TODO: agrega algo al final de cada nodo (padre e hijos)
    if (node.crudMethod == 'all') {
        str += '<span style="position:absolute;left:65%;" >[';

        if (node.isAction) {
            //agrega la opcion de agregar solo si no es accion (si es accion deja un boton sin funcion)
            str += '<img width="12" height="12" id="addOff_i' + this.obj + node.id + '" src="' + crudAddOffImg + '" alt="Agregar una nueva funcionalidad a este nodo" style="cursor:pointer;" />&nbsp;,';
        } else {
            str += '<img width="12" height="12" id="add_i' + this.obj + node.id + '" src="' + crudAddImg + '" alt="Agregar una nueva funcionalidad a este nodo" onclick="'+crudAddMethod+'('+node.id+');" style="cursor:pointer;" />&nbsp;,';
        }

        // agrega la opcion de edicion
        str += '<img width="12" height="12" id="edit_i' + this.obj + node.id + '" src="' + crudEditImg + '" alt="Editar funcionalidad" onclick="'+crudEditMethod+'('+node.id+');" style="cursor:pointer;" />';

        if (node._hc) {
            // si es hoja, agrega opcion de eliminar
            str += '&nbsp;,<img width="12" height="12" id="removeAll_i' + this.obj + node.id + '" src="' + crudRemoveAllImg + '" alt="Eliminar el arbol de funcionalidades" onclick="'+crudRemoveAllMethod+'('+node.id+');" style="cursor:pointer;" />]';
        } else {
            // si no es hoja, agrega opcion de eliminar en cascada
            str += '&nbsp;,<img width="12" height="12" id="remove_i' + this.obj + node.id + '" src="' + crudRemoveImg + '" alt="Eliminar esta funcionalidad" onclick="'+crudRemoveMethod+'('+node.id+');" style="cursor:pointer;" />]';
        }
        str += '</span>';
    } else if (node.crudMethod == 'add') {

        //if (node._hc) {
        str += '<span style="position:absolute;left:65%;" >[<img width="12" height="12" id="add_i' + this.obj + node.id + '" src="' + crudAddImg + '" alt="Agregar una nueva funcionalidad a este nodo" onclick="'+crudAddMethod+'('+node.id+');" style="cursor:pointer;" />]';
        //}
        str += '</span>';
    }

    str += '</div>';

    if (node._hc) {

        str += '<div id="d' + this.obj + nodeId + '" class="clip" style="display:' + ((this.root.id == node.pid || node._io) ? 'block' : 'none') + ';">';

        str += this.addNode(node);

        str += '</div>';

    }

    this.aIndent.pop();

    return str;

};



// Adds the empty and line icons

dTree.prototype.indent = function(node, nodeId) {

    var str = '';

    if (this.root.id != node.pid) {

        for (var n=0; n<this.aIndent.length; n++) {

            str += '<img src="' + ( (this.aIndent[n] == 1 && this.config.useLines) ? this.icon.line : this.icon.empty ) + '" alt="" />';
        }

        (node._ls) ? this.aIndent.push(0) : this.aIndent.push(1);

        if (node._hc) {
            //TODO: encuentra un nodo padre
            str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');"><img id="j' + this.obj + nodeId + '" src="';

            if (!this.config.useLines) str += (node._io) ? this.icon.nlMinus : this.icon.nlPlus;

            else str += ( (node._io) ? ((node._ls && this.config.useLines) ? this.icon.minusBottom : this.icon.minus) : ((node._ls && this.config.useLines) ? this.icon.plusBottom : this.icon.plus ) );

            str += '" alt="" /></a>';
        } else {
            //TODO: encuentra una hoja
            str += '<img src="' + ( (this.config.useLines) ? ((node._ls) ? this.icon.joinBottom : this.icon.join ) : this.icon.empty) + '" alt="" />';
        }

    }

    return str;

};



// Checks if a node has any children and if it is the last sibling

dTree.prototype.setCS = function(node) {

    var lastId;

    for (var n=0; n<this.aNodes.length; n++) {

        if (this.aNodes[n].pid == node.id) node._hc = true;

        if (this.aNodes[n].pid == node.pid) lastId = this.aNodes[n].id;

    }

    if (lastId==node.id) node._ls = true;

};



// Returns the selected node

dTree.prototype.getSelected = function() {

    var sn = this.getCookie('cs' + this.obj);

    return (sn) ? sn : null;

};



// Highlights the selected node

dTree.prototype.s = function(id) {

    if (!this.config.useSelection) return;

    var cn = this.aNodes[id];

    if (cn._hc && !this.config.folderLinks) return;

    if (this.selectedNode != id) {

        if (this.selectedNode || this.selectedNode==0) {

            eOld = document.getElementById("s" + this.obj + this.selectedNode);

            eOld.className = "node";

        }

        eNew = document.getElementById("s" + this.obj + id);

        eNew.className = "nodeSel";

        this.selectedNode = id;

        if (this.config.useCookies) this.setCookie('cs' + this.obj, cn.id);

    }

};



// Toggle Open or close

dTree.prototype.o = function(id) {

    var cn = this.aNodes[id];

    this.nodeStatus(!cn._io, id, cn._ls);

    cn._io = !cn._io;

    if (this.config.closeSameLevel) this.closeLevel(cn);

    if (this.config.useCookies) this.updateCookie();

};



// Open or close all nodes

dTree.prototype.oAll = function(status) {

    for (var n=0; n<this.aNodes.length; n++) {

        if (this.aNodes[n]._hc && this.aNodes[n].pid != this.root.id) {

            this.nodeStatus(status, n, this.aNodes[n]._ls)

            this.aNodes[n]._io = status;

        }

    }

    if (this.config.useCookies) this.updateCookie();

};



// Opens the tree to a specific node

dTree.prototype.openTo = function(nId, bSelect, bFirst) {

    if (!bFirst) {

        for (var n=0; n<this.aNodes.length; n++) {

            if (this.aNodes[n].id == nId) {

                nId=n;

                break;

            }

        }

    }

    var cn=this.aNodes[nId];

    if (cn.pid==this.root.id || !cn._p) return;

    cn._io = true;

    cn._is = bSelect;

    if (this.completed && cn._hc) this.nodeStatus(true, cn._ai, cn._ls);

    if (this.completed && bSelect) this.s(cn._ai);

    else if (bSelect) this._sn=cn._ai;

    this.openTo(cn._p._ai, false, true);

};



// Closes all nodes on the same level as certain node

dTree.prototype.closeLevel = function(node) {

    for (var n=0; n<this.aNodes.length; n++) {

        if (this.aNodes[n].pid == node.pid && this.aNodes[n].id != node.id && this.aNodes[n]._hc) {

            this.nodeStatus(false, n, this.aNodes[n]._ls);

            this.aNodes[n]._io = false;

            this.closeAllChildren(this.aNodes[n]);

        }

    }

}



// Closes all children of a node

dTree.prototype.closeAllChildren = function(node) {

    for (var n=0; n<this.aNodes.length; n++) {

        if (this.aNodes[n].pid == node.id && this.aNodes[n]._hc) {

            if (this.aNodes[n]._io) this.nodeStatus(false, n, this.aNodes[n]._ls);

            this.aNodes[n]._io = false;

            this.closeAllChildren(this.aNodes[n]);

        }

    }

}



// Change the status of a node(open or closed)

dTree.prototype.nodeStatus = function(status, id, bottom) {

    eDiv	= document.getElementById('d' + this.obj + id);

    eJoin	= document.getElementById('j' + this.obj + id);

    if (this.config.useIcons) {

        eIcon	= document.getElementById('i' + this.obj + id);

        //para que deje el icono de carpeta cerrada en caso que tenga hijos no action en su interior
        var haveChidren = this.haveNodesChildren(this.aNodes[id].id);
        var iconClose = this.aNodes[id].icon;
        if (haveChidren) iconClose = this.icon.folder;

        //para que deje el icono por parametro en caso que sus hijos sean solo del tipo action
        var iconOpen = this.aNodes[id].iconOpen;
        if (!haveChidren) iconOpen = this.aNodes[id].icon;

        eIcon.src = (status) ? iconOpen : iconClose;

    }

    eJoin.src = (this.config.useLines)?

        ((status)?((bottom)?this.icon.minusBottom:this.icon.minus):((bottom)?this.icon.plusBottom:this.icon.plus)):

        ((status)?this.icon.nlMinus:this.icon.nlPlus);

    eDiv.style.display = (status) ? 'block': 'none';

};





// [Cookie] Clears a cookie

dTree.prototype.clearCookie = function() {

    var now = new Date();

    var yesterday = new Date(now.getTime() - 1000 * 60 * 60 * 24);

    this.setCookie('co'+this.obj, 'cookieValue', yesterday);

    this.setCookie('cs'+this.obj, 'cookieValue', yesterday);

};



// [Cookie] Sets value in a cookie

dTree.prototype.setCookie = function(cookieName, cookieValue, expires, path, domain, secure) {

    document.cookie =

        escape(cookieName) + '=' + escape(cookieValue)

            + (expires ? '; expires=' + expires.toGMTString() : '')

            + (path ? '; path=' + path : '')

            + (domain ? '; domain=' + domain : '')

            + (secure ? '; secure' : '');

};



// [Cookie] Gets a value from a cookie

dTree.prototype.getCookie = function(cookieName) {

    var cookieValue = '';

    var posName = document.cookie.indexOf(escape(cookieName) + '=');

    if (posName != -1) {

        var posValue = posName + (escape(cookieName) + '=').length;

        var endPos = document.cookie.indexOf(';', posValue);

        if (endPos != -1) cookieValue = unescape(document.cookie.substring(posValue, endPos));

        else cookieValue = unescape(document.cookie.substring(posValue));

    }

    return (cookieValue);

};



// [Cookie] Returns ids of open nodes as a string

dTree.prototype.updateCookie = function() {

    var str = '';

    for (var n=0; n<this.aNodes.length; n++) {

        if (this.aNodes[n]._io && this.aNodes[n].pid != this.root.id) {

            if (str) str += '.';

            str += this.aNodes[n].id;

        }

    }

    this.setCookie('co' + this.obj, str);

};



// [Cookie] Checks if a node id is in a cookie

dTree.prototype.isOpen = function(id) {

    var aOpen = this.getCookie('co' + this.obj).split('.');

    for (var n=0; n<aOpen.length; n++)

        if (aOpen[n] == id) return true;

    return false;

};



// If Push and pop is not implemented by the browser

if (!Array.prototype.push) {

    Array.prototype.push = function array_push() {

        for(var i=0;i<arguments.length;i++)

            this[this.length]=arguments[i];

        return this.length;

    }

};

if (!Array.prototype.pop) {

    Array.prototype.pop = function array_pop() {

        lastElement = this[this.length-1];

        this.length = Math.max(this.length-1,0);

        return lastElement;

    }

};