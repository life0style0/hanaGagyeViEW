package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.CategoryDTO;
import kr.or.kosta.salmon.domain.HashTagDTO;
import kr.or.kosta.salmon.domain.ImageDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;
import kr.or.kosta.salmon.mapper.GaArticleMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GaArticleServiceImpl implements GaArticleService{
	@Inject
	GaArticleMapper gaArticleMapper;

	
	@Override
	public int createGaArticle(ArticleDTO article) {
		gaArticleMapper.createGaArticle(article);
		return article.getArticle_id();
	}

	@Override
	public ArrayList<String> getCategory() {
		return gaArticleMapper.getCategory();
	}

	@Override
	public String getCategoryByName(String categoryName) {
		return gaArticleMapper.getCategoryByName(categoryName);
	}

	@Override
	public String getArticleCategoryByName(String article_ctgry_name) {
		return gaArticleMapper.getArticleCategoryByName(article_ctgry_name);
	}

	@Override
	public void createCategory(CategoryDTO category) {
		gaArticleMapper.createCategory(category);	
	}

	@Override
	public void createHashTag(HashTagDTO hashTagDTO) {
		gaArticleMapper.createHashTag(hashTagDTO);
		hashTagDTO.setHashtag_id(hashTagDTO.getHashtag_id()-1);
		createHashTagRef(hashTagDTO);
	}

	@Override
	public void createHashTagRef(HashTagDTO hashTagDTO) {
		gaArticleMapper.createHashTagRef(hashTagDTO);
	}

	@Override
	public void createImageInfo(ImageDTO imageDTO) {
		gaArticleMapper.createImageInfo(imageDTO);
	}

	@Override
	public MainArticleDTO getEditArticle(int article_id) {
		return gaArticleMapper.getEditArticle(article_id);
	}

	@Override
	public String getCtgryName(int ctgry_id) {
		return gaArticleMapper.getCtgryName(ctgry_id);
	}

	@Override
	public void updateArticle(ArticleDTO article) {
		gaArticleMapper.updateArticle(article);
	}

	@Override
	public void deleteImages(int article_id) {
		gaArticleMapper.deleteImages(article_id);
	}

	@Override
	public void deleteHash(int article_id) {
		gaArticleMapper.deleteHash(article_id);
		
	}

	@Override
	public void deleteCtgry(int article_id) {
		gaArticleMapper.deleteCtgry(article_id);
		
	}

	@Override
	public void deleteHashRefs(int article_id) {
		gaArticleMapper.deleteHashRefs(article_id);
	}
	
}
