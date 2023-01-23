package egovframework.com.cmm.util;

import java.io.Serializable;

public class EgovLmsWebSessionVO  implements Serializable {
	private static final long serialVersionUID = -7037706821616494828L;
	
	private String userId = "";
	private String userName = "";
	private String memType = "";
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
}
