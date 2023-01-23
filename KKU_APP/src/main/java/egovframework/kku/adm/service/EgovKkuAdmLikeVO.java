package egovframework.kku.adm.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

/**
 * kpc-ceo-web
 * @author 개발팀 조반석
 * @since 2020.08.27
 * @version 1.1
 * @see
 */

@SuppressWarnings("serial")
public class EgovKkuAdmLikeVO extends ComDefaultVO implements Serializable{
		
	private String usrIdx  = "";  //좋아요 누른 유저
	private String trdIdx    = "";  //테이블 번호
	private String tblCode    = "";  //테이블 코드 0 중고거래
	
	public String getUsrIdx() {
		return usrIdx;
	}
	public void setUsrIdx(String usrIdx) {
		this.usrIdx = usrIdx;
	}
	public String getTrdIdx() {
		return trdIdx;
	}
	public void setTrdIdx(String trdIdx) {
		this.trdIdx = trdIdx;
	}
	public String getTblCode() {
		return tblCode;
	}
	public void setTblCode(String tblCode) {
		this.tblCode = tblCode;
	}
}