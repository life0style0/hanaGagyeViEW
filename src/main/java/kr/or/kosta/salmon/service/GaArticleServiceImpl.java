package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.mapper.GaArticleMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GaArticleServiceImpl implements GaArticleService{
	@Inject
	GaArticleMapper gaArticleMapper;

	@Transactional
	@Override
	public void gaArticleRegist(ArticleDTO article) {
		boolean check = false;
		gaArticleMapper.createGaArticle(article);
	}

	@Override
	public ArrayList<String> getCategory() {
		return gaArticleMapper.getCategory();
	}
	
	
}
