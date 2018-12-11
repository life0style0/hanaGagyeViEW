package kr.or.kosta.salmon.common;

/**
 * PsnScore
 */
public interface PsnScore {

    public static String CREATE_ARTICLE = "3";
    public static String DELETE_ARTICLE = "3";
    public static String JOIN_GROUP = "10";
    public static String FOLLOW_USER = "3";
    public static String UNFOLLOW_USER = "-3";
    public static String COMMENT = "2";
    public static String UNCOMMENT = "-2";
    public static String LIKE = "1";
    public static String UNLIKE = "-1";

}