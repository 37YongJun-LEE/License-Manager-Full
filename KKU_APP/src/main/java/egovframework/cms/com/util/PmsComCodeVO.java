package egovframework.cms.com.util;
import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *  클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.3.11   이삼섭          최초 생성
 *
 * </pre>
 */
@SuppressWarnings("serial")
public class PmsComCodeVO implements Serializable {

	/** 코드 ID */
    private String cod_idx = "";
    
    /** 코드명 */
    private String cod_name = "";
    
    /** 코드유형 */
    private String cod_type = "";
    
    /** 코드순서 */
    private int cod_sort;
    
    /** 상세 조건 여부 */
    private String haveDetailCondition = "N";
    
    /** 상세 조건 */
    private String detailCondition = "";
    
    /**이메일 발송*/
    public String rcv_server_id;
    public String rcv_server_ip;
    public String sender_mail_address;
    public String sender_mail_domain;
    public String sender_mail_name;
    public String rcv_mail_address;
    public String rcv_mail_domain;
    public String rcv_mail_name;
    public String mail_subject;
    public String mail_body;
    public String insertdate;
    public String susin_idx;
    
    /**문자발송*/
    public String pidx;
    public String tran_phone;
    public String tran_callback;
    public String tran_status;
    public String tran_date;
    public String tran_msg;
    public String tran_id;
    public String tran_etc1;
    public String tran_type;
    public String return_page;
    public String mem_length;
    public String log_web_num;
    
	/** 일정 관리*/
	private String sch_idx;
	private String sch_pro_idx;
	private String sch_mem_idx;
	private String sch_start;
	private String sch_end;
	private String sch_gubun;
	private String sch_place;
	private String sch_content;
	private String sch_allday;
	private String sch_use_yn;
	private String sch_date;	
	private String allday;	
	private String color;	
	private String sch_regdate;	
	private String sch_moddate;
	private String dayDelta;
	private String minuteDelta;
	private String sch_mode;
	private String allschedule;
	private String editable;
	private String mem_type;
	private String mem_name;
	
	/**우편번호 검색*/
	private String zip_no;
	private String zip_zipcode;
	private String zip_sido;
	private String zip_gugun;
	private String zip_dong;
	private String zip_bunji;
	private String zip_fulljuso;
	
	/**결제*/	
	private String pay_name;
	private String pay_mem_idx;
	private String pay_good_name;
	private String pay_good_mny;
	private String pay_ordr_idx;
	private String pay_card_cd;
	private String pay_app_no;
	private String pay_app_time;	
	
    public String getCod_idx() {
		return cod_idx;
	}

	public void setCod_idx(String cod_idx) {
		this.cod_idx = cod_idx;
	}

	public String getCod_name() {
		return cod_name;
	}

	public void setCod_name(String cod_name) {
		this.cod_name = cod_name;
	}

	public String getCod_type() {
		return cod_type;
	}

	public void setCod_type(String cod_type) {
		this.cod_type = cod_type;
	}

	public int getCod_sort() {
		return cod_sort;
	}

	public void setCod_sort(int cod_sort) {
		this.cod_sort = cod_sort;
	}

	/**
     * haveDetailCondition attribute를 리턴한다.
     * 
     * @return the haveDetailCondition
     */
    public String getHaveDetailCondition() {
	return haveDetailCondition;
    }

    /**
     * haveDetailCondition attribute 값을 설정한다.
     * 
     * @param haveDetailCondition
     *            the haveDetailCondition to set
     */
    public void setHaveDetailCondition(String haveDetailCondition) {
	this.haveDetailCondition = haveDetailCondition;
    }

    /**
     * detailCondition attribute를 리턴한다.
     * 
     * @return the detailCondition
     */
    public String getDetailCondition() {
	return detailCondition;
    }

    /**
     * detailCondition attribute 값을 설정한다.
     * 
     * @param detailCondition
     *            the detailCondition to set
     */
    public void setDetailCondition(String detailCondition) {
	this.detailCondition = detailCondition;
    }

    /**
     * toString 메소드를 대치한다.
     */
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }

	public String getRcv_server_id() {
		return rcv_server_id;
	}

	public void setRcv_server_id(String rcv_server_id) {
		this.rcv_server_id = rcv_server_id;
	}

	public String getRcv_server_ip() {
		return rcv_server_ip;
	}

	public void setRcv_server_ip(String rcv_server_ip) {
		this.rcv_server_ip = rcv_server_ip;
	}

	public String getSender_mail_address() {
		return sender_mail_address;
	}

	public void setSender_mail_address(String sender_mail_address) {
		this.sender_mail_address = sender_mail_address;
	}

	public String getSender_mail_domain() {
		return sender_mail_domain;
	}

	public void setSender_mail_domain(String sender_mail_domain) {
		this.sender_mail_domain = sender_mail_domain;
	}

	public String getSender_mail_name() {
		return sender_mail_name;
	}

	public void setSender_mail_name(String sender_mail_name) {
		this.sender_mail_name = sender_mail_name;
	}

	public String getRcv_mail_address() {
		return rcv_mail_address;
	}

	public void setRcv_mail_address(String rcv_mail_address) {
		this.rcv_mail_address = rcv_mail_address;
	}

	public String getRcv_mail_domain() {
		return rcv_mail_domain;
	}

	public void setRcv_mail_domain(String rcv_mail_domain) {
		this.rcv_mail_domain = rcv_mail_domain;
	}

	public String getRcv_mail_name() {
		return rcv_mail_name;
	}

	public void setRcv_mail_name(String rcv_mail_name) {
		this.rcv_mail_name = rcv_mail_name;
	}

	public String getMail_subject() {
		return mail_subject;
	}

	public void setMail_subject(String mail_subject) {
		this.mail_subject = mail_subject;
	}

	public String getMail_body() {
		return mail_body;
	}

	public void setMail_body(String mail_body) {
		this.mail_body = mail_body;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public String getSusin_idx() {
		return susin_idx;
	}

	public void setSusin_idx(String susin_idx) {
		this.susin_idx = susin_idx;
	}

	public String getPidx() {
		return pidx;
	}

	public void setPidx(String pidx) {
		this.pidx = pidx;
	}

	public String getTran_phone() {
		return tran_phone;
	}

	public void setTran_phone(String tran_phone) {
		this.tran_phone = tran_phone;
	}

	public String getTran_callback() {
		return tran_callback;
	}

	public void setTran_callback(String tran_callback) {
		this.tran_callback = tran_callback;
	}

	public String getTran_status() {
		return tran_status;
	}

	public void setTran_status(String tran_status) {
		this.tran_status = tran_status;
	}

	public String getTran_date() {
		return tran_date;
	}

	public void setTran_date(String tran_date) {
		this.tran_date = tran_date;
	}

	public String getTran_msg() {
		return tran_msg;
	}

	public void setTran_msg(String tran_msg) {
		this.tran_msg = tran_msg;
	}

	public String getTran_id() {
		return tran_id;
	}
	public void setTran_id(String tran_id) {
		this.tran_id = tran_id;
	}
	public String getTran_etc1() {
		return tran_etc1;
	}
	public void setTran_etc1(String tran_etc1) {
		this.tran_etc1 = tran_etc1;
	}
	public String getTran_type() {
		return tran_type;
	}
	public void setTran_type(String tran_type) {
		this.tran_type = tran_type;
	}
	public String getReturn_page() {
		return return_page;
	}
	public void setReturn_page(String return_page) {
		this.return_page = return_page;
	}
	public String getMem_length() {
		return mem_length;
	}
	public void setMem_length(String mem_length) {
		this.mem_length = mem_length;
	}

	public String getLog_web_num() {
		return log_web_num;
	}

	public void setLog_web_num(String log_web_num) {
		this.log_web_num = log_web_num;
	}

	public String getSch_idx() {
		return sch_idx;
	}

	public void setSch_idx(String sch_idx) {
		this.sch_idx = sch_idx;
	}

	public String getSch_pro_idx() {
		return sch_pro_idx;
	}

	public void setSch_pro_idx(String sch_pro_idx) {
		this.sch_pro_idx = sch_pro_idx;
	}

	public String getSch_mem_idx() {
		return sch_mem_idx;
	}

	public void setSch_mem_idx(String sch_mem_idx) {
		this.sch_mem_idx = sch_mem_idx;
	}

	public String getSch_start() {
		return sch_start;
	}

	public void setSch_start(String sch_start) {
		this.sch_start = sch_start;
	}

	public String getSch_end() {
		return sch_end;
	}

	public void setSch_end(String sch_end) {
		this.sch_end = sch_end;
	}

	public String getSch_gubun() {
		return sch_gubun;
	}

	public void setSch_gubun(String sch_gubun) {
		this.sch_gubun = sch_gubun;
	}

	public String getSch_place() {
		return sch_place;
	}

	public void setSch_place(String sch_place) {
		this.sch_place = sch_place;
	}

	public String getSch_content() {
		return sch_content;
	}

	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}

	public String getSch_allday() {
		return sch_allday;
	}

	public void setSch_allday(String sch_allday) {
		this.sch_allday = sch_allday;
	}

	public String getSch_use_yn() {
		return sch_use_yn;
	}

	public void setSch_use_yn(String sch_use_yn) {
		this.sch_use_yn = sch_use_yn;
	}

	public String getSch_date() {
		return sch_date;
	}

	public void setSch_date(String sch_date) {
		this.sch_date = sch_date;
	}

	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSch_regdate() {
		return sch_regdate;
	}

	public void setSch_regdate(String sch_regdate) {
		this.sch_regdate = sch_regdate;
	}

	public String getSch_moddate() {
		return sch_moddate;
	}

	public void setSch_moddate(String sch_moddate) {
		this.sch_moddate = sch_moddate;
	}

	public String getAllday() {
		return allday;
	}

	public void setAllday(String allday) {
		this.allday = allday;
	}

	public String getDayDelta() {
		return dayDelta;
	}

	public void setDayDelta(String dayDelta) {
		this.dayDelta = dayDelta;
	}

	public String getMinuteDelta() {
		return minuteDelta;
	}

	public void setMinuteDelta(String minuteDelta) {
		this.minuteDelta = minuteDelta;
	}

	public String getSch_mode() {
		return sch_mode;
	}

	public void setSch_mode(String sch_mode) {
		this.sch_mode = sch_mode;
	}

	public String getAllschedule() {
		return allschedule;
	}

	public void setAllschedule(String allschedule) {
		this.allschedule = allschedule;
	}

	public String getEditable() {
		return editable;
	}

	public void setEditable(String editable) {
		this.editable = editable;
	}

	public String getMem_type() {
		return mem_type;
	}

	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getZip_no() {
		return zip_no;
	}

	public void setZip_no(String zip_no) {
		this.zip_no = zip_no;
	}

	public String getZip_zipcode() {
		return zip_zipcode;
	}

	public void setZip_zipcode(String zip_zipcode) {
		this.zip_zipcode = zip_zipcode;
	}

	public String getZip_sido() {
		return zip_sido;
	}

	public void setZip_sido(String zip_sido) {
		this.zip_sido = zip_sido;
	}

	public String getZip_gugun() {
		return zip_gugun;
	}

	public void setZip_gugun(String zip_gugun) {
		this.zip_gugun = zip_gugun;
	}

	public String getZip_dong() {
		return zip_dong;
	}

	public void setZip_dong(String zip_dong) {
		this.zip_dong = zip_dong;
	}

	public String getZip_bunji() {
		return zip_bunji;
	}

	public void setZip_bunji(String zip_bunji) {
		this.zip_bunji = zip_bunji;
	}

	public String getZip_fulljuso() {
		return zip_fulljuso;
	}

	public void setZip_fulljuso(String zip_fulljuso) {
		this.zip_fulljuso = zip_fulljuso;
	}

	public String getPay_name() {
		return pay_name;
	}

	public String getPay_mem_idx() {
		return pay_mem_idx;
	}

	public void setPay_mem_idx(String pay_mem_idx) {
		this.pay_mem_idx = pay_mem_idx;
	}

	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}

	public String getPay_good_name() {
		return pay_good_name;
	}

	public void setPay_good_name(String pay_good_name) {
		this.pay_good_name = pay_good_name;
	}

	public String getPay_good_mny() {
		return pay_good_mny;
	}

	public void setPay_good_mny(String pay_good_mny) {
		this.pay_good_mny = pay_good_mny;
	}

	public String getPay_ordr_idx() {
		return pay_ordr_idx;
	}

	public void setPay_ordr_idx(String pay_ordr_idx) {
		this.pay_ordr_idx = pay_ordr_idx;
	}

	public String getPay_card_cd() {
		return pay_card_cd;
	}

	public void setPay_card_cd(String pay_card_cd) {
		this.pay_card_cd = pay_card_cd;
	}

	public String getPay_app_no() {
		return pay_app_no;
	}

	public void setPay_app_no(String pay_app_no) {
		this.pay_app_no = pay_app_no;
	}

	public String getPay_app_time() {
		return pay_app_time;
	}

	public void setPay_app_time(String pay_app_time) {
		this.pay_app_time = pay_app_time;
	}	

}
