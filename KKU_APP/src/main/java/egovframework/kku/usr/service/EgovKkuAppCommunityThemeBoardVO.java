package egovframework.kku.usr.service;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class EgovKkuAppCommunityThemeBoardVO  extends ComDefaultVO implements Serializable{
	public int bthemeIdx;
	public String bthemeName;
	public String bthemeCreater;
	public String bthemeCreateridx;
	public String bthemeCreatergroup;
	public String bthemeCreatercontact;
	public String bthemeCreateremail;
	public String bthemeCreatepurpose;
	public String bthemeApplydate;
	public String bthemeAprovaldate;
	public String bthemeStatus;
	public String first;
	private String[] fileIdxArr ;
	private String[] delArr ;
	
	public int fileTblCode;
	public int likeNum;
	public String usrNickname;
	public String usrMajor;
	public String usrStdnum;
	public String usrSrvprofilepic;
	public int fileCnt;
	/*게시판용*/
	public int tboardIdx;
	public String tboardContent;
	public String tboardWriter;
	public String tboardWritedate;
	public int tboardViewnum;
	public int tboardStatus = 1;
	public String tboardDetailname;
	public String tboardTitle;
	public String tboardName;
	public int getBthemeIdx() {
		return bthemeIdx;
	}
	public void setBthemeIdx(int bthemeIdx) {
		this.bthemeIdx = bthemeIdx;
	}
	public String getBthemeName() {
		return bthemeName;
	}
	public void setBthemeName(String bthemeName) {
		this.bthemeName = bthemeName;
	}
	public String getBthemeCreater() {
		return bthemeCreater;
	}
	public void setBthemeCreater(String bthemeCreater) {
		this.bthemeCreater = bthemeCreater;
	}
	public String getBthemeCreateridx() {
		return bthemeCreateridx;
	}
	public void setBthemeCreateridx(String bthemeCreateridx) {
		this.bthemeCreateridx = bthemeCreateridx;
	}
	public String getBthemeCreatergroup() {
		return bthemeCreatergroup;
	}
	public void setBthemeCreatergroup(String bthemeCreatergroup) {
		this.bthemeCreatergroup = bthemeCreatergroup;
	}
	public String getBthemeCreatercontact() {
		return bthemeCreatercontact;
	}
	public void setBthemeCreatercontact(String bthemeCreatercontact) {
		this.bthemeCreatercontact = bthemeCreatercontact;
	}
	public String getBthemeCreateremail() {
		return bthemeCreateremail;
	}
	public void setBthemeCreateremail(String bthemeCreateremail) {
		this.bthemeCreateremail = bthemeCreateremail;
	}
	public String getBthemeCreatepurpose() {
		return bthemeCreatepurpose;
	}
	public void setBthemeCreatepurpose(String bthemeCreatepurpose) {
		this.bthemeCreatepurpose = bthemeCreatepurpose;
	}
	public String getBthemeApplydate() {
		return bthemeApplydate;
	}
	public void setBthemeApplydate(String bthemeApplydate) {
		this.bthemeApplydate = bthemeApplydate;
	}
	public String getBthemeAprovaldate() {
		return bthemeAprovaldate;
	}
	public void setBthemeAprovaldate(String bthemeAprovaldate) {
		this.bthemeAprovaldate = bthemeAprovaldate;
	}
	public String getBthemeStatus() {
		return bthemeStatus;
	}
	public void setBthemeStatus(String bthemeStatus) {
		this.bthemeStatus = bthemeStatus;
	}
	public String getFirst() {
		return first;
	}
	public void setFirst(String first) {
		this.first = first;
	}
	public String[] getFileIdxArr() {
		return fileIdxArr;
	}
	public void setFileIdxArr(String[] fileIdxArr) {
		this.fileIdxArr = fileIdxArr;
	}
	public String[] getDelArr() {
		return delArr;
	}
	public void setDelArr(String[] delArr) {
		this.delArr = delArr;
	}
	public int getFileTblCode() {
		return fileTblCode;
	}
	public void setFileTblCode(int fileTblCode) {
		this.fileTblCode = fileTblCode;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public String getUsrNickname() {
		return usrNickname;
	}
	public void setUsrNickname(String usrNickname) {
		this.usrNickname = usrNickname;
	}
	public String getUsrMajor() {
		return usrMajor;
	}
	public void setUsrMajor(String usrMajor) {
		this.usrMajor = usrMajor;
	}
	public String getUsrStdnum() {
		return usrStdnum;
	}
	public void setUsrStdnum(String usrStdnum) {
		this.usrStdnum = usrStdnum;
	}
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	public int getTboardIdx() {
		return tboardIdx;
	}
	public void setTboardIdx(int tboardIdx) {
		this.tboardIdx = tboardIdx;
	}
	public String getTboardContent() {
		return tboardContent;
	}
	public void setTboardContent(String tboardContent) {
		this.tboardContent = tboardContent;
	}
	public String getTboardWriter() {
		return tboardWriter;
	}
	public void setTboardWriter(String tboardWriter) {
		this.tboardWriter = tboardWriter;
	}

	public String getTboardWritedate() {
		return tboardWritedate;
	}
	public void setTboardWritedate(String tboardWritedate) {
		this.tboardWritedate = tboardWritedate;
	}
	public int getTboardViewnum() {
		return tboardViewnum;
	}
	public String getUsrSrvprofilepic() {
		return usrSrvprofilepic;
	}
	public void setUsrSrvprofilepic(String usrSrvprofilepic) {
		this.usrSrvprofilepic = usrSrvprofilepic;
	}
	public void setTboardViewnum(int tboardViewnum) {
		this.tboardViewnum = tboardViewnum;
	}
	public int getTboardStatus() {
		return tboardStatus;
	}
	public void setTboardStatus(int tboardStatus) {
		this.tboardStatus = tboardStatus;
	}
	public String getTboardDetailname() {
		return tboardDetailname;
	}
	public void setTboardDetailname(String tboardDetailname) {
		this.tboardDetailname = tboardDetailname;
	}
	public String getTboardTitle() {
		return tboardTitle;
	}
	public void setTboardTitle(String tboardTitle) {
		this.tboardTitle = tboardTitle;
	}
	public String getTboardName() {
		return tboardName;
	}
	public void setTboardName(String tboardName) {
		this.tboardName = tboardName;
	}
	@Override
	public String toString() {
		return "EgovKkuAppCommunityThemeBoardVO [bthemeIdx=" + bthemeIdx + ", bthemeName=" + bthemeName
				+ ", bthemeCreater=" + bthemeCreater + ", bthemeCreateridx=" + bthemeCreateridx
				+ ", bthemeCreatergroup=" + bthemeCreatergroup + ", bthemeCreatercontact=" + bthemeCreatercontact
				+ ", bthemeCreateremail=" + bthemeCreateremail + ", bthemeCreatepurpose=" + bthemeCreatepurpose
				+ ", bthemeApplydate=" + bthemeApplydate + ", bthemeAprovaldate=" + bthemeAprovaldate
				+ ", bthemeStatus=" + bthemeStatus + ", first=" + first + ", fileIdxArr=" + Arrays.toString(fileIdxArr)
				+ ", delArr=" + Arrays.toString(delArr) + ", fileTblCode=" + fileTblCode + ", likeNum=" + likeNum
				+ ", usrNickname=" + usrNickname + ", usrMajor=" + usrMajor + ", usrStdnum=" + usrStdnum
				+ ", usrSrvprofilepic=" + usrSrvprofilepic + ", fileCnt=" + fileCnt + ", tboardIdx=" + tboardIdx
				+ ", tboardContent=" + tboardContent + ", tboardWriter=" + tboardWriter + ", tboardWritedate="
				+ tboardWritedate + ", tboardViewnum=" + tboardViewnum + ", tboardStatus=" + tboardStatus
				+ ", tboardDetailname=" + tboardDetailname + ", tboardTitle=" + tboardTitle + ", tboardName="
				+ tboardName + "]";
	}
	
}
