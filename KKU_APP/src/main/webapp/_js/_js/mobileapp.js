


var mobileapp = {
	scheme : "kkuapp",
	//초기작업
	init : function() {
		var nowUrl = location.href;
		if(nowUrl.indexOf("/member/login.do") > -1) {
			mobileapp.webtoapp({cmd : "clearHistory"});
		}
		
		
		//mobileapp.webtoapp({cmd : "getDeviceNo"});
		//$.get("http://ipinfo.io", function(response) {
			//if(response.ip == "220.71.10.208") {
				if(mobileapp.os() == "android") {
					
					mobileapp.webtoapp({cmd : "getDeviceId"});
				}
				else if(mobileapp.os() == "ios") {
					//if(mobileapp.version() >= "1.0") {
						mobileapp.webtoapp({cmd : "getDeviceId"});
					//}
				} else {
				}
			//}
		//}, "jsonp");
		mobileapp.webtoapp({cmd : "setHistory", url : nowUrl});
	},

	//OS 구분확인
	/* 둘 다 공통으로 있음 */
	os : function() {
		//var ipad = navigator.userAgent.match(/iPad/i) != null;
		//var iphone = navigator.userAgent.match(/iPhone/i) != null;
		//var ipod = navigator.userAgent.match(/iPod/i) != null;
		var android = navigator.userAgent.match(/Android/i) != null;
		
		var ios = navigator.userAgent.match(/(iPad|iPhone|iPod)/g) != null;

		//if(ipad || iphone || ipod) return "ios";
		if(ios) return "ios";
		else if(android) return "android";
		else return "pc";
	}, 

	//웹뷰에서 접근여부 판별
	/* 둘 다 공통으로 있음 */
	inapp : function() {
		var agent = navigator.userAgent.toLowerCase();
		return !(agent.indexOf(mobileapp.scheme.toLocaleLowerCase()) == -1);
	},

	//iOS 인터페이스 호출
	/* 둘 다 공통으로 있음 */
	ios : function(cmd, jsonstr) {
		var ifsrc = mobileapp.scheme + "://" + cmd + "?" + jsonstr;
		$('body').append("<iframe id='appIF' src='"+ifsrc+"' frameborder='no' scrolling='0' width='0' height='0'><clearHistory/iframe>");
		$('#appIF').remove();
	},

	//안드로이드 인터페이스 호출
	/* 둘 다 공통으로 있음 */
	android : function(cmd, jsonstr) {
		try {
			eval("window." + mobileapp.scheme + "." + cmd + "('" + jsonstr + "')");
		}
		catch (e) {
			alert(e.message);
		}
	},

	//웹에서 앱으로 호출시 사용
	/* 둘 다 공통으로 있음 */
	webtoapp : function(jsonobj) {
		//IN앱일 경우
		if(mobileapp.inapp()) {
			var jsonstr = JSON.stringify(jsonobj);
			if(mobileapp.os() == "android") {
				mobileapp.android(jsonobj.cmd, jsonstr);
			}
			else if(mobileapp.os() == "ios") {
				mobileapp.ios(jsonobj.cmd, jsonstr);
			}
		}
	},
	
	version : function() {
		if(mobileapp.inapp()) {
			
			var agent = navigator.userAgent;
			//alert("1"+agent);
			if(mobileapp.os() == "android") {
				var appVersionTmp = agent.split("kpcceo_app_android_");
				return appVersionTmp[1];
			}
			else if(mobileapp.os() == "ios") {
				//alert("ios"+agent);
				var appVersionTmp = agent.split("kpcceo_app_iphone_");
				return appVersionTmp[1];
			}
		}
		else {
			return 0;
		}
	},

	//앱에서 웹으로 호출시 사용
	apptoweb : function(jsonobj) {
		switch(jsonobj.cmd) {
			case "getDeviceNo": {
				$("#deviceNo").val(jsonobj.deviceNo);
				break;
			}

			case "getDeviceId" : {
				$("#deviceId").val(jsonobj.deviceId);
				alert($("#deviceId").val(jsonobj.deviceNo));
				//alert(jsonobj.deviceId);
				//var deviceId = jsonobj.deviceId;
				/*$.ajax({
	    			url: '/app/setDeviceId.do',
	    			type: 'POST',
	    			data: { deviceId : jsonobj.deviceId },
	    			success: function(res){
	    			}, error : function(err) {
	    			}
	    		});*/
				
				  var expire = new Date();
				  expire.setDate(expire.getDate() + 1);
				  cookies = 'DEVICEID' + '=' + escape(jsonobj.deviceId) + '; path=/ '; 
				  if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
				  document.cookie = cookies;

				break;
			}

			case "setAutoLogin": {
				$("#appAuto").val(jsonobj.rtnState);
				setState();
				break;
			}
			case "setPushAgree": {
				$("#appPush").val(jsonobj.rtnState);
				setState();
				break;
			}
			case "getGooglePlayVersion": {
				var googleVer = jsonobj.version;
				if(googleVer == "") {
					$("#div_version_new").hide();
				}
				else {
					$("#div_version_new .right").text(googleVer);
					if(googleVer.replace(".", "") > mobileapp.version().replace(".", "")) {
						$("#div_update").show();
					}
				}
				break;
			}
			case "historyUsing" : {
				eval(jsonobj.after);
				break;
			}
			//IOS 앱에서만 호출되는 메시지
			case "ios" : {
				apphelper.iosToWeb(jsonobj);
				break;
			}
		}
	}
};

var apphelper =  {
	//통신 판매 사업자 정보 표시		
	footerBiz : function() {
		var parmObj = { 
			cmd : "openBrowser",
			url :  "http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1018628756"
		  }; 
			
		 if(mobileapp.inapp()) {
			 mobileapp.webtoapp(parmObj);		 
		 }
		 else {
			 window.open(parmObj.url, "communicationViewPopup", "width=750, height=700;");					 
		}		
	},

	//IOS에서만 적용되는 특정 기능 처리
	iosToWeb : function(jsonobj) {
		//백그라운드 갔다가 되돌아 올경우 처리
		if(jsonobj.action == "setting") {
			if(window.location.pathname == "/mobile/mypage/settings.do") {
				window.location.reload();
			}			
		}
	},
	
	//단말기번호 수신완료시 실행해야 할 로직 
	receiveDeviceNo : function() {
		try {
			mobileAppLoadSyncFinish();			
		}  catch (e) {}
	}
};




function openBrowser( url ){
	var parmObj = { 
		cmd : "openBrowser",
		url :  url
	  }; 
		
	 if (mobileapp.inapp()) {
		mobileapp.webtoapp(parmObj);
	 }else{		
		window.open(url);
	 }
}

function openWindow( url, title ){
	var parmObj = { 
		cmd : "openWindow",
		url :  url,
		title : title
	  }; 
		
	 if (mobileapp.inapp()) {
		mobileapp.webtoapp(parmObj);
	 }else{		
		window.open(url);
	 }

}

function doShare( name, url, title ) { 
	var parmObj = { 
			cmd : "doShare",
			name :  name,
			url : url,
			title : title
		  }; 
	if (mobileapp.inapp()) {
		mobileapp.webtoapp(parmObj);
		//alert("모바일");
	}else{		
		alert("웹");
		//window.open(key3);
	}
}



/*function fileDownload( str, real_name ){
	var parmObj = { 
		cmd : "fileDownload",
		str :  str,
		real_name : real_name,
		url : "http://www.vtk-cs.co.kr"+str+real_name
	  }; 
		
	 if (mobileapp.inapp()) {
		mobileapp.webtoapp(parmObj);
	 }else{		
		location.href = "http://www.vtk-cs.co.kr"+str+real_name;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
	 }

}*/