package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;
import kr.or.kosta.salmon.domain.MainChartDTO;
import kr.or.kosta.salmon.domain.MainGroupCtFeeDTO;

public interface MainMapper {

	public ArrayList<MainArticleDTO> getListSprint1(String user_id);
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id);
	public MainChartDTO getChartTotalIncomeFee(String user_id);
	public MainChartDTO getChartTotalSpendFee(String user_id);
	public ArrayList<MainGroupCtFeeDTO> getChartCategoryIncomeFee(String user_id);
	public ArrayList<MainGroupCtFeeDTO> getChartCategorySpendFee(String user_id);
	
}
