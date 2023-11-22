package library.dto;

public class Criteria {

	// 현재 페이지 번호
	private int pageNo = 1;
	
	// 한페이지당 보여줄 게시물 수
	private int amount =10;
	
	// 현재 페이지 게시물의 시작번호
	private int startNo;
	
	// 현재 페이지 게시물의 끝번호
	private int endNo;

	public Criteria() {
		endNo = pageNo * amount;
		startNo = endNo - (amount - 1);
	}
	
	public Criteria(String pageNo, String amount) {
		if(pageNo != null && "".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);
			}
		
		if(amount != null && "".equals(amount)) {
			this.amount = Integer.parseInt(amount);
		}
		endNo = this.pageNo * this.amount;
		startNo = endNo - (this.amount - 1);
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getAmount() {
		return amount;
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
	
	
	
}
