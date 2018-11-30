package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.ArticleDTO;

public interface GaArticleMapper {

	public void createGaArticle(ArticleDTO article);
	public ArrayList<String> getCategory();
}
