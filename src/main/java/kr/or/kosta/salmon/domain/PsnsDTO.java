package kr.or.kosta.salmon.domain;

import lombok.Data;

/**
 * PsnsDTO
 */
@Data
public class PsnsDTO {
    private int psnId;
    private int psnMonthlyPayment;
    private int psnSalary;
    private int psnMonthStart;
    private int psnPoint;
    private String locationName;
    private String userId;
    private String userNickname;
    private String ctgryName1;
    private String ctgryName2;
    private String ctgryName3;
}