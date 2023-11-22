package com.momo.dto;

/*
 * 리스트를 조회하기 위한 파라미터 세팅
 */
public class Criteria {
	
	private int pageNo = 1;
	private int amount = 10;
	private int startNo;
	private int endNo;
	
	
	// 검색어
	private String searchWord="";
	
	
	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	// 검색조건
	private String searchField="";
	
	public Criteria() {
		endNo = pageNo * amount;
		startNo = endNo - (amount - 1);
	}
	
	/*
	 * 생성자를 통해 값을 세팅함
	 * 
	 * 
	 */
	public Criteria(String pageNo, String amount, String searchField, String searchWord) {
		if(pageNo != null && "".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);
		} 
		else {
			this.pageNo = Integer.parseInt(pageNo);
		}

		if(amount != null && "".equals(amount)) {
			this.amount = Integer.parseInt(amount);
		} 
		//else {
			// this.amount = Integer.parseInt(amount);
		//}
		
		// 필드를 선택하고 싶을 때 this를 붙임
		endNo = this.pageNo * this.amount;
		startNo = (this.pageNo * this.amount) - (this.amount - 1);
		
		if(searchField != null && !"".equals(searchField)) {
			this.searchField = searchField;
		} 
		if(searchWord != null && !"".equals(searchWord)) {
			this.searchWord = searchWord;
		} 
		
		
		
	}

	public int getPageNo() {
		return pageNo;
	}


	public int getAmount() {
		return amount;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	@Override
	public String toString() {
		return "Criteria [searchWord=" + searchWord + ", searchField=" + searchField + "]";
	}
	
	
	
}
