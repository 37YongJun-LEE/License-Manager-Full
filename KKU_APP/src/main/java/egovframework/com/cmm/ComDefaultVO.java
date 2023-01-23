package egovframework.com.cmm;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : ComDefaultVO.java
 * @Description : ComDefaultVO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.02.01    조재영         최초 생성
 *
 *  @author 공통서비스 개발팀 조재영
 *  @since 2009.02.01
 *  @version 1.0
 *  @see 
 *  
 */
@SuppressWarnings("serial")
public class ComDefaultVO implements Serializable {

	/** 검색조건 */
    private String searchCondition = "";
    
    /** 검색Keyword */
    private String searchKeyword = "";
    
    /** 검색사용여부 */
    private String searchUseYn = "";
    
    /** 검색날짜 */
    private String searchDate = "";
    
    /** 검색시작날짜 */
    private String searchSdate = "";
    
    /** 검색종료날짜 */
    private String searchEdate = "";

    /** 검색사용여부 */
    private String searchGroup = "";

    /** 분류검색 PC */
    private String searchCfgCatePc = "";

    /** 분류검색 Mobile */
    private String searchCfgCateMo = "";

    /** 현재페이지 */
    private int pageIndex = 1;
    
    /** 페이지갯수 */
    private int pageUnit = 5;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

    /** 레코드 번호 */
    private int rowNo = 0;

    /** 작성자 ID*/
    private String regId = "";

    /** 최종 등록 INDEX */
    private String regIdx = "";

    /** 최초 등록자명 */
    private String regName = "";

    /** 최초 등록 IP */
    private String regIp = "";

    /** 최초 등록일 */
    private String regDate = "";
    
    /** 수정자 ID */
    private String modId = "";

    /** 최종 수정 INDEX */
    private String modIdx = "";

    /** 최종 수정자명 */
    private String modName = "";

    /** 최종 수정 IP */
    private String modIp = "";

    /** 최종 수정일 */
    private String modDate = "";

    /** 정렬 */
	private String orderBy = "";
	
	/** 븐류정렬 */
	private String orderByBcf = "";

	private String searchYear = "";
	
	private String searchMonth = "";
	
	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchCondition() {
        return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    public String getSearchUseYn() {
        return searchUseYn;
    }

    public void setSearchUseYn(String searchUseYn) {
        this.searchUseYn = searchUseYn;
    }

    public String getSearchSdate() {
		return searchSdate;
	}

	public void setSearchSdate(String searchSdate) {
		this.searchSdate = searchSdate;
	}

	public String getSearchEdate() {
		return searchEdate;
	}

	public void setSearchEdate(String searchEdate) {
		this.searchEdate = searchEdate;
	}

	public String getSearchGroup() {
		return searchGroup;
	}

	public void setSearchGroup(String searchGroup) {
		this.searchGroup = searchGroup;
	}

	public String getSearchCfgCatePc() {
		return searchCfgCatePc;
	}

	public void setSearchCfgCatePc(String searchCfgCatePc) {
		this.searchCfgCatePc = searchCfgCatePc;
	}

	public String getSearchCfgCateMo() {
		return searchCfgCateMo;
	}

	public void setSearchCfgCateMo(String searchCfgCateMo) {
		this.searchCfgCateMo = searchCfgCateMo;
	}

	public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageUnit() {
        return pageUnit;
    }

    public void setPageUnit(int pageUnit) {
        this.pageUnit = pageUnit;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getRowNo() {
		return rowNo;
	}

	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegIdx() {
		return regIdx;
	}

	public void setRegIdx(String regIdx) {
		this.regIdx = regIdx;
	}

	public String getRegName() {
		return regName;
	}

	public void setRegName(String regName) {
		this.regName = regName;
	}

	public String getRegIp() {
		return regIp;
	}

	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public String getModIdx() {
		return modIdx;
	}

	public void setModIdx(String modIdx) {
		this.modIdx = modIdx;
	}

	public String getModName() {
		return modName;
	}

	public void setModName(String modName) {
		this.modName = modName;
	}

	public String getModIp() {
		return modIp;
	}

	public void setModIp(String modIp) {
		this.modIp = modIp;
	}

	public String getModDate() {
		return modDate;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrderByBcf() {
		return orderByBcf;
	}

	public void setOrderByBcf(String orderByBcf) {
		this.orderByBcf = orderByBcf;
	}

	public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	public String getSearchYear() {
		return searchYear;
	}

	public void setSearchYear(String searchYear) {
		this.searchYear = searchYear;
	}

	public String getSearchMonth() {
		return searchMonth;
	}

	public void setSearchMonth(String searchMonth) {
		this.searchMonth = searchMonth;
	}
	
	
}
