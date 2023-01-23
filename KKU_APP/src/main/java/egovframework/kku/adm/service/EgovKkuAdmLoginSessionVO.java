package egovframework.kku.adm.service;

public class EgovKkuAdmLoginSessionVO {
	private String usrIdx 	  = "";  // 유저 고유번호
	private String usrEmail 	  = "";	 // 유저 아이디
	private String usrNickname      = "";  // 유저 이름
	
	/*private String cmntIdx    = "";  */
	public String getUsrIdx() {
		return usrIdx;
	}
	public void setUsrIdx(String usrIdx) {
		this.usrIdx = usrIdx;
	}
	public String getUsrEmail() {
		return usrEmail;
	}
	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
	}
	public String getUsrNickname() {
		return usrNickname;
	}
	public void setUsrNickname(String usrNickname) {
		this.usrNickname = usrNickname;
	}
	@Override
	public String toString() {
		return "EgovKkuAdminLoginSessionVO [usrIdx=" + usrIdx + ", usrEmail=" + usrEmail + ", usrNickname="
				+ usrNickname + "]";
	}
	
}
