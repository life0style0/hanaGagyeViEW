package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.CategoryDTO;
import kr.or.kosta.salmon.domain.HashTagDTO;
import kr.or.kosta.salmon.domain.ImageDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;

public interface GaArticleService {
	
	//가계부 게시글 등록
	public int createGaArticle(ArticleDTO article);
	//카테고리 항목 가져오기
	public ArrayList<String> getCategory();
	//카테고리 아이디 가져오기
	public String getCategoryByName(String categoryName);
	//게시판 카테고리 아이디 가져오기
	public String getArticleCategoryByName(String article_ctgry_name);
	//카테고리 추가
	public void createCategory(CategoryDTO category);
	//해시태그 추가
	public void createHashTag(HashTagDTO hashTagDTO);
	public void createHashTagRef(HashTagDTO hashTagDTO);
	//이미지 추가
	public void createImageInfo(ImageDTO imageDTO);
	
	//수정 게시글 정보 가져오기
	public MainArticleDTO getEditArticle(int article_id);
	
	//카테고리 번호로 이름 가져오기
	public String getCtgryName(int ctgry_id);
	
	//게시글 수정하기
	public void updateArticle(ArticleDTO article);
	
	//게시글 수정을 위한 사전작업
	public void deleteImages(int article_id);
	public void deleteHash(int article_id);
	public void deleteCtgry(int article_id);
	public void deleteHashRefs(int article_id);
}
