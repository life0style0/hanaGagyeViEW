package kr.or.kosta.salmon.domain;

import lombok.Data;

/**
 * AccountBookDTO
 */
@Data
public class AccountBookDTO {
    private int article_id;
    private String ctgry_name;
    private String article_scope;
    private String article_regdate;
    private String article_payment_type;
    private int article_payment_fee;
    private String article_photo;
    private String article_content;
}