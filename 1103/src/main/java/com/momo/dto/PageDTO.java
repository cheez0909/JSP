package com.momo.dto;

public class PageDTO {

	// 페이지네이션을 그리기 위해 필요한 정보
	
	int page_startNo;
	int page_endNo;
	
	// 게시물 자체의 마지막
	int page_lastNo;
	boolean previous, next;
	
	
	// 위의 정보들을 세팅하기 위해 필요한 값
	int totalCnt;
	Criteria criteria;
	int page_blockAmount = 10;
	
	
	/*
	 * 생성자를 통해 페이지네이션을 그리기 위한 정보를 세팅한다. 
	 * 
	 */
	public PageDTO(int totalCnt, Criteria criteria, String page_blockAmount) {
		this(totalCnt, criteria);
		if(!"".equals(page_blockAmount) && page_blockAmount !=null) {
			this.page_blockAmount = Integer.parseInt(page_blockAmount);
		}
	}
	
	public PageDTO(int totalCnt, Criteria criteria) {
		this.totalCnt = totalCnt;
		this.criteria = criteria;
		
		// 페이지 블럭의 끝번호를 구한다. 
		// 요청 페이지에 따라서 블럭의 범위가 정해진다. ex) 2페이지 인데 앞뒤로 3개씩 보여줄 것인지...
		
		// 페이지 끝번호 = 현재페이지 no * 페이지 블럭수 / 페이지블럭수 -> 현재가 2라면 2부터 11까지 /  현재가 3이라면 -> 3부터 12까지
		// 현재페이지no * 
		// ( 게시물전체개수 / 페이지당 개수 ) 
		
		page_endNo = (int) Math.ceil (criteria.getPageNo()*1.0 / (page_blockAmount)) *  page_blockAmount ;
		// (cri.getPageNo()/(blockAmount*1.0)) * blockAmount
		page_startNo = page_endNo - (page_blockAmount- 1);
		
		page_lastNo = (int) Math.ceil(totalCnt * 1.0 / criteria.getAmount()); // 10
		
		page_endNo = page_endNo > page_lastNo ? page_lastNo : page_endNo;
		
		previous = criteria.getPageNo() == 1 ? false : true;
		next = criteria.getPageNo() == page_lastNo ? false : true;
		
		System.out.println("page_endNo " + page_endNo);
		System.out.println("page_startNo " + page_startNo);
		System.out.println("page_lastNo " + page_lastNo);
		System.out.println("previous " + previous);
		System.out.println("next " + next);
		
		
		System.out.println("==============================");
		System.out.println("요청페이지번호 : " + criteria.getPageNo());
		System.out.println("페이지당 게시물의 수 : " + criteria.getAmount());
		System.out.println("총 게시물의 수 : " + totalCnt);
		
	}

	public int getPage_startNo() {
		return page_startNo;
	}

	public void setPage_startNo(int page_startNo) {
		this.page_startNo = page_startNo;
	}

	public int getPage_endNo() {
		return page_endNo;
	}

	public void setPage_endNo(int page_endNo) {
		this.page_endNo = page_endNo;
	}

	public int getPage_lastNo() {
		return page_lastNo;
	}

	public void setPage_lastNo(int page_lastNo) {
		this.page_lastNo = page_lastNo;
	}

	public boolean isPrevious() {
		return previous;
	}

	public void setPrevious(boolean previous) {
		this.previous = previous;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}	
}
