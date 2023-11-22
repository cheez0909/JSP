package library.dto;

public class pageDTO {

	// 보여줄 페이지 블럭
	int page_firstNo;
	int page_lastNo;
	
	// 총 페이블럭의 마지막번호
	int page_endNo;
	
	// 이전값, 다음값이 존재하는지
	boolean pre, next;
	
	/*
	 * 위의 정보들을 세팅하기 위해 필요한 값
	 */
	// 총게시물 수
	int totalCnt;
	Criteria critera;
	// 보여줄 페이지 블럭의 수
	int page_blockAmount = 10;

	public pageDTO(int totalCnt,
			Criteria criteria, String page_blockAmount) {
		this(totalCnt, criteria);
		
		if(!"".equals(page_blockAmount) && page_blockAmount !=null) {
			this.page_blockAmount = Integer.parseInt(page_blockAmount);
		}
	}
	
	
	public pageDTO(int totalCnt,
			Criteria criteria) {
		this.totalCnt = totalCnt;
		this.critera = criteria;
		
		page_lastNo = (int) Math.ceil  ( criteria.getPageNo() * 1.0 / page_blockAmount ) * page_blockAmount; 
		page_firstNo = page_lastNo - (page_blockAmount-1);
		
		page_endNo =(int) Math.ceil  ( totalCnt / criteria.getAmount());
		
		page_lastNo = page_lastNo > page_endNo ? page_endNo : page_lastNo;
		
		pre = criteria.getPageNo() == 1 ? false : true;
		next = criteria.getPageNo() == page_endNo ? false : true;
		
		System.out.println("page_firstNo " + page_firstNo);
		System.out.println("page_lastNo " + page_lastNo);
		System.out.println("page_endNo " + page_endNo);
		System.out.println("previous " + pre);
		System.out.println("next " + next);
		
		
		System.out.println("==============================");
		System.out.println("요청페이지번호 : " + criteria.getPageNo());
		System.out.println("페이지당 게시물의 수 : " + criteria.getAmount());
		System.out.println("총 게시물의 수 : " + totalCnt);
		
	}
	

	public int getPage_firstNo() {
		return page_firstNo;
	}

	public void setPage_firstNo(int page_firstNo) {
		this.page_firstNo = page_firstNo;
	}

	public int getPage_lastNo() {
		return page_lastNo;
	}

	public void setPage_lastNo(int page_lastNo) {
		this.page_lastNo = page_lastNo;
	}

	public int getPage_endNo() {
		return page_endNo;
	}

	public void setPage_endNo(int page_endNo) {
		this.page_endNo = page_endNo;
	}

	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
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

	public Criteria getCritera() {
		return critera;
	}

	public void setCritera(Criteria critera) {
		this.critera = critera;
	}

	public int getPage_blockAmount() {
		return page_blockAmount;
	}

	public void setPage_blockAmount(int page_blockAmount) {
		this.page_blockAmount = page_blockAmount;
	}
	
}
