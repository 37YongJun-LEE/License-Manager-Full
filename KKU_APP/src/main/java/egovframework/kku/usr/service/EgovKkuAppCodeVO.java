package egovframework.kku.usr.service;

public class EgovKkuAppCodeVO {
	/**문자발송*/
    public String pIdx;
    public String tranPhone;
    public String tranCallback;
    public String tranDate;
    public String tranMsg;
    public String tranId;
    public String tran_etc1;
    
	public String getTran_etc1() {
		return tran_etc1;
	}
	public String getpIdx() {
		return pIdx;
	}
	public void setpIdx(String pIdx) {
		this.pIdx = pIdx;
	}
	public String getTranPhone() {
		return tranPhone;
	}
	public void setTranPhone(String tranPhone) {
		this.tranPhone = tranPhone;
	}
	public String getTranCallback() {
		return tranCallback;
	}
	public void setTranCallback(String tranCallback) {
		this.tranCallback = tranCallback;
	}
	public String getTranDate() {
		return tranDate;
	}
	public void setTranDate(String tranDate) {
		this.tranDate = tranDate;
	}
	public String getTranMsg() {
		return tranMsg;
	}
	public void setTranMsg(String tranMsg) {
		this.tranMsg = tranMsg;
	}
	public void setTran_etc1(String tran_etc1) {
		this.tran_etc1 = tran_etc1;
	}
	public String getTranId() {
		return tranId;
	}
	public void setTranId(String tranId) {
		this.tranId = tranId;
	}
	

}
