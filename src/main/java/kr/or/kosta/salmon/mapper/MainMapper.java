package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.MainChartDTO;

public interface MainMapper {

	public ArrayList<ArticleDTO> getListSprint1(String user_id);
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id);
	public MainChartDTO getChartTotalFee(String user_id);
}
