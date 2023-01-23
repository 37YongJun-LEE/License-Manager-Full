package egovframework.kku.usr.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EgovKkuLostService {

	public void insertLost(EgovKkuLostVO lostVO);

	public int updateLost(EgovKkuLostVO lostVO);

	public List<EgovMap> selectLostList(EgovKkuLostVO lostVO);

	public EgovMap selectLostByIdx(EgovKkuLostVO lostVO);

	public List<EgovMap> lostFileList(EgovKkuLostVO lostVO);
	//삭제
	public void delLost(EgovKkuLostVO lostVO);
	//상태변경
	public void updateStaLost(EgovKkuLostVO lostVO);

}
