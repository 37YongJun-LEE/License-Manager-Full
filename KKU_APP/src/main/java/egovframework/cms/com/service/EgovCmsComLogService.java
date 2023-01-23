package egovframework.cms.com.service;


public interface EgovCmsComLogService {
	
	/**
	 * 로그를 기록한다.
	 * @param logVO
	 * @return void
	 */
	void insertLogAdm(EgovCmsComLogVO vo) throws Exception;

	void insertLogUsr(EgovCmsComLogVO vo) throws Exception;
	
	/**
	 * 2시간이내에 접속한 똑같은 IP가 존재하는지 체크한다.
	 * @param EgovCmsComLogUsrStatVO
	 * @return int
	 * @throws Exception
	 */
	int checkLogUsrStat(EgovCmsComLogUsrStatVO vo) throws Exception;
	
	/**
	 * 사용자 접속 로그를 기록한다.
	 * @param EgovCmsComLogUsrStatVO
	 * @throws Exception
	 */
	void insertLogUsrStat(EgovCmsComLogUsrStatVO vo) throws Exception;
	
	/**
	 * 하루 uv 와 pv 카운트
	 * @param vo
	 * @throws Exception
	 */
	void updateLogUsrStatDaily(EgovCmsComLogUsrStatVO vo) throws Exception;

}
