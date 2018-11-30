package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.ArticleDTO;

public interface GaArticleService {
	
	//가계부 게시글 등록
	public void gaArticleRegist(ArticleDTO article);
	//카테고리 항목 가져오기
	public ArrayList<String> getCategory();
}
