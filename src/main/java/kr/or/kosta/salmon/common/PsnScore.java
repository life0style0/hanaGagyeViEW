package kr.or.kosta.salmon.common;

/**
 * PsnScore
 * 앞에 부호를 붙여줘야한다.
 * 부호가 없으면 더하기와 빼기로 인식을 하지 않아 오류 발생한다.
 */
public interface PsnScore {

    public static String CREATE_ARTICLE = "+ 3";
    public static String DELETE_ARTICLE = "+ 3";
    public static String JOIN_GROUP = "+ 10";
    public static String FOLLOW_USER = "+ 3";
    public static String UNFOLLOW_USER = "- 3";
    public static String COMMENT = "+ 1";
    public static String UNCOMMENT = "- 1";
    public static String LIKE = "+ 1";
    public static String UNLIKE = "- 1";

}