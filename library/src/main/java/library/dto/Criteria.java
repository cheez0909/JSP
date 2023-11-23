package library.dto;

public class Criteria {

	// 현재 페이지 번호
	private int pageNo;
	
	// 한페이지당 보여줄 게시물 수
	private int amount;
	
	// 현재 페이지 게시물의 시작번호
	private int startNo;
	
	// 현재 페이지 게시물의 끝번호
	private int endNo;
	
	private String searchField;
	private String searchWord;
	
	

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public Criteria() {
		endNo = pageNo * amount;
		startNo = endNo - (amount - 1);
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNo=" + pageNo + ", amount=" + amount + ", startNo=" + startNo + ", endNo=" + endNo
				+ ", searchField=" + searchField + ", searchWord=" + searchWord + "]";
	}

	public Criteria(String pageNo, String amount, String searchField, String searchWord) {
		if(pageNo != null && !"".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);
			}
			else {
				this.pageNo = 1;
			}
		
		if(amount != null && !"".equals(amount)) {
			this.amount = Integer.parseInt(amount);
		} else {
			this.amount = 10;
		}
		
		endNo = this.pageNo * this.amount;
		startNo = endNo - (this.amount - 1);
		
		if(searchField != null && !"".equals(searchField)) {
			this.searchField = searchField;
			}
			else {
				this.searchField = "";
			}
		
		if(searchWord != null && !"".equals(searchWord)) {
			this.searchWord = searchWord;
			}
			else {
				this.searchWord = "";
			}
		
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
