package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;
import kr.or.kosta.salmon.domain.MainChartDTO;
import kr.or.kosta.salmon.domain.MainGroupCtFeeDTO;
import kr.or.kosta.salmon.mapper.MainMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MainServiceImpl implements MainService{
	@Inject
	MainMapper mainMapper;

	@Override
	public ArrayList<MainArticleDTO> getListSprint1(String user_id) {
		return mainMapper.getListSprint1(user_id);
	}

	@Override
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id) {
		return mainMapper.getHashTagGroup(user_id);
	}

	@Override
	public MainChartDTO getChartTotalFee(String user_id) {
		return mainMapper.getChartTotalFee(user_id);
	}

	@Override
	public ArrayList<MainGroupCtFeeDTO> getChartCategoryFee(String user_id) {
		return mainMapper.getChartCategoryFee(user_id);
	}

	

}
