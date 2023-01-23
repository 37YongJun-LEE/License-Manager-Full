/**
 * Copyright (c) 2016, Damonet Inc. All rights reserved.
 */
var ReleaseVer = "20160731003";
var C_PX = "px";
var damoUtil = {
    isIE: navigator.appVersion.indexOf("MSIE") > -1,
    isChrome: /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor),
    isEdge: window.navigator.userAgent.indexOf('Edge/') > 0,
    detectIE: function() {
        var ua = window.navigator.userAgent;
        if (ua.indexOf('MSIE ') > 0 || ua.indexOf('Trident/') > 0 || ua.indexOf('Edge/') > 0) {
            return true;
        }
        return false;
    },
    isMobile: function() {
        if (/Android|webOS|iPhone|iPad|iPod|pocket|psp|kindle|avantgo|blazer|midori|Palm|maemo|plucker|phone|BlackBerry|symbian|IEMobile|mobile|ZuneWP7|Windows Phone|Opera Mini/i.test(navigator.userAgent)) {
            return true;
        };
        return false;
    },
    getNodeWidth: null,
    getElm: function(id) {
        return document.getElementById(id);
    },
    createElement: function(nodetype, parent, classname, eventname, eventhandle, isaddPrevent) {
        var elm = document.createElement(nodetype);
        if (parent) parent.appendChild(elm);
        if (classname) this.addClass(elm, classname);
        if (eventname) this.addEvent(elm, eventname, eventhandle, isaddPrevent);
        return elm;
    },
    removeAllChild: function(node) {
        while (node.firstChild) {
            node.removeChild(node.firstChild);
        }
    },
    addEvent: function(obj, evName, evHandler, isaddPrevent) {
        if (obj.addEventListener) {
            obj.addEventListener(evName, evHandler, false);
            if (isaddPrevent) obj.addEventListener("mousedown", this.preventEvent, false);
        } else {
            obj.attachEvent("on" + evName, evHandler);
            if (isaddPrevent) obj.attachEvent("onmousedown" + evName, this.preventEvent);
        }
    },
    removeEvent: function(obj, evName, evHandler) {
        if (obj.removeEventListener) {
            obj.removeEventListener(evName, evHandler);
        } else if (x.detachEvent) {
            obj.detachEvent("on" + evName, evHandler);
        }
    },
    addEventByClass: function(classname, evName, evHandler, isaddPrevent) {
        var el = document.getElementsByClassName(classname);
        if (el[0]) {
            this.addEvent(el[0], evName, evHandler, isaddPrevent);
        }
    },
    preventEvent: function(ev) {
        var event = ev || window.event;
        if (event.preventDefault && event.stopPropagation) {
            event.preventDefault();
            event.stopPropagation();
        }
        return false;
    },
    hasClass: function(src, classname) {
        return src.className.indexOf(classname) > 0;
    },
    addClass: function(src, classname) {
        if (!this.hasClass(src, classname)) {
            if (src.className !== "") src.className += " ";
            src.className += classname;
        }
    },
    toggleClass: function(src, classname) {
        if (this.hasClass(src, classname))
            this.removeClass(src, classname);
        else this.addClass(src, classname);
    },
    removeClass: function(src, classname) {
        src.className = src.className.replace(classname, "");
    },
    setStyle: function(src, styles) {
        var s = src.style;
        for (var item in styles) s[item] = styles[item];
    },
    setStyleNremoveA: function(src, styles) {
        var s = src.style;
        for (var item in styles) {
            s[item] = styles[item];
            src.removeAttribute(item);
        }
    },
    getStyle: function(src, style) {
        if (document.defaultView && document.defaultView.getComputedStyle) {
            return document.defaultView.getComputedStyle(src, null).getPropertyValue(style);
        } else if (src.currentStyle) {
            return src.currentStyle[style];
        }
        return null;
    },
    getStyleI: function(src, style) {
        return parseInt(this.getStyle(src, style));
    },
    getStyleA: function(src, style) {
        if (src.getAttribute(style)) return src.getAttribute(style);
        if (src.style[style]) return src.style[style];
        return this.getStyle(src, style);
    },
    getStyleAI: function(src, style) {
        var ret = this.getStyleA(src, style);
        if (ret) return parseInt(ret);
        return "";
    },
    setSelection: function(sel, range, startnode, offset) {
        if (!sel) return;
        if (window.getSelection) {
            range.setStart(startnode, offset);
            range.collapse(true);
            sel.removeAllRanges();
            sel.addRange(range);
        } else {
            range.select();
        }
        sel = range = null;
    },
    setSelection2: function(sel, range, node) {
        if (!range) {
            return;
        }
        if (window.getSelection) {
            range.setStartBefore(node);
            range.setEndAfter(node);
            sel.removeAllRanges();
            sel.addRange(range);
        } else {
            range.select();
        }
        sel = range = null;
    },
    setSelectionControl: function(control) {
        if (document.body.createControlRange) {
            var oControlRange = document.body.createControlRange();
            oControlRange.add(control);
            oControlRange.select();
        } else {
            var sel = this.getSelection();
            var range = this.getRange();
            this.setSelection2(sel, range, control);
        }
    },
    setSelectText: function(sel, node, spos, epos) {
        if (!spos && spos !== 0) {
            spos = 0;
            epos = node.data.length;
        }
        var range = document.createRange();
        range.setStart(node, spos);
        range.setEnd(node, epos);
        sel.removeAllRanges();
        sel.addRange(range);
    },
    getSelection: function() {
        return (window.getSelection) ? window.getSelection() : document.selection;
    },
    getRange: function() {
        var sel, range;
        if (window.getSelection) {
            sel = window.getSelection();
            if (sel.getRangeAt && sel.rangeCount) {
                range = sel.getRangeAt(0);
                return range;
            }
        } else if (document.selection && document.selection.type !== "Control") {
            return document.selection.createRange();
        }
    },
    getRangeCreate: function() {
        var range = this.getRange();
        if (!range) {
            range = document.createRange();
        }
        return range;
    },
    getElementFromSibling: function(range) {
        if (!range) return;
        if (range.collapsed) return range.startContainer;
        var src = range.startContainer;
        if (!src) return null;
        while (src && src.nodeType === 3) {
            src = src.nextSibling;
        }
        return src;
    },
    getElementFromHierarchy: function() {
        var src = damoUtil.getRange();
        if (!src) return;
        if (src.collapsed) return src.startContainer;
        if (src.startContainer && src.startContainer.firstChild)
            src = src.startContainer.firstChild;
        else
        if (src.endContainer && src.endContainer.firstChild)
            src = src.endContainer.firstChild;
        else
            src = src.startContainer;
        while (src && src.nodeType === 3) {
            src = src.parentNode;
        }
        return src;
    },
    onlyNumber: function(ev) {
        var event = ev || window.event;
        var key = window.event ? event.keyCode : event.which;
        if ((event.shiftKey === false) && ((key > 47 && key < 58) || (key > 95 && key < 106) || key === 35 || key === 36 || key === 37 || key === 39 || key === 8 || key === 46 || key === 13)) {
            return true;
        } else {
            event.preventDefault();
        }
    },
    parseInt: function(value) {
        if (!value) return 0;
        return parseInt(value);
    },
    loadScript: function(filename, callback) {
        var js = document.createElement("script");
        js.type = "text/javascript";
        if (callback) {
            if (js.readyState) {
                js.onreadystatechange = function() {
                    if (js.readyState == "loaded" || js.readyState == "complete") {
                        js.onreadystatechange = null;
                        callback();
                    }
                };
            } else {
                js.onload = function() {
                    callback();
                };
            }
        }
        js.src = damoScriptPath + filename;
        if (document.head)
            document.head.appendChild(js);
        else document.getElementsByTagName("head")[0].appendChild(js);
        return js;
    },
    toArray: function(C) {
        var B = C.length,
            A = new Array(B);
        while (B--) {
            A[B] = C[B];
        }
        return A;
    },
    getBlankChar: function() {
        var blankChar = "<BR/>";
        if (damoUtil.isIE) blankChar = "&nbsp;";
        return blankChar;
    },
    getElementPosition: function(node) {
        var itop = 0;
        var ileft = 0;
        var style = "";
        while (node) {
            style = damoUtil.getStyle(node, "position");
            if (style !== "static") break;
            itop += node.offsetTop;
            ileft += node.offsetLeft;
            node = node.offsetParent;
        }
        return {
            top: itop,
            left: ileft
        };
    },
    getElementPosition2: function(node) {
        var itop = 0;
        var ileft = 0;
        while (node) {
            itop += node.offsetTop;
            ileft += node.offsetLeft;
            node = node.offsetParent;
        }
        return {
            top: itop,
            left: ileft
        };
    },
    protectFromXSS: function(editor, xssOption) {
        var tags = xssOption.removeTag.split(",");
        for (var i = 0; i < tags.length; i++) {
            var tagList = editor.getElementsByTagName(tags[i]);
            for (var j = 0; j < tagList.length; j++) {
                tagList[j].parentNode.removeChild(tagList[j]);
            }
        }
        var eles = editor.getElementsByTagName("IMG");
        for (var i = 0; i < eles.length; i++) {
            eles[i].removeAttribute("onerror");
        }
        var html = editor.innerHTML;
        if (xssOption.removeEvent === "all") {
            html = html.replace(/<[^>]+/g, function(match) {
                return match.replace(/ on\w+[= ]*["\'][^"]*["\']/g, '');
            });
        } else
        if (xssOption.removeEvent !== "") {
            var evlist = xssOption.removeEvent.split(",");
            for (var i = 0; i < evlist.length; i++) {
                html = html.replace(/<[^>]+/g, function(match) {
                    return match.replace(eval('/' + evlist[i] + '[= ]*["\'][^"]*["\']/gi'), '');
                });
            }
        }
        editor.innerHTML = html;
    },
    removeLayoutCSS: function(text) {
        return text.replace(new RegExp("damoLayoutDot", 'g'), "");
    },
    inputCheck: function(ctrl, msg) {
        if (ctrl.value === "") {
            alert(msg);
            ctrl.focus();
            return false;
        }
        return true;
    }
};
var rangeUtil = {
    getAllTagList: function(range, tag) {
        if (!range) return [];
        if (range.collapsed) {
            var a = this.findTag(range.startContainer, tag);
            return (a) ? [a] : [];
        }
        var nodeList = this.getAllNodeList(range);
        var tagList = [];
        for (var i = 0; i < nodeList.length; i++) {
            var node = nodeList[i];
            if (node.nodeName.match(tag)) {
                tagList.push(node);
            } else {
                var nodeP = this.findTag(node, tag);
                if (nodeP) tagList.push(nodeP);
            }
        }
        return tagList;
    },
    findTag: function(startNode, tag) {
        if (!startNode) return null;
        var node = startNode;
        while (node) {
            if (node.className === "editor") return null;
            if (node.nodeName.match(tag)) return node;
            node = node.nextSibling;
        }
        node = startNode;
        if (node.firstChild) node = node.firstChild;
        do {
            if (node.className === "editor") return null;
            if (node && node.nodeName && node.nodeName.match(tag)) return node;
            node = node.parentNode;
        } while (node);
        return null;
    },
    findTags: function(startNode, tag) {
        var node = startNode;
        var nodeList = [];
        while (node) {
            if (node.className === "editor") return null;
            if (node.nodeName.match(tag)) nodeList.push(node);
            node = node.nextSibling;
        }
        if (nodeList.length > 0) return nodeList;
        node = startNode;
        if (node.firstChild) node = node.firstChild;
        do {
            if (node.className === "editor") return null;
            if (node && node.nodeName && node.nodeName.match(tag)) {
                return this.findTags(node, tag);
            }
            node = node.parentNode;
        } while (node);
        return null;
    },
    findTagInPath: function(node, tag) {
        if (!node) return null;
        if (node.firstChild) node = node.firstChild;
        do {
            if (node.className === "editor") return null;
            if (node && node.nodeName && node.nodeName.match(tag)) return node;
            node = node.parentNode;
        } while (node);
        return null;
    },
    findTagInPathByClass: function(node, classname) {
        do {
            if (node.className === classname) return node;
            node = node.parentNode;
        } while (node);
        return null;
    },
    findElementByTag: function(tag) {
        var src = damoUtil.getRange();
        return this.findTag(src.startContainer, tag);
    },
    getSpanList: function(range) {
        if (!range) return [];
        if (range.collapsed) {
            var span = document.createElement("SPAN");
            span.appendChild(range.extractContents());
            range.deleteContents();
            range.insertNode(span);
            return [span];
        }
        var nodeList = this.getAllNodeList(range);
        var spanList = [];
        for (var i = 0; i < nodeList.length; i++) {
            var node = nodeList[i];
            if (!node || node.nodeType !== 3 || node.data === null) {
                continue;
            }
            var parentNode = node.parentNode;
            if (parentNode.tagName === "SPAN" & parentNode.innerHTML === node.data) {
                spanList.push(parentNode);
                continue;
            }
            var span = document.createElement("SPAN");
            parentNode.insertBefore(span, node);
            span.appendChild(node);
            spanList.push(span);
        }
        var sel = damoUtil.getSelection();
        sel.removeAllRanges();
        if (spanList.length > 0) {
            range.setStartBefore(spanList[0]);
            range.setEndAfter(spanList[spanList.length - 1]);
            sel.addRange(range);
        }
        return spanList;
    },
    getAllNodeList: function(range) {
        var start = this.startContainer(range);
        this.endNode = this.endContainer(range);
        if (!start || !this.endNode) return [];
        this.nodeList = [];
        this.extractNodes(start);
        return this.nodeList;
    },
    extractNodes: function(node) {
        if (this.extractChildNodes(node)) return;
        while (!node.nextSibling) {
            if (!(node = node.parentNode)) {
                return;
            }
            this.nodeList.push(node);
            if (node === this.endNode) {
                return;
            }
        }
        return this.extractNodes(node.nextSibling);
    },
    extractChildNodes: function(node) {
        if (!node) return false;
        this.nodeList.push(node);
        var cNode = node.firstChild;
        while (cNode) {
            if (this.extractChildNodes(cNode)) return true;
            cNode = cNode.nextSibling;
        }
        if (node === this.endNode) return true;
        return false;
    },
    searchNext: function(node) {
        if (!node || node.tagName === "BODY") {
            return document.body;
        }
        if (node.nextSibling) {
            return node.nextSibling;
        }
        return this.searchNext(node.parentNode);
    },
    searchPrevious: function(node) {
        if (!node || node.tagName === "BODY") {
            return document.body;
        }
        if (node.previousSibling) {
            return node.previousSibling;
        }
        return this.searchPrevious(node.parentNode);
    },
    startContainer: function(range) {
        if (!range) return null;
        if (range.startContainer.nodeType === 3) {
            if (range.startOffset < range.startContainer.nodeValue.length) {
                var a = range.startContainer.splitText(range.startOffset);
                if (range.startContainer === range.endContainer) {
                    range.endOffset -= range.startOffset;
                    range.endContainer = a;
                }
            }
            if (range.startOffset >= range.startContainer.nodeValue.length) {
                return this.searchNext(range.startContainer);
            }
            return range.startContainer;
        } else {
            if (range.startOffset >= range.startContainer.childNodes.length) {
                return this.searchNext(range.startContainer);
            }
            return this.childNodes2Array(range.startContainer)[range.startOffset];
        }
    },
    endContainer: function(range) {
        if (range.endContainer.nodeType === 3) {
            if (range.endOffset < range.endContainer.nodeValue.length) range.endContainer.splitText(range.endOffset);
            if (range.endOffset === 0) {
                return this.searchPrevious(range.endContainer);
            }
            return range.endContainer;
        } else {
            if (range.endOffset === 0) {
                return this.searchPrevious(range.endContainer);
            }
            return this.childNodes2Array(range.endContainer)[range.endOffset - 1];
        }
    },
    childNodes2Array: function(elNode) {
        if (!elNode) return [];
        var list = [];
        elNode = elNode.firstChild;
        while (elNode) {
            list.push(elNode);
            elNode = elNode.nextSibling;
        }
        return list;
    },
    execCommand: function(command, value, selectList) {
        var range = damoUtil.getRange();
        if ((!range || range.collapsed) && selectList.length > 0) {
            var sel = damoUtil.getSelection();
            range = damoUtil.getRangeCreate();
            for (var i = 0; i < selectList.length; i++) {
                damoUtil.setSelection2(sel, range, selectList[i]);
                document.execCommand(command, false, value);
            }
            range.collapse(false);
            sel.removeAllRanges();
        } else {
            if ((!range || range.collapsed) && (command === "subscript" || command === "superscript")) {
                return false;
            }
            document.execCommand(command, false, value);
            if (!damoUtil.isChrome) {
                return true;
            }
            var sel = damoUtil.getSelection();
            var range = damoUtil.getRange();
            var node = range.startContainer;
            if (range.startContainer.firstChild) node = range.startContainer.firstChild;
            damoUtil.setSelection2(sel, range, node);
        }
        return true;
    }
};
Function.prototype.closure = function() {
    var src = this,
        newthis = arguments[0],
        param = arguments[1];
    if (param) param = [param];
    return function() {
        return src.apply(newthis, (param) ? param : [newthis]);
    };
};
Function.prototype.closureListener = function() {
    var A = this,
        C = damoUtil.toArray(arguments),
        B = C.shift();
    return function(E) {
        E = E || window.event;
        if (E.target) {
            var D = E.target;
        } else {
            var D = E.srcElement;
        }
        return A.apply(B, [E, D].concat(C));
    };
};

function damoFileUpload(files, action, callback) {
    var form = document.createElement("form");
    form.action = action;
    form.method = "post";
    form.enctype = "multipart/form-data";
    form.style.display = "none";
    form.target = "damoiframe";
    document.body.appendChild(form);
    form.appendChild(files);
    var iframe = document.createElement("iframe");
    iframe.src = "javascript:false;";
    iframe.name = "damoiframe";
    iframe.style.display = "none";
    document.body.appendChild(iframe);
    iframe.onload = function() {
        var doc = this.contentWindow ? this.contentWindow.document : (this.contentDocument ? this.contentDocument : this.document);
        var root = doc.documentElement ? doc.documentElement : doc.body;
        var result = root.textContent ? root.textContent : root.innerText;
        callback(result);
        document.body.removeChild(form);
        document.body.removeChild(iframe);
    };
    form.submit();
}

function damoFileUploadByAjax(file, action, callback, progress) {
    var formData = new FormData();
    formData.append("damoImgFile", file.files[0]);
    var fileName = file.files[0].name;
    var fileSplit = fileName.split(".");

    if(fileSplit[1] == "jpg" || fileSplit[1] == "jpeg" || fileSplit[1] == "gif" || fileSplit[1] == "png" || fileSplit[1] == "bmp") {
        formData.append("damoImgFile", file.files[0]);
        var xhr = new XMLHttpRequest();
        xhr.open("POST", action, true);
        xhr.setRequestHeader("Cache-Control", "no-cache");
        if (progress) {
            xhr.upload.onprogress = function(e) {
                damoUtil.setStyle(progress, {
                    width: (e.loaded / e.total * 100) + '%'
                });
            };
        }
        xhr.onload = function(result) {
            var str = xhr.responseText;
            callback(str.replace(/[\r\n]/g, ''));
        };

        xhr.send(formData);
    }
    else {
    	alert("PNG, GIF, JPG(JPEG)의 확장자만 가능합니다.");
    	$(".damoCancelBtn").click();
    }
};

function damoAjax(option) {
    var httpRequest = null;
    if (window.XMLHttpRequest) {
        httpRequest = new XMLHttpRequest();
    } else
    if (window.ActiveXObject) {
        try {
            httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }
    if (!httpRequest) {
        alert('Cannot create an XMLHTTP instance');
        return false;
    }
    httpRequest.onreadystatechange = function() {
        if (httpRequest.readyState !== 4) {
            return;
        }
        if (httpRequest.status === 200) {
            if (option.done) option.done(httpRequest.responseText);
        } else {
            alert('There was a problem with the request.');
        }
    };
    httpRequest.open('POST', option.url);
    httpRequest.send(option.data);
}
var damoScriptPath = document.querySelector('script[src$="damoEditor.js"]').getAttribute('src');
damoScriptPath = damoScriptPath.replace("damoEditor.js", "");
damoUtil.loadScript("damoTableEditor.js");
damoUtil.loadScript("damoUndo.js");
damoUtil.loadScript("ext/colorpicker.min.js");
var editorConfig = {
    buttons: {},
    iconsize: 24,
    filesize: 20 * 1000 * 1000
};
editorConfig.buttons.newdoc = {
    icon: 1,
    command: null,
    title: "새문서",
    clickEvent: damoNewClick,
    shortcut: "N"
};
editorConfig.buttons.save = {
    icon: 2,
    command: null,
    title: "저장",
    clickEvent: damoSaveClick
};
editorConfig.buttons.print = {
    icon: 3,
    command: null,
    title: "출력",
    clickEvent: damoPrintClick,
    shortcut: "P"
};
editorConfig.buttons.undo = {
    icon: 4,
    command: "undo",
    title: "되돌리기"
};
editorConfig.buttons.redo = {
    icon: 5,
    command: "redo",
    title: "다시실행"
};
editorConfig.buttons.copy = {
    icon: 6,
    command: "copy",
    title: "복사하기"
};
editorConfig.buttons.cut = {
    icon: 7,
    command: "cut",
    title: "잘라내기"
};
editorConfig.buttons.paste = {
    icon: 8,
    command: "paste",
    title: "붙여넣기",
    clickEvent: damoPasteClick
};
editorConfig.buttons.hr = {
    icon: 13,
    command: "insertHorizontalRule",
    title: "수평선"
};
editorConfig.buttons.bold = {
    icon: 14,
    command: "Bold",
    title: "굵게",
    tags: "^B$|STRONG",
    css: {
        "font-weight": "bold"
    },
    shortcut: "B"
};
editorConfig.buttons.italic = {
    icon: 16,
    command: "Italic",
    title: "기울임꼴",
    tags: "EM|^I$",
    css: {
        "font-style": "italic"
    },
    shortcut: "I"
};
editorConfig.buttons.underline = {
    icon: 15,
    command: "Underline",
    title: "하단선",
    tags: "^U$",
    css: {
        "text-decoration": "underline"
    },
    shortcut: "U"
};
editorConfig.buttons.strikethrough = {
    icon: 17,
    command: "strikeThrough",
    title: "중앙선",
    tags: "STRIKE",
    css: {
        "text-decoration": "line-through"
    }
};
editorConfig.buttons.subscript = {
    icon: 21,
    command: "subscript",
    title: "아래첨자",
    tags: "SUB"
};
editorConfig.buttons.superscript = {
    icon: 20,
    command: "superscript",
    title: "윗첨자",
    tags: "SUP"
};
editorConfig.buttons.left = {
    icon: 22,
    command: "justifyleft",
    title: "왼쪽 맞춤",
    group: "a",
    clickClass: damoAlignButtonEvent
};
editorConfig.buttons.center = {
    icon: 23,
    command: "justifycenter",
    title: "가운데 맞춤",
    group: "a",
    clickClass: damoAlignButtonEvent
};
editorConfig.buttons.right = {
    icon: 24,
    command: "justifyright",
    title: "오른쪽 맞춤",
    group: "a",
    clickClass: damoAlignButtonEvent
};
editorConfig.buttons.justify = {
    icon: 25,
    command: "justifyfull",
    title: "양쪽 맞춤",
    group: "a",
    clickClass: damoAlignButtonEvent
};
editorConfig.buttons.ol = {
    icon: 26,
    command: "insertorderedlist",
    title: "번호 매기기",
    tags: "OL",
    group: "b",
    clickClass: damoOrderButtonEvent
};
editorConfig.buttons.ul = {
    icon: 27,
    command: "insertunorderedlist",
    title: "글머리 기호",
    tags: "UL",
    group: "b",
    clickClass: damoOrderButtonEvent
};
editorConfig.buttons.outdent = {
    icon: 28,
    command: "outdent",
    title: "내어쓰기",
    clickEvent: damoOutdentClick
};
editorConfig.buttons.indent = {
    icon: 29,
    command: "indent",
    title: "들여쓰기",
    clickEvent: damoIndentClick,
    shortcut: "T"
};
editorConfig.buttons.removeformat = {
    icon: 30,
    command: "removeformat",
    title: "형식제거"
};
editorConfig.buttons.image = {
    icon: 9,
    command: "image",
    title: "이미지",
    dialogHandler: damoDialogImage
};
editorConfig.buttons.link = {
    icon: 10,
    command: "link",
    title: "링크",
    dialogHandler: damoDialogLink,
    shortcut: "L"
};
editorConfig.buttons.table = {
    icon: 11,
    command: "table",
    title: "테이블",
    clickClass: damoButtonTable
};
editorConfig.buttons.specialChar = {
    icon: 12,
    command: "sChar",
    title: "특수기호",
    dialogHandler: damoDialogChar
};
editorConfig.buttons.emoticon = {
    icon: 46,
    command: "emoticon",
    title: "이모티콘",
    dialogHandler: damoDialogEmoticon
};
editorConfig.buttons.find = {
    icon: 44,
    command: "find",
    title: "찾기&바꾸기",
    dialogHandler: damoDialogFind,
    shortcut: "F"
};
editorConfig.buttons.layout = {
    icon: 45,
    command: "layout",
    title: "레이아웃",
    dialogHandler: damoDialogLayout
};
editorConfig.buttons.forecolor = {
    icon: 18,
    command: "forecolor",
    title: "글자색",
    selectHandler: damoSelectBoxColor
};
editorConfig.buttons.backcolor = {
    icon: 19,
    command: "background-color",
    title: "글자배경색",
    selectHandler: damoSelectBoxColor
};
editorConfig.buttons.fontfamily = {
    command: "fontname",
    title: "글꼴",
    selectHandler: damoSelectBoxFontname
};
editorConfig.buttons.fontsize = {
    command: "fontsize",
    title: "글자크기",
    selectHandler: damoSelectBoxFontsize
};
editorConfig.buttons.fontformat = {
    command: "formatBlock",
    title: "글자서식",
    selectHandler: damoSelectBoxFontformat
};
editorConfig.buttons.lineheight = {
    icon: 52,
    command: "lineheight",
    title: "줄간격",
    selectHandler: damoSelectButtonLineheight
};
editorConfig.buttons.bgcolor4td = {
    icon: 51,
    command: "bgcolor4td",
    title: "셀배경색",
    selectHandler: damoSelectBoxColor4td
};
editorConfig.buttons.documentBG = {
    icon: 53,
    command: null,
    title: "문서배경",
    dialogHandler: damoDialogDocument
};
editorConfig.buttons.externalMedia = {
    icon: 50,
    command: null,
    title: "외부동영상",
    dialogHandler: damoDialogExternalMedia
};
editorConfig.buttons.mediaFile = {
    icon: 55,
    command: null,
    title: "동영상파일",
    dialogHandler: damoDialogMedia
};
editorConfig.buttons.media = {
    icon: 50,
    command: null,
    title: "동영상",
    selectHandler: damoSelectBoxMedia
};
editorConfig.buttons.align = {
    icon: 22,
    command: null,
    title: "정렬",
    selectHandler: damoSelectBoxAlign
};
var DAMO_GAP = "gap";
var DAMO_BLANK = "blank";
var DAMO_BLANKSMALL = "blankSmall";
editorConfig.defaultButtons1 = ["newdoc", "save", "print", "undo", "redo", "copy", "cut", "paste", "find", "layout", "image", "link", "table", "specialChar", "emoticon", "hr", "left", "center", "right", "justify", "ol", "ul", "indent", "outdent", "<br>", "fontsize", "fontfamily", "fontformat", "lineheight", "bold", "italic", "underline", "strikethrough", "subscript", "superscript", "removeformat", "forecolor", "backcolor"];
editorConfig.defaultButtons = [
    ["fontfamily", "fontsize", "fontformat", DAMO_GAP, "undo", "copy", "paste", DAMO_GAP, "ul", "ol", "subscript", "superscript", "indent", DAMO_BLANKSMALL, "outdent", DAMO_BLANKSMALL, DAMO_GAP, "link", "table", "image", "media", DAMO_GAP, "save", "print"],
    [{
        group: ["bold", "italic", "underline", "strikethrough"]
    }, {
        group: ["removeformat", "forecolor", "backcolor"]
    }, DAMO_GAP, "redo", "cut", "find", DAMO_GAP, "left", "center", "right", "justify", "lineheight", "bgcolor4td", DAMO_GAP, "specialChar", "hr", "emoticon", "documentBG", DAMO_BLANKSMALL, DAMO_GAP, "newdoc", "layout"]
];
editorConfig.mobileButtons = [
    ["fontfamily", "fontsize", "bold", "italic", "underline", "strikethrough", "removeformat", "forecolor", "backcolor", "align", "lineheight", "image", "emoticon"]
];
editorConfig.xss = {
    used: true,
    removeTag: "script,iframe,object,applet,embed,form",
    removeEvent: "all"
};
var dContextMenu = null,
    damoTableEditor = null;
var damoEditors = {
    activeEditor: null,
    editors: [],
    addEditor: function(A, B) {
        this.editors.push({
            editor: A,
            damo: B
        });
    },
    findEditor: function(C) {
        var editors = this.editors;
        for (var i = 0; i < editors.length; i++) {
            if (editors[i].editor === C) {
                return editors[i].damo;
            }
        }
    },
    findDamoEditorInPath: function(C) {
        var editor = rangeUtil.findTagInPathByClass(C, "editor");
        if (!editor || editor.contentEditable === "inherit") {
            return null;
        }
        return damoEditors.findEditor(editor);
    }
};
var DAMO_Language = [];

function DamoEditor(editor, options) {
    this.contentEditor = damoUtil.getElm(editor);
    this.contentEditor.style.display = "none";
    this.options = options || {};
    this.options.language = this.options.language || "ko";
    this.options.xss = this.options.xss || editorConfig.xss;
    if (this.options.xss.used === undefined) {
        this.options.xss.used = editorConfig.xss.used;
    }
    if (this.options.xss.removeTag === undefined) {
        this.options.xss.removeTag = editorConfig.xss.removeTag
    };
    if (this.options.xss.removeEvent === undefined) {
        this.options.xss.removeEvent = editorConfig.xss.removeEvent
    };
    if (this.options.filesize === undefined) {
        this.options.filesize = editorConfig.filesize
    };
    if (this.options.useMobile === undefined) {
        this.options.useMobile = true
    };
    if (this.options.plugins) {
        if (this.options.plugins) {
            this.imageEditor = this.options.plugins.imageEditor;
        }
    }
    this.range = null;
    this.damoEditor = damoUtil.createElement("div", null, "damoEditor");
    this.contentEditor.parentNode.insertBefore(this.damoEditor, this.contentEditor);
    this.toolbar = damoUtil.createElement("div", this.damoEditor, "toolbar", "mousedown", damoUtil.preventEvent);
    this.editor = damoUtil.createElement("div", this.damoEditor, "editor");
    if (this.contentEditor.innerHTML === "")
        this.clearDocument();
    else this.setHtmlContent(this.contentEditor.innerText);
    this.editor.contentEditable = true;
    damoUtil.setStyle(this.damoEditor, {
        width: this.contentEditor.style.width || "750px"
    });
    damoUtil.setStyle(this.editor, {
        height: this.contentEditor.style.height || "350px"
    });
    damoEditors.addEditor(this.editor, this);
    damoUtil.loadScript('lang/' + this.options.language + ".js", this.init.closure(this));
}
DamoEditor.prototype.init = function() {
    this.DamoMessage = DAMO_Language[this.options.language];
    var a = this.editor.getBoundingClientRect();
    this.position = {
        left: a.left,
        top: a.top
    };
    var buttons = null,
        btn = null;
    if (this.options.buttons)
        buttons = this.options.buttons;
    else buttons = editorConfig.defaultButtons;
    var specialReg = new RegExp(DAMO_GAP + '|' + DAMO_BLANK + '|' + DAMO_BLANKSMALL);
    this.extendButton = [];
    this.tagButtonList = [];
    this.buttonList = [];
    this.shortcutList = {};
    var undoBtn = null,
        redoBtn = null;
    this.makeButon = function(btnType, isGroup) {
        editorConfig.buttons[btnType].title = this.DamoMessage.buttons[btnType];
        if (editorConfig.buttons[btnType].selectHandler) {
            btn = new editorConfig.buttons[btnType].selectHandler().init(this, editorConfig.buttons[btnType]);
            if (isGroup) btn.changeToGroup();
        } else btn = new DamoButton(this, editorConfig.buttons[btnType], isGroup);
        this.buttonList.push(btn);
        if (editorConfig.buttons[btnType].tags) this.tagButtonList.push(btn);
        else
        if (btnType === "undo") undoBtn = btn;
        else
        if (btnType === "redo") redoBtn = btn;
        else
        if (editorConfig.buttons[btnType].shortcut) {
            this.shortcutList[editorConfig.buttons[btnType].shortcut.charCodeAt()] = btn.button;
        }
    };
    var toolbar = this.toolbar;
    this.makeButons = function(buttonList, inx) {
        var subbar = damoUtil.createElement("div", toolbar, "subbar");
        subbar.id = inx;
        this.toolbar = subbar;
        for (var button in buttonList) {
            var btnType = buttonList[button];
            if (btnType === "<br>") {
                damoUtil.createElement("br", this.toolbar);
                continue;
            }
            if (specialReg.test(btnType)) {
                var elm = damoUtil.createElement("div", this.toolbar, btnType);
                continue;
            }
            if (typeof btnType !== "string") {
                var grpBtn = btnType.group;
                var elm = damoUtil.createElement("div", this.toolbar);
                damoUtil.setStyle(elm, {
                    display: "inline-block",
                    width: "2px"
                });
                for (var btn in grpBtn) {
                    this.makeButon(grpBtn[btn], true);
                }
                elm = damoUtil.createElement("div", this.toolbar);
                damoUtil.setStyle(elm, {
                    display: "inline-block",
                    width: "2px"
                });
            } else {
                this.makeButon(btnType);
            }
        }
    };
    for (var btns in buttons) {
        this.makeButons(buttons[btns], btns);
    }
    this.toolbar = toolbar;
    this.morePn = damoUtil.createElement("div", this.toolbar, "morePn");
    var moreBtn = damoUtil.createElement("div", this.morePn, "moreBtn");
    this.overflowBar = damoUtil.createElement("div", this.morePn, "overflowBar");
    damoUtil.setStyle(this.overflowBar, {
        visibility: "hidden"
    });
    damoUtil.addEvent(moreBtn, "click", this.damoResizeMorebtnClick.closureListener(this));
    if (damoUtil.detectIE()) {
        damoUtil.getNodeWidth = function(node) {
            return damoUtil.getStyleI(node, "width") + damoUtil.getStyleI(node, "border-left-width") * 2 + damoUtil.getStyleI(node, "padding-left") * 2 +
                damoUtil.getStyleI(node, "margin-left") + damoUtil.getStyleI(node, "margin-right");
        }
    } else {
        damoUtil.getNodeWidth = function(node) {
            var w = damoUtil.getStyleI(node, "width") +
                damoUtil.getStyleI(node, "margin-left") + damoUtil.getStyleI(node, "margin-right");
            if (node.nodeName !== "BUTTON") w += damoUtil.getStyleI(node, "border-left-width") * 2;
            return w;
        }
    }
    this.undoManager = new UndoManager(undoBtn, redoBtn, this);
    damoUtil.addEvent(this.editor, "mouseup", this.editorMousedown.closureListener(this));
    damoUtil.addEvent(this.editor, "keydown", this.editorKeydown.closureListener(this));
    damoUtil.addEvent(this.editor, "keyup", this.editorKeyup.closureListener(this));
    damoUtil.addEvent(this.editor, "blur", this.editorBlur.closure(this));
    damoUtil.addEvent(this.editor, "focus", this.editorFocus.closure(this));
    damoUtil.addEvent(this.editor, "paste", this.damoPasteEvent.closureListener(this));
    damoUtil.addEvent(this.editor, "dragend", this.damoDropEvent.closureListener(this));
    damoUtil.addEvent(window, "resize", this.damoResize.closureListener(this));
    if (this.options.useEditMode === undefined || this.options.useEditMode === true) this.setEditorMode();
    if (!damoTableEditor) {
        damoTableEditor = new TableEditor();
    }
    if (!dContextMenu) {
        dContextMenu = new DamoContextMenu();
        dContextMenu.init(damoTableEditor);
    }
    if (this.options.colors) {
        this.setToolbarBgColor(this.toolbar, this.damoEditor);
        this.setToolbarBgColor(this.overflowBar, this.overflowBar);
    }
    this.damoResize();
    return this;
};
DamoEditor.prototype.setToolbarBgColor = function(toolbar, toolbarBorder) {
    damoUtil.setStyle(toolbarBorder, {
        "border-color": this.options.colors.editorBorder
    });
    damoUtil.setStyle(toolbar, {
        "border-bottom-color": this.options.colors.editorBorder
    });
    damoUtil.setStyle(toolbar, {
        "background": this.options.colors.toolbarStart
    });
    damoUtil.setStyle(toolbar, {
        "background": "linear-gradient(to bottom, " + this.options.colors.toolbarStart + " 0%, " + this.options.colors.toolbarEnd + " 100%"
    });
    damoUtil.setStyle(toolbar, {
        "background": "-moz-linear-gradient(top, " + this.options.colors.toolbarStart + " 0%, " + this.options.colors.toolbarEnd + " 100%"
    });
    damoUtil.setStyle(toolbar, {
        "background": "-webkit-linear-gradient(top, " + this.options.colors.toolbarStart + " 0%, " + this.options.colors.toolbarEnd + " 100%"
    });
    damoUtil.setStyle(toolbar, {
        "filter": "progid:DXImageTransform.Microsoft.gradient( startColorstr='" + this.options.colors.toolbarStart + "', endColorstr='" + this.options.colors.toolbarEnd + "',GradientType=0 )"
    });
}
DamoEditor.prototype.damoResizeMorebtnClick = function(event) {
    this.closePanels(this.overflowBar);
    if (damoUtil.getStyle(this.overflowBar, "visibility") === "hidden") {
        damoUtil.setStyle(this.overflowBar, {
            "visibility": "visible"
        });
    } else {
        damoUtil.setStyle(this.overflowBar, {
            "visibility": "hidden"
        });
    }
}
DamoEditor.prototype.damoResize = function(event) {
    var windowWidth = damoUtil.getStyleI(this.toolbar, "width");
    var subbars = this.toolbar.getElementsByClassName("subbar");
    while (this.overflowBar.firstChild) {
        var child = this.overflowBar.firstChild;
        var toolGroup = child.getAttribute("toolGroup");
        if (toolGroup) {
            subbars[toolGroup].appendChild(child);
        } else {
            this.toolbar.appendChild(child);
        }
    }
    for (var i = 0; i < subbars.length; i++) {
        doOverflow(subbars[i], windowWidth, -20, this.overflowBar);
    }
    damoUtil.setStyle(this.morePn, {
        "display": this.overflowBar.firstChild ? "inline-block" : "none"
    });

    function doOverflow(subbar, windowWidth, margin, overflowBar) {
        var btnsW = 0;
        var beforeNode = overflowBar.firstChild;
        var node = subbar.firstChild;
        var w = 0;
        while (node && node !== null) {
            if (node.className !== "damoSelectBoxPanel") {
                w = damoUtil.getNodeWidth(node);
                btnsW += w;
            }
            node = node.nextSibling;
        }
        if (btnsW <= windowWidth - 5) {
            return;
        }
        var maxW = btnsW;
        while (btnsW > (windowWidth + margin)) {
            node = subbar.lastChild;
            node.setAttribute("toolGroup", subbar.id);
            if (node.className !== "damoSelectBoxPanel") {
                w = damoUtil.getNodeWidth(node);
                btnsW -= w;
            }
            overflowBar.insertBefore(node, beforeNode);
            beforeNode = node;
        }
        maxW -= btnsW;
        damoUtil.setStyle(overflowBar, {
            "min-width": maxW + C_PX,
            "left": (-maxW) + C_PX
        });
    }
};
DamoEditor.prototype.damoDropEvent = function(event) {
    setTimeout(this.undoManager.record.closure(this.undoManager), 10);
};
DamoEditor.prototype.setEditorMode = function() {
    this.modeTabs = new DamoEditorMode(this);
};
DamoEditor.prototype.getClipboardData = function(event) {
    var cbData = null;
    if (window.clipboardData) {
        cbData = window.clipboardData;
    } else {
        cbData = event.clipboardData;
    }
    return cbData;
};
DamoEditor.prototype.damoPasteEvent = function(event) {
    var cbData = this.getClipboardData(event);
    var editor = this;
    if (!cbData.types) {
        return true;
    }
    var isTable = new RegExp(/<(TABLE)[^>]*>/, "i");
    var types = cbData.types;
    var html = cbData.getData('text/html');
    if ((types.contains && types.contains("text/html")) || (types.indexOf && types.indexOf("text/html") > -1)) {
        if (isTable.test(html)) {
            var tmpDiv = document.createElement("DIV");
            tmpDiv.innerHTML = html;
            var range = damoUtil.getRange();
            if (!range.isCollapsed) {
                range.deleteContents();
            }
            for (var i = tmpDiv.childNodes.length - 1; i > -1; i--) {
                var node = tmpDiv.childNodes[i];
                if (node.nodeName === "META" || node.nodeName === "LINK" || node.nodeName === "STYLE" || node.nodeName === "#comment") {
                    continue;
                }
                if (node.nodeName === "TABLE" && !damoUtil.isIE) {
                    node.border = 1;
                }
                if (node.nodeName === "P") {
                }
                range.insertNode(node);
            }
        } else {
            var tmpDiv = document.createElement("DIV");
            tmpDiv.innerHTML = html;
            var range = damoUtil.getRange();
            if (!range.isCollapsed) {
                range.deleteContents();
            }
            for (var i = tmpDiv.childNodes.length - 1; i > -1; i--) {
                var node = tmpDiv.childNodes[i];
                if (node.nodeName === "META" || node.nodeName === "LINK" || node.nodeName === "STYLE" || node.nodeName === "#comment") {
                    continue;
                }
                if (node.nodeName === "P") {
                    if (node.style.fontFamily === "") node.style.fontFamily = "맑은 고딕";
                }
                range.insertNode(node);
            }
        }
        event.preventDefault();
        return false;
    }
    if ((types.contains && types.contains("Files")) || (types.indexOf && types.indexOf("Files") > -1)) {
        var itemList = cbData.items;
        if (itemList.length > 0) {
            for (var i = 0; i < itemList.length; i++) {
                if (itemList[i].type.indexOf('image') !== -1) {
                    this.sendFile(editor, null, itemList[i].getAsFile());
                }
            }
        }
        event.preventDefault();
        return false;
    }
    return true;
};
DamoEditor.prototype.sendFile = function(editor, targetImg, file) {
    if (file === null) return;
    var formData = new FormData();
    formData.append("damoImgFile", file, "damoImgFile");
    damoAjax({
        url: editor.options.uploadURL,
        data: formData,
        done: uploadPaste
    });

    function uploadPaste(result) {
        var damoRange = damoUtil.getRange();
        var a = damoRange.startContainer;
        var offset = damoRange.startOffset;
        var elm = damoUtil.createElement("IMG");
        elm.setAttribute("src", result);
        damoRange.deleteContents();
        damoRange.insertNode(elm);
        damoUtil.setSelection(damoUtil.getSelection(), damoRange, a, offset);
        damoRange = null;
    }
};
DamoEditor.prototype.editorBlur = function() {
    this.closePanels();
};
DamoEditor.prototype.editorFocus = function() {
    damoEditors.activeEditor = this;
};
DamoEditor.prototype.saveRange = function() {
    this.range = damoUtil.getRange();
};
DamoEditor.prototype.restoreRange = function() {
    if (!this.range || this.range.collapse) {
        return;
    }
    var sel = damoUtil.getSelection();
    sel.removeAllRanges();
    sel.addRange(this.range);
    this.focus();
};
DamoEditor.prototype.focus = function() {
    if (!this.editor.focued) this.editor.focus();
};
DamoEditor.prototype.editorMousedown = function(event) {
    if (event.target.nodeName === "IMG") {
        this.buttonsDisable(true, "undo,redo,copy,cut,paste,image,justifyleft,justifycenter,justifyright,justifyfull");
        this.activateButton(event.target);
    } else {
        this.buttonsDisable(false, "bgcolor4td");
        this.activateButton();
    }
};
DamoEditor.prototype.editorKeydown = function(event) {
    if (!event.ctrlKey || event.keyCode === 17) {
        return;
    }
    var btn = this.shortcutList[event.keyCode];
    if (btn) {
        btn.click(this);
        damoUtil.preventEvent(event);
    }
};
DamoEditor.prototype.editorKeyup = function(event) {
    if ((event.keyCode < 33 || event.keyCode > 46) & event.keyCode !== 13) return;
    this.activateButton();
};
DamoEditor.prototype.executeClick = function(btnName) {
    for (var i = 0; i < this.buttonList.length; i++) {
        var btn = this.buttonList[i];
        if (btn.command === btnName) {
            btn.button.click(this);
            return;
        }
    }
};
DamoEditor.prototype.removeElement = function() {
    this.activeElement.parentNode.removeChild(this.activeElement);
    this.activeElement = null;
};
DamoEditor.prototype.activateButton = function(src) {
    if (!src) src = damoUtil.getElementFromHierarchy();
    if (!src) return;
    this.activeElement = src;
    this.saveRange();
    this.closePanels();
    this.buttonUnSelect();
    var fontSize = null,
        fontFamily = null,
        fontformat = null,
        textAlign = null,
        lineheight = null;
    while (src && src !== this.editor) {
        for (var inx in this.tagButtonList) {
            var button = this.tagButtonList[inx];
            if (src.nodeName.match(eval("/" + button.tags + "/"))) {
                damoUtil.addClass(button.button, "buttonSelect");
                break;
            } else
            if (fontformat === null & "H1,H2,H3,H4,H5,H6".indexOf(src.nodeName) > -1) {
                fontformat = src.nodeName;
                if (textAlign === null) textAlign = src.align;
                if (lineheight === null) lineheight = this.getLineheight(src, "line-height");
            }
        }
        if (src.nodeType !== 3) {
            if (fontSize === null && src.style.fontSize !== null) fontSize = this.getFontStyle(src, "font-size");
            if (fontFamily === null && src.style.fontFamily !== null) fontFamily = this.getFontStyle(src, "font-family");
            if (lineheight === null && src.style.lineHeight !== null) lineheight = this.getLineheight(src, "line-height");
            if (textAlign === null && "PDIV".indexOf(src.nodeName) > -1) textAlign = src.style.textAlign;
        }
        if (lineheight === null && src.nodeName === "P") lineheight = this.getLineheight(src, "line-height");
        src = src.parentNode;
    };
    this.selectedExtendButton(damoSelectBoxFontsize, fontSize ? fontSize : this.getFontStyle(src, "font-size"));
    this.selectedExtendButton(damoSelectBoxFontname, fontFamily ? fontFamily : this.getFontStyle(src, "font-family"));
    this.selectedExtendButton(damoSelectBoxFontformat, fontformat);
    this.selectedAlignButton(textAlign);
};
DamoEditor.prototype.getFontStyle = function(src, style) {
    var ret = null;
    ret = damoUtil.getStyle(src, style).replace("\"", "");
    if (ret.indexOf(C_PX) > -1) {
        ret = Math.ceil(parseInt(ret) * 3 / 4) + "pt";
    } else
    if (ret.indexOf("em") > -1) {
        ret = Math.ceil(parseInt(ret) * 12) + "pt";
    }
    return ret;
};
DamoEditor.prototype.getLineheight = function(src, style) {
    var ret = damoUtil.getStyle(src, style);
    if (!ret) return null;
    var retInt = parseFloat(ret);
    if (!retInt) return "120%";
    if (ret.indexOf(C_PX) > -1) {
        var f = damoUtil.getStyle(src, "font-size");
        ret = (Math.round(retInt / parseFloat(f) * 10) * 10) + "%";
    } else ret = retInt;
    return ret;
};
DamoEditor.prototype.selectedExtendButton = function(objectClass, value) {
    for (var button in this.extendButton) {
        if (this.extendButton[button] instanceof objectClass) {
            this.extendButton[button].setTitle(value);
        }
    }
};
DamoEditor.prototype.selectedAlignButton = function(value) {
    if (!this.toggleBtns) return;
    if (value === "justify") value = "full";
    var toggleBtns = this.toggleBtns["a"];
    for (var inx in toggleBtns) {
        if (toggleBtns[inx].command.indexOf(value) > 0)
            damoUtil.addClass(toggleBtns[inx].button, "buttonSelect");
        else damoUtil.removeClass(toggleBtns[inx].button, "buttonSelect");
    }
};
DamoEditor.prototype.closePanels = function(parentNode) {
    var list = document.getElementsByClassName("damoSelectBoxPanel");
    for (var i = 0; i < list.length; i++) {
        list[i].style.display = "none";
    }
    if (parentNode !== this.overflowBar) {
        damoUtil.setStyle(this.overflowBar, {
            "visibility": "hidden"
        });
    }
};
DamoEditor.prototype.buttonUnSelect = function() {
    for (var inx in this.tagButtonList) {
        damoUtil.removeClass(this.tagButtonList[inx].button, "buttonSelect");
    }
};
DamoEditor.prototype.getLength = function() {
    var tab = damoUtil.getStyle(this.editor, "display");
    if (tab !== "none") {
        if (this.editor.innerText === "" && this.editor.innerHTML.length < 12)
            return 0;
        return this.editor.innerHTML.length;
    } else {
        return this.modeTabs.editorETC.innerText.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '').length;
    }
};
DamoEditor.prototype.saveContents = function() {
    var tab = damoUtil.getStyle(this.editor, "display");
    var html;
    if (tab === "none") {
        html = this.modeTabs.editorETC.innerText;
        this.editor.innerHTML = html;
    } else {
        html = this.editor.innerHTML;
    }
    if (this.options.xss.used) {
        damoUtil.protectFromXSS(this.editor, this.options.xss);
    }
    this.contentEditor.value = damoUtil.removeLayoutCSS(this.editor.innerHTML);
};
DamoEditor.prototype.clearDocument = function() {
    this.editor.innerHTML = "<p>" + damoUtil.getBlankChar() + "</p>";
    var bgImage = damoUtil.getStyle(this.editor, "background-image");
    damoUtil.setStyle(this.editor, {
        "background-color": "transparent",
        "background-image": "none"
    });
    if (bgImage !== "none") {
        damoUtil.setStyle(this.editor, {
            "background-attachment": "",
            "background-repeat": "",
            "background-position": ""
        });
    }
};
DamoEditor.prototype.buttonsDisable = function(disabled, exceptions) {
    var buttonList = this.buttonList;
    if (disabled) {
        for (var button in buttonList) {
            var a = buttonList[button];
            this.buttonDisable(a, !(exceptions && exceptions.indexOf(a.command) > -1));
        }
    } else {
        for (var button in buttonList) {
            var a = buttonList[button];
            this.buttonDisable(a, exceptions && exceptions.indexOf(a.command) > -1);
        }
    }
    this.undoManager.changed(this.undoManager);
};
DamoEditor.prototype.buttonDisable = function(btn, disabled) {
    if (disabled) {
        btn.button.setAttribute("disabled", disabled);
        damoUtil.addClass(btn.button, "buttonDisable");
    } else {
        btn.button.removeAttribute("disabled");
        damoUtil.removeClass(btn.button, "buttonDisable");
    }
};
DamoEditor.prototype.undoRecord = function() {
    this.undoManager.record();
};
DamoEditor.prototype.setHtmlContent = function(html) {
    this.editor.innerHTML = html;
    this.setEditorProperty(this.editor);
    if (this.options.xss.used) {
        damoUtil.protectFromXSS(this.editor, this.options.xss);
    }
}
DamoEditor.prototype.setEditorProperty = function(editor) {
    var editorBack = editor.querySelector("#damoEditorBack");
    if (!editorBack) {
        damoUtil.setStyle(editor, {
            "background-color": "transparent",
            "background-image": "none"
        });
        return
    }
    var child = null;
    while (child = editorBack.firstChild) {
        editor.appendChild(child);
    }
    damoUtil.setStyle(editor, {
        "background-color": damoUtil.getStyleA(editorBack, "background-color")
    });
    var bgImage = damoUtil.getStyle(editorBack, "background-image");
    if (bgImage !== "none") {
        damoUtil.setStyle(editor, {
            "background-image": bgImage,
            "background-attachment": damoUtil.getStyle(editorBack, "background-attachment"),
            "background-repeat": damoUtil.getStyle(editorBack, "background-repeat"),
            "background-position": damoUtil.getStyle(editorBack, "background-position-x") + " " +
                damoUtil.getStyle(editorBack, "background-position-y")
        });
    }
    editor.removeChild(editorBack);
}
DamoEditor.prototype.getEditorContent = function(editor) {
    var bgColor = damoUtil.getStyleA(editor, "background-color");
    var bgImage = damoUtil.getStyle(editor, "background-image");
    if (bgColor === "transparent" && bgImage === "none") {
        return editor.innerHTML;
    }
    var str = "<div id='damoEditorBack' style='width:100%;";
    if (bgColor !== "transparent") {
        str += "background-color:" + bgColor + ";";
    }
    if (bgImage !== "none") {
        str += "background-image:" + bgImage + "; background-attachment:" + damoUtil.getStyle(editor, "background-attachment") + ";background-repeat:" + damoUtil.getStyle(editor, "background-repeat") + ";background-position:" + damoUtil.getStyle(editor, "background-position-x") + " " + damoUtil.getStyle(editor, "background-position-y");
    }
    return str + "'>" + editor.innerHTML + "</div>";
}

function DamoEditorMode(parent) {
    this.parent = parent;
    this.editor = parent.editor;
    this.editorETC = damoUtil.createElement("textarea", parent.damoEditor, "editor");
    var h = parseInt(damoUtil.getStyle(this.editor, "height"));
    damoUtil.setStyle(this.editorETC, {
        display: "none",
        height: h + parseInt(damoUtil.getStyle(this.editor, "padding-top")) * 2 + C_PX,
        width: "100%",
        padding: "0px"
    });
    this.preview = damoUtil.createElement("div", parent.damoEditor, "editor");
    damoUtil.setStyle(this.preview, {
        display: "none",
        height: h + C_PX
    });
    var bottom = damoUtil.createElement("div", parent.damoEditor, "damoEditorBottom");
    this.editorView = {
        "design": this.editor,
        "html": this.editorETC,
        "text": this.editorETC,
        "preview": this.preview
    };
    var tabArr = ["design", "html", "text", "preview"];
    for (var i = 0; i < tabArr.length; i++) {
        var tab = damoUtil.createElement("div", bottom, "damoEditorBottomTab");
        tab.innerText = this.parent.DamoMessage.editorMode[tabArr[i]];
        tab.id = tabArr[i];
        damoUtil.addEvent(tab, "click", this.damoEditorBottomTabChange.closure(this, tab));
        if (i === 0) this.damoEditorBottomTabChange(tab);
        if (parent.options.colors) {
            damoUtil.setStyle(tab, {
                "background": parent.options.colors.bottom
            });
        }
    }
    if (parent.options.colors) {
        damoUtil.setStyle(bottom, {
            "background": parent.options.colors.bottom,
            "border-top-color": parent.options.colors.bottomTop
        });
    }
    return this;
}
DamoEditorMode.prototype.damoEditorBottomTabChange = function(tab) {
    if (this.activetab === tab) return;
    if (tab.id === "text") {
        if (!confirm(this.parent.DamoMessage.editorMode.msg.textMode)) return;
    }
    if (this.activetab) damoUtil.removeClass(this.activetab, "damoEditorBottomTabActive");
    damoUtil.addClass(tab, "damoEditorBottomTabActive");
    if (!this.activetab) {
        this.activetab = tab;
        return;
    }
    this.damoEditorBottomTabDisplay(this.editorView[this.activetab.id], this.editorView[tab.id]);
    if (this.activetab.id === "preview") {
        this.activetab = this.activetab4preview;
    }
    this.parent.buttonsDisable(tab.id !== "design");
    if (this.activetab === tab) {
        return;
    }
    if (tab.id === "design") {
        var html = "";
        if (this.activetab.id === "html")
            html = this.editorETC.value;
        else html = this.HTML2Text(this.editorETC.value);
        this.parent.setHtmlContent(html);
        var tags = document.getElementsByClassName("damoLayoutInput");
        for (var i = 0; i < tags.length; i++) {
            damoUtil.addClass(tags[i], "damoLayoutDot");
        }
        this.editorETC.value = "";
        this.preview.innerHTML = "";
    } else
    if (tab.id === "preview") {
        if (this.activetab.id === "design") {
            this.preview.innerHTML = damoUtil.removeLayoutCSS(this.parent.getEditorContent(this.editor));
        } else
        if (this.activetab.id === "html") {
            this.preview.innerHTML = this.editorETC.value;
        } else {
            this.preview.innerHTML = this.Text2HTML(this.editorETC.value);
        }
        this.activetab4preview = this.activetab;
    } else {
        if (tab.id === "html") {
            if (this.activetab.id === "design")
                this.editorETC.value = damoUtil.removeLayoutCSS(this.parent.getEditorContent(this.editor));
            else this.editorETC.value = this.Text2HTML(this.editorETC.value);
        } else {
            if (this.activetab.id === "design")
                this.editorETC.value = this.HTML2Text(this.parent.getEditorContent(this.editor));
            else this.editorETC.value = this.HTML2Text(this.editorETC.value);
        }
    }
    this.activetab = tab;
};
DamoEditorMode.prototype.damoEditorBottomTabDisplay = function(before, current) {
    if (before) damoUtil.setStyle(before, {
        display: "none"
    });
    damoUtil.setStyle(current, {
        display: ""
    });
    current.focus();
};
DamoEditorMode.prototype.Text2HTML = function(text) {
    var sHtml = "";
    var textArr = text.split("\n");
    var blankChar = "<BR>";
    if (damoUtil.isIE) blankChar = "&nbsp;";
    for (var i = 0; i < textArr.length; i++) {
        var str = textArr[i].replace(/[\r|\n]/g, "");
        if (str === null || str === "") str = blankChar;
        sHtml = sHtml + "<p>" + str + "</p>\n";
    }
    return sHtml;
};
DamoEditorMode.prototype.HTML2Text = function(sHtml) {
    sHtml = sHtml.replace(/[\r|\n|\t|\v|\f]/g, "");
    sHtml = sHtml.replace(/<p><br><\/p>|<P>&nbsp;<\/P>/gi, "\n");
    sHtml = sHtml.replace(/<br(\s)*\/?>|<br(\s[^\/]*)?>|<\/p(\s[^\/]*)?>/gi, "\n");
    sHtml = sHtml.replace(/<\/li(\s[^\/]*)?>|<\/tr(\s[^\/]*)?>/gi, "\n");
    sHtml = this.strip_tags(sHtml, false);
    sHtml = sHtml.replace(/[\n]*$/g, "");
    sHtml = sHtml.replace(new RegExp("damoLayoutDot", 'g'), "");
    return sHtml;
};
DamoEditorMode.prototype.strip_tags = function(input, allowed) {
    allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join("");
    var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi;
    var commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
    return input.replace(commentsAndPhpTags, "").replace(tags, function($0, $1) {
        return allowed.indexOf("<" + $1.toLowerCase() + ">") > -1 ? $0 : "";
    });
};

function DamoButton(parent, buttonInfo, isgroup) {
    this.command = buttonInfo.command;
    this.tags = buttonInfo.tags;
    this.editor = parent;
    var elm = damoUtil.createElement("button", parent.toolbar, "damoButton");
    elm.setAttribute('type', 'button');
    if (isgroup) {
        damoUtil.addClass(elm, "groupButton");
    }
    damoUtil.setStyle(elm, {
        backgroundPosition: (buttonInfo.icon * -editorConfig.iconsize) + "px 0px"
    });
    elm.title = buttonInfo.title;
    if (buttonInfo.dialogHandler) {
        var dialog = new buttonInfo.dialogHandler().init(parent);
        damoUtil.addEvent(elm, "click", dialog.open.closure(dialog), true);
    } else
    if (buttonInfo.clickClass) {
        var clickEvent = new buttonInfo.clickClass();
        clickEvent = clickEvent.init(parent, buttonInfo, this);
        damoUtil.addEvent(elm, "click", clickEvent.buttonClick.closure(clickEvent, this), true);
    } else
    if (buttonInfo.clickEvent) {
        damoUtil.addEvent(elm, "click", buttonInfo.clickEvent.closureListener(this), true);
    } else
    if (buttonInfo.command !== "undo" && buttonInfo.command !== "redo") {
        damoUtil.addEvent(elm, "click", this.buttonClick.closure(this), true);
    }
    damoUtil.addEvent(elm, "mousedown", parent.restoreRange.closure(parent), false);
    this.button = elm;
    return this;
}
DamoButton.prototype.buttonClick = function() {
    if (!rangeUtil.execCommand(this.command, null, damoTableEditor.selectList)) return;
    this.editor.undoRecord();
    var src = damoUtil.getElementFromSibling(damoUtil.getRange());
    if (!src) {
        return;
    }
    while (src.firstChild) src = src.firstChild;
    this.editor.activateButton(src);
};
DamoButton.prototype.buttonsDisable = function() {
    damoUtil.toggleClass(this.button, "buttonDisable");
};

function damoNewClick() {
    if (!confirm(this.editor.DamoMessage.msg.clear)) return false;
    this.editor.clearDocument();
    this.editor.undoManager.clearUndo(this.editor.editor.innerHTML);
    return true;
}

function damoGetContent(content) {
    return "<!DOCTYPE html>\n" + "<html>\n<head>\n" + "<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />\n" + "<title>damoWebEditor</title></head>\n<body>\n" +
        content + "</body>\n<html>";
}

function damoSaveClick() {
    var filename = 'damoWebEditor.html';
    var contentType = 'data:text/plain;charset=utf-8,';
    var content = this.editor.getEditorContent(this.editor.editor);
    damoUtil.removeLayoutCSS(content);
    if (damoUtil.detectIE()) {
        var file = new Blob([damoGetContent(content)]);
        window.navigator.msSaveBlob(file, filename);
    } else {
        var a = document.createElement('a');
        document.body.appendChild(a);
        a.href = contentType + damoGetContent(content);
        a.download = filename;
        a.click();
        document.body.removeChild(a);
    }
}

function damoPrintClick() {
    var width = damoUtil.getStyleI(this.editor.editor, "width");
    if (width < 700) {
        width = 700;
    }
    var damoWindow = window.open('', '', 'width=' + width + ',height=500, scrollbars=yes');
    damoWindow.document.write(damoGetContent(this.editor.getEditorContent(this.editor.editor)));
    damoWindow.document.close();
    damoWindow.focus();
    damoWindow.print();
}

function damoPasteClick(event) {
    if (!this.editor.getClipboardData(event)) {
        alert(this.editor.DamoMessage.msg.pasteWarning);
        return;
    }
    this.editor.focus();
    document.execCommand("paste", false, null);
    this.editor.undoRecord();
    var src = damoUtil.getElementFromHierarchy();
    while (src.firstChild) src = src.firstChild;
    this.editor.activateButton(src);
}

function damoIndentClick() {
    damoIndentOutdent(20, this.editor);
}

function damoOutdentClick() {
    damoIndentOutdent(-20, this.editor);
}

function damoIndentOutdent(value, editor) {
    editor.focus();
    if (damoTableEditor.selectList.length > 0) {
        var sel = damoUtil.getSelection();
        var range = damoUtil.getRangeCreate();
        for (var i = 0; i < damoTableEditor.selectList.length; i++) {
            execCommand(damoTableEditor.selectList[i]);
        }
        sel.removeAllRanges();
    } else {
        var range = damoUtil.getRange();
        if (range) {
            execCommand(range.startContainer);
        }
    }
    editor.undoRecord();

    function execCommand(startNode) {
        var nodeList = rangeUtil.findTags(startNode, "^P|OL|UL");
        if (!nodeList || nodeList.length === 0) return;
        for (var i = 0; i < nodeList.length; i++) {
            var node = nodeList[i];
            var left = damoUtil.getStyle(node, "padding-left");
            if (!left) left = 0;
            else left = parseInt(left) + value;
            if (left < 0) left = 0;
            damoUtil.setStyle(node, {
                "padding-left": left + C_PX
            });
        }
    }
}

function damoToggleButtonEvent() {}
damoToggleButtonEvent.prototype.init = function(parent, buttonInfo, btnClass) {
    btnClass.toggleGroup = buttonInfo.group;
    if (buttonInfo.group) {
        if (!parent.toggleBtns) parent.toggleBtns = {};
        if (!parent.toggleBtns[buttonInfo.group]) parent.toggleBtns[buttonInfo.group] = {};
        parent.toggleBtns[buttonInfo.group][buttonInfo.command] = btnClass;
    }
    return this;
};
damoToggleButtonEvent.prototype.buttonsDisable = function() {
    damoUtil.toggleClass(this.button, "buttonDisable");
};
damoToggleButtonEvent.prototype.activateButton = function(btn, btnGroup, btnClass) {
    for (var inx in btnGroup) {
        damoUtil.removeClass(btnGroup[inx].button, "buttonSelect");
    }
    damoUtil.addClass(btn, "buttonSelect");
};
damoToggleButtonEvent.prototype.multiBlockExec = function(button) {
    var sel = damoUtil.getSelection();
    var range = damoUtil.getRangeCreate();
    for (var i = 0; i < damoTableEditor.selectList.length; i++) {
        damoUtil.setSelection2(sel, range, damoTableEditor.selectList[i]);
        this.execCommand(button, damoTableEditor.selectList[i]);
    }
    sel.removeAllRanges();
};

function damoAlignButtonEvent() {
    this.buttonClick = function(button) {
        if (damoTableEditor.selectList.length > 0) {
            this.multiBlockExec(button);
        } else {
            this.execCommand(button);
        }
        button.editor.undoRecord();
        this.activateButton(button.button, button.editor.toggleBtns[button.toggleGroup], "buttonSelect");
        button.editor.focus();
    }, this.execCommand = function(button) {
        document.execCommand(button.command, false, null);
        var node = rangeUtil.findElementByTag("^P$|DIV");
        if (node) {
            var a = button.command.replace("justify", "");
            if (a === "full") a = "justify";
            damoUtil.setStyle(node, {
                "text-align": a
            });
        }
    };
}
damoAlignButtonEvent.prototype = new damoToggleButtonEvent();

function damoOrderButtonEvent() {
    this.buttonClick = function(button) {
        button.editor.focus();
        if (damoTableEditor.selectList.length > 0) {
            this.multiBlockExec(button);
        } else {
            var range = damoUtil.getRange();
            this.execCommand(button, range.startContainer);
        }
        button.editor.undoRecord();
        this.activateButton(button.button, button.editor.toggleBtns[button.toggleGroup], "buttonSelect");
    }, this.execCommand = function(button, node) {
        document.execCommand(button.command, false, "");
        var node = rangeUtil.findTag(node, "OL|UL");
        if (node) {
            if (button.command === "insertorderedlist")
                damoUtil.setStyle(node, {
                    "list-style-type": "decimal"
                });
            else damoUtil.setStyle(node, {
                "list-style-type": "disc"
            });
            damoUtil.setStyle(node, {
                "overflow": "visible"
            });
        }
    };
}
damoOrderButtonEvent.prototype = new damoToggleButtonEvent();

function DamoSelectBox() {
    this.button = null;
    this.panelwidth = 150;
    this.width = "100px";
    this.selectedValue = null;
    this.isMenu = true;
}
DamoSelectBox.prototype.initialize = function(parent, buttonInfo) {
    this.command = buttonInfo.command;
    this.editor = parent;
    if (parent.toolbar)
        this.button = damoUtil.createElement("div", parent.toolbar, "damoSelectBox", "click", this.damoSelectBoxClick.closure(this), true);
    else this.button = damoUtil.createElement("div", parent, "damoSelectBox", "click", this.damoSelectBoxClick.closure(this), true);
    damoUtil.setStyle(this.button, {
        width: this.width,
        "background-color": "#FFFFFF"
    });
    this.button.selecttitle = damoUtil.createElement("div", this.button, "selecttitle");
    this.button.selecttitle.innerHTML = buttonInfo.title;
    damoUtil.setStyle(this.button.selecttitle, {
        width: (parseInt(this.width) - editorConfig.iconsize + 4) + C_PX
    });
    var dropbutton = damoUtil.createElement("div", this.button, "dropbutton");
    damoUtil.setStyle(dropbutton, {
        backgroundPosition: "-3px 0px",
        border: "0px"
    });
    if (buttonInfo.command) parent.extendButton.push(this);
};
DamoSelectBox.prototype.damoSelectBoxClick = function() {
    if (damoUtil.hasClass(this.button, 'buttonDisable')) {
        this.hide();
        return;
    }
    if (!this.panel) {
        this.setPanel();
    }
    if (this.panel.style.display === "none") {
        this.show();
    } else
        this.hide();
};
DamoSelectBox.prototype.show = function() {
    if (this.editor.closePanels) {
        this.editor.focus();
        this.editor.closePanels(this.button.parentNode);
    } else {
        this.closePanels();
    }
    this.panel.style.display = "block";
    this.calcPanelPosition(this.panel);
    this.showPanel();
};
DamoSelectBox.prototype.closePanels = function() {
    var list = document.getElementsByClassName("damoSelectBoxPanel");
    for (var i = 0; i < list.length; i++) {
        list[i].style.display = "none";
    }
};
DamoSelectBox.prototype.addPanel = function() {
    var parent;
    parent = (this.isMenu) ? this.editor.toolbar : this.button.parentNode.parentNode;
    panel = damoUtil.createElement("div", parent, "damoSelectBoxPanel");
    panel.style.display = "none";
    this.calcPanelPosition(panel);
    return panel;
}
DamoSelectBox.prototype.calcPanelPosition = function(panel) {
    var btn = this.button;
    var pos;
    if (this.isMenu) {
        if (this.button.parentNode === this.editor.overflowBar)
            btn.parentNode.appendChild(panel);
        else this.editor.toolbar.appendChild(panel);
        var pos = damoUtil.getElementPosition(btn);
        var w = damoUtil.getStyleI(this.editor.toolbar, "width");
        if (pos.left + this.panelwidth > w) {
            pos.left = w - this.panelwidth - 20
        }
    } else {
        var pos = damoUtil.getElementPosition(btn);
    }
    damoUtil.setStyle(panel, {
        left: pos.left + C_PX,
        top: (pos.top + btn.offsetHeight) + C_PX,
        width: this.panelwidth + C_PX
    });
}
DamoSelectBox.prototype.showPanel = function() {}
DamoSelectBox.prototype.setPanel = function() {
    this.panel = this.addPanel();
    for (var i in this.items) {
        this.addItem(i, this.items[i]);
    }
    if (this.showEvent) this.showEvent();
};
DamoSelectBox.prototype.hide = function() {
    if (this.panel) {
        this.panel.style.display = "none";
    }
};
DamoSelectBox.prototype.addItem = function(key, value) {
    var item = damoUtil.createElement("div", this.panel, "damoSelectBoxItem", "click", this.damoSelectBoxItemClick.closure(this, key), false);
    this.setItem(item, value, key);
};
DamoSelectBox.prototype.damoSelectBoxItemClick = function(item) {
    this.hide();
    this.selectedItemEvent(item);
    this.editor.oldsrc = null;
    if (this.isMenu) {
        this.editor.undoRecord();
    }
};
DamoSelectBox.prototype.setTitle = function(title) {
    this.button.selecttitle.innerText = title;
};
DamoSelectBox.prototype.buttonsDisable = function() {
    damoUtil.toggleClass(this.button, "buttonDisable");
};
DamoSelectBox.prototype.execCommand = function(range, style, value) {
    var rangeStatus = range.collapsed;
    var spanList = rangeUtil.getSpanList(range);
    for (var i = 0; i < spanList.length; i++) {
        spanList[i].style[style] = value;
        if (spanList[i].innerText === "") spanList[i].innerText = unescape("%uFEFF");
    }
    if (rangeStatus && spanList.length === 1) {
        damoUtil.setSelection(damoUtil.getSelection(), range, spanList[0], 1);
    }
};
DamoSelectBox.prototype.setStyle = function(style, value) {
    var range = damoUtil.getRange();
    if ((!range || range.collapsed) && damoTableEditor.selectList.length > 0) {
        var sel = damoUtil.getSelection();
        range = damoUtil.getRangeCreate();
        for (var i = 0; i < damoTableEditor.selectList.length; i++) {
            damoUtil.setSelection2(sel, range, damoTableEditor.selectList[i]);
            this.execCommand(range, style, value);
        }
        range.collapse(false);
        sel.removeAllRanges();
    } else {
        this.execCommand(range, style, value);
    }
};

function damoSelectBoxFontname() {
    var items = ["돋움", "돋움체", "굴림", "굴림체", "바탕", "바탕체", "궁서", "Arial", "Courier New", "Times New Roman", "Verdana"];
    this.width = "61px";
    this.panelwidth = 120;
    this.init = function(parent, buttonInfo) {
        this.items = parent.options.fonts || items;
        this.initialize(parent, buttonInfo);
        return this;
    };
    this.setItem = function(item, value) {
        item.innerHTML = "<font face='" + value + "'>" + value + "</font>";
    };
    this.selectedItemEvent = function(item) {
        var fontFamily = this.items[item];
        this.setTitle(fontFamily);
        this.setStyle("fontFamily", fontFamily);
    };
}
damoSelectBoxFontname.prototype = new DamoSelectBox();

function damoSelectBoxFontsize() {
    this.items = ["9pt", "10pt", "12pt", "14pt", "16pt", "20pt", "24pt", "30pt", "36pt"];
    this.width = "36px";
    this.panelwidth = 120;
    this.init = function(parent, buttonInfo) {
        this.initialize(parent, buttonInfo);
        return this;
    };
    this.setItem = function(item, value) {
        item.innerHTML = "<font style='font-size:" + value + "'>" + value + "</font>";
    };
    this.selectedItemEvent = function(item) {
        var fontSize = this.items[item];
        this.setTitle(fontSize);
        this.setStyle("fontSize", fontSize);
    };
    this.setTitle = function(title) {
        this.button.selecttitle.innerText = title.replace("pt", "");
    };
}
damoSelectBoxFontsize.prototype = new DamoSelectBox();

function damoSelectBoxFontformat() {
    this.items = {
        H1: "Heading 1",
        H2: "Heading 2",
        H3: "Heading 3",
        H4: "Heading 4",
        H5: "Heading 5",
        H6: "Heading 6"
    };
    this.width = "94px";
    this.panelwidth = 130;
    this.init = function(parent, buttonInfo) {
        this.initialize(parent, buttonInfo);
        return this;
    };
    this.setItem = function(item, value, key) {
        item.innerHTML = "<" + key + ">" + value + "</" + key + ">";
    };
    this.selectedItemEvent = function(item) {
        rangeUtil.execCommand(this.command, "<" + item + ">", damoTableEditor.selectList);
        this.button.selecttitle.innerText = this.items[item];
        this.editor.activateButton();
    }, this.setTitle = function(item) {
        if (this.items[item])
            this.button.selecttitle.innerText = this.items[item];
        else this.button.selecttitle.innerText = editorConfig.buttons.fontformat.title;
    };
}
damoSelectBoxFontformat.prototype = new DamoSelectBox();

function damoSelectButton() {
    this.initialize = function(parent, buttonInfo, useColorDisplay) {
        this.command = buttonInfo.command;
        this.editor = parent;
        if (parent.toolbar)
            this.button = damoUtil.createElement("div", parent.toolbar, "damoSelectButton");
        else this.button = damoUtil.createElement("div", parent, "damoSelectButton");
        damoUtil.setStyle(this.button, {
            border: "1px solid #fbfcfd"
        });
        this.button.selecttitle = damoUtil.createElement("div", this.button, "damoButton", "click", this.damoSelectButtonClick.closure(this), true);
        this.button.selecttitle.title = buttonInfo.title;
        damoUtil.setStyle(this.button.selecttitle, {
            backgroundPosition: (buttonInfo.icon * -editorConfig.iconsize) + "px 0px"
        });
        if (useColorDisplay) {
            this.button.selecttitlecolor = damoUtil.createElement("div", this.button.selecttitle, "buttonColor");
        }
        var dropbutton = damoUtil.createElement("div", this.button, "dropbutton", "click", this.damoSelectBoxClick.closure(this), true);
        damoUtil.setStyle(dropbutton, {
            backgroundPosition: "-8px 0px",
            width: "10px"
        });
        if (buttonInfo.command) parent.extendButton.push(this);
    };
    this.changeToGroup = function() {
        damoUtil.addClass(this.button, "damoSelectBoxGroup");
    };
    this.damoSelectButtonClick = function() {
        if (this.button.disabled) {
            return;
        }
        this.selectedItemEvent(this.selectedValue);
        this.editor.undoRecord();
        this.editor.closePanels();
    };
    this.addItem = function(key, value) {
        var item = damoUtil.createElement("div", this.panel, "damoSelectButtonItem", "click", this.damoSelectBoxItemClick.closure(this, key), false);
        this.setItem(item, value, key);
    };
}
damoSelectButton.prototype = new DamoSelectBox();

function damoSelectButtonLineheight() {
    this.items = {
        1: "100%",
        2: "120%",
        3: "140%",
        4: "160%",
        5: "180%",
        6: "200%",
        7: "300%"
    };
    this.panelwidth = 60;
    this.init = function(parent, buttonInfo) {
        this.initialize(parent, buttonInfo);
        return this;
    };
    this.setItem = function(item, value, key) {
        item.innerHTML = value;
        damoUtil.removeClass(item, "damoSelectButtonItem");
        damoUtil.addClass(item, "damoSelectBoxItem");
    };
    this.selectedItemEvent = function(item) {
        var lineheight = this.items[item];
        if (damoTableEditor.selectList.length > 0) {
            var sel = damoUtil.getSelection();
            var range = damoUtil.getRangeCreate();
            for (var i = 0; i < damoTableEditor.selectList.length; i++) {
                damoUtil.setSelection2(sel, range, damoTableEditor.selectList[i]);
                this.execCommand(range, lineheight);
            }
            sel.removeAllRanges();
        } else {
            this.execCommand(damoUtil.getRange(), lineheight);
        }
    }, this.execCommand = function(range, value) {
        var tagList = rangeUtil.getAllTagList(range, /^P$|^H([0-9])|OL|UL/);
        for (var i = 0; i < tagList.length; i++) {
            damoUtil.setStyle(tagList[i], {
                "line-height": value
            });
        }
    }
    this.damoSelectButtonClick = function() {
        this.damoSelectBoxClick();
    };
}
damoSelectButtonLineheight.prototype = new damoSelectButton();

function damoSelectBoxColor() {
    this.items = ["#ff0000", "#ff5e00", "#ffbb00", "#ffe400", "#abf200", "#1fda11", "#00d8ff", "#0055ff", "#0900ff", "#6600ff", "#ff00dd", "#ff007f", "#000000", "#ffffff", "#ffd8d8", "#fae0d4", "#faecc5", "#faf4c0", "#e4f7ba", "#cefbc9", "#d4f4fa", "#d9e5ff", "#dad9ff", "#e8d9ff", "#ffd9fa", "#ffd9ec", "#f6f6f6", "#eaeaea", "#f15f5f", "#f29661", "#f2cb61", "#e5d85c", "#bce55c", "#86e57f", "#5cd1e5", "#6699ff", "#6b66ff", "#a366ff", "#f261df", "#f261aa", "#a6a6a6", "#8c8c8c", "#670000", "#662500", "#664b00", "#665c00", "#476600", "#22741c", "#005766", "#002266", "#030066", "#290066", "#660058", "#660033", "#464646", "#212121", "#000000"];
    this.panelwidth = 180;
    this.selectedValue = "#000000";
    this.init = function(parent, buttonInfo) {
        this.initialize(parent, buttonInfo, true);
        return this;
    };
    this.showEvent = function() {
        this.moreBtn = damoUtil.createElement("button", this.panel);
        this.moreBtn.setAttribute('type', 'button');
        this.moreBtn.innerHTML = "more";
        damoUtil.addEvent(this.moreBtn, "click", this.moreColor.closureListener(this));
        damoUtil.setStyle(this.panel, {
            "overflow": "hidden"
        });
    };
    this.moreColor = function() {
        var colorPicker = damoUtil.createElement("div", this.panel, "cp cp-small");
        colorPicker.id = "colorPicker";
        var colorStatus = damoUtil.createElement("div", this.panel, "colorStatus");
        this.selectedhex = damoUtil.createElement("div", colorStatus, "selectedhex");
        this.selectedcolor = damoUtil.createElement("div", colorStatus, "selectedcolor");
        var btn = damoUtil.createElement("button", colorStatus);
        btn.setAttribute('type', 'button');
        btn.innerHTML = "OK";
        damoUtil.addEvent(btn, "click", this.okClick.closureListener(this));
        colorPicker = ColorPicker(colorPicker, this.colorPickerChange.closureListener(this));
        colorPicker.setHex('#f4329c');
        this.moreBtn.disabled = 'false';
    };
    this.colorPickerChange = function(hex) {
        this.selectedhex.innerHTML = hex;
        this.selectedcolor.style.backgroundColor = hex;
    };
    this.okClick = function(hex) {
        this.damoSelectBoxItemClick(this.selectedhex.innerHTML);
    };
    this.setItem = function(item, value) {
        damoUtil.setStyle(item, {
            width: "8px",
            height: "8px",
            "background-color": value,
            "border": "1px solid " + value
        });
    };
    this.selectedItemEvent = function(item) {
        if (item.charAt(0) !== '#') {
            item = this.items[item];
        }
        var values = {};
        values[this.command.replace("fore", "")] = item;
        var range = damoUtil.getRange();
        if ((!range || range.collapsed) && damoTableEditor.selectList.length > 0) {
            var sel = damoUtil.getSelection();
            range = damoUtil.getRangeCreate();
            for (var i = 0; i < damoTableEditor.selectList.length; i++) {
                damoUtil.setSelection2(sel, range, damoTableEditor.selectList[i]);
                this.execCommand(range, values);
            }
            range.collapse(false);
            sel.removeAllRanges();
        } else {
            this.execCommand(damoUtil.getRange(), values);
        }
        this.selectedValue = item;
        if (this.button.selecttitlecolor) {
            damoUtil.setStyle(this.button.selecttitlecolor, {
                "background-color": item
            });
        }
    };
    this.execCommand = function(range, values) {
        var spanList = rangeUtil.getSpanList(range);
        for (var i = 0; i < spanList.length; i++) {
            damoUtil.setStyle(spanList[i], values);
        }
    };
}
damoSelectBoxColor.prototype = new damoSelectButton();

function damoSelectBoxColor4td() {
    this.selectedItemEvent = function(item) {
        if (item.charAt(0) !== '#') {
            item = this.items[item];
        }
        for (var i = 0; i < damoTableEditor.selectList.length; i++) {
            damoUtil.setStyle(damoTableEditor.selectList[i], {
                "background-color": item
            });
        }
        this.selectedValue = item;
        damoUtil.setStyle(this.button.selecttitlecolor, {
            "background-color": item
        });
    };
}
damoSelectBoxColor4td.prototype = new damoSelectBoxColor();

function damoSelectBoxAlign() {
    this.items = {
        0: "left",
        1: "center",
        2: "right",
        3: "justify"
    };
    var itemsClass = [],
        selectedValue = 0;
    this.panelwidth = 30;
    this.init = function(parent, buttonInfo) {
        this.initialize(parent, buttonInfo);
        this.setPanel();
        return this;
    };
    this.setItem = function(item, value, key) {
        btn = new DamoButton(this.editor, editorConfig.buttons[value], false);
        item.appendChild(btn.button);
        itemsClass[key] = btn;
        damoUtil.removeClass(item, "damoSelectButtonItem");
    };
    this.selectedItemEvent = function(inx) {
        selectedValue = parseInt(inx);
        var pos = damoUtil.getStyle(itemsClass[selectedValue].button, "background-position-x");
        damoUtil.setStyle(this.button.selecttitle, {
            backgroundPosition: pos + " 0px"
        });
    }, this.damoSelectButtonClick = function() {
        itemsClass[selectedValue].button.click();
    };
}
damoSelectBoxAlign.prototype = new damoSelectButton();

function damoButtonExt() {
    this.init = function(parent, buttonInfo, btnClass) {
        this.editor = parent;
        this.button = btnClass;
        return this;
    }
    this.buttonClick = function(button) {
        this.editor.focus();
        if (damoUtil.hasClass(this.button.button, 'buttonDisable')) {
            this.hide();
            return;
        }
        if (!this.panel) {
            this.setPanel();
        }
        if (this.panel.style.display === "none") {
            this.show();
        } else {
            this.hide();
        }
    };
}
damoButtonExt.prototype.show = function() {
    this.editor.closePanels(this.button.button.parentNode);
    this.panel.style.display = "block";
    this.calcPanelPosition(this.panel);
    this.showPanel();
}
damoButtonExt.prototype.hide = function() {
    this.panel.style.display = "none";
}
damoButtonExt.prototype.addPanel = function() {
    panel = damoUtil.createElement("div", this.editor.toolbar, "damoSelectBoxPanel");
    panel.style.display = "none";
    this.calcPanelPosition(panel);
    return panel;
}
damoButtonExt.prototype.calcPanelPosition = function(panel) {
    var btn = this.button.button;
    btn.parentNode.appendChild(panel);
    var pos = damoUtil.getElementPosition(btn);
    var w = damoUtil.getStyleI(this.editor.toolbar, "width");
    if (pos.left + this.panelwidth > w) {
        pos.left = (pos.left - this.panelwidth)
    }
    damoUtil.setStyle(panel, {
        left: pos.left + C_PX,
        top: (pos.top + btn.offsetHeight) + C_PX,
        width: this.panelwidth + C_PX
    });
}

function damoButtonTable() {
    this.panelwidth = 170;
    this.showPanel = function() {
        this.selectArea(null, 0, 0);
    }
    this.setPanel = function() {
        this.panel = this.addPanel();
        this.table = damoUtil.createElement("table", this.panel, "tablePicker");
        damoUtil.addEvent(this.table, "mouseleave", this.mouseleave.closureListener(this));
        var row = damoUtil.createElement("tr", this.table);
        this.tablePickerDsp = damoUtil.createElement("td", row, "tablePickerDsp");
        this.tablePickerDsp.innerHTML = "&nbsp;";
        this.tablePickerDsp.colSpan = 10;
        for (var i = 0; i < 10; i++) {
            var row = damoUtil.createElement("tr", this.table);
            for (var j = 0; j < 10; j++) {
                var td = damoUtil.createElement("td", row, "tablePickerCell");
                damoUtil.addEvent(td, "mousedown", this.mousedown.closureListener(this));
                damoUtil.addEvent(td, "mousemove", this.mousemove.closureListener(this));
            }
        }
        var btn = damoUtil.createElement("button", this.panel);
        btn.setAttribute('type', 'button');
        btn.innerHTML = this.editor.DamoMessage.table.title;
        damoUtil.addEvent(btn, "click", this.makeTableBtnClick.closureListener(this));
    };
    this.makeTableBtnClick = function() {
        var dialog = new DamoDialogTable().init(this.editor);
        dialog.open();
    };
    this.mouseleave = function(ev) {
        this.selectArea(null, 0, 0);
    };
    this.mousedown = function(ev) {
        var td = ev.target;
        var y = td.parentNode.rowIndex;
        var x = td.cellIndex + 1;
        var td = rangeUtil.findTag(damoUtil.getRange().startContainer, "TD");
        var tableCss = {
            "width": tableWidth + C_PX,
            border: "0px",
            "border-collapse": "collapse",
            "border-spacing": "0px"
        };
        var tableWidth = 0;
        if (td) {
            tableWidth = parseInt(damoUtil.getStyle(td, "width")) - 10;
        } else {
            tableWidth = parseInt(damoUtil.getStyle(this.editor.editor, "width")) - 30;
        }
        var tdCss = {
            "width": Math.round(tableWidth / x) + C_PX,
            border: "1px solid",
            "word-break": "break-all"
        };
        var table = damoMakeTable(damoUtil.getRange(), x, y, tableCss, tdCss);
        this.editor.closePanels();
        this.editor.undoRecord(table);
    };
    this.mousemove = function(ev) {
        var td = ev.target;
        var y = td.parentNode.rowIndex;
        var x = td.cellIndex;
        this.selectArea(td, x, y);
    };
    this.selectArea = function(td, x, y) {
        this.tablePickerDsp.innerHTML = (x + 1) + " * " + y;
        for (var i = 1; i <= 10; i++) {
            var row = this.table.rows[i];
            for (var j = 0; j < 10; j++) {
                if (i <= y & j <= x)
                    row.cells[j].style.backgroundColor = "#85D3F1";
                else row.cells[j].style.backgroundColor = "white";
            }
        }
    };
}
damoButtonTable.prototype = new damoButtonExt();
var damoActiveDialog = null;

function DamoDialog() {
    this.st = null;
    this.initialize = function(parent) {
        this.editor = parent;
    };
    this.headMousedown = function(event) {
        this.st = {
            x: event.pageX,
            y: event.pageY
        };
        damoActiveDialog = this;
    };
    this.headMouseup = function() {
        if (damoActiveDialog) damoActiveDialog.st = null;
    };
    this.headMousemove = function(event) {
        if (!damoActiveDialog || !damoActiveDialog.st) return;
        var x = event.pageX - damoActiveDialog.st.x;
        var y = event.pageY - damoActiveDialog.st.y;
        damoActiveDialog.dialog.style.left = (parseInt(damoActiveDialog.dialog.style.left) + x) + C_PX;
        damoActiveDialog.dialog.style.top = (parseInt(damoActiveDialog.dialog.style.top) + y) + C_PX;
        damoActiveDialog.st = {
            x: event.pageX,
            y: event.pageY
        };
    };
}
DamoDialog.prototype.show = function(html) {
    this.saveRange();
    this.editor.editor.blur();
    this.damoDialog = damoUtil.createElement("div", document.body, "damoDialog");
    this.dialog = damoUtil.createElement("div", this.damoDialog, "dialog");
    this.head = damoUtil.createElement("div", this.dialog, "head", "mousedown", this.headMousedown.closure(this));
    this.head.innerText = this.title;
    this.dialogBody = damoUtil.createElement("div", this.dialog, "dialogBody");
    var closebtn = damoUtil.createElement("a", this.dialog, "closebtn", "mousedown", this.close.closure(this));
    closebtn.innerText = " ";
    var pos = damoUtil.getElementPosition2(this.editor.editor);
    var l = (pos.left - (document.documentElement.scrollLeft || document.body.scrollLeft)) + (damoUtil.getStyleI(this.editor.editor, "width") - parseInt(this.width)) / 2;
    if (l < 0) t = 10;
    var t = pos.top - (document.documentElement.scrollTop || document.body.scrollTop);
    var h1 = damoUtil.getStyleI(this.editor.editor, "height");
    var h2 = parseInt(this.height);
    if (h1 < h2) t -= (h2 - h1) / 2;
    if (t < 0) t = 50;
    damoUtil.setStyle(this.dialog, {
        width: this.width,
        "min-height": this.height,
        top: t + C_PX,
        left: l + C_PX
    });
    damoUtil.addEvent(window, "mouseup", this.headMouseup);
    damoUtil.addEvent(window, "mousemove", this.headMousemove);
    this.dialogBody.innerHTML = html;
    damoUtil.addEventByClass("damoSubmitBtn", "click", this.sumit.closure(this));
    damoUtil.addEventByClass("damoCancelBtn", "click", this.close.closure(this));
    if (this.editor.options.colors) {
        damoUtil.setStyle(this.dialog, {
            "border-color": this.editor.options.colors.editorBorder
        });
        damoUtil.setStyle(this.dialog, {
            "background": this.editor.options.colors.toolbarStart
        });
    }
};
DamoDialog.prototype.close = function() {
    this.damoDialog.parentNode.removeChild(this.damoDialog);
    this.editor.editor.focus();
    if (this.selection) this.selection.addRange(this.linkRange);
    this.linkRange = this.selection = null;
};
DamoDialog.prototype.sumit = function() {
    if (this.submitEvent()) this.close();
};
DamoDialog.prototype.saveRange = function() {
    this.editor.focus();
    this.linkRange = damoUtil.getRange();
    this.selection = damoUtil.getSelection();
};
DamoDialog.prototype.undoRecord = function(elm) {
    this.editor.undoRecord();
};

function damoDialogLink() {
    this.init = function(parent) {
        this.initialize(parent);
        return this;
    };
    this.open = function() {
        var html = "<div id='damoDialogMain' class='damoDialogMain'>" + "<label class='label'>URL</label><input type='text' id='damoUrl' class='textBox' value='http://'><p/>" + "<label class='label'>" + this.editor.DamoMessage.link.text + "</label><input type='text' id='damoUrlTitle' class='textBox'><p/>" + "<input type='checkbox' id='damoUrlNew' value='Y'> " + this.editor.DamoMessage.link.newWindow + "<p/>" + "</div><div id='damoDialogBottom' class='damoDialogBottom'><div class='damoSubmitBtn'>" + this.editor.DamoMessage.dialog.makeBtn + "</div> <div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.cancelBtn + "</div></div>";
        var linkRange = damoUtil.getRange();
        this.link = rangeUtil.findTag(linkRange.startContainer, "^A");
        if (!this.link && linkRange.collapsed) {
            alert(this.editor.DamoMessage.link.msg);
            return;
        }
        this.width = "340px";
        this.height = "180px";
        this.title = this.editor.DamoMessage.buttons.link;
        this.show(html);
        if (this.link) {
            damoUtil.getElm("damoUrl").value = this.link.getAttribute("href");
            damoUtil.getElm("damoUrlNew").checked = this.link.getAttribute("target") !== null;
            damoUtil.getElm("damoUrlTitle").value = this.link.getAttribute("title");
            var p = damoUtil.getElm("damoDialogBottom");
            var unlink = damoUtil.createElement("div", p, "damoControlBtn", "click", this.unlinkClick.closure(this));
            unlink.innerHTML = this.editor.DamoMessage.link.unlink;
        }
    };
    this.submitEvent = function() {
        var damoUrl = damoUtil.getElm("damoUrl");
        var damoUrlNew = damoUtil.getElm("damoUrlNew");
        var damoUrlTitle = damoUtil.getElm("damoUrlTitle");
        if (this.link) {
            this.link.setAttribute("href", damoUrl.value);
            this.link.setAttribute("target", damoUrlNew.checked ? "blank_" : "");
            return;
        }
        var selectedTag = this.linkRange.extractContents();
        var elm = damoUtil.createElement("A");
        if (selectedTag.textContent === "") {
            elm.appendChild(selectedTag);
        } else {
            elm.innerHTML = selectedTag.textContent;
            elm.setAttribute("title", selectedTag.textContent);
        }
        elm.setAttribute("href", damoUrl.value);
        if (damoUrlNew.checked) elm.setAttribute("target", "blank_");
        if (damoUrlTitle.value) elm.setAttribute("title", damoUrlTitle.value);
        this.linkRange.deleteContents();
        this.linkRange.insertNode(elm);
        this.undoRecord(elm);
        return true;
    };
    this.unlinkClick = function() {
        damoUtil.setSelection2(this.selection, this.linkRange, this.link);
        document.execCommand("unlink", false, null);
        this.editor.undoRecord();
        this.close();
    };
}
damoDialogLink.prototype = new DamoDialog();

function damoDialogChar() {
    var items = ["｝〔〕〈〉《》「」『』【】‘’“”、。·‥…§※☆★○●◎◇◆□■△▲▽▼◁◀▷▶♤♠♡♥♧♣⊙◈▣◐◑▒▤▥▨▧▦▩±×÷≠≤≥∞∴°′″∠⊥⌒∂≡≒≪≫√∽∝∵∫∬∈∋⊆⊇⊂⊃∪∩∧∨￢⇒⇔∀∃´～ˇ˘˝˚˙¸˛¡¿ː∮∑∏♭♩♪♬㉿→←↑↓↔↕↗↙↖↘㈜№㏇™㏂㏘℡♨☏☎☜☞¶†‡®ªº♂♀", "½⅓⅔¼¾⅛⅜⅝⅞¹²³⁴ⁿ₁₂₃₄ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅰⅱⅲⅳⅴⅵⅶⅷⅸⅹ￦$￥￡€℃A℉￠¤‰㎕㎖㎗ℓ㎘㏄㎣㎤㎥㎦㎙㎚㎛㎜㎝㎞㎟㎠㎡㎢㏊㎍㎎㎏㏏㎈㎉㏈㎧㎨㎰㎱㎲㎳㎴㎵㎶㎷㎸㎹㎀㎁㎂㎃㎄㎺㎻㎼㎽㎾㎿㎐㎑㎒㎓㎔Ω㏀㏁㎊㎋㎌㏖㏅㎭㎮㎯㏛㎩㎪㎫㎬㏝㏐㏓㏃㏉㏜㏆", "㉠㉡㉢㉣㉤㉥㉦㉧㉨㉩㉪㉫㉬㉭㉮㉯㉰㉱㉲㉳㉴㉵㉶㉷㉸㉹㉺㉻ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮㈀㈁㈂㈃㈄㈅㈆㈇㈈㈉㈊㈋㈌㈍㈎㈏㈐㈑㈒㈓㈔㈕㈖㈗㈘㈙㈚㈛⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂"];
    this.init = function(parent) {
        this.initialize(parent);
        this.activeInx = 0;
        return this;
    };
    this.open = function() {
        var html = "<div id='damoTab' class='damoTab'>" + "<div id='damoTabHead0'class='damoTabHead'>" + this.editor.DamoMessage.specialChar.tabHead1 + "</div>" + "<div id='damoTabHead1' class='damoTabHead'>" + this.editor.DamoMessage.specialChar.tabHead2 + "</div>" + "<div id='damoTabHead2' class='damoTabHead'>" + this.editor.DamoMessage.specialChar.tabHead3 + "</div>" + "<div id='damoTabBody' class='damoTabBody'></div></div>" + "<div class='damoDialogBottom'>" + "<input type='text' id='damoSelectChar' class='damoSelectChar' readonly='readonly'/>" + "<div class='damoSubmitBtn'>" + this.editor.DamoMessage.dialog.confirmBtn + "</div><div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.cancelBtn + "</div>" + "</div>";
        this.width = "500px";
        this.height = "284px";
        this.title = this.editor.DamoMessage.buttons.specialChar;
        this.show(html);
        this.damoTabChange(0);
        this.damoSelectChar = damoUtil.getElm('damoSelectChar');
        for (var i = 0; i < 3; i++) {
            var damoTabHead = damoUtil.getElm('damoTabHead' + i);
            damoUtil.addEvent(damoTabHead, 'click', this.damoTabChange.closure(this, i.toString()));
        }
    };
    this.submitEvent = function() {
        if (this.damoSelectChar.value === "") return false;
        var elm = document.createTextNode(this.damoSelectChar.value);
        this.linkRange.insertNode(elm);
        this.selection.addRange(this.linkRange);
        this.undoRecord(elm);
        return true;
    };
    this.damoTabChange = function(inx) {
        var damoTabBody = damoUtil.getElm('damoTabBody');
        damoUtil.removeAllChild(damoTabBody);
        for (var i = 0; i < items[inx].length; i++) {
            if (items[inx][i] === ",") continue;
            var item = damoUtil.createElement("div", damoTabBody, "damoTabItem");
            item.innerText = items[inx][i];
            damoUtil.addEvent(item, 'click', this.damoTabItemClick.closure(item));
        }
        damoUtil.removeClass(damoUtil.getElm('damoTabHead' + this.activeInx), "damoTabActive");
        damoUtil.addClass(damoUtil.getElm('damoTabHead' + inx), "damoTabActive");
        this.activeInx = inx;
    };
    this.damoTabItemClick = function() {
        var damoSelectChar = damoUtil.getElm("damoSelectChar");
        damoSelectChar.value += this.innerText;
    };
}
damoDialogChar.prototype = new DamoDialog();

function damoDialogEmoticon() {
    this.init = function(parent) {
        this.initialize(parent);
        return this;
    };
    this.open = function() {
        var html = "<div id='damoDialogMain' class='damoDialogMain'>" + "</div><div id='damoDialogBottom' class='damoDialogBottom'><div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.closeBtn + "</div></div>";
        this.width = "500px";
        this.height = "270px";
        this.title = this.editor.DamoMessage.buttons.emoticon;
        this.show(html);
        var damoDialogMain = damoUtil.getElm('damoDialogMain');
        for (var i = 1; i < 79; i++) {
            var item = damoUtil.createElement("div", damoDialogMain, "damoEmoticonItem");
            damoUtil.setStyle(item, {
                "background-image": "url('" + damoScriptPath + "images/emoticon/icon" + i + ".gif')"
            });
            damoUtil.addEvent(item, 'click', this.itemClick.closure(this, item));
        }
    };
    this.itemClick = function(item) {
        var url = damoUtil.getStyle(item, "background-image");
        var img = damoUtil.createElement("IMG");
        img.setAttribute("src", url.replace(/(url\(|\)|")/g, ""));
        img.setAttribute("title", "Emoticon");
        img.setAttribute("alt", "Emoticon");
        this.linkRange.insertNode(img);
        this.selection.addRange(this.linkRange);
        this.undoRecord(img);
        this.close();
    };
}
damoDialogEmoticon.prototype = new DamoDialog();

function damoDialogImage() {
    var img = null;
    var damoImgTitle = null;
    var damoImgAlt = null;
    var thisObj = null;
    this.init = function(parent) {
        this.initialize(parent);
        return this;
    };
    this.open = function() {
        var html = "<div id='damoDialogMain' class='damoDialogMain'>" + "<div><label class='label'>" + this.editor.DamoMessage.image.file + "</label><input type='file' id='damoImgFile' name='damoImgFile' accept='image/*' class='textBox'/></div><br/>" + "<div><label class='label'>" + this.editor.DamoMessage.image.imgAlt + "</label><input type='text' id='damoImgAlt' class='textBox'/></div><br/>" + "<div><label class='label'>" + this.editor.DamoMessage.image.imgDesc + "</label><input type='text' id='damoImgTitle' class='textBox'/></div>" + "</div><div id='damoDialogBottom' class='damoDialogBottom'><div class='damoSubmitBtn'>" + this.editor.DamoMessage.dialog.confirmBtn + "</div> <div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.cancelBtn + "</div></div>";
        this.width = "340px";
        this.height = "230px";
        this.title = this.editor.DamoMessage.buttons.image;
        this.show(html);
        img = this.editor.activeElement;
        if (img && img.nodeName === "IMG") {
            var file = damoUtil.getElm("damoImgFile");
            var span = damoUtil.createElement("span", file.parentNode, "imageFile");
            span.innerHTML = img.getAttribute("src");
            span.setAttribute("title", img.src);
            damoUtil.getElm("damoImgAlt").value = img.getAttribute("title");
            damoUtil.getElm("damoImgTitle").value = img.getAttribute("alt");
        } else {
            img = null;
        }
    };
    this.submitEvent = function() {
        if (damoImgFile.value !== "" && damoImgFile.files && damoImgFile.files[0].size > this.editor.options.filesize) {
            alert(this.editor.DamoMessage.msg.filesize);
            return false;
        }
        damoImgTitle = damoUtil.getElm("damoImgTitle").value;
        damoImgAlt = damoUtil.getElm("damoImgAlt").value;
        if (damoImgFile.value === "") {
            if (img) {
                img.setAttribute("title", damoImgTitle);
                img.setAttribute("alt", damoImgAlt);
                this.undoRecord(img);
                damoUtil.setSelectionControl(img);
                return true;
            }
            return false;
        }
        var progress = damoUtil.createElement("div", damoImgFile.parentNode, 'progressbar4VideoFld');
        var progressbar = damoUtil.createElement("div", progress, 'progressbar4Video');
        damoUtil.setStyle(progressbar, {
            width: '0%'
        });
        thisObj = {
            "this": this,
            "range": this.linkRange
        };
        if (damoImgFile.files) {
            damoFileUploadByAjax(damoImgFile, this.editor.options.uploadURL, this.uploadResult, progressbar);
        } else {
            damoFileUpload(damoImgFile, this.editor.options.uploadURL, this.uploadResult);
        }
        return false;
    };
    this.uploadResult = function(result) {
        if (!img) {
            img = damoUtil.createElement("IMG");
            thisObj.range.insertNode(img);
            thisObj.this.editor.focus();
            var sel = damoUtil.getSelection();
            var range = damoUtil.getRange();
            damoUtil.setSelection2(sel, range, img);
        }
        img.setAttribute("src", result);
        if (damoImgTitle) img.setAttribute("title", damoImgTitle);
        if (damoImgTitle) img.setAttribute("alt", damoImgAlt);
        damoUtil.setStyle(img, {
            "max-width": "95%"
        });
        damoUtil.addEvent(img, 'load', imgLoad);
        thisObj.this.close();
    };
    var imgLoad = function() {
        thisObj.this.undoRecord(img);
    };
}
damoDialogImage.prototype = new DamoDialog();

function damoDialogFind() {
    this.init = function(parent) {
        this.initialize(parent);
        if (!this.damoFind) {
            this.damoFind = new DamoFind(this.editor);
        }
        return this;
    };
    this.open = function() {
        var html = "<div id='damoDialogMain' class='damoDialogMain'>" + "<div><label class='label'>" + this.editor.DamoMessage.find.findWord + "</label><input type='text' id='damoFindWord' class='textBox'/></div><br/>" + "<div><label class='label'>" + this.editor.DamoMessage.find.replaceWord + "</label><input type='text' id='damoReplaceWord' class='textBox'/></div>" + "<div><label class='label'></label><label><input type='checkbox' id='damoMatchcase' value='0'/> " + this.editor.DamoMessage.find.matchcase + "</label></div>" + "</div><div id='damoDialogBottom' class='damoDialogBottom'>" + "<div id='damoFindBtn' class='damoControlBtn'>" + this.editor.DamoMessage.find.findBtn + "</div><div id='damoReplaceBtn' class='damoControlBtn'>" + this.editor.DamoMessage.find.replaceBtn + "</div><div class='damoSubmitBtn'>" + this.editor.DamoMessage.find.replaceAllBtn + "</div> <div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.closeBtn + "</div></div>";
        this.width = "340px";
        this.height = "200px";
        this.title = this.editor.DamoMessage.buttons.find;
        this.show(html);
        this.selection = null;
        this.damoFindWord = damoUtil.getElm("damoFindWord");
        this.damoReplaceWord = damoUtil.getElm("damoReplaceWord");
        this.damoFindBtn = damoUtil.getElm("damoFindBtn");
        this.damoReplaceBtn = damoUtil.getElm("damoReplaceBtn");
        damoUtil.addEvent(this.damoFindBtn, 'click', this.Find.closure(this));
        damoUtil.addEvent(this.damoReplaceBtn, 'click', this.Replace.closure(this));
    };
    this.Find = function() {
        if (!damoUtil.inputCheck(this.damoFindWord, this.editor.DamoMessage.find.findMsg)) return false;
        var findWord = this.damoFind.setFindOption();
        if (this.selection) this.selection.addRange(this.linkRange);
        this.damoFind.findNext(findWord);
        this.saveRange();
    };
    this.Replace = function() {
        if (!damoUtil.inputCheck(this.damoFindWord, this.editor.DamoMessage.find.replacedMsg)) return false;
        if (!damoUtil.inputCheck(this.damoReplaceWord, this.editor.DamoMessage.find.replaceMsg)) return false;
        var findWord = this.damoFind.setFindOption();
        if (this.selection) this.selection.addRange(this.linkRange);
        this.damoFind.replaceNext(findWord, damoReplaceWord.value);
        this.saveRange();
        this.editor.undoRecord();
    };
    this.submitEvent = function() {
        if (!damoUtil.inputCheck(this.damoFindWord, this.editor.DamoMessage.find.findMsg)) return false;
        if (!damoUtil.inputCheck(this.damoReplaceWord, this.editor.DamoMessage.find.replaceMsg)) return false;
        var findWord = this.damoFind.setFindOption();
        this.damoFind.replaceAll(findWord, damoReplaceWord.value);
        this.editor.undoRecord();
        return true;
    };
}
damoDialogFind.prototype = new DamoDialog();

function damoDialogLayout() {
    this.init = function(parent) {
        this.initialize(parent);
        return this;
    };
    this.open = function() {
        var html = "<div id='damoDialogMain' class='damoDialogMain'>" + "</div><div id='damoDialogBottom' class='damoDialogBottom'>" + "<div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.closeBtn + "</div></div>";
        this.width = "340px";
        this.height = "410px";
        this.title = this.editor.DamoMessage.buttons.layout;
        this.show(html);
        var damoDialogMain = damoUtil.getElm("damoDialogMain");
        var table = damoUtil.createElement("table", damoDialogMain, "damoLayoutDialog");
        for (var i = 0; i < 4; i++) {
            var tr = damoUtil.createElement("tr", table);
            for (var j = 0; j < 4; j++) {
                var inx = i * 4 + j;
                var td = damoUtil.createElement("td", tr, null, 'click', this.LayoutClick.closureListener(this, inx));
                var span = damoUtil.createElement("span", td, "editorLayoutItem");
                damoUtil.setStyle(span, {
                    backgroundPosition: (inx * -64) + "px 0px"
                });
            }
        }
    };
    var layoutArr = ["<tr><td style='height: 50%;border-spacing: 10px;'>#msg#</td></tr><tr><td style='height: 50%;border-spacing: 10px;'>#msg#</td></tr>", "<tr><td style='width: 50%'>#msg#</td><td style='width: 50%'>#msg#</td></tr>", "<tr><td style='height: 33%'>#msg#</td></tr><tr><td style='height: 33%'>#msg#</td></tr><tr><td style='height: 33%'>#msg#</td></tr>", "<tr><td style='width: 33%'>#msg#</td><td style='width: 33%'>#msg#</td><td style='width: 33%'>#msg#</td></tr>", "<tr><td style='width: 50%; height: 50%;border-spacing: 10px;'>#msg#</td><td style='width: 50%; height: 50%;border-spacing: 10px;'>#msg#</td></tr><tr><td colspan='2' style='height: 50%;border-spacing: 10px;'>#msg#</td></tr>", "<tr><td colspan='2' style='height: 50%;border-spacing: 10px;'>#msg#</td></tr><tr><td style='width: 50%; height: 50%;border-spacing: 10px;'>#msg#</td><td style='width: 50%; height: 50%;border-spacing: 10px;'>#msg#</td></tr>", "<tr><td style='height: 50%;width: 50%'>#msg#</td><td rowspan='2'style='width: 50%'>#msg#</td></tr><tr><td style='height: 50%;width: 50%'>#msg#</td></tr>", "<tr><td rowspan='2' style='width: 50%'>#msg#</td><td style='width: 50%;height: 50%;'>#msg#</td></tr><tr><td style='height: 50%;width: 50%'>#msg#</td></tr>", "<tr><td style='width: 50%; height: 50%;border-spacing: 10px;'>#msg#</td><td style='width: 50%; height: 50%;border-spacing: 10px;'>#msg#</td></tr>" + "<tr><td style='width: 50%; height: 50%;border-spacing: 10px;'>#msg#</td><td style='width: 50%; height: 50%;border-spacing: 10px;'>#msg#</td></tr>", "<tr><td style='height: 25%'>#msg#</td></tr><tr><td style='height: 25%'>#msg#</td></tr><tr><td style='height: 25%'>#msg#</td></tr><tr><td style='height: 25%'>#msg#</td></tr>", "<tr><td colspan='2' style='height: 25%'>#msg#</td></tr><tr><td style='height: 50%;width:50%'>#msg#</td><td style='height: 50%;width:50%'>#msg#</td></tr><tr><td colspan='2' style='height: 25%'>#msg#</td></tr>", "<tr><td colspan='3' style='height: 25%;border-spacing: 10px;'>#msg#</td></tr>" + "<tr><td style='width: 33%; height: 75%;'>#msg#</td><td style='width: 33%'>#msg#</td><td style='width: 33%'>#msg#</td></tr>", "<tr><td style='height: 20%'>#msg#</td></tr><tr><td style='height: 20%'>#msg#</td></tr><tr><td style='height: 20%'>#msg#</td></tr><tr><td style='height: 20%'>#msg#</td></tr><tr><td style='height: 20%'>#msg#</td></tr>", "<tr><td rowspan='4' style='height: 100%; width: 20%'>#msg#</td><td style='height: 25%'>#msg#</td></tr><tr><td style='height: 25%'>#msg#</td></tr><tr><td style='height: 25%'>#msg#</td></tr><tr><td style='height: 25%'>#msg#</td></tr>", "<tr><td colspan='2' style='height: 25%'>#msg#</td></tr>" + "<tr><td rowspan='3' style='height: 100%; width: 20%'>#msg#</td><td style='height: 25%'>#msg#</td></tr><tr><td style='height: 25%'>#msg#</td></tr><tr><td style='height: 25%'>#msg#</td></tr>", "<tr><td colspan='2' style='height: 25%'>#msg#</td></tr>" + "<tr><td rowspan='2' style='height: 100%; width: 20%'>#msg#</td><td style='height: 25%'>#msg#</td></tr><tr><td style='height: 25%'>#msg#</td></tr>" + "<tr><td colspan='2' style='height: 25%'>#msg#</td></tr>"];
    this.LayoutClick = function(ev, button, inx) {
        if (!damoNewClick.apply(this)) return;
        this.editor.editor.innerHTML = "<p><table class='damoLayoutInput damoLayoutDot' style='width: 100%; height: 700px; border-spacing: 10px;'>" +
            layoutArr[inx].replace(/#msg#/g, "<p>" + this.editor.DamoMessage.layout.inputMsg + "</p>") + "</table></p>";
        this.editor.undoManager.clearUndo(this.editor.editor.innerHTML);
        this.close();
        var el = document.getElementsByClassName("damoLayoutInput");
        damoUtil.setSelectText(damoUtil.getSelection(), el[0].firstChild.firstChild.firstChild.firstChild);
    };
}
damoDialogLayout.prototype = new DamoDialog();
var damoMakeUtil = {
    makeColumn: function(damoDialogMain, label, value, disabled) {
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField");
        var lbl = damoUtil.createElement("label", settingField, "inputSpinLabel");
        lbl.innerHTML = label;
        var inputSpin = damoUtil.createElement("div", settingField, "inputSpin");
        var txt = damoUtil.createElement("input", inputSpin, "inputSpinTxt", "keydown", damoUtil.onlyNumber);
        txt.value = value;
        if (!disabled) {
            var spinButton = damoUtil.createElement("div", inputSpin, "spinButton");
            var spinUp = damoUtil.createElement("span", spinButton, "spinUp", 'click', this.spinClick.closure(txt, 1));
            var spinDown = damoUtil.createElement("span", spinButton, "spinDown", 'click', this.spinClick.closure(txt, -1));
        } else {
            txt.disabled = true;
        }
        return txt;
    },
    makeTextColumn: function(damoDialogMain, label) {
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField");
        var lbl = damoUtil.createElement("label", settingField, "inputSpinLabel");
        lbl.innerHTML = label;
        var txt = damoUtil.createElement("input", settingField, "inputText");
        return txt;
    },
    makeSelectBox: function(damoDialogMain, label, SelectBoxClass) {
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField");
        var lbl = damoUtil.createElement("label", settingField, "inputSpinLabel");
        lbl.innerHTML = label;
        var selectBox = new SelectBoxClass();
        selectBox.init(settingField, {});
        return selectBox;
    },
    spinClick: function(value) {
        this.value = damoUtil.parseInt(this.value) + value;
        if (this.value === "-1") this.value = "0";
    }
}

function DamoDialogBasic4Table() {
    this.init = function(parent) {
        this.initialize(parent);
        return this;
    };
    this.open = function(table) {};
    this.makeColumn = function(damoDialogMain, label, value, disabled) {
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField");
        var lbl = damoUtil.createElement("label", settingField, "inputSpinLabel");
        lbl.innerHTML = label;
        var inputSpin = damoUtil.createElement("div", settingField, "inputSpin");
        var txt = damoUtil.createElement("input", inputSpin, "inputSpinTxt", "keydown", damoUtil.onlyNumber);
        txt.value = value;
        if (!disabled) {
            var spinButton = damoUtil.createElement("div", inputSpin, "spinButton");
            var spinUp = damoUtil.createElement("span", spinButton, "spinUp", 'click', this.spinClick.closure(txt, 1));
            var spinDown = damoUtil.createElement("span", spinButton, "spinDown", 'click', this.spinClick.closure(txt, -1));
        } else {
            txt.disabled = true;
        }
        return txt;
    };
    this.makeTextColumn = function(damoDialogMain, label) {
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField");
        var lbl = damoUtil.createElement("label", settingField, "inputSpinLabel");
        lbl.innerHTML = label;
        var txt = damoUtil.createElement("input", settingField, "inputText");
        return txt;
    };
    this.makeSelectBox = function(damoDialogMain, label, SelectBoxClass) {
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField");
        var lbl = damoUtil.createElement("label", settingField, "inputSpinLabel");
        lbl.innerHTML = label;
        var selectBox = new SelectBoxClass();
        selectBox.init(settingField, {});
        return selectBox;
    };
    this.spinClick = function(value) {
        this.value = damoUtil.parseInt(this.value) + value;
        if (this.value === "-1") this.value = "0";
    };
}
DamoDialogBasic4Table.prototype = new DamoDialog();

function DamoDialogTable() {
    this.open = function(table) {
        var html = "<div id='damoDialogMain' class='damoDialogMain'></div>" + "<div id='damoDialogBottom' class='damoDialogBottom'><div class='damoSubmitBtn'>" + this.editor.DamoMessage.dialog.confirmBtn + "</div> <div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.cancelBtn + "</div></div>";
        this.width = "400px";
        this.height = "280px";
        this.title = this.editor.DamoMessage.table.title;
        this.show(html);
        this.selectedTable = table;
        var damoDialogMain = damoUtil.getElm("damoDialogMain");
        this.tableRow = this.makeColumn(damoDialogMain, this.editor.DamoMessage.table.row, 5, table);
        this.tableWidth = this.makeColumn(damoDialogMain, this.editor.DamoMessage.table.width, "");
        this.tableColumn = this.makeColumn(damoDialogMain, this.editor.DamoMessage.table.column, 4, table);
        this.tableHeight = this.makeColumn(damoDialogMain, this.editor.DamoMessage.table.height, "");
        this.tableBorder = this.makeSelectBox(damoDialogMain, this.editor.DamoMessage.table.border, damoSelectBoxLinetype4Table);
        this.tableBorderWidth = this.makeColumn(damoDialogMain, this.editor.DamoMessage.table.borderWidth, 1);
        this.borderColor = this.makeSelectBox(damoDialogMain, this.editor.DamoMessage.table.borderColor, damoSelectBoxLineColor4Table);
        this.bgColor = this.makeSelectBox(damoDialogMain, this.editor.DamoMessage.table.bgColor, damoSelectBoxLineColor4Table);
        this.tableCellSpace = this.makeColumn(damoDialogMain, this.editor.DamoMessage.table.cellSpace, 0);
        this.tableCellPad = this.makeColumn(damoDialogMain, this.editor.DamoMessage.table.cellPad, 1);
        this.borderColor.selectedItemEvent("#000000");
        this.bgColor.selectedItemEvent("#FFFFFF");
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField");
        var lbl = damoUtil.createElement("label", settingField);
        lbl.innerHTML = this.editor.DamoMessage.table.seperateBorder;
        this.collapse = damoUtil.createElement("input", lbl);
        this.collapse.type = "checkbox";
        damoUtil.createElement("br", damoDialogMain);
        this.caption = this.makeTextColumn(damoDialogMain, this.editor.DamoMessage.table.caption);
        this.summary = this.makeTextColumn(damoDialogMain, this.editor.DamoMessage.table.summary);
        if (!table) return;
        this.tableRow.value = table.rows.length;
        this.tableWidth.value = damoUtil.getStyleI(table, "width");
        this.tableColumn.value = table.rows[0].cells.length;
        this.tableHeight.value = damoUtil.getStyleI(table, "height");
        this.tableBorder.setValue(damoUtil.getStyleA(table, "border-top-style"));
        this.tableBorderWidth.value = parseFloat(damoUtil.getStyleA(table, "border-top-width"));
        this.borderColor.setValue(damoUtil.getStyleA(table, "border-top-color"));
        this.bgColor.setValue(damoUtil.getStyleA(table, "background-color"));
        this.tableCellSpace.value = damoUtil.getStyleAI(table, "border-spacing");
        this.tableCellPad.value = damoUtil.getStyleAI(table, "padding");
        this.collapse.checked = damoUtil.getStyle(table, "border-collapse") !== "collapse";
        if (table.caption) {
            this.caption.value = table.caption.innerHTML;
        }
        this.summary.value = table.summary;
    };
    this.submitEvent = function() {
        var y = this.tableRow.value;
        var x = this.tableColumn.value;
        if (y > 60 || x > 40) {
            alert(this.editor.DamoMessage.table.restrictCellMsg);
            return;
        }
        if (this.selectedTable) {
            return this.modifyTable();
        }
        return this.makeTable();
    };
    this.modifyTable = function() {
        damoUtil.setStyle(this.selectedTable, this.makeCSS(this.calWidth()));
        if (!this.selectedTable.caption) {
            this.selectedTable.createCaption();
        }
        this.selectedTable.caption.innerHTML = this.caption.value;
        this.selectedTable.summary = this.summary.value;
        this.undoRecord(this.selectedTable);
        return true;
    };
    this.makeTable = function() {
        var y = this.tableRow.value;
        var x = this.tableColumn.value;
        if (x === "0" || y === "0") {
            alert(this.editor.DamoMessage.table.InputMsg);
            return false;
        }
        var tableWidth = this.calWidth();
        var td = rangeUtil.findTag(this.linkRange.startContainer, "TD");
        var td_width = Math.round(tableWidth / x) + C_PX;
        var tableCss = this.makeCSS(tableWidth);
        var tdCss = {
            "width": td_width,
            border: "1px solid black",
            "word-break": "break-all"
        };
        var elm = damoMakeTable(this.linkRange, x, y, tableCss, tdCss);
        this.undoRecord(elm);
        return true;
    };
    this.calWidth = function() {
        var tableWidth = this.tableWidth.value;
        if (damoUtil.parseInt(tableWidth) > 0) {
            tableWidth = tableWidth;
        } else {
            var td = rangeUtil.findTag(this.linkRange.startContainer, "TD");
            tableWidth = td ? parseInt(damoUtil.getStyle(td, "width")) - 10 : parseInt(damoUtil.getStyle(this.editor.editor, "width")) - 30;
        }
        return tableWidth;
    };
    this.makeCSS = function(tableWidth) {
        var css = {
            "width": tableWidth + C_PX,
            "border": this.tableBorderWidth.value + "px " + this.tableBorder.getValue() + " " + this.borderColor.selectedValue,
            "background-color": this.bgColor.selectedValue,
            "border-spacing": this.tableCellSpace.value + C_PX,
            "padding": this.tableCellPad.value + C_PX
        };
        var tableHeight = this.tableHeight.value;
        if (damoUtil.parseInt(tableHeight) > 0) {
            css.height = tableHeight + C_PX;
        }
        css["border-collapse"] = this.collapse.checked ? "separate" : "collapse";
        return css;
    };
}
DamoDialogTable.prototype = new DamoDialogBasic4Table();

function damoMakeTable(range, x, y, tableCss, tdCss) {
    var table = damoUtil.createElement("table", null);
    damoUtil.setStyle(table, tableCss);
    for (var i = 0; i < y; i++) {
        var row = damoUtil.createElement("tr", table);
        for (var j = 0; j < x; j++) {
            var td = damoUtil.createElement("td", row);
            damoUtil.setStyle(td, tdCss);
            td.innerHTML = "<p>" + damoUtil.getBlankChar() + "</p>";
        }
    }
    range.insertNode(table);
    return table;
}

function DamoDialogTableCell() {
    this.open = function(tableEditor) {
        var align_arr = {
            left: this.editor.DamoMessage.tableCell.left,
            right: this.editor.DamoMessage.tableCell.right,
            center: this.editor.DamoMessage.tableCell.center,
            justify: this.editor.DamoMessage.tableCell.justify
        };
        var valign_arr = {
            top: this.editor.DamoMessage.tableCell.top,
            middle: this.editor.DamoMessage.tableCell.middle,
            bottom: this.editor.DamoMessage.tableCell.bottom
        };
        var wordbreak_arr = {
            normal: this.editor.DamoMessage.tableCell.wordbreak_normal,
            "break-all": this.editor.DamoMessage.tableCell.wordbreak_all
        };
        this.border_arr = {
            left: 1,
            right: 1,
            top: 1,
            middle: 1
        };
        var html = "<div id='damoDialogMain' class='damoDialogMain'></div>" + "<div id='damoDialogBottom' class='damoDialogBottom'><div class='damoSubmitBtn'>" + this.editor.DamoMessage.dialog.confirmBtn + "</div> <div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.cancelBtn + "</div></div>";
        this.width = "400px";
        this.height = "320px";
        this.title = this.editor.DamoMessage.tableCell.title;
        this.show(html);
        this.selectedCell = tableEditor.selectList[0];
        this.selectList = tableEditor.selectList;
        this.tableEditor = tableEditor;
        var damoDialogMain = damoUtil.getElm("damoDialogMain");
        this.align = this.makeSelectBoxTag(damoDialogMain, this.editor.DamoMessage.tableCell.align, align_arr);
        this.wordbreak = this.makeSelectBoxTag(damoDialogMain, this.editor.DamoMessage.tableCell.wordbreak, wordbreak_arr);
        this.valign = this.makeSelectBoxTag(damoDialogMain, this.editor.DamoMessage.tableCell.valign, valign_arr);
        damoUtil.createElement("hr", damoDialogMain);
        this.tableBorder = this.makeSelectBox(damoDialogMain, this.editor.DamoMessage.tableCell.tableBorder, damoSelectBoxLinetype4Table);
        this.tableBorderWidth = this.makeColumn(damoDialogMain, this.editor.DamoMessage.tableCell.tableBorderWidth, 1);
        this.borderColor = this.makeSelectBox(damoDialogMain, this.editor.DamoMessage.tableCell.borderColor, damoSelectBoxLineColor4Table);
        this.bgColor = this.makeSelectBox(damoDialogMain, this.editor.DamoMessage.tableCell.bgColor, damoSelectBoxLineColor4Table);
        this.tableCellPad = this.makeColumn(damoDialogMain, this.editor.DamoMessage.tableCell.tableCellPad, 1);
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField damoEditorCellProp");
        var outline = damoUtil.createElement("div", settingField, "damoEditorCellPropOutline");
        var outlineLeft = damoUtil.createElement("div", outline, "damoEditorCellPropOutlineLeft");
        var hTop = damoUtil.createElement("div", outlineLeft, "damoEditorCellPropHandlerTop");
        var hBottom = damoUtil.createElement("div", outlineLeft, "damoEditorCellPropHandlerBottom");
        this.propPreview = damoUtil.createElement("div", outline, "damoEditorCellPropPreview");
        var hLeft = damoUtil.createElement("div", outline, "damoEditorCellPropHandlerLeft");
        var hRight = damoUtil.createElement("div", outline, "damoEditorCellPropHandlerRight");
        damoUtil.addEvent(hTop, "click", this.previewClick.closureListener(this, "top"));
        damoUtil.addEvent(hBottom, "click", this.previewClick.closureListener(this, "bottom"));
        damoUtil.addEvent(hLeft, "click", this.previewClick.closureListener(this, "left"));
        damoUtil.addEvent(hRight, "click", this.previewClick.closureListener(this, "right"));
        this.getBorderStatus(this.selectedCell, hTop, "top");
        this.getBorderStatus(this.selectedCell, hBottom, "bottom");
        this.getBorderStatus(this.selectedCell, hLeft, "left");
        this.getBorderStatus(this.selectedCell, hRight, "right");
        this.align.value = damoUtil.getStyle(this.selectedCell, "text-align");
        this.wordbreak.value = damoUtil.getStyle(this.selectedCell, "word-break");
        this.valign.value = damoUtil.getStyle(this.selectedCell, "vertical-align");
        this.tableBorder.setValue(damoUtil.getStyleA(this.selectedCell, "border-top-style"));
        this.tableBorderWidth.value = parseFloat(damoUtil.getStyleA(this.selectedCell, "border-top-width"));
        this.borderColor.setValue(damoUtil.getStyleA(this.selectedCell, "border-top-color"));
        this.bgColor.setValue(damoUtil.getStyleA(this.selectedCell, "background-color"));
        this.tableCellPad.value = damoUtil.getStyleAI(this.selectedCell, "padding");
    };
    this.previewClick = function(ev, button, side) {
        var target = this.propPreview;
        var style = "border-" + side + "-style";
        if (target.style[style] === "dotted") {
            target.style[style] = "solid";
            button.style.backgroundColor = "#C0C0C0";
            this.border_arr[side] = 1;
        } else {
            target.style[style] = "dotted";
            button.style.backgroundColor = "#FFFFFF";
            this.border_arr[side] = 0;
        }
    };
    this.getBorderStatus = function(src, button, side) {
        var style = "border-" + side + "-style";
        var target = this.propPreview;
        if (src.style[style] === "solid") {
            target.style[style] = "solid";
            button.style.backgroundColor = "#C0C0C0";
            this.border_arr[side] = 1;
        } else {
            target.style[style] = "dotted";
            button.style.backgroundColor = "#FFFFFF";
            this.border_arr[side] = 0;
        }
    };
    this.makeSelectBoxTag = function(damoDialogMain, label, options) {
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField");
        var lbl = damoUtil.createElement("label", settingField, "inputSpinLabel");
        lbl.innerHTML = label;
        var selectbox = damoUtil.createElement("select", settingField, "damoSelect");
        for (var key in options) {
            var val = options[key];
            selectbox.options[selectbox.options.length] = new Option(val, key);
        }
        return selectbox;
    };
    this.submitEvent = function() {
        var css = this.makeCSS();
        for (var i = 0; i < this.selectList.length; i++) {
            var td = this.selectList[i];
            damoUtil.setStyle(td, css);
        }
        this.undoRecord(this.selectedCell);
        return true;
    };
    this.close = function() {
        this.editor.editor.focus();
        this.damoDialog.parentNode.removeChild(this.damoDialog);
        this.tableEditor.resetSelectList(this.selectList);
        return true;
    };
    this.makeCSS = function() {
        var css = {
            "text-align": this.align.value,
            "word-break": this.wordbreak.value,
            "vertical-align": this.valign.value,
            "border": this.tableBorderWidth.value + "px " + this.tableBorder.getValue() + " " + this.borderColor.selectedValue,
            "background-color": this.bgColor.selectedValue,
            "padding": this.tableCellPad.value + C_PX
        };
        if (this.border_arr.left + this.border_arr.right + this.border_arr.top + this.border_arr.middle !== 4) {
            for (var key in this.border_arr) {
                css["border-" + key + "-style"] = (this.border_arr[key] === 1) ? this.tableBorder.getValue() : "none";
            }
        }
        return css;
    };
}
DamoDialogTableCell.prototype = new DamoDialogBasic4Table();

function damoSelectBoxLinetype4Table() {
    this.isMenu = false;
    this.items = {
        0: "style='border: 1px'",
        1: "style='border: 1px solid'",
        2: "style='border: 1px dashed'",
        3: "style='border: 1px dotted'",
        4: "style='border: 3px double'"
    };
    this.itemsString = ["", "solid", "dashed", "dotted", "double"];
    this.width = "80px";
    this.selectedIndex = null;
    this.init = function(parent, buttonInfo) {
        this.initialize(parent, buttonInfo);
        this.selectedItemEvent(0);
        return this;
    };
    this.setItem = function(item, value, key) {
        item.innerHTML = "<HR " + value + ">";
    };
    this.selectedItemEvent = function(item) {
        this.selectedIndex = item;
        this.button.selecttitle.innerHTML = "<HR " + this.items[item] + ">";
    };
    this.getValue = function() {
        return this.itemsString[this.selectedIndex];
    };
    this.setValue = function(value) {
        for (var i = 0; i < this.itemsString.length; i++) {
            if (this.itemsString[i] === value) {
                this.selectedItemEvent(i);
                return;
            }
        }
        this.selectedItemEvent(0);
    };
    this.damoSelectButtonClick = function() {
        this.selectedItemEvent(this.selectedValue);
    };
}
damoSelectBoxLinetype4Table.prototype = new DamoSelectBox();

function damoSelectBoxLineColor4Table() {
    this.isMenu = false;
    this.init = function(parent, buttonInfo) {
        this.initialize(parent, buttonInfo, false);
        return this;
    };
    this.selectedItemEvent = function(item) {
        if (parseInt(item) < 100) {
            item = this.items[item];
        }
        this.selectedValue = item;
        damoUtil.setStyle(this.button.selecttitle, {
            "background-image": "none",
            "background-color": item
        });
    };
    this.setValue = function(item) {
        this.selectedItemEvent(item);
    };
    this.damoSelectButtonClick = function() {};
}
damoSelectBoxLineColor4Table.prototype = new damoSelectBoxColor();

function DamoFind(damoEditor) {
    var matchcase = false;
    var editor = damoEditor;
    var getNextElement = function(startNode, startPos, findWord) {
        if (!startNode || startNode.tagName == "BODY" || startNode.className == "damoEditor") {
            return null;
        }
        var node = startNode;
        do {
            var str = node.data;
            if (str && !matchcase) {
                str = str.toLowerCase();
            }
            if (node.nodeType === 3 && str.indexOf(findWord, startPos) > -1) {
                setSelectText(findWord, node, str.indexOf(findWord, startPos));
                return node;
            }
            if (node.firstChild) {
                for (var i = 0; i < node.childNodes.length; i++) {
                    return getNextElement(node.childNodes[i], 0, findWord);
                }
            }
        } while (node = node.nextSibling);
        return getNextElement(getParentSibiling(startNode), 0, findWord);
    };
    var getParentSibiling = function(node) {
        while (node = node.parentNode) {
            if (node.className == "damoEditor") {
                return null;
            }
            if (node.nextSibling) {
                return node.nextSibling;
            }
        }
        return null;
    };
    var setSelectText = function(findWord, node, pos) {
        if (editor.editor.scrollTop > node.parentNode.offsetTop || editor.editor.scrollTop + parseInt(editor.editor.style.height) < node.parentNode.offsetTop + 20) {
            editor.editor.scrollTop = node.parentNode.offsetTop - 20;
        }
        damoUtil.setSelectText(damoUtil.getSelection(), node, pos, pos + findWord.length);
    };
    var getTextElement = function(range) {
        if (range.endContainer.firstChild) return range.endContainer.firstChild;
        else return range.endContainer;
    };
    this.findNext = function(findWord) {
        var range = damoUtil.getRange();
        var src = getTextElement(range);
        if (!getNextElement(src, range.endOffset + 1, findWord)) {
            alert(editor.DamoMessage.find.notFindMsg);
        }
    };
    this.replaceNext = function(findWord, replaceWord) {
        var range = damoUtil.getRange();
        var src = getTextElement(range);
        var startPos = range.endOffset;
        var currentStr = src.data.substring(range.startOffset, range.endOffset);
        if ((matchcase && currentStr === findWord) || (!matchcase && currentStr.toLowerCase() === findWord)) {
            startPos = range.startOffset + replaceWord.length;
            var str = src.data;
            src.data = str.substring(0, range.startOffset) + replaceWord + str.substring(range.endOffset, str.length);
        }
        if (!getNextElement(src, startPos, findWord)) {
            alert(editor.DamoMessage.find.notFindMsg);
        }
    };
    this.replaceAll = function(findWord, replaceWord) {
        var node = editor.editor.firstChild,
            cnt = 0,
            startPos = 0;
        var reg = new RegExp(findWord, 'g' + (!matchcase ? 'i' : ''));
        while (node = getNextElement(node, startPos, findWord)) {
            var str = node.data;
            var results = str.match(reg);
            cnt += results.length;
            node.data = str.replace(reg, replaceWord);
            startPos = node.data.length;
        }
        alert(editor.DamoMessage.find.replacedMsg.replace("%1", cnt));
    };
    this.setFindOption = function() {
        var findWord = document.getElementById('damoFindWord').value;
        matchcase = document.getElementById('damoMatchcase').checked;
        if (!matchcase) {
            findWord = findWord.toLowerCase();
        }
        editor.editor.focus();
        return findWord;
    };
}

function damoDialogExternalMedia() {
    this.init = function(parent) {
        this.initialize(parent);
        return this;
    };
    this.open = function() {
        var html = "<div id='damoDialogMain' class='damoDialogMain'>" + "<div>" + this.editor.DamoMessage.externalMedia.desc + "</div><br/>" + "<div>" + this.editor.DamoMessage.externalMedia.source + "</div><br/>" + "<div><textarea id='damoMediaSource' style='width: 98%; height: 120px; border: 1px solid LightGray'></textarea></div><br/>" + "</div><div id='damoDialogBottom' class='damoDialogBottom'><div class='damoSubmitBtn'>" + this.editor.DamoMessage.dialog.confirmBtn + "</div> <div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.cancelBtn + "</div></div>";
        this.width = "470px";
        this.height = "350px";
        this.title = this.editor.DamoMessage.buttons.externalMedia;
        this.show(html);
    };
    this.submitEvent = function() {
        this.editor.focus();
        var damoMediaSource = damoUtil.getElm("damoMediaSource");
        var p = damoUtil.createElement("P");
        p.innerHTML = damoMediaSource.value;
        if (p.firstChild) {
            damoUtil.setStyle(p.firstChild, {
                "max-width": "95%"
            });
        }
        this.linkRange.insertNode(p);
        this.selection.addRange(this.linkRange);
        this.undoRecord(p);
        this.close();
    };
}
damoDialogExternalMedia.prototype = new DamoDialog();

function damoDialogMedia() {
    var img = null;
    var thisObj = null;
    this.init = function(parent) {
        this.initialize(parent);
        return this;
    };
    this.open = function() {
        var html = "<div id='damoDialogMain' class='damoDialogMain'>" + "<div><label class='label'>" + this.editor.DamoMessage.mediaFile.videoTag + "</label>" + "<label><input type='radio' name='damoVideoTag' value='video' checked/>HTML5 Video</label>" + "<label><input type='radio' name='damoVideoTag' value='embed'/>MediaPlayer(IE Only)</label></div><br/>" + "<div><label class='label'>" + this.editor.DamoMessage.image.file + "</label><input type='file' id='damoImgFile' name='damoImgFile' class='textBox' accept='.wmv, .mp4, .avi'/></div><br/>" + "<div id='damoDialogSub'></div><br/>" + "<div><label class='videoLabel'><input type='checkbox' name='damoVideoOption' value='autoplay' />" + this.editor.DamoMessage.mediaFile.autoplay + "</label>" + "<label class='videoLabel'><input type='checkbox' name='damoVideoOption' value='loop' />" + this.editor.DamoMessage.mediaFile.loop + "</label>" + "<label class='videoLabel'><input type='checkbox' name='damoVideoOption' value='controls' checked/>" + this.editor.DamoMessage.mediaFile.controls + "</label></div><br/>" + "</div><div id='damoDialogBottom' class='damoDialogBottom'><div class='damoSubmitBtn'>" + this.editor.DamoMessage.dialog.confirmBtn + "</div> <div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.cancelBtn + "</div></div>";
        this.width = "380px";
        this.height = "230px";
        this.title = this.editor.DamoMessage.buttons.mediaFile;
        this.show(html);
        var damoDialogSub = damoUtil.getElm("damoDialogSub");
        this.videoWidth = damoMakeUtil.makeColumn(damoDialogSub, this.editor.DamoMessage.table.width, 320, false);
        this.videoHeight = damoMakeUtil.makeColumn(damoDialogSub, this.editor.DamoMessage.table.height, 240, false);
    };
    this.submitEvent = function() {
        var damoImgFile = damoUtil.getElm("damoImgFile");
        if (damoImgFile.value === "") {
            return false;
        }
        var filename = "";
        if (damoImgFile.files) {
            if (damoImgFile.files[0].size > this.editor.options.filesize) {
                alert(this.editor.DamoMessage.msg.filesize);
                return false;
            }
            filename = damoImgFile.files[0].name;
        } else {
            filename = damoImgFile.value;
        }
        damoUtil.setStyle(damoImgFile, {
            display: 'none'
        });
        var progress = damoUtil.createElement("div", damoImgFile.parentNode, 'progressbar4VideoFld');
        var progressbar = damoUtil.createElement("div", progress, 'progressbar4Video');
        damoUtil.setStyle(progressbar, {
            width: '0%'
        });
        thisObj = {
            "this": this,
            "range": this.linkRange,
            "ext": filename.split('.').pop(),
            "damoVideoTag": document.querySelector('input[name = "damoVideoTag"]:checked').value
        };
        if (damoImgFile.files) {
            damoFileUploadByAjax(damoImgFile, this.editor.options.uploadURL, this.uploadResult, progressbar);
        } else {
            damoFileUpload(damoImgFile, this.editor.options.uploadURL, this.uploadResult);
        }
        return false;
    };
    this.uploadResult = function(result) {
        thisObj.this.editor.focus();
        var video = damoUtil.createElement(thisObj.damoVideoTag);
        video.setAttribute("width", thisObj.this.videoWidth.value);
        video.setAttribute("height", thisObj.this.videoHeight.value);
        if (thisObj.damoVideoTag === "video") {
            var source = damoUtil.createElement("source");
            video.appendChild(source);
            source.setAttribute("src", result);
            source.setAttribute("type", "video/" + thisObj.ext);
            var damoVideoOption = document.querySelectorAll('input[name=damoVideoOption]:checked');
            for (var i = 0; i < damoVideoOption.length; i++) {
                video.setAttribute(damoVideoOption[i].value, damoVideoOption[i].value);
            };
        } else {
            video.setAttribute("src", result);
            video.setAttribute("type", "video/x-ms-wmv");
            video.setAttribute("enablecontextmenu", "0");
            var damoVideoOption = document.querySelectorAll('input[name=damoVideoOption]');
            for (var i = 0; i < damoVideoOption.length; i++) {
                video.setAttribute(damoVideoOption[i].value, (damoVideoOption[i].checked ? "1" : "0"));
            };
        }
        thisObj.range.insertNode(video);
        thisObj.this.undoRecord(video);
        thisObj.this.close();
    };
}
damoDialogMedia.prototype = new DamoDialog();

function damoSelectBoxMedia() {
    this.items = {
        0: "externalMedia",
        1: "mediaFile"
    };
    var itemsClass = [],
        selectedValue = 0;
    this.panelwidth = 30;
    this.init = function(parent, buttonInfo) {
        this.initialize(parent, buttonInfo);
        this.setPanel();
        return this;
    };
    this.setItem = function(item, value, key) {
        btn = new DamoButton(this.editor, editorConfig.buttons[value], false);
        item.appendChild(btn.button);
        itemsClass[key] = btn;
        damoUtil.removeClass(item, "damoSelectButtonItem");
    };
    this.selectedItemEvent = function(inx) {
        selectedValue = parseInt(inx);
        var pos = damoUtil.getStyle(itemsClass[selectedValue].button, "background-position-x");
        damoUtil.setStyle(this.button.selecttitle, {
            backgroundPosition: pos + " 0px"
        });
    }, this.damoSelectButtonClick = function() {
        itemsClass[selectedValue].button.click();
    };
}
damoSelectBoxMedia.prototype = new damoSelectButton();

function damoDialogDocument() {
    var img = null;
    var thisObj = null;
    var imgOptionArr = [];
    var imgRepeatArr = [];
    var imgPos = ['left top', 'left center', 'left bottom', 'right top', 'right center', 'right bottom', 'center top', 'center center', 'center bottom'];
    var imgPosArr = [imgPos, imgPos]
    this.init = function(parent) {
        this.initialize(parent);
        imgOptionArr = [
            ['', 'scroll', 'fixed'],
            [this.editor.DamoMessage.documentBG.optionDefault, this.editor.DamoMessage.documentBG.optionScroll, this.editor.DamoMessage.documentBG.optionFixed]
        ];
        imgRepeatArr = [
            ['no-repeat', 'repeat', 'repeat-x', 'repeat-y'],
            [this.editor.DamoMessage.documentBG.repeatNo, this.editor.DamoMessage.documentBG.repeat, this.editor.DamoMessage.documentBG.repeatX, this.editor.DamoMessage.documentBG.repeatY]
        ];
        return this;
    };
    this.open = function() {
        var html = "<div id='damoDialogMain' class='damoDialogMain'>" + "<div><label class='label'>" + this.editor.DamoMessage.buttons.image + "</label><input type='file' id='damoImgFile' name='damoImgFile' accept='image/*' class='textBox'/></div><br/>" + "<div><label class='label'>" + this.editor.DamoMessage.documentBG.imgOption + "</label><select id='damoImgOption' class='selectBox'></select></div><br/>" + "<div><label class='label'>" + this.editor.DamoMessage.documentBG.imgRepeat + "</label><select id='damoImgRepeat' class='selectBox'></select></div><br/>" + "<div><label class='label'>" + this.editor.DamoMessage.documentBG.imgPosition + "</label><select id='damoImgPosition' class='selectBox'></select></div><br/>" + "</div><div id='damoDialogBottom' class='damoDialogBottom'><div class='damoSubmitBtn'>" + this.editor.DamoMessage.dialog.confirmBtn + "</div> <div class='damoCancelBtn'>" + this.editor.DamoMessage.dialog.cancelBtn + "</div></div>";
        this.width = "340px";
        this.height = "270px";
        this.title = this.editor.DamoMessage.buttons.documentBG;
        this.show(html);
        this.imgOption = damoUtil.getElm("damoImgOption");
        createOption(this.imgOption, imgOptionArr);
        this.imgRepeat = damoUtil.getElm("damoImgRepeat");
        createOption(this.imgRepeat, imgRepeatArr);
        this.imgPosition = damoUtil.getElm("damoImgPosition");
        createOption(this.imgPosition, imgPosArr);
        var damoDialogMain = damoUtil.getElm("damoDialogMain");
        var settingField = damoUtil.createElement("div", damoDialogMain, "settingField_tmp");
        var lbl = damoUtil.createElement("label", settingField, "label");
        lbl.innerHTML = this.editor.DamoMessage.documentBG.bgCollor;
        this.bgColor = new damoSelectBoxLineColor4Table();
        this.bgColor.init(settingField, {});
        this.bgColor.selectedItemEvent("#FFFFFF");
        damoUtil.addEvent(this.bgColor.button.selecttitle, "click", this.bgColor.damoSelectBoxClick.closure(this.bgColor))
        this.bgColor.setValue(damoUtil.getStyleA(this.editor.editor, "background-color"));
        this.imgOption.value = damoUtil.getStyle(this.editor.editor, "background-attachment");
        this.imgRepeat.value = damoUtil.getStyle(this.editor.editor, "background-repeat");
        this.imgPosition.value = damoUtil.getStyle(this.editor.editor, "background-position-x") + " " + damoUtil.getStyle(this.editor.editor, "background-position-y");
        var damoImgFile = damoUtil.getElm("damoImgFile");
        var str = damoUtil.getStyle(this.editor.editor, "background-image");
        if (str !== "none") {
            var span = damoUtil.createElement("span", damoImgFile.parentNode, "imageFile");
            span.innerHTML = str;
            span.setAttribute("title", str);
            var damoDialogBottom = damoUtil.getElm("damoDialogBottom");
            var removeButton = damoUtil.createElement("A", damoDialogBottom, "damoControlBtn", "click", this.removeButtonClick.closure(this));
            removeButton.innerHTML = this.editor.DamoMessage.documentBG.imgRemove;
            removeButton.setAttribute("href", "#");
        }
    };
    this.removeButtonClick = function() {
        damoUtil.setStyle(this.editor.editor, {
            "background-color": "",
            "background-image": "none"
        });
        this.close();
    }
    this.damoSelectButtonClick = function() {}

    function createOption(selectbox, arr) {
        for (i = 0; i < arr[0].length; i++) {
            var opt = damoUtil.createElement("option");
            opt.text = arr[1][i];
            opt.value = arr[0][i];
            selectbox.options.add(opt);
        }
    }
    this.submitEvent = function() {
        damoUtil.setStyle(this.editor.editor, {
            "background-color": this.bgColor.selectedValue
        });
        damoUtil.setStyle(this.editor.editor, {
            "background-attachment": this.imgOption.value
        });
        damoUtil.setStyle(this.editor.editor, {
            "background-repeat": this.imgRepeat.value
        });
        damoUtil.setStyle(this.editor.editor, {
            "background-position": this.imgPosition.value
        });
        var damoImgFile = damoUtil.getElm("damoImgFile");
        if (damoImgFile.value === "") {
            return true;
        }
        _this = this;
        if (damoImgFile.files) {
            damoFileUploadByAjax(damoImgFile, this.editor.options.uploadURL, this.uploadResult, null);
        } else {
            damoFileUpload(damoImgFile, this.editor.options.uploadURL, this.uploadResult);
        }
        return true;
    };
    this.uploadResult = function(result) {
        damoUtil.setStyle(_this.editor.editor, {
            "background-image": "url('" + result + "')"
        });
    };
}
damoDialogDocument.prototype = new DamoDialog();