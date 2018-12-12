package kr.or.kosta.salmon.domain;

import java.util.List;

import kr.or.kosta.salmon.common.Criteria;
import lombok.Data;

/**
 * temp
 */
@Data
public class SuggestionProcDTO {
    private String userId;
    private String pagenumR;
    private String pagenumL;
    private String criteria;
    private String articleProposalStatus;
    private List<SuggestionDTO> resultset;
    private int resultNum;

    public SuggestionProcDTO build(Criteria criteriaSrc) {
        this.userId = criteriaSrc.getUserId();
        this.pagenumR = (criteriaSrc.getPageNum() * criteriaSrc.getMaxArticleNum()) + "";
        this.pagenumL = ((criteriaSrc.getPageNum() - 1) * criteriaSrc.getMaxArticleNum()) + "";
        this.articleProposalStatus = criteriaSrc.getArticleProposalStatus();
        
        String[] typeArr = criteriaSrc.getTypeArr();
        if (typeArr == null || typeArr.length <= 0) {
            this.criteria = "";
        } else {
            this.criteria = "(";
            for (int i = 0; i < typeArr.length; i++) {
                if (typeArr[i].equals("T")) {
                    this.criteria += "article_title like '%" + criteriaSrc.getKeyword() + "' ";
                    if (i + 1 != typeArr.length) {
                        this.criteria += " or";
                    }
                } else if (typeArr[i].equals("C")) {
                    this.criteria += "article_content like '%" + criteriaSrc.getKeyword() + "' ";
                    if (i + 1 != typeArr.length) {
                        this.criteria += " or";
                    }
                } else if (typeArr[i].equals("W")) {
                    this.criteria += "user_id like '%" + criteriaSrc.getKeyword() + "' ";
                    if (i + 1 != typeArr.length) {
                        this.criteria += " or";
                    }
                }
            }
            this.criteria += ") and ";
            if (this.criteria.length() == 2) {
                this.criteria = "";
            }
        }
        return this;
    }
}