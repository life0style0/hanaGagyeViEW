package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.CategoryDTO;
import kr.or.kosta.salmon.domain.HashTagDTO;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.ImageDTO;
import kr.or.kosta.salmon.domain.MainChartDTO;

public interface MainService {
	
	//필요 게시글 가져오기 (sprint1버전 기능 제외)
	//기능 추가할 시 개별적으로 가져와서 필터 걸어줄것.
	public ArrayList<ArticleDTO> getListSprint1(String user_id);
	
	//해시태그 필터를 위한 카운트 개수 가져오기(차후 워드클라우드도..?)
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id);
	
	//차트정보
	public MainChartDTO getChartTotalFee(String user_id);
	
}
