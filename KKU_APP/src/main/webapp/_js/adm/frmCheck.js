/********************************************************************
 *
 * Form 관련 스크립트 함수 모음
 *
 *******************************************************************/
	// 폼 검증 함수
	function checkForm(f) {
		var fObj;	// 폼 요소
		var fOId;	// 폼 ID 이름
		var fTyp;	// 폼 요소 Type
		var fVal;	// 폼 요소 Value
		var fMsg;	// 경고 메시지 속성
		var fNum;	// 숫자만 입력 속성
		var fMax;	// 최대 길이 지정
		var fMin;	// 최소 길이 지정
		var fMxN;	// 최대값 지정
		var fMnN;	// 최소값 지정
		var fMal;	// 메일 FORMAT
		var fLng;	// 길이값
		var fKMax;	// 최대 길이 지정(한글)
		var fNumEng;// 영문, 숫자 체크
		var fUrl;	// url (http, https) 체크
		var fSUrl; // ssl url(https) 체크
		var rtnV    = true;		

		$("#"+f+" input, #"+f+" select, #"+f+" textarea").each(function(){ 
			fObj	= $(this);
			fOId	= $(this).attr("id");
			fTyp	= toUpperCase(fObj.attr("type"));
			fVal	= $.trim(fObj.val());
			fMsg	= fObj.attr("msg");		  // 경고 메시지
			fNum	= fObj.attr("chknum");	  // 숫자만 기입 가능하도록
			fMax	= fObj.attr("maxlen");	  // 최대 입력글자수 제한
			fKMax	= fObj.attr("maxlenK");	  // 최대 입력글자수 한글만 제한
			fMin	= fObj.attr("minlen");	  // 최소 입력글자수 제한
			fMxN	= fObj.attr("maxnum");	  // 최대 숫자 제한
			fMnN	= fObj.attr("minnum");	  // 최소 숫자 제한
			fMal	= fObj.attr("chkmail");	  // 이메일 체크
			fLng	= fObj.attr("chklen");    // 길이체크			
			fNumEng = fObj.attr("chknumeng"); // 영문, 숫자 체크
			fUrl		= fObj.attr("chkurl");	// url 체크
			fSUrl	= fObj.attr("chkssl"); // SSL url 체크

			

			// 체크해야 하는 필수 폼인지 확인
			var chkBool = false;
			if (fMsg != undefined || getLen(fVal) > 0) chkBool = true;

			// select 타입 인식 불가시 기본 select box 로 인식
			if (fTyp == "") fTyp = "SELECT-ONE";

			if (chkBool && fMsg != undefined && (fTyp == "TEXT" || fTyp == "HIDDEN" || fTyp == "TEXTAREA" || fTyp == "PASSWORD") && fVal.replace(/ /gi,"") == "") {				
				alert(fMsg + " 입력해 주세요");
				if (fTyp != "HIDDEN" && fTyp != "TEXTAREA") {fObj.focus();}
				rtnV = false;
				return false;
			}
			if (chkBool && fMsg != undefined && (fTyp == "FILE") && fVal =="") {
				alert(fMsg + " 입력해주세요");
				rtnV = false;
				return false;
			}
			if (chkBool && fMsg != undefined && (fTyp == "SELECT-ONE" || fTyp == "SELECT-MULTIPLE") && fVal =="") {
				alert(fMsg + " 선택해 주세요");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fMsg != undefined && fTyp == "RADIO" && checkChecked(fOId,"radio") == false) {
				alert(fMsg + " 선택해 주세요");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fMsg != undefined && fTyp == "CHECKBOX" && checkChecked(fOId,"checkbox") == false) {
				alert(fMsg + " 선택해 주세요");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fNum != undefined && isNaN(fVal)) {
				alert("숫자로만 입력해 주세요");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fMax != undefined && fMax < getLen(fVal)) {
				alert("입력된 글자수가 "+fMax+"자보다 작아야합니다.");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fKMax != undefined && fKMax < getLen(fVal)) {
				alert("입력된 글자수가 "+fKMax+"자보다 작아야합니다.\n(영문 "+fKMax+"자, 한글 "+Math.floor(fKMax/2)+"자 까지 가능합니다.)");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fMin != undefined && fMin > getLen(fVal)) {
				alert("입력된 글자수가 "+(fMin-1)+"자보다 커야합니다.");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fLng != undefined && fLng != getLen(fVal)) {
				alert(""+fLng+"자리로 입력해주세요.");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fMxN != undefined && parseInt(fMxN) < parseInt(fVal)) {
				alert("입력된 숫자는 "+fMxN+"보다 작아야합니다.");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fMnN != undefined && parseInt(fMnN) > parseInt(fVal)) {
				alert("입력된 숫자는 "+fMnN+"보다 커야합니다.");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fMal != undefined && checkEmail(fVal) == false && fVal != "") {
				alert("이메일 주소가 올바르지 않습니다");
				rtnV = false;
				fObj.focus(); return false;
			}
			if (chkBool && fNumEng != undefined && checkNumEng(fVal) == false && fVal != "") {
				alert(fNumEng+" 영문, 숫자를 조합해서 입력해주세요.");
				rtnV = false;
				fObj.focus(); return false;
			}
			if(chkBool && fUrl != undefined && checkUrl(fVal) == false && fVal != "") {
				alert("url이 올바르지 않습니다.");
				rtnV = false;
				fObj.focus(); return false;
			}
			if(chkBool && fSUrl != undefined && checkSSLUrl(fVal) == false && fVal != "") {
				alert("url이 올바르지 않습니다.");
				rtnV = false;
				fObj.focus(); return false;
			}
			
		});

		return rtnV;
	}

	// 폼 검증 함수
	function checkFormResearch(f) {
		var fObj;	// 폼 요소
		var fOId;	// 폼 ID 이름
		var fTyp;	// 폼 요소 Type
		var fVal;	// 폼 요소 Value
		var fMsg;	// 경고 메시지 속성

		var rtnV    = true;		
		var saveId  = "";

		$("#"+f+" input:radio, #"+f+" textarea").each(function(){ 
			fObj	= $(this);
			fOId	= $(this).attr("id");
			fTyp	= toUpperCase(fObj.attr("type"));
			fVal	= fObj.val();
			fMsg	= fObj.attr("msg");		  // 경고 메시지

			

			// 체크해야 하는 필수 폼인지 확인
			var chkBool = false;
			if (fMsg != undefined || getLen(fVal) > 0) chkBool = true;

			// select 타입 인식 불가시 기본 select box 로 인식
			if (fTyp == "") fTyp = "SELECT-ONE";

			if (chkBool && fMsg != undefined && (fTyp == "TEXTAREA") && fVal == "") {				
				alert(fMsg + " 입력해 주세요");
				if (fTyp != "HIDDEN" && fTyp != "TEXTAREA") {fObj.focus();}
				rtnV = false;
				return false;
			}
			if (saveId != fOId) {
				if (chkBool && fMsg != undefined && fTyp == "RADIO" && checkChecked(fOId,"radio") == false) { 
					alert(fMsg + " 선택해 주세요");
					rtnV = false;
					fObj.focus(); return false;
				}
			}

			saveId = fOId;
			
		});

		return rtnV;
	}

	// 폼에 해당하는 컨트롤들의 기본값 쉽게 셋팅해 주기
	function initForm(f) {
		var ival;	// 각 요소의 default value 값 즉! 초기화하고자 하는값(일치형)
		var ivalin;	// 각 요소의 default value 값 즉! 초기화하고자 하는값(포함형)
		var fTyp;	// form 요소의 타입(select, radio, checkbox...)

		$("#"+f+" input, #"+f+" select").each(function(){ 
			fObj	= $(this);
			fOId	= $(this).attr("id");
			fTyp	= toUpperCase(fObj.attr("type"));
			ival	= $(this).attr("ival");
			ivalin	= $(this).attr("ivalin");

			// 이상한 케이스 발견 사용자 쪽에서 select 타입 인식 불가
			if (fTyp == "") fTyp = "SELECT-ONE";

			if (ival != undefined && fTyp == "SELECT-ONE") {
				for (var i=0;i<$("#"+fOId+" option").length;i++) {
					if (ival == $("#"+fOId+" option:eq("+i+")").val()) {
						fObj.val(ival);
					}					
				}
			}
			if (ival != undefined && (fTyp == "RADIO" || fTyp == "CHECKBOX")) {
				if (ival == fObj.val()) {
					fObj.attr("checked","checked");
				}
			}
			if (ivalin != undefined && (fTyp == "RADIO" || fTyp == "CHECKBOX")) {
				if (ivalin.indexOf(fObj.val()) != -1) {
					fObj.attr("checked","checked");
				}
			}			
		});

	}
	// 배열 요소일 경우 checked 된것이 있는지 확인
	function checkChecked(objid,objType) {
		var ret = false;
		if($("input:"+objType+"[id='"+objid+"']:checked").val() == undefined) {
			ret = false;
		} else {
			ret = true;
		}
		return ret;
	}
	// 이메일 유효성 체크
	function checkEmail(str){
	    var regexr = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	    return regexr.test(str); //이메일형식이 아니면 false, 맞으면 true
	}
	// 문자 길이 반환 (영문 1byte, 한글 2byte 계산)
	function getLen(str) {
		var len;
	    var temp;

	    len = str.length;
	    var tot_cnt = 0;

	    for(var k=0;k < len;k++){
	    	temp = str.charAt(k);
	    	if(escape(temp).length > 4)
	    		tot_cnt += 2;
	    	else
	    		tot_cnt++;
	    }
	    return tot_cnt;
	}
	// 대문자 변환 ex) toUpperCase(문자)
	function toUpperCase(str) {
		var ret;
		str != null ? ret = str.toUpperCase() : ret = "";
		return ret;
	}
	// 영문 조합해서 입력
	function checkEng(str){
		var reg2 = /[a-zA-Z]/g;		
		return (reg2.test(str));
	}
	// 영문하고 숫자를 조합해서 입력
	function checkNumEng(str){
		//var reg1 = /^[a-zA-Z0-9]{6,16}$/;
		//var reg2 = /[a-zA-Z]/g;
		//var reg3 = /[0-9]/g;
		var regExp4 = /^[a-zA-Z0-9]+$/; // 영문하고숫자만

		//return (reg1.test(str) && reg2.test(str) && reg3.test(str));
		return (regExp4.test(str));
	}
	// 영문하고 숫자하고 특수문자 조합해서 입력
	function checkNumEngChar(str){
		var reg1 = /[a-zA-Z0-9_]/;
		var reg2 = /[^a-zA-Z0-9_]/;
		var reg3 = /[a-zA-Z]/g;
		var reg4 = /[0-9]/g;
		return (reg1.test(str) && (reg2.test(str) || reg3.test(str)) && (reg2.test(str) || reg4.test(str)));
	}
	// 한글체크
	function checkKorChar(str){
		var reg1 = /^[\uac00-\ud7a3]*$/;
		return (reg1.test(str));
	}
	// 특수문자 입력제한
	function checkNumEngKorChar(str){
		var reg1 = /[`~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]/gi;
		return (reg1.test(str));
	}
	// 검색문구제한
	function checkSearchChar(str){
		var reg1 = /^[\uac00-\ud7a3]*$/;
		var reg2 = /^[a-zA-Z0-9]+$/;
		return (reg1.test(str) || reg2.test(str));
	}
	// 특정 문자열 입력만 체크
	function isDefindeChars(input_value, chars) {
		if (input_value == "") return false;
		for (var i = 0; i < input_value.length; i++) {
		   if (chars.indexOf(input_value.charAt(i)) == -1)
			   return false;
		}
		return true;
	}
	// URL 유효성 체크
	function checkUrl(str){
		var regex	=	/^(http:\/\/)|(https:\/\/)/;
		return regex.test(str);
	}
	// SSL URL 유효성 체크
	function checkSSLUrl(str){
		var regex	=	/^(https:\/\/)/;
		return regex.test(str);
	}