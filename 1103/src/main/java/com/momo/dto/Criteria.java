package com.momo.dto;

/*
 * 리스트를 조회하기 위한 파라미터 세팅
 */
public class Criteria {
	
	private int pageNo = 1;
	private int amount = 10;
	private int startNo;
	private int endNo;
	public Criteria() {}
	public Criteria(String pageNo, String amount) {
		if(pageNo != null && "".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);
		}
		if(amount != null && "".equals(amount)) {
			this.amount = Integer.parseInt(amount);
		}
		
		// 필드를 선택하고 싶을 때 this를 붙임
		endNo = this.pageNo * this.amount;
		startNo = (this.pageNo * this.amount) - (this.amount - 1);
	}

	public int getPageNo() {
		return pageNo;
	}


	public int getAmount() {
		return amount;
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
}
