function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
			try {
				rtnPostcode(data);
			}
			catch (e){
				//ignore
			}
        }
    }).open();
}

// footer 에서 사용
function f_postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
			try {
				f_rtnPostcode(data);
			}
			catch (e){
				//ignore
			}
        }
    }).open();
}



//페이지 함수
function submit(action, pageNo) {
	if(action != "") {
		$("schFrm").attr("action", action);
	}
	$("#pageIndex").val(pageNo);
	$("#schFrm").submit();
}
function fnLinkPage(pageNo) {
	submit("", pageNo);
}

// 폼값 클리어
function clearForm(oForm) {

	var frm_elements = oForm.elements;
	for (i = 0; i < frm_elements.length; i++){
		field_type = frm_elements[i].type.toLowerCase();
		switch (field_type){
			case "text":
			case "password":
			case "textarea":
			case "hidden":
				frm_elements[i].value = "";
			break;

			case "radio":
			case "checkbox":
				if (frm_elements[i].checked){
					frm_elements[i].checked = false;
				}
				break;
			case "select-one":
			case "select-multi":
				//frm_elements[i].selectedIndex = 0;
				break;
			default:
			break;
		}
	}
}

// 폼값 클리어
function clearForm2(oForm) {

	var frm_elements = oForm.elements;
	for (i = 0; i < frm_elements.length; i++){
		field_type = frm_elements[i].type.toLowerCase();
		switch (field_type){
			case "text":
			case "password":
			case "textarea":
				frm_elements[i].value = "";
			break;

			case "radio":
			case "checkbox":
				if (frm_elements[i].checked){
					frm_elements[i].checked = false;
				}
				break;
			case "select-one":
			case "select-multi":
				//frm_elements[i].selectedIndex = 0;
				break;
			default:
			break;
		}
	}
}


function setCookie(name,value,expiredays) { 
	var today = new Date();
	today.setDate(today.getDate()+expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + today.toGMTString() + ";";
}

function getCookie( name ) {
	var nameOfCookie = name + "="; 
	var x = 0; 
	while ( x <= document.cookie.length ) 
	{ 
		var y = (x+nameOfCookie.length); 
		if ( document.cookie.substring( x, y ) == nameOfCookie ) { 
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
				endOfCookie = document.cookie.length; 
			return unescape( document.cookie.substring( y, endOfCookie ) ); 
		} 
		x = document.cookie.indexOf( " ", x ) + 1; 
		if ( x == 0 ) 
		break; 
	} 
	return ""; 
}

// 04.18 승철 추가
function isEmpty(str) {
	if(typeof str == "undefined" || str == null || str == "")
		return true;
	else
		return false;
}
