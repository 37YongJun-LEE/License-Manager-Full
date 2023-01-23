package egovframework.cms.com.util.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.cms.com.util.PmsComCodeVO;

@Repository("pmsComSmsDAO")
public class PmsComSmsDAO extends PmsComSmsAbstractDAO{
	
    /**문자 발송*/
	public String insertSms(PmsComCodeVO pmsComCodeVO) {
		return (String)insert("pmsComSmsDAO.insertSms", pmsComCodeVO);
	}
}