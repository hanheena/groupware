package com.teraenergy.common.vo;

public class PageVO {
	private Integer start;
	private Integer end;
	private Integer limit;
	private Integer nPageSize = 10;
	private Integer currentPageNo = 1;
	private Integer selectsCnt = 10;

	public Integer getSelectsCnt() {
		return selectsCnt;
	}
	public void setSelectsCnt(Integer selectsCnt) {
		this.selectsCnt = selectsCnt;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public Integer getnPageSize() {
		return nPageSize;
	}
	public void setnPageSize(Integer nPageSize) {
		this.nPageSize = nPageSize;
	}
	public Integer getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(Integer currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
}