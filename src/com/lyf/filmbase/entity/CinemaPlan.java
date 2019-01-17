package com.lyf.filmbase.entity;

import java.io.Serializable;

public class CinemaPlan implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cinemaid;
	private String watchid;
	private String movieid;
	
	public String getCinemaid() {
		return cinemaid;
	}

	public void setCinemaid(String cinemaid) {
		this.cinemaid = cinemaid;
	}

	public String getWatchid() {
		return watchid;
	}

	public void setWatchid(String watchid) {
		this.watchid = watchid;
	}
	public String getMovieid() {
		return movieid;
	}

	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}
}
