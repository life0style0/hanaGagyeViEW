package kr.or.kosta.salmon.common;

import kr.or.kosta.salmon.common.Criteria;

/**
 * 페이지의 넘버링을 위해 만들어진 빌더 클래스
 * 
 * @author 정지원
 *
 */
public class MyPageBuilder {
    private int totalArticles; // 전체 게시글 개수
    private int maxPageNum; // 게시판 최대 개수(기본 5개)
    private int maxArticleNum; // 한 페이지 게시글 목록 최대 개수(기본 10개)

    private int totalPageNum; // 게시판 전체 목록 개수

    // 한 페이지 게시판 목록 시작과 마지막 값 계산
    private int startPageNum; // 게시판 목록 시작 값
    private int lastPageNum; // 게시판 목록 끝 값
    private int articleNum; // 해당 페이지 게시글 시작 번호
    private int pageNum; // 현재 페이지

    private boolean isPrevPrev;
    private boolean isPrev;
    private boolean isNext;
    private boolean isNextNext;

    public MyPageBuilder() {
    }

    public MyPageBuilder(int totalArticles) {
        this.totalArticles = totalArticles;
    }

    /**
     * 게시판 번호를 받아 해당 번호와 맞는 페이지 넘버링을 해주는 메소드
     */
    public void build(Criteria criteria) {
        this.pageNum = criteria.getPageNum();
        this.maxPageNum = criteria.getMaxPageNum();
        this.maxArticleNum = criteria.getMaxArticleNum();

        totalPageNum = (int) Math.ceil((double) totalArticles / maxArticleNum);
        startPageNum = maxPageNum * ((pageNum - 1) / maxPageNum) + 1;
        lastPageNum = maxPageNum * ((pageNum - 1) / maxPageNum + 1) > totalPageNum ? totalPageNum
                : maxPageNum * ((pageNum - 1) / maxPageNum + 1);
        articleNum = totalArticles - (pageNum - 1) * maxArticleNum;

        this.isPrevPrev = pageNum != 1 ? true : false;
        this.isPrev = pageNum != 1 ? true : false;
        this.isNext = pageNum < totalPageNum ? true : false;
        this.isNextNext = lastPageNum != totalPageNum ? true : false;
    }

    public int getTotalArticles() {
        return totalArticles;
    }

    public void setTotalArticles(int totalArticles) {
        this.totalArticles = totalArticles;
    }

    public int getMaxPageNum() {
        return maxPageNum;
    }

    public void setMaxPageNum(int maxPageNum) {
        this.maxPageNum = maxPageNum;
    }

    public int getMaxArticleNum() {
        return maxArticleNum;
    }

    public void setMaxArticleNum(int maxArticleNum) {
        this.maxArticleNum = maxArticleNum;
    }

    public int getTotalPageNum() {
        return totalPageNum;
    }

    public void setTotalPageNum(int totalPageNum) {
        this.totalPageNum = totalPageNum;
    }

    public int getStartPageNum() {
        return startPageNum;
    }

    public void setStartPageNum(int startPageNum) {
        this.startPageNum = startPageNum;
    }

    public int getLastPageNum() {
        return lastPageNum;
    }

    public void setLastPageNum(int lastPageNum) {
        this.lastPageNum = lastPageNum;
    }

    public int getArticleNum() {
        return articleNum;
    }

    public void setArticleNum(int articleNum) {
        this.articleNum = articleNum;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public boolean getIsPrevPrev() {
        return this.isPrevPrev;
    }

    public void setIsPrevPrev(boolean isPrevPrev) {
        this.isPrevPrev = isPrevPrev;
    }

    public boolean getIsPrev() {
        return this.isPrev;
    }

    public void setIsPrev(boolean isPrev) {
        this.isPrev = isPrev;
    }

    public boolean getIsNext() {
        return this.isNext;
    }

    public void setIsNext(boolean isNext) {
        this.isNext = isNext;
    }

    public boolean getIsNextNext() {
        return this.isNextNext;
    }

    public void setIsNextNext(boolean isNextNext) {
        this.isNextNext = isNextNext;
    }

    @Override
    public String toString() {
        return "MyPageBuilder [totalArticles=" + totalArticles + ", maxPageNum=" + maxPageNum + ", maxArticleNum="
                + maxArticleNum + ", totalPageNum=" + totalPageNum + ", isPrevPrev=" + isPrevPrev + ", isPrev=" + isPrev
                + ", isNext=" + isNext + ", isNextNext=" + isNextNext + ", startPageNum=" + startPageNum
                + ", lastPageNum=" + lastPageNum + ", articleNum=" + articleNum + ", pageNum=" + pageNum + "]";
    }

}