//-------------------- 아이디 저장 쿠키-----------------------------//
function loadingChat(str) {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(document).height();
    var maskWidth  = window.document.body.clientWidth;
     
    //화면에 출력할 마스크를 설정해줍니다.
    //var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg = '';
      
    loadingImg += "<div id='loadingImg' class=layer>"
    			+ "<div id='loadChat'><p align='center'>"+str+"</p>";
    loadingImg += " <img src='/_img/_img/cont/loading.gif' style='position: relative; display: block; margin: 0px auto;'/>";
    loadingImg += "</div></div>";

    //화면에 레이어 추가
    $('body')
    	.append(loadingImg)/*
        .append(mask)*/
        
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    /*
    //마스크 표시
    $('#mask').show();   */
    //로딩중 이미지 표시
    $('#loadingImg').show();
}
function closeLoading() {    
/*	$('#mask, #loadingImg').hide();    
	$('#mask, #loadingImg').remove();  
	*/	
	$('#loadingImg').hide();    
	$('#loadingImg').remove();  
    	
} 

function closeLoadingById(loadId) {    
	/*	$('#mask, #loadingImg').hide();    
		$('#mask, #loadingImg').remove();  
		*/	
		$('#'+loadId).hide();    
		$('#'+loadId).remove();  
	    	
} 