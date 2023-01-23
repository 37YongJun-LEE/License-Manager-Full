var UndoStack=function(undoManager){this.commands=[];this.stackPosition=-1;this.undoManager=undoManager;};UndoStack.prototype.execute=function(command){this._clearRedo();if(this.commands.length===200){this.commands.splice(0,1);this.stackPosition=198;}
command.execute();this.commands.push(command);this.stackPosition++;this.changed(this.undoManager);}
function restoreRangePosition(rp,bE){bE.focus();if(!rp)return;var sel=damoUtil.getSelection(),range=sel.getRangeAt(0);var x,C,sC=bE,eC=bE;C=rp.sC;x=C.length;while(x--&&sC)sC=sC.childNodes[C[x]];C=rp.eC;x=C.length;while(x--&&sC)eC=eC.childNodes[C[x]];if(eC.nodeType!==3){return}
range.setStart(sC,rp.sO);range.setEnd(eC,rp.eO);sel.removeAllRanges();sel.addRange(range)}
UndoStack.prototype.undo=function(editor){var value=this.commands[this.stackPosition].oldValue;this.commands[this.stackPosition--].undo();this.changed(this.undoManager);if(this.stackPosition>-1){var rangeInfo=this.commands[this.stackPosition].rangeInfo;restoreRangePosition(rangeInfo,this.undoManager.editor.editor);this.undoManager.editor.activateButton();}
return value;};UndoStack.prototype.canUndo=function(){return this.stackPosition>=0;}
UndoStack.prototype.redo=function(){this.commands[++this.stackPosition].redo();var rangeInfo=this.commands[this.stackPosition].rangeInfo;restoreRangePosition(rangeInfo,this.undoManager.editor.editor);this.undoManager.editor.activateButton();this.changed(this.undoManager);return this.commands[this.stackPosition].newValue;}
UndoStack.prototype.canRedo=function(){return this.stackPosition<this.commands.length-1;}
UndoStack.prototype._clearRedo=function(){this.commands=this.commands.slice(0,this.stackPosition+1);};UndoStack.prototype.clearUndo=function(){this.commands=[];this.stackPosition=-1;this.changed(this.undoManager);};UndoStack.prototype.changed=function(undoManager){}
function getNodeIndex(n){var i=0;while(n=n.previousSibling)i++;return i}
function saveRangePosition(bE){var range=damoUtil.getRange();if(!range)return null;var sC=range.startContainer,eC=range.endContainer;var A=[];while(sC!==bE){A.push(getNodeIndex(sC));sC=sC.parentNode}
var B=[];while(eC!==bE){B.push(getNodeIndex(eC));eC=eC.parentNode}
return{"sC":A,"sO":range.startOffset,"eC":B,"eO":range.endOffset};}
var EditCommand=function(editor,oldValue,newValue){this.editor=editor;this.oldValue=oldValue.replace(/damoSelectedCell/gi,"");this.newValue=newValue.replace(/damoSelectedCell/gi,"");this.rangeInfo=saveRangePosition(editor);};EditCommand.prototype.execute=function(){};EditCommand.prototype.undo=function(){this.editor.innerHTML=this.oldValue;};EditCommand.prototype.redo=function(){this.editor.innerHTML=this.newValue;};var UndoManager=function(undoBtn,redoBtn,editor){this.timer=null;this.isPressShortcuts=false;this.editor=editor;this.undoBtn=undoBtn;this.redoBtn=redoBtn;this.stack=new UndoStack(this);this.stack.changed=this.changed;this.stack.changed(this);this.startValue=editor.editor.innerHTML;if(undoBtn){damoUtil.addEvent(undoBtn.button,"click",this.undo_click.closure(this));}
if(redoBtn){damoUtil.addEvent(redoBtn.button,"click",this.redo_click.closure(this));}
damoUtil.addEvent(this.editor.editor,"keyup",this.editor_keyup.closureListener(this));damoUtil.addEvent(this.editor.editor,"keydown",this.editor_keydown.closureListener(this));}
UndoManager.prototype.clearUndo=function(value){this.stack.clearUndo();this.startValue=value;}
UndoManager.prototype.changed=function(undoManager){if(undoManager.undoBtn){undoManager.editor.buttonDisable(undoManager.undoBtn,!undoManager.stack.canUndo());}
if(undoManager.redoBtn){undoManager.editor.buttonDisable(undoManager.redoBtn,!undoManager.stack.canRedo());}}
UndoManager.prototype.undo_click=function(){this.startValue=this.stack.undo(this.editor);}
UndoManager.prototype.redo_click=function(){this.stack.redo();}
UndoManager.prototype.editor_keyup=function(event){if(this.isPressShortcuts){if(event.ctrlKey&&event.keyCode===86){this.record();return true;}
if(event.keyCode===17||event.ctrlKey||event.keyCode>86){return false;}
this.isPressShortcuts=false;};clearTimeout(this.timer);this.timer=setTimeout(this.autoRecord.closure(this),300);};UndoManager.prototype.editor_keydown=function(event){if(event.ctrlKey){this.isPressShortcuts=true;switch(event.keyCode){case 89:event.preventDefault();if(this.stack.canRedo()){this.startValue=this.stack.redo()}
break;case 90:event.preventDefault();if(this.stack.canUndo()){this.startValue=this.stack.undo(this.editor);}
break;}}}
UndoManager.prototype.autoRecord=function(){var newValue=this.editor.editor.innerHTML;if(newValue!=this.startValue){this.stack.execute(new EditCommand(this.editor.editor,this.startValue,newValue));this.startValue=newValue;}}
UndoManager.prototype.record=function(){this.editor.focus();var newValue=this.editor.editor.innerHTML;this.stack.execute(new EditCommand(this.editor.editor,this.startValue,newValue));this.startValue=newValue;}