package egovframework.cms.com.util.impl;

import javax.annotation.Resource;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

public abstract class PmsComSmsAbstractDAO extends EgovAbstractDAO{
		
	@Resource(name="egov.sqlMapClientSms")
	public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
        super.setSuperSqlMapClient(sqlMapClient);
    }
	

}
