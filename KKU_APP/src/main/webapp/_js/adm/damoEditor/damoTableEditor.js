"use strict";
function TableEditor(){this.editor=null;this.tableCells=[];this.selectList=[];this.selectArea={};this.sCellPos={};this.selectingCell=false;this.startTD=null
this.selectedTable=null;this.useRibbon=damoUtil.isChrome||damoUtil.isEdge;damoUtil.addEvent(document,"mousemove",this.mousemove.closureListener(this));damoUtil.addEvent(document,"mousedown",this.mousedown.closureListener(this));damoUtil.addEvent(document,"mouseup",this.mouseup.closureListener(this));this.mouseMoveAction=0;this.tableResize={position:0,type:0,table:null};this.gripper=damoUtil.createElement("div",document.body);damoUtil.addClass(this.gripper,"gripper");damoUtil.addEvent(this.gripper,"mousedown",this.gripperMousedown.closureListener(this));damoUtil.addEvent(this.gripper,"dragover",damoUtil.preventDefault);damoUtil.addEvent(this.gripper,"drop",damoUtil.preventDefault);}
TableEditor.prototype.undoRecord=function(elm){if(!elm)elm=this.selectedTable;var editor=damoEditors.findDamoEditorInPath(elm);editor.focus();editor.undoRecord();}
TableEditor.prototype.setRibbon=function(img){var rt=img.getBoundingClientRect();var top=rt.top+document.body.scrollTop+damoUtil.getStyleI(img,"height")-7;var left=rt.left+document.body.scrollLeft+damoUtil.getStyleI(img,"width")-7;damoUtil.setStyle(this.ribbon,{left:left+C_PX,top:top+C_PX});}
TableEditor.prototype.removeRibbon=function(){if(!this.ribbon)return;this.ribbon.parentNode.removeChild(this.ribbon);this.ribbon=null;this.selectedImage=null;}
TableEditor.prototype.mousedown=function(event){if(event.button===0&&this.useRibbon){if(event.target.nodeName==="IMG"){this.editor=damoEditors.findDamoEditorInPath(event.target);if(!this.editor){return}
if(!this.ribbon){this.ribbon=damoUtil.createElement("div",document.body,"imageRibbon","mousedown",this.imageMousedown.closureListener(this));damoUtil.addEvent(this.ribbon,"mouseup",this.imageMouseup.closureListener(this));}
this.selectedImage=event.target;this.setRibbon(this.selectedImage);return;}else
if(this.ribbon===event.target){return;}
else
if(this.ribbon){this.removeRibbon()}}
if(event.target.className==="damoContextMenuItemBody"){return}
this.startTD=rangeUtil.findTagInPath(event.target,"TD");if(!this.startTD){if(event.target.className.indexOf&&event.target.className.indexOf("damoContextMenuItem")===-1){this.unmarkSelectCell();this.selectList=[];}
return;}
this.editor=damoEditors.findDamoEditorInPath(this.startTD);if(!this.editor){return;}
this.selectedTable=rangeUtil.findTagInPath(this.startTD,"TABLE");this.setTableCells();if(event.which===3){event.preventDefault();return;}
this.unmarkSelectCell();this.selectList=[this.startTD];this.selectingCell=true;this.sCellPos=this.getCellPosition(this.startTD);};TableEditor.prototype.imageMousedown=function(event){this.imageResizing=true;this.imagePos={x:event.pageX,y:event.pageY};}
TableEditor.prototype.imageMouseup=function(event){this.imageResizing=false;this.setRibbon(this.selectedImage);this.editor.undoRecord();}
TableEditor.prototype.mousemove=function(event){if(this.imageResizing&&this.ribbon){damoUtil.setStyle(this.ribbon,{left:(event.pageX-3)+C_PX,top:(event.pageY-3)+C_PX});damoUtil.setStyle(this.selectedImage,{width:(damoUtil.getStyleI(this.selectedImage,"width")+event.pageX-this.imagePos.x)+C_PX,height:(damoUtil.getStyleI(this.selectedImage,"height")+event.pageY-this.imagePos.y)+C_PX});this.imagePos={x:event.pageX,y:event.pageY};return;}
if(!this.selectingCell){this.mousemove4CellResizing(event);return;}
this.unmarkSelectCell();var node=rangeUtil.findTagInPath(event.target,"TD");if(!node||node===this.startTD){return;}
damoUtil.getSelection().removeAllRanges();var eCellPos=this.getCellPosition(node);if(!eCellPos)return;this.selectArea={x1:Math.min(this.sCellPos.x,this.sCellPos.x_span,eCellPos.x,eCellPos.x_span),y1:Math.min(this.sCellPos.y,this.sCellPos.y_span,eCellPos.y,eCellPos.y_span),x2:Math.max(this.sCellPos.x,this.sCellPos.x_span,eCellPos.x,eCellPos.x_span),y2:Math.max(this.sCellPos.y,this.sCellPos.y_span,eCellPos.y,eCellPos.y_span)};this.selectArea=this.searchSelectArea(this.selectArea);this.selectCell(this.selectArea);this.markSelectCell();};TableEditor.prototype.mouseup=function(event){if(event.button!==0||event.target.className==="damoContextMenuItemBody"){return;}
if(this.tableResize.type>0){if(this.tableResize.type===1){this.resizeTableColumnWidth(this.tableResize.targetCell,event.pageX-this.tableResize.position);}else{this.resizeTableRowHeight(this.tableResize.targetCell,event.pageY-this.tableResize.position);}
this.tableResize.type=0;damoUtil.removeClass(this.gripper,"gripperShow");return;}
if(!this.selectingCell){return}
this.selectingCell=false;if(this.selectList.length<2){this.selectArea={};if(this.editor)this.editor.buttonsDisable(false);}else{this.editor.buttonsDisable(false,"image,link,table,sChar")}}
TableEditor.prototype.getStyleI=function(src,style){var ret=this.getAttributeI(src,style);if(ret>1)return ret;if(src.style[style])return parseInt(src.style[style]);return parseInt(damoUtil.getStyle(src,style));}
TableEditor.prototype.setTableCells=function(){var tr=this.selectedTable.rows[0],columnCnt=0,rowCnt=0;for(var i=0;i<tr.cells.length;i++){columnCnt+=this.getAttributeI(tr.cells[i],"colSpan");}
this.tableCells=[columnCnt];rowCnt=this.selectedTable.rows.length;for(var i=0;i<columnCnt;i++){this.tableCells[i]=new Array(rowCnt);}
for(var y=0;y<rowCnt;y++){tr=this.selectedTable.rows[y];if(!tr){continue;}
var x=-1,tdIndex=0;var td=tr.cells[tdIndex];while(td){x++;if(!this.tableCells[x]){break;}
if(this.tableCells[x][y]){continue;}
var colSpan=this.getAttributeI(td,"colSpan");var rowSpan=this.getAttributeI(td,"rowSpan");for(var yy=0;yy<rowSpan;yy++){for(var xx=0;xx<colSpan;xx++){this.tableCells[x+xx][y+yy]=td;}}
td=tr.cells[++tdIndex];}}}
TableEditor.prototype.getCellSpan=function(td){var col=parseInt(td.getAttribute("colSpan"))-1||0;var row=parseInt(td.getAttribute("rowSpan"))-1||0;if(row<0)row=0;return{col:col,row:row};}
TableEditor.prototype.getCellPosition=function(td){for(var x=0;x<this.tableCells.length;x++){for(var y=0;y<this.tableCells[x].length;y++){if(this.tableCells[x][y]===td){var colSpan=this.getAttributeI(td,"colSpan");var rowSpan=this.getAttributeI(td,"rowSpan");return{x:x,y:y,x_span:x+colSpan-1,y_span:y+rowSpan-1};}}}
return{x:0,y:0,x_span:0,y_span:0};}
TableEditor.prototype.markSelectCell=function(){for(var i=0;i<this.selectList.length;i++){damoUtil.addClass(this.selectList[i],"damoSelectedCell");}}
TableEditor.prototype.unmarkSelectCell=function(){for(var i=0;i<this.selectList.length;i++){damoUtil.removeClass(this.selectList[i],"damoSelectedCell");}}
TableEditor.prototype.selectCell=function(rect){this.selectList=[];for(var x=rect.x1;x<=rect.x2;x++){for(var y=rect.y1;y<=rect.y2;y++){var dtd=this.tableCells[x][y];if(this.selectList.indexOf(dtd)===-1){this.selectList.push(dtd);}}}}
TableEditor.prototype.searchSelectArea=function(rect){var min_x=rect.x1,min_y=rect.y1,max_x=0,max_y=0;for(var x=rect.x1;x<=rect.x2;x++){for(var y=rect.y1;y<=rect.y2;y++){var dtd=this.tableCells[x][y];var span=this.getCellSpan(dtd);var xplus=-1,xminus=1,yplus=-1,yminus=1;for(var i=x;i>=x-span.col;i--){if(!this.tableCells[i]||dtd!==this.tableCells[i][y]){break;}
xminus--;}
for(var i=x;i<=x+span.col;i++){if(!this.tableCells[i]||dtd!==this.tableCells[i][y]){break;}
xplus++;}
for(var i=y;i>=y-span.row;i--){if(!this.tableCells[x][i]||dtd!==this.tableCells[x][i]){break;}
yminus--;}
for(var i=y;i<=y+span.row;i++){if(!this.tableCells[x][i]||dtd!==this.tableCells[x][i]){break;}
yplus++;}
if(min_x>x+xminus){min_x=x+xminus;}
if(max_x<x+xplus){max_x=x+xplus;}
if(min_y>y+yminus){min_y=y+yminus;}
if(max_y<y+yplus){max_y=y+yplus;}}}
var ret={x1:min_x,y1:min_y,x2:max_x,y2:max_y};if(rect.x1===min_x&rect.y1===min_y&rect.x2===max_x&rect.y2===max_y)
{return ret;}
else{return this.searchSelectArea(ret)};}
TableEditor.prototype.searchSelectMinMax=function(){var min_x=9999,min_y=9999,max_x=0,max_y=0;for(var i=0;i<this.selectList.length;i++){var td=this.selectList[i];var pos=this.getCellPosition(td);min_x=Math.min(min_x,pos.x);max_x=Math.max(max_x,pos.x,pos.x_span);min_y=Math.min(min_y,pos.y);max_y=Math.max(max_y,pos.y,pos.y_span);}
return{x1:min_x,y1:min_y,x2:max_x,y2:max_y};}
TableEditor.prototype.cellMerge=function(){if(this.selectList.length<2){return;}
var firstTD=this.selectList[0];this.selectArea=this.searchSelectMinMax();var widthI=0,heightI=0,oldTD;for(var i=this.selectArea.x1;i<=this.selectArea.x2;i++){var td=this.tableCells[i][this.selectArea.y1];if(td===oldTD){continue;}
widthI+=this.getStyleI(td,"width");;oldTD=td;}
for(var i=this.selectArea.y1;i<=this.selectArea.y2;){heightI+=this.getStyleI(this.tableCells[this.selectArea.x1][i],"height");i+=this.getAttributeI(this.tableCells[this.selectArea.x1][i],"rowspan");}
for(var i=1;i<this.selectList.length;i++){this.selectList[i].parentNode.removeChild(this.selectList[i]);}
var rowspan=this.selectArea.y2-this.selectArea.y1+1;firstTD.setAttribute("rowspan",rowspan);firstTD.setAttribute("colspan",this.selectArea.x2-this.selectArea.x1+1);damoUtil.setStyle(firstTD,{"width":widthI+C_PX,"height":heightI+C_PX});this.selectList=[];this.selectList.push(firstTD);this.rearrangeTR(firstTD.parentNode,rowspan);this.setTableCells();this.undoRecord();}
TableEditor.prototype.rearrangeTR=function(row,rowspan){var cnt=0;for(var i=0;i<row.cells.length;i++){if(this.getAttributeI(row.cells[i],"rowspan")===rowspan){cnt++;}}
if(row.cells.length===cnt){for(var i=0;i<row.cells.length;i++){row.cells[i].removeAttribute("rowspan");}
for(var i=row.rowIndex+1;i<row.rowIndex+rowspan;){var row1=this.selectedTable.rows[i];if(row1.cells.length===0){row1.parentNode.removeChild(row1);}else{i++;}
if(i===this.selectedTable.rows.length){break;}}}}
TableEditor.prototype.splitColumn=function(){if(this.selectList.length===0){return;}
this.unmarkSelectCell();var firstTD=this.selectList[0];var max_x=0,max_y=0;for(var i=0;i<this.selectList.length;i++){var td=this.selectList[i];var colSpan=this.getAttributeI(td,"colSpan");var newSpan=Math.round(colSpan/2);if(colSpan===1){var pos=this.getCellPosition(td);for(var y=0;y<this.tableCells[0].length;){var td1=this.tableCells[pos.x][y];var span=this.getAttributeI(td1,"colSpan");td1.setAttribute("colSpan",span+1);y+=this.getAttributeI(td1,"rowSpan");}
td.setAttribute("colSpan",1);}else{td.setAttribute("colSpan",colSpan-newSpan);}
var newTD=this.cloneNode(td);newTD.setAttribute("colSpan",newSpan);newTD.setAttribute("rowSpan",this.getAttributeI(td,"rowSpan"));var widthI=this.getStyleI(td,"width");var newWidth=Math.round(widthI/2);damoUtil.setStyleNremoveA(td,{width:newWidth+"px"});damoUtil.setStyleNremoveA(newTD,{width:(widthI-newWidth)+"px"});td.parentNode.insertBefore(newTD,td.nextSibling);var ePos=this.getCellPositionInTable(newTD);if(max_x<ePos.x)max_x=ePos.x;if(max_y<ePos.y)max_y=ePos.y;}
this.setTableCells();var sPos=this.getCellPosition(firstTD);var ePos=this.getCellPosition(newTD);this.selectArea=this.searchSelectArea({x1:sPos.x,y1:sPos.y,x2:Math.max(ePos.x,ePos.x_span),y2:max_y});this.selectCell(this.selectArea);this.markSelectCell();this.undoRecord();}
TableEditor.prototype.sameHeight=function(){this.unmarkSelectCell();var trSum=0,sPos=0,ePos=0;if(this.selectList.length>1){var selectArea=this.searchSelectMinMax();sPos=this.selectArea.y1;ePos=this.selectArea.y2;}else{ePos=this.tableCells[0].length-1;}
for(var i=sPos;i<=ePos;){trSum+=damoUtil.getStyleAI(this.tableCells[0][i],"height");i+=this.getAttributeI(this.tableCells[0][i],"rowspan");}
trSum=Math.round(trSum/(ePos-sPos+1));for(var i=sPos;i<=ePos;i++){for(var j=0;j<this.tableCells.length;j++){var rowSpan=this.getAttributeI(this.tableCells[j][i],"rowSpan");damoUtil.setStyle(this.tableCells[j][i],{'height':(trSum*rowSpan)+C_PX});}}
if(this.selectList.length>1){this.markSelectCell();}
this.undoRecord();}
TableEditor.prototype.sameWidth=function(){this.unmarkSelectCell();var trSum=0,sPos=0,ePos=0;if(this.selectList.length>1){var selectArea=this.searchSelectMinMax();sPos=this.selectArea.x1;ePos=this.selectArea.x2;}else{ePos=this.tableCells.length-1;}
for(var i=sPos;i<=ePos;){trSum+=damoUtil.getStyleAI(this.tableCells[i][0],"width");i+=this.getAttributeI(this.tableCells[i][0],"colspan");}
trSum=Math.round(trSum/(ePos-sPos+1));for(var i=sPos;i<=ePos;i++){for(var j=0;j<this.tableCells[i].length;j++){var colspan=this.getAttributeI(this.tableCells[i][j],"colspan");damoUtil.setStyle(this.tableCells[i][j],{'width':(trSum*colspan)+C_PX});}}
if(this.selectList.length>1){this.markSelectCell();}
this.undoRecord();}
TableEditor.prototype.getCellPositionInTable=function(td){var x=td.cellIndex;var y=td.parentNode.rowIndex;var colSpan=this.getAttributeI(td,"colSpan");var rowSpan=this.getAttributeI(td,"rowSpan");return{x:x,y:y,x_span:x+colSpan-1,y_span:y+rowSpan-1};}
TableEditor.prototype.getAttributeI=function(obj,attr){return parseInt(obj.getAttribute(attr),10)||1;}
TableEditor.prototype.cloneNode=function(td){var newTD=td.cloneNode(false);newTD.innerHTML=damoUtil.getBlankChar();return newTD;}
TableEditor.prototype.splitRow=function(){if(this.selectList.length===0){return;}
this.unmarkSelectCell();var tr,td,otd,newTR,rowCnt=0,pos;for(var i=0;i<this.selectList.length;i++){td=this.selectList[i];if(this.getAttributeI(td,"rowSpan")>1){continue;}
tr=td.parentNode;newTR=damoUtil.createElement("tr");tr.parentNode.insertBefore(newTR,tr.nextSibling);pos=this.getCellPosition(td);for(var x=0;x<this.tableCells.length;){otd=this.tableCells[x][pos.y];;rowSpan=this.getAttributeI(otd,"rowSpan");otd.setAttribute("rowSpan",rowSpan+1);x+=this.getAttributeI(otd,"colSpan");}
rowCnt++;}
var newTD,newSpan,pos1,pos2,rowSpan,colSpan,lastCell;var max_x=0,max_y=0,heightI,newHeight;for(var i=0;i<this.selectList.length;i++){var td=this.selectList[i];rowSpan=this.getAttributeI(td,"rowSpan");newSpan=Math.round(rowSpan/2);td.setAttribute("rowSpan",newSpan);newTD=this.cloneNode(td);newTD.setAttribute("rowSpan",rowSpan-newSpan);lastCell=newTD;colSpan=this.getAttributeI(td,"colSpan");newTD.setAttribute("colSpan",colSpan);heightI=damoUtil.getStyleAI(td,"height");newHeight=Math.round(heightI/2);damoUtil.setStyleNremoveA(td,{height:newHeight+"px"});damoUtil.setStyle(newTD,{height:(heightI-newHeight)+"px"});tr=this.selectedTable.rows[td.parentNode.rowIndex+newSpan];var cells=tr.cells;var existingnode=null;pos1=this.getCellPosition(td);for(var j=0;j<cells.length;j++){otd=cells[j];pos2=this.getCellPosition(otd);if(pos1.x<pos2.x){existingnode=otd;break;}}
tr.insertBefore(newTD,existingnode);var ePos=this.getCellPositionInTable(newTD);if(max_x<pos1.x)max_x=pos1.x;if(max_y<ePos.y)max_y=ePos.y;}
this.setTableCells();var sPos=this.getCellPosition(this.selectList[0]);if(this.selectArea&&this.selectArea.y2){this.selectArea.y2+=rowCnt;}else{this.selectArea={x1:sPos.x,y1:sPos.y,x2:max_x,y2:max_y};}
this.selectCell(this.selectArea);this.markSelectCell();this.undoRecord();}
TableEditor.prototype.insertColumn=function(direction){if(this.selectList.length===0){return;}
this.selectArea={};this.unmarkSelectCell();var selectedTD=this.selectList[0];var pos=this.getCellPosition(selectedTD);var newTD=null,maxWidth=damoUtil.getStyle(selectedTD,"width");for(var y=0;y<this.tableCells[0].length;){var td=this.tableCells[pos.x][y];var rowSpan=this.getAttributeI(td,"rowSpan");var colSpan=this.getAttributeI(td,"colSpan");if(colSpan>1){var pos1=this.getCellPosition(td);if(direction==="left"&&pos.x===pos1.x){newTD=this.cloneNode(td);newTD.setAttribute("rowSpan",rowSpan);newTD.setAttribute("colSpan",1);damoUtil.setStyle(newTD,{width:maxWidth});td.parentNode.insertBefore(newTD,td);}else{td.setAttribute("colSpan",colSpan+1);}}else{newTD=this.cloneNode(td);td.parentNode.insertBefore(newTD,((direction==="left")?td:td.nextSibling));newTD.setAttribute("rowSpan",rowSpan);damoUtil.setStyle(newTD,{width:maxWidth});}
y+=rowSpan;}
this.undoRecord();this.setTableCells();this.selectList=[];this.selectList.push(selectedTD);selectedTD.focus();}
TableEditor.prototype.insertRow=function(direction){if(this.selectList.length===0){return;}
this.selectArea={};this.unmarkSelectCell();var selectedTD=this.selectList[0];var rowSpan=this.getAttributeI(selectedTD,"rowSpan");if(rowSpan>1&&direction!=="over"){var pos=this.getCellPosition(selectedTD);if(pos.y+rowSpan<this.tableCells[0].length){selectedTD=this.tableCells[pos.x][pos.y+rowSpan];direction="over";}}
var tr=selectedTD.parentNode;var newTR=damoUtil.createElement("tr");tr.parentNode.insertBefore(newTR,((direction==="over")?tr:tr.nextSibling));function CreateTD(parent,td,colSpan){var newTD=parent.cloneNode(td);newTD.setAttribute("colSpan",colSpan);newTD.setAttribute("rowSpan",1);var height=damoUtil.getStyle(td,"height");damoUtil.setStyle(newTD,{height:height});newTR.insertBefore(newTD,null);}
var pos=this.getCellPosition(selectedTD);var colSpan,rowSpan;for(var x=0;x<this.tableCells.length;){var td=this.tableCells[x][pos.y];colSpan=this.getAttributeI(td,"colSpan");rowSpan=this.getAttributeI(td,"rowSpan");if(rowSpan>1){if(direction==="over"&&tr.rowIndex===td.parentNode.rowIndex){CreateTD(this,td,colSpan)}else{td.setAttribute("rowSpan",rowSpan+1);}}else{CreateTD(this,td,colSpan);}
x+=colSpan;}
this.undoRecord();this.setTableCells();this.selectList=[];this.selectList.push(selectedTD);selectedTD.focus();}
TableEditor.prototype.deleteRow=function(){if(this.selectList.length===0){return;}
this.selectArea={};this.unmarkSelectCell();var selectedTD=this.selectList[0];var tr=selectedTD.parentNode;var pos=this.getCellPosition(selectedTD);var colSpan,rowSpan,rowSpanTD=null;for(var x=0;x<this.tableCells.length;x++){var td=this.tableCells[x][pos.y];rowSpan=this.getAttributeI(td,"rowSpan");if(rowSpan>1){rowSpanTD=td;break;}}
if(rowSpanTD){for(var x=0;x<this.tableCells.length;){var td=this.tableCells[x][pos.y];rowSpan=this.getAttributeI(td,"rowSpan");colSpan=this.getAttributeI(td,"colSpan");if(rowSpan>1){td.setAttribute("rowSpan",rowSpan-1);if(tr.rowIndex===td.parentNode.rowIndex){var nextTD=null;if(x+colSpan<this.tableCells.length){nextTD=this.tableCells[x+colSpan][pos.y+1]
if(this.getAttributeI(nextTD,"rowSpan")>1)nextTD=null;}
tr.nextSibling.insertBefore(td,nextTD);}}else{td.parentNode.removeChild(td);}
x+=colSpan;}
do{if(tr.cells.length===0){tr.parentNode.removeChild(tr);break;}}while(tr=tr.nextSibling);}else{tr.parentNode.removeChild(tr);}
this.undoRecord();this.setTableCells();this.selectList=[];}
TableEditor.prototype.deleteColumn=function(){if(this.selectList.length===0){return;}
this.selectArea={};this.unmarkSelectCell();var selectedTD=this.selectList[0];var pos=this.getCellPosition(selectedTD);for(var y=0;y<this.tableCells[0].length;){var td=this.tableCells[pos.x][y];var colSpan=this.getAttributeI(td,"colSpan");if(colSpan>1){td.setAttribute("colSpan",colSpan-1);}else{td.parentNode.removeChild(td);}
var rowSpan=this.getAttributeI(td,"rowSpan");y+=rowSpan;}
this.undoRecord();this.setTableCells();this.selectList=[];}
TableEditor.prototype.removeTable=function(){var parentNode=this.selectedTable.parentNode;parentNode.removeChild(this.selectedTable);this.undoRecord(parentNode);}
var inc=0;TableEditor.prototype.mousemove4CellResizing=function(event){if(this.tableResize.type>0){if(this.tableResize.type===1){damoUtil.setStyle(this.gripper,{left:(event.pageX)+C_PX});}else{damoUtil.setStyle(this.gripper,{top:(event.pageY)+C_PX});}
return false;}
if(event.target.nodeName!=="TD"){return false;}
this.mouseMoveAction=0;var cell=rangeUtil.findTagInPath(event.target,"TD");if(!cell||cell.className.indexOf("tablePacker")>-1){damoUtil.setStyle(this.gripper,{display:"none"})
return false;}
if(!rangeUtil.findTagInPathByClass(cell,"editor")){return;}
this.tableResize.targetCell=cell;var cellWidth=cell.clientWidth+this.getStyleI(cell,"border-left-width")+this.getStyleI(cell,"border-right-width"),cellHeight=cell.clientHeight+this.getStyleI(cell,"border-top-width")+this.getStyleI(cell,"border-bottom-width");if(event.offsetY<=3){if(cell.parentNode.rowIndex===0)return false;this.setGriperPositionOfRow(cell,event,1);}else
if(cellHeight-event.offsetY<=3){this.setGriperPositionOfRow(cell,event,2);}else
if(cellWidth-event.offsetX<=3){this.setGriperPositionOfColumn(cell,event,3);}else
if(event.offsetX<=3){if(cell.cellIndex==0)return false;this.setGriperPositionOfColumn(cell,event,4);}else{damoUtil.setStyle(this.gripper,{display:"none",cursor:"default",top:"-1px"});}
return false;};TableEditor.prototype.getBeforeRow=function(td){this.selectedTable=this.tableResize.table;this.setTableCells();var pos=this.getCellPosition(td);return this.tableCells[pos.x][pos.y-1];}
TableEditor.prototype.getBeforeColumn=function(td){var pos=this.getCellPosition(td);var ret=this.tableCells[pos.x-1][pos.y];var colsPan=this.getAttributeI(ret,"colSpan");if(colsPan===1)return ret;var ret1=this.getBeforeColumnInOther(ret,pos.x-1,pos.y)
if(ret1)return ret1;return ret;}
TableEditor.prototype.getBeforeColumnInOther=function(td,x,posY){var ret1=null,colsPan=1;for(var y=posY+1;y<this.tableCells[0].length;y++){ret1=this.tableCells[x][y];colsPan=this.getAttributeI(ret1,"colSpan");if(colsPan===1)return ret1;}
for(var y=posY-1;y>=0;y--){ret1=this.tableCells[x][y];colsPan=this.getAttributeI(ret1,"colSpan");if(colsPan===1)return ret1;}
return td;}
TableEditor.prototype.resizeTableColumnWidth=function(td,inc){this.selectedTable=this.tableResize.table;this.setTableCells();if(this.mouseMoveAction===4){td=this.getBeforeColumn(td);}
var pos=this.getCellPosition(td);var colsPan=this.getAttributeI(td,"colSpan");if(colsPan>1){td=this.getBeforeColumnInOther(td,pos.x+colsPan-1,pos.y);pos=this.getCellPosition(td);}
var sWidth=(this.getStyleI(td,"width")+inc)+C_PX;var row=td.parentNode;var cellIndex=td.cellIndex;var sWidth2=((cellIndex<row.cells.length-1)?(this.getStyleI(row.cells[cellIndex+1],"width")-inc)+C_PX:null);for(var y=0;y<this.tableCells[0].length;){var td1=this.tableCells[pos.x][y];var td2=null;if(pos.x<this.tableCells.length-1){td2=this.tableCells[pos.x+1][y];}
if(td1!==td2){damoUtil.setStyleNremoveA(td1,{width:sWidth});if(sWidth2&&td2)damoUtil.setStyleNremoveA(td2,{width:sWidth2});}
y+=this.getAttributeI(td1,"rowSpan");}
this.undoRecord();}
TableEditor.prototype.resizeTableRowHeight=function(td,inc){if(this.mouseMoveAction===1){td=this.getBeforeRow(td);}
var row=td.parentNode;var cellHeights=[]
for(var i=0;i<row.cells.length;i++){cellHeights.push(this.getStyleI(row.cells[i],"height"));}
for(var i=0;i<row.cells.length;i++){var sHeight=(cellHeights[i]+inc)+C_PX;damoUtil.setStyleNremoveA(row.cells[i],{height:sHeight});}
this.undoRecord(row);}
TableEditor.prototype.getElementPosition=function(node){var itop=0;var ileft=0;var style="";while(node){if(node.className==="editor")break;itop+=node.offsetTop;ileft+=node.offsetLeft;node=node.offsetParent;}
return{top:itop,left:ileft};}
TableEditor.prototype.setGriperPositionOfColumn=function(targetCell,event,moveAction){this.mouseMoveAction=moveAction;this.editor=damoEditors.findDamoEditorInPath(targetCell);if(!this.editor){return}
this.tableResize.table=rangeUtil.findTagInPath(targetCell,"TABLE");var pos=this.getElementPosition(this.tableResize.table);var gripperWidth=2;var iTop=this.editor.position.top+pos.top-this.editor.editor.scrollTop+35;var iLeft=event.clientX-event.offsetX-gripperWidth;if(this.mouseMoveAction===3){iLeft+=targetCell.clientWidth;}
damoUtil.setStyle(this.gripper,{width:(gripperWidth*2)+C_PX,height:this.tableResize.table.offsetHeight+C_PX,left:iLeft+C_PX,top:iTop+C_PX,display:"block",cursor:"col-resize"})}
TableEditor.prototype.setGriperPositionOfRow=function(targetCell,event,moveAction){this.mouseMoveAction=moveAction;this.editor=damoEditors.findDamoEditorInPath(targetCell);if(!this.editor){return}
this.tableResize.table=rangeUtil.findTagInPath(targetCell,"TABLE");var pos=this.getElementPosition(this.tableResize.table);var iTop=event.clientY+document.documentElement.scrollTop+document.body.scrollTop-this.getStyleI(this.gripper,"height")/2;var iLeft=this.editor.position.left+pos.left;damoUtil.setStyle(this.gripper,{width:this.tableResize.table.offsetWidth+C_PX,height:((1+1)*2)+C_PX,left:iLeft+C_PX,top:iTop+C_PX,display:"block",cursor:"row-resize"})}
TableEditor.prototype.gripperMousedown=function(event){if(event.button!==0||this.mouseMoveAction===0){return true;};damoUtil.addClass(this.gripper,"gripperShow");if(this.mouseMoveAction>2){this.tableResize.type=1;this.tableResize.position=event.pageX;}else
if(this.mouseMoveAction<3){this.tableResize.type=2;this.tableResize.position=event.pageY;}
event.preventDefault();return false;}
TableEditor.prototype.selectTable=function(){this.editor.focus();damoUtil.setSelectionControl(this.selectedTable);}
TableEditor.prototype.modifyTable=function(){this.unmarkSelectCell();this.selectList=[];var dialog=new DamoDialogTable().init(damoEditors.findDamoEditorInPath(this.selectedTable));dialog.open(this.selectedTable);}
TableEditor.prototype.modifyCell=function(){this.unmarkSelectCell();var dialog=new DamoDialogTableCell().init(damoEditors.findDamoEditorInPath(this.selectedTable));dialog.open(this);}
TableEditor.prototype.resetSelectList=function(selectList){this.selectList=selectList;this.markSelectCell();}
TableEditor.prototype.damoTableLayout=function(){var dialog=new DamoDialogTableLayout().init(this.editor);dialog.open(this.selectedTable);}
var damoMenuItems=[{icon:31,command:"addUp",text:"addUp",action:function(tableEditor){tableEditor.insertRow("over");}},{icon:32,command:"addDown",text:"addDown",action:function(tableEditor){tableEditor.insertRow("below");}},{icon:40,command:"splitRow",text:"splitRow",action:function(tableEditor){tableEditor.splitRow();}},{icon:36,command:"delRow",text:"delRow",action:function(tableEditor){tableEditor.deleteRow();}},{command:"seperate"},{icon:33,command:"addLeft",text:"addLeft",action:function(tableEditor){tableEditor.insertColumn("left");}},{icon:34,command:"addRight",text:"addRight",action:function(tableEditor){tableEditor.insertColumn("right");}},{icon:39,command:"splitCol",text:"splitCol",action:function(tableEditor){tableEditor.splitColumn();}},{icon:35,command:"delColumn",text:"delColumn",action:function(tableEditor){tableEditor.deleteColumn();}},{command:"seperate"},{icon:57,command:"sameHeight",text:"sameHeight",action:function(tableEditor){tableEditor.sameHeight();}},{icon:56,command:"sameWidth",text:"sameWidth",action:function(tableEditor){tableEditor.sameWidth();}},{command:"seperate"},{icon:41,command:"merge",text:"merge",action:function(tableEditor){tableEditor.cellMerge();}},{icon:43,command:"propCell",text:"propCell",action:function(tableEditor){tableEditor.modifyCell();}},{command:"seperate"},{icon:42,command:"propTable",text:"propTable",action:function(tableEditor){tableEditor.modifyTable();}},{command:"ie",text:"selectTable",action:function(tableEditor){tableEditor.selectTable();}},{icon:37,command:"delTable",text:"delTable",action:function(tableEditor){tableEditor.removeTable();}},{command:"seperate"},{icon:11,command:"delTable",text:"tableLayout",action:function(tableEditor){tableEditor.damoTableLayout()}}];var damoImageMenuItems=[{icon:38,command:"delete",text:"delete",action:function(editor){editor.editor.removeElement();}},{icon:9,command:"property",text:"property",action:damoModifyImage},{icon:49,command:"edit",text:"edit",action:damoEditImage}];function damoEditImage(img,menuClass){var editor=menuClass.tableEditor.editor;var imagepath=editor.activeElement.src;var matches=imagepath.match(/^https?\:\/\/([^\/?#]+)(?:[\/?#]|$)/i);var m=window.location.href.match(/^https?\:\/\/([^\/?#]+)(?:[\/?#]|$)/i);if(!matches||matches[1]!==m[1]){alert(editor.DamoMessage.image.msg.notEditor);return;}
if(imagepath.indexOf("damoWebEditor")>0){alert(editor.DamoMessage.image.msg.emoticon);return;}
var url=editor.imageEditor;window.open(url,null,"width=990, height=595, help=no, resizable=no, status=no, center=yes, edge=raised");}
function damoEditImage4Popup(){if(damoEditors.activeEditor.activeElement.nodeName!=="IMG")return null;return damoEditors.activeEditor.activeElement;}
function damoModifyImage(img,menuClass){menuClass.tableEditor.editor.executeClick("image");}
function DamoContextMenu(tableEditor){this.isshow=false;this.init=function(tableEditor){document.oncontextmenu=function(){return false;}
this.menuItems=null;this.tableEditor=tableEditor;this.contextMenu=damoUtil.createElement("div",document.body,"damoContextMenu");this.hide();damoUtil.addEvent(document.body,"mouseup",this.mouseup.closureListener(this));}
this.show=function(x,y){var tw=damoUtil.getStyleI(this.tableEditor.editor.toolbar,"width");var cw=damoUtil.getStyleI(this.contextMenu,"width");console.log(tw+":"+cw+":"+x)
if(cw+x>tw){x-=cw;}
damoUtil.setStyle(this.contextMenu,{display:"",top:(y-80)+"px",left:x+"px"});this.isshow=true;};this.hide=function(){damoUtil.setStyle(this.contextMenu,{display:"none"});this.isshow=false;};this.itemClick=function(action){this.hide();action(this.targetNode?this.targetNode:this.tableEditor,this);};this.setMenuItem=function(menuItems,menuTexts){this.menuItems=menuItems;var menu=this.contextMenu;while(menu.firstChild){menu.removeChild(menu.firstChild);}
for(var i in menuItems){var menuItem=menuItems[i];if(menuItem.command==="ie"&&!damoUtil.detectIE())continue;var item=damoUtil.createElement("div",menu);if("seperate"===menuItem.command){damoUtil.addClass(item,"damoContextMenuSeperate");continue;}
damoUtil.addClass(item,"damoContextMenuItem");damoUtil.addEvent(item,"click",this.itemClick.closure(this,menuItem.action));var itemHead=damoUtil.createElement("div",item,"damoContextMenuItemHead");if(menuItem.icon){damoUtil.setStyle(itemHead,{backgroundPosition:(menuItem.icon* -editorConfig.iconsize)+"px 0px"});}else{damoUtil.setStyle(itemHead,{"background-image":"url('') !important"});}
var itemBody=damoUtil.createElement("div",item,"damoContextMenuItemBody");itemBody.innerHTML=menuTexts[menuItem.text];}};}
DamoContextMenu.prototype.mouseup=function(ev){if(ev.button!==2){if(this.isshow)this.hide();return;}
this.tableEditor.editor=damoEditors.findDamoEditorInPath(ev.target);if(!this.tableEditor.editor){return}
this.targetNode=null;if(ev.target.nodeName==="IMG"){var sel=damoUtil.getSelection();sel.removeAllRanges();var menuItem=damoImageMenuItems.slice();if(!this.tableEditor.editor.imageEditor){menuItem.splice(2,1);}
this.setMenuItem(menuItem,this.tableEditor.editor.DamoMessage.imageMenu);this.show(ev.pageX,ev.pageY);return;}
var selectedTable=rangeUtil.findTagInPath(ev.target,"TABLE");if(!selectedTable){if(this.isshow)this.hide();return;}
if(this.tableEditor.selectList.length===0){this.tableEditor.selectList=[rangeUtil.findTagInPath(ev.target,"TD")];}else{var table=rangeUtil.findTagInPath(this.tableEditor.selectList[0],"TABLE");if(selectedTable!==table){this.tableEditor.unmarkSelectCell();this.tableEditor.selectList=[rangeUtil.findTagInPath(ev.target,"TD")];}}
this.setMenuItem(damoMenuItems,this.tableEditor.editor.DamoMessage.tableMenu);this.show(ev.pageX,ev.pageY);}
function DamoDialogTableLayout(){this.open=function(selectedTable){this.selectedTable=selectedTable;var html="<div id='damoDialogMain' class='damoDialogMain'></div>"+"<div id='damoDialogBottom' class='damoDialogBottom'><a href='#' class='damoCancelBtn'>"+this.editor.DamoMessage.dialog.closeBtn+"</a></div>";this.width="340px";this.height="390px";this.title=this.editor.DamoMessage.tableMenu.tableLayout;this.show(html);var damoDialogMain=damoUtil.getElm("damoDialogMain");this.borderColor=this.makeSelectBox(damoDialogMain,this.editor.DamoMessage.table.borderColor,damoSelectBoxLineColor4Table);this.bgColor=this.makeSelectBox(damoDialogMain,this.editor.DamoMessage.table.bgColor,damoSelectBoxLineColor4Table);this.borderColor.selectedItemEvent("#000000");this.bgColor.selectedItemEvent("#EAEAEA");var table=damoUtil.createElement("table",damoDialogMain,"damoLayoutDialog");for(var i=0;i<4;i++){var tr=damoUtil.createElement("tr",table);for(var j=0;j<4;j++){var inx=i*4+j;var td=damoUtil.createElement("td",tr,null,'click',this.LayoutClick.closureListener(this,inx));var span=damoUtil.createElement("span",td,"tableLayoutItem");damoUtil.setStyle(span,{backgroundPosition:(inx* -62)+"px 0px"});}}};this.LayoutClick=function(ev,button,inx){var type=parseInt(inx/4);inx=inx%4;initLayout(this.selectedTable,this.borderColor.selectedValue);var bgColor=this.bgColor.selectedValue;if(inx===1){var row=this.selectedTable.rows[0];for(var i=0;i<row.cells.length;i++){row.cells[i].style.backgroundColor=bgColor;}}else
if(inx>1){var rows=this.selectedTable.rows;var isEven=inx===2;for(var i=0;i<rows.length;i++){if(isEven&(i%2)!==1)continue;for(var j=0;j<rows[i].cells.length;j++){rows[i].cells[j].style.backgroundColor=bgColor;}}}
setLayoutByType(this.selectedTable,type);};function setLayoutByType(targetTable,type){if(type===1)setLayoutBottom(targetTable.rows[0]);else
if(type===2){setLayoutBottom(targetTable.rows[0]);setLayoutLeftRight(targetTable);}else
if(type===3){setLayoutLeftRightAll(targetTable);}}
function initLayout(targetTable,boderColor){var tableCss={"border-collapse":"collapse","border-color":boderColor};damoUtil.setStyle(targetTable,tableCss);var rows=targetTable.rows;var css={"background-color":"",border:"1px solid "+boderColor}
for(var i=0;i<rows.length;i++){for(var j=0;j<rows[i].cells.length;j++){damoUtil.setStyle(rows[i].cells[j],css);}}}
function setLayoutBottom(row){var css={"border-bottom-width":"3px","border-bottom-style":"solid"}
for(var i=0;i<row.cells.length;i++){damoUtil.setStyle(row.cells[i],css);}}
function setLayoutLeftRight(targetTable){damoUtil.setStyle(targetTable,{"border-left-width":"0px","border-right-width":"0px"});var rows=targetTable.rows;var cssL={"border-left-width":"0px"}
var cssR={"border-right-width":"0px"}
for(var i=0;i<rows.length;i++){damoUtil.setStyle(rows[i].cells[0],cssL);damoUtil.setStyle(rows[i].cells[rows[0].cells.length-1],cssR);}}
function setLayoutLeftRightAll(targetTable){damoUtil.setStyle(targetTable,{"border-left-width":"0px","border-right-width":"0px"});var rows=targetTable.rows;var css={"border-left-width":"0px","border-right-width":"0px"}
for(var i=0;i<rows.length;i++){for(var j=0;j<rows[i].cells.length;j++){damoUtil.setStyle(rows[i].cells[j],css);}}}};DamoDialogTableLayout.prototype=new DamoDialogBasic4Table();