package com.lyf.filmbase.util;

import java.io.Serializable;
import java.util.List;

import com.lyf.filmbase.entity.Movie;
import com.lyf.filmbase.entity.Review;

public class Page implements Serializable{
	private Integer currentPage;
	private Integer totalPage;
	private List<String> objectList;
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public List<String> getObjectList() {
		return objectList;
	}
	public void setObjectList(List<String> objectList) {
		this.objectList = objectList;
	}	
}
