package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.CategoryDTO;
import kr.or.kosta.salmon.domain.HashTagDTO;
import kr.or.kosta.salmon.domain.ImageDTO;
import kr.or.kosta.salmon.domain.ImageEditDTO;
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
	public int createGaArticleSimple(ArticleDTO article) {
		gaArticleMapper.createGaArticleSimple(article);
		return article.getArticle_id();
	}


	@Override
	public int createGaArticleGroup(ArticleDTO article) {
		gaArticleMapper.createGaArticleGroup(article);
		return article.getArticle_id();
	}

	@Override
	public int createGaArticleGroupSimple(ArticleDTO article) {
		gaArticleMapper.createGaArticleGroupSimple(article);
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
		log.info("hashTag만들기");
		gaArticleMapper.createHashTag(hashTagDTO);
		hashTagDTO.setHashtag_id(hashTagDTO.getHashtag_id()-1);
		createHashTagRef(hashTagDTO);
	}

	@Override
	public void createHashTagRef(HashTagDTO hashTagDTO) {
		log.info("hashTagRef");
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
		log.info("article보자:" + article.toString());
		gaArticleMapper.updateArticle(article);
		log.info("article죽나..?");
	}

	@Override
	public void deleteImages(ImageEditDTO imageEditDTO) {
		log.info("이미지 삭제 :" +imageEditDTO );
		gaArticleMapper.deleteImages(imageEditDTO);
	}

	@Override
	public void deleteHash(int article_id) {
		log.info("해시 삭제 :" + article_id );
		gaArticleMapper.deleteHash(article_id);
		
	}

	@Override
	public void deleteCtgry(int article_id) {
		log.info("카테고리 삭제 :" + article_id );
		gaArticleMapper.deleteCtgry(article_id);
		
	}

	@Override
	public void deleteHashRefs(int article_id) {
		log.info("해시참조 삭제 :" + article_id );
		gaArticleMapper.deleteHashRefs(article_id);
	}

	@Override
	public ArrayList<String> getArticleFilePath(int article_id){
		return gaArticleMapper.getArticleFilePath(article_id);
	}

	@Override
	public int imageCheck(ImageEditDTO imageEditDTO) {
		return gaArticleMapper.imageCheck(imageEditDTO);
	}

	@Override
	public ArrayList<String> getUserGroupTitle(String user_id) {
		return gaArticleMapper.getUserGroupTitle(user_id);
	}

	@Override
	public boolean deleteArticle(int article_id, String user_id) {
		return gaArticleMapper.deleteArticle(article_id, user_id) > 0 ? true : false;
	}
	
}
