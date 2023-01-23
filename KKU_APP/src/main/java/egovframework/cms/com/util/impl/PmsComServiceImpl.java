package egovframework.cms.com.util.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.cms.com.util.PmsComCodeVO;
import egovframework.cms.com.util.PmsComService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


/**
 * 사용자관리에 관한 비지니스 클래스를 정의한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *
 * </pre>
 */
@Service("pmsComService")
public class PmsComServiceImpl extends EgovAbstractServiceImpl implements PmsComService {
	
	/** pmsComSmsDAO */
	@Resource(name="pmsComSmsDAO")
	private PmsComSmsDAO pmsComSmsDAO;

	/** 
	 * 	sms 발송
	 *  @param Tran_callback 	- 	보내는사람
	 *  @param Tran_phone    	- 	받는사람
	 *  @param Tran_msg			-	메세지
	 *  @param Tran_id			-	구분자 맴버idx
	 *  @param Tran_etc1		-	사이트 uri
	 */	
	public String insertSms(PmsComCodeVO vo) {
		return pmsComSmsDAO.insertSms(vo);
	}


	
}