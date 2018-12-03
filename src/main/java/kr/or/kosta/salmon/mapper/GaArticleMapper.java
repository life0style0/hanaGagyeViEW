package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.CategoryDTO;
import kr.or.kosta.salmon.domain.HashTagDTO;
import kr.or.kosta.salmon.domain.ImageDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;

public interface GaArticleMapper {

	public int createGaArticle(ArticleDTO article);
	public ArrayList<String> getCategory();
	public String getCategoryByName(String categoryName);
	public String getArticleCategoryByName(String article_ctgry_name);
	public void createCategory(CategoryDTO category);
	public void createHashTag(HashTagDTO hashTagDTO);
	public void createHashTagRef(HashTagDTO hashTagDTO);
	public void createImageInfo(ImageDTO imageDTO);
	
	public MainArticleDTO getEditArticle(int article_id);
}
