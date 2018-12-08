package kr.or.kosta.salmon.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * Criteria
 */
@Getter
@Setter
@ToString
public class Criteria {
    private int pageNum;
    private int maxPageNum; // 한 페이지 게시글 최대 개수(기본 5개)
    private int maxArticleNum; // 한 페이지 게시판 목록 최대 개수(기본 10개)
    private String type;
    private String keyword;
    private String userId;

    public Criteria() {
        this(1, 5, 10);
    }

    public Criteria(int pageNum, int maxPageNum, int maxArticleNum) {
        this.pageNum = pageNum;
        this.maxPageNum = maxPageNum;
        this.maxArticleNum = maxArticleNum;
    }

    public String[] getTypeArr() {
        return type == null ? new String[] {} : type.split("");
    }

}