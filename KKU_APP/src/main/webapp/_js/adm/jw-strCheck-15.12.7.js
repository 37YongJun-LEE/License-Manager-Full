/********************사용설명서********************
한글만 입력이 필요한 경우
<input ... strChk="kor" />

영문만 입력이 필요한 경우
<input ... strChk="eng" />

영문과 숫자만 입력이 필요한 경우
<input ... strChk="num_eng" />
<input ... strChk="eng_num" />
********************사용설명서********************/


var mailCheck = /[0-9a-zA-Z-.]/;
var korCheck = /[ㄱ-ㅎㅏ-ㅣ가-힣]/;
var engCheck = /[0-9a-zA-Z-_]/;
var eng_numCheck = num_engCheck = /[0-9a-zA-Z-_.]/;
var numCheck = /[0-9]/;
var eng_num = num_eng = "영문과 숫자";
var num = "숫자";
var eng = "영문";
var mail = "영문, 숫자, 하이픈(-)";
var kor = "한글";
var firstMsg = "";

if(navigator.userAgent.indexOf("Chrome") > -1 || navigator.userAgent.indexOf("Firefox") > -1 ) {
	$(window).keyup(function(e) {
		fnCheck(e.keyCode);
	});
}
else {
	window.document.onkeyup = function() {
		fnCheck(window.event.keyCode);
	};
}

function fnCheck(keyCode) {
	if(isAccessStr(keyCode)) {
		var strChk = $(":focus").attr("strChk");
		try {
			strChk = strChk.toLowerCase();
		}
		catch(e) {
			//ignore
		}

		var value = $(":focus").val();
		var newValue = "";
		var isAlert = false;

		if(strChk == "kor" || strChk == "eng" || strChk == "num_eng" || strChk == "eng_num" || strChk == "mail" || strChk == "num") {
			for(var i=0; i<value.length; i++) {
				valueAt = value.charAt(i);
				if(eval(strChk + "Check.test('" + valueAt + "')")) {
					if((strChk.indexOf("eng") > -1 || strChk.indexOf("mail") > -1) && i == 0 && !engCheck.test(valueAt)) {
						firstMsg = "첫글자는 영문자";
						isAlert = true;
						break;
					}
					newValue += valueAt;
				}
				else {
					firstMsg = eval(strChk);
					isAlert = true;
				}
			}

			if(isAlert) {
				alert(firstMsg + "만 입력 가능합니다.");
				$(":focus").val(newValue);
			}
		}
	}
}

function isAccessStr(code) {
	var isAccessStr = true;
	$.each(ignoreCode, function(key, value) {
		if(code == value) {
			return isAccessStr = false;
		}
	});
	return isAccessStr;
}

var ignoreCode = new Array(
	  8,// Back
	  9,// Tab
	 16,// Shift
	 27,// Esc
	 35,// End
	 36,// Home
	 46,// Delete
	 37,// 방향키
	 38,// 방향키
	 39,// 방향키
	 40,// 방향키
	116/// F5
);