package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;
import kr.or.kosta.salmon.domain.MainChartDTO;
import kr.or.kosta.salmon.domain.MainGroupCtFeeDTO;

public interface MainService {
	
	//필요 게시글 가져오기 (sprint1버전 기능 제외)
	//기능 추가할 시 개별적으로 가져와서 필터 걸어줄것.
	public ArrayList<MainArticleDTO> getListSprint1(String user_id);
	
	//해시태그 필터를 위한 카운트 개수 가져오기(차후 워드클라우드도..?)
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id);
	
	//차트정보
	public MainChartDTO getChartTotalIncomeFee(String user_id);
	public MainChartDTO getChartTotalSpendFee(String user_id);
	public ArrayList<MainGroupCtFeeDTO> getChartCategoryIncomeFee(String user_id);
	public ArrayList<MainGroupCtFeeDTO> getChartCategorySpendFee(String user_id);
	
}
