package cn.caiweb.student.util;

public class PageInfo {

	private int currentPage;
	private int totalPage;
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getPageDown() {
		return currentPage + 1;
	}
	
	public int getPageUp() {
		return currentPage -1;
	}
	
}
