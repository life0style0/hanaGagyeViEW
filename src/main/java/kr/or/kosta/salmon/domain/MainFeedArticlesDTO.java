package kr.or.kosta.salmon.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class MainFeedArticlesDTO {
	
	private String today;
	
	//내 피드 게시글
	private ArrayList<SNSArticleDTO_sjh> myfeedArticles;
	//최신 일주일 게시글
	private ArrayList<SNSArticleDTO_sjh> newArticles;
	//일주일동안 좋아요 많이 받은 게시글
	private ArrayList<SNSArticleDTO_sjh> popArticles;
}
