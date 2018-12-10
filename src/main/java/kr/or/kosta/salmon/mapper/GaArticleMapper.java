package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.CategoryDTO;
import kr.or.kosta.salmon.domain.HashTagDTO;
import kr.or.kosta.salmon.domain.ImageDTO;
import kr.or.kosta.salmon.domain.ImageEditDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;

public interface GaArticleMapper {

	public int createGaArticle(ArticleDTO article);
	public int createGaArticleSimple(ArticleDTO article);
	public int createGaArticleGroup(ArticleDTO article);
	public int createGaArticleGroupSimple(ArticleDTO article);
	public ArrayList<String> getCategory();
	public String getCategoryByName(String categoryName);
	public String getArticleCategoryByName(String article_ctgry_name);
	public void createCategory(CategoryDTO category);
	public void createHashTag(HashTagDTO hashTagDTO);
	public void createHashTagRef(HashTagDTO hashTagDTO);
	public void createImageInfo(ImageDTO imageDTO);
	
	public MainArticleDTO getEditArticle(int article_id);
	
	public String getCtgryName(int ctgry_id); 
	public void updateArticle(ArticleDTO article);
	public void deleteImages(ImageEditDTO imageEditDTO);
	public void deleteHash(int article_id);
	public void deleteCtgry(int article_id);
	
	public void deleteHashRefs(int article_id);

	public ArrayList<String> getArticleFilePath(int article_id); 

	public int imageCheck(ImageEditDTO imageEditDTO);
	
	public ArrayList<String> getUserGroupTitle(String user_id);
}
