package egovframework.kku.usr.service;

public class DormVO {
	private String check;
	private String stdNo;
	private String resno;
	private String DORM_CD;
	private String crud;
	private String remk;
	private String gubun;
	private String scStartReceDt;
	private String scEndReceDt;
	private String resn;
	private String dataSeq;
	

	@Override
	public String toString() {
		return "DormVO [check=" + check + ", stdNo=" + stdNo + ", resno=" + resno + ", DORM_CD=" + DORM_CD + ", crud="
				+ crud + ", remk=" + remk + ", gubun=" + gubun + ", scStartReceDt=" + scStartReceDt + ", scEndReceDt="
				+ scEndReceDt + ", resn=" + resn + ", dataSeq=" + dataSeq + "]";
	}
	public String getStdNo() {
		return stdNo;
	}
	public void setStdNo(String stdNo) {
		this.stdNo = stdNo;
	}
	public String getResno() {
		return resno;
	}
	public void setResno(String resno) {
		this.resno = resno;
	}
	public String getDORM_CD() {
		return DORM_CD;
	}
	public void setDORM_CD(String dORM_CD) {
		DORM_CD = dORM_CD;
	}
	public String getCrud() {
		return crud;
	}
	public void setCrud(String crud) {
		this.crud = crud;
	}
	public String getRemk() {
		return remk;
	}
	public void setRemk(String remk) {
		this.remk = remk;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getScStartReceDt() {
		return scStartReceDt;
	}
	public void setScStartReceDt(String scStartReceDt) {
		this.scStartReceDt = scStartReceDt;
	}
	public String getScEndReceDt() {
		return scEndReceDt;
	}
	public void setScEndReceDt(String scEndReceDt) {
		this.scEndReceDt = scEndReceDt;
	}
	public String getResn() {
		return resn;
	}
	public void setResn(String resn) {
		this.resn = resn;
	}
	public String getDataSeq() {
		return dataSeq;
	}
	public void setDataSeq(String dataSeq) {
		this.dataSeq = dataSeq;
	}
	
}
