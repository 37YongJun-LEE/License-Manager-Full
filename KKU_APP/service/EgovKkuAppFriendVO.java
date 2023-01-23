package egovframework.kku.mypage.service;

import java.io.Serializable;

public class EgovKkuAppFriendVO  implements Serializable {
	private String friendIdx = ""; // 프렌드 인덱스
	private String friendMyid 	  = "";  // 내아이디
	private String friendFid 	  = "";	 // 상대아이디
	private String friendIsfav      = "";  // 즐겨찾기여부
	private String friendMyIdx = "";
	private String friendFrdIdx = "";
	private String friendStatus = ""; // 친구 상태 1:친구 0:대기중
	
	private String searchKeyword = ""; // 친구 검색
	
	
	
	public String getFriendIdx() {
		return friendIdx;
	}
	public void setFriendIdx(String friendIdx) {
		this.friendIdx = friendIdx;
	}
	public String getFriendMyid() {
		return friendMyid;
	}
	public void setFriendMyid(String friendMyid) {
		this.friendMyid = friendMyid;
	}
	public String getFriendFid() {
		return friendFid;
	}
	public void setFriendFid(String friendFid) {
		this.friendFid = friendFid;
	}
	public String getFriendIsfav() {
		return friendIsfav;
	}
	public void setFriendIsfav(String friendIsfav) {
		this.friendIsfav = friendIsfav;
	}
	public String getFriendMyIdx() {
		return friendMyIdx;
	}
	public void setFriendMyIdx(String friendMyIdx) {
		this.friendMyIdx = friendMyIdx;
	}
	public String getFriendFrdIdx() {
		return friendFrdIdx;
	}
	public void setFriendFrdIdx(String friendFrdIdx) {
		this.friendFrdIdx = friendFrdIdx;
	}
	public String getFriendStatus() {
		return friendStatus;
	}
	public void setFriendStatus(String friendStatus) {
		this.friendStatus = friendStatus;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	
	@Override
	public String toString() {
		return "EgovKkuAppFriendVO [friendIdx=" + friendIdx + ", friendMyid=" + friendMyid + ", friendFid=" + friendFid
				+ ", friendIsfav=" + friendIsfav + ", friendMyIdx=" + friendMyIdx + ", friendFrdIdx=" + friendFrdIdx
				+ ", friendStatus=" + friendStatus + ", searchKeyword=" + searchKeyword + "]";
	}
	
	
	
}
