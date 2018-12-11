package kr.or.kosta.salmon.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * PsnScoreDTO
 */
@Getter
@Setter
@ToString
public class PsnScoreDTO {
    private String userId;
    private String followId;
    private String groupId;
    private String articleId;
    private String commentId;
    private String amount;
    private int result;

    public PsnScoreDTO() {
        this("1");
    }

    public PsnScoreDTO(String amount) {
        this.amount = amount;
    }

    public PsnScoreDTO(Object object, String amount) {
        build(object);
        this.amount = amount;
    }

    public void setPsnScoreDTO(Object object) {
        build(object);
    }

    private void build(Object object) {
        if (object instanceof ArticleDTO) {
            ArticleDTO article = (ArticleDTO) object;
            this.articleId = article.getArticle_id() + "";
            this.userId = article.getUser_id();
        } else if (object instanceof LikeDTO) {
            LikeDTO like = (LikeDTO) object;
            this.articleId = like.getArticle_id() + "";
            this.userId = like.getUser_id();
        }
    }
}