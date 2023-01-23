//-------------------- 아이디 저장 쿠키-----------------------------//
	function getCookie(cookieName){
		var search = cookieName + "=";
		var cookie = document.cookie;

		if( cookie.length > 0 ){
		startIndex = cookie.indexOf( cookieName );

		 	if( startIndex != -1 ){
				startIndex += cookieName.length;
				endIndex = cookie.indexOf( ";", startIndex );
		
				if( endIndex == -1) endIndex = cookie.length;
				return unescape( cookie.substring( startIndex + 1, endIndex ) );
		  	}else{
				return false;
		  	}
		}else{
			return false;
		}
	}

	function setCookie(cookieName, cookieValue, expireDate){
		var today = new Date();
		today.setDate( today.getDate() + parseInt( expireDate ) );
		document.cookie = cookieName + "=" + escape( cookieValue ) + "; path=/; expires=" + today.toGMTString() + ";";
	}

	function readCookie(){
		if(getCookie("idCook")!=false){
			$("input:checkbox[id='save']").attr("checked", true);
			$("input:checkbox[id='save']").parent().addClass("checked");
			$("#usrEmail").val(getCookie("idCook"));
			$("#usrPassword").focus();
		}else{
			$("#usrEmail").focus();
		}
	}

	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate( expireDate.getDate() - 1 );
		document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
	}