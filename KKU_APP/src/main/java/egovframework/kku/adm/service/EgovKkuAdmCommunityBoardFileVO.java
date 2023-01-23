package egovframework.kku.adm.service;

import java.io.Serializable;
import java.util.Arrays;

import egovframework.com.cmm.ComDefaultVO;

/**
 * kpc-ceo-web
 * @author 개발팀 조반석
 * @since 2020.08.27
 * @version 1.0
 * @see
 */

@SuppressWarnings("serial")
public class EgovKkuAdmCommunityBoardFileVO  extends ComDefaultVO implements Serializable{

	private String fileIdx 	   = ""; // 게시판 파일 인덱스
	private String fileTblIdx  = ""; // 게시판 인덱스
	private String fileTblCode = ""; // 게시판 코드
	private String fileUsrFile 	   = ""; // 사용자 파일명
	private String fileSrvFile 	   = ""; // 서버 파일명
	private String fileDelYn       = ""; // 삭제여부	
	private String fileRegNick       = ""; // 작성자닉네임	
	private String fileRegIdx       = ""; // 작성자Idx	
	private String BfType       = ""; // 파일타입	

	// 파일 삭제여부
	private String delArr[];
	private String fileSvrNameArr[];
	
	// 첨부파일 삭제 확인
	private String fileNameArr[];

	public String getFileIdx() {
		return fileIdx;
	}

	public void setFileIdx(String fileIdx) {
		this.fileIdx = fileIdx;
	}

	public String getFileTblIdx() {
		return fileTblIdx;
	}

	public void setFileTblIdx(String fileTblIdx) {
		this.fileTblIdx = fileTblIdx;
	}

	public String getFileTblCode() {
		return fileTblCode;
	}

	public void setFileTblCode(String fileTblCode) {
		this.fileTblCode = fileTblCode;
	}

	public String getFileUsrFile() {
		return fileUsrFile;
	}

	public void setFileUsrFile(String fileUsrFile) {
		this.fileUsrFile = fileUsrFile;
	}

	public String getFileSrvFile() {
		return fileSrvFile;
	}

	public void setFileSrvFile(String fileSrvFile) {
		this.fileSrvFile = fileSrvFile;
	}

	public String getFileDelYn() {
		return fileDelYn;
	}

	public void setFileDelYn(String fileDelYn) {
		this.fileDelYn = fileDelYn;
	}

	public String[] getDelArr() {
		return delArr;
	}

	public void setDelArr(String[] delArr) {
		this.delArr = delArr;
	}

	public String[] getFileSvrNameArr() {
		return fileSvrNameArr;
	}

	public void setFileSvrNameArr(String[] fileSvrNameArr) {
		this.fileSvrNameArr = fileSvrNameArr;
	}

	public String[] getFileNameArr() {
		return fileNameArr;
	}

	public void setFileNameArr(String[] fileNameArr) {
		this.fileNameArr = fileNameArr;
	}

	public String getFileRegNick() {
		return fileRegNick;
	}

	public void setFileRegNick(String fileRegNick) {
		this.fileRegNick = fileRegNick;
	}

	public String getFileRegIdx() {
		return fileRegIdx;
	}

	public void setFileRegIdx(String fileRegIdx) {
		this.fileRegIdx = fileRegIdx;
	}

	public String getBfType() {
		return BfType;
	}

	public void setBfType(String bfType) {
		BfType = bfType;
	}

	@Override
	public String toString() {
		return "EgovKkuAdmCommunityBoardFileVO [fileIdx=" + fileIdx + ", fileTblIdx=" + fileTblIdx + ", fileTblCode="
				+ fileTblCode + ", fileUsrFile=" + fileUsrFile + ", fileSrvFile=" + fileSrvFile + ", fileDelYn="
				+ fileDelYn + ", fileRegNick=" + fileRegNick + ", fileRegIdx=" + fileRegIdx + ", BfType=" + BfType
				+ ", delArr=" + Arrays.toString(delArr) + ", fileSvrNameArr=" + Arrays.toString(fileSvrNameArr)
				+ ", fileNameArr=" + Arrays.toString(fileNameArr) + "]";
	}

}
