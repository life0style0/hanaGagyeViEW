package kr.or.kosta.salmon.domain;

import lombok.Data;

@Data
public class UserLocAndCatsDTO {

	private String user_id;
	
	private int location_id;
	private int CTGRY_1;
	private int CTGRY_2;
	private int CTGRY_3;

	private String locationname;
	private String categories;
	
	private String ctgry1Name;
	private String ctgry2Name;
	private String ctgry3Name;
	
	
	public void setCtgrNames() {
		if(this.categories != null || this.categories.length() != 0) {
			String[] strs=categories.split(",");
			this.ctgry1Name= strs[0];
			this.ctgry2Name= strs[1];
			this.ctgry3Name= strs[2];
		}
	}
}
