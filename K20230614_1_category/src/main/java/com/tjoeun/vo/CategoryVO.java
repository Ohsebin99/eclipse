package com.tjoeun.vo;

//	카테고리 1건을 기억하는 클래스
public class CategoryVO {
	private int idx;
	private String category;
	private int gup;
	private int lev;
	private int seq;
	private String deleteCheck = "NO";
	private int deleteReport;
	
	

	public int getDeleteReport() {
		return deleteReport;
	}
	public void setDeleteReport(int deleteReport) {
		this.deleteReport = deleteReport;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getGup() {
		return gup;
	}
	public void setGup(int gup) {
		this.gup = gup;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
	public String getDeleteCheck() {
		return deleteCheck;
	}
	public void setDeleteCheck(String deleteCheck) {
		this.deleteCheck = deleteCheck;
	}
	@Override
	public String toString() {
		return "CategoryVO [idx=" + idx + ", category=" + category + ", gup=" + gup + ", lev=" + lev + ", seq=" + seq
				+ ", deleteCheck=" + deleteCheck + ", deletereport=" + deleteReport + "]";
	}
	
	
}
