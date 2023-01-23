package egovframework.cms.com.service;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class EgovCmsComFileVO extends ComDefaultVO implements Serializable {
	
	private String filIdx  	="";	/** 파일	idx */
	private String idx 	="";	/** 기관	idx */
	private String filPath	="";	/** 파일경로 */
	private String filUsrName ="";	/** 파일명 사용자 */
	private String filSvrName ="";	/** 파일명 서버명 */
	private String filSize ="";		/** 파일사이즈 */
	private String regAdmYn ="";	/** 관리자등록 */
	private String modAdmYn ="";	/** 관리자수정 */
	//private List<?> fileList = new ArrayList<?>();
	
	public String getFilIdx() {
		return filIdx;
	}
	public void setFilIdx(String filIdx) {
		this.filIdx = filIdx;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getFilPath() {
		return filPath;
	}
	public void setFilPath(String filPath) {
		this.filPath = filPath;
	}
	public String getFilUsrName() {
		return filUsrName;
	}
	public void setFilUsrName(String filUsrName) {
		this.filUsrName = filUsrName;
	}
	public String getFilSvrName() {
		return filSvrName;
	}
	public void setFilSvrName(String filSvrName) {
		this.filSvrName = filSvrName;
	}
	public String getFilSize() {
		return filSize;
	}
	public void setFilSize(String filSize) {
		this.filSize = filSize;
	}
	public String getRegAdmYn() {
		return regAdmYn;
	}
	public void setRegAdmYn(String regAdmYn) {
		this.regAdmYn = regAdmYn;
	}
	public String getModAdmYn() {
		return modAdmYn;
	}
	public void setModAdmYn(String modAdmYn) {
		this.modAdmYn = modAdmYn;
	}
	@Override
	public String toString() {
		return "EgovCmsComFileVO [filIdx=" + filIdx + ", Idx=" + idx
				+ ", filPath=" + filPath + ", filUsrName=" + filUsrName
				+ ", filSvrName=" + filSvrName + ", filSize=" + filSize
				+ ", regAdmYn=" + regAdmYn + ", modAdmYn=" + modAdmYn + "]";
	}
	

}
