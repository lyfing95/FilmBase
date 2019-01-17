package com.lyf.filmbase.entity;

import java.io.Serializable;

public class Mark implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userid;
	private String movieid;
	private Double mark;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMovieid() {
		return movieid;
	}
	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}
	public double getMark() {
		return mark;
	}
	public void setMark(double mark) {
		this.mark = mark;
	}
	
}
