package com.lyf.filmbase.entity;


import java.io.Serializable;
import java.util.Date;

public class MoviePlan implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private String cinemaid;

    private String movieid;

    private String moviename;

    private Date moviestarttime;

    private Date movieendtime;

    public String getCinemaid() {
        return cinemaid;
    }

    public void setCinemaid(String cinemaid) {
        this.cinemaid = cinemaid == null ? null : cinemaid.trim();
    }

    public String getMovieid() {
        return movieid;
    }

    public void setMovieid(String movieid) {
        this.movieid = movieid == null ? null : movieid.trim();
    }

    public String getMoviename() {
        return moviename;
    }

    public void setMoviename(String moviename) {
        this.moviename = moviename == null ? null : moviename.trim();
    }

    public Date getMoviestarttime() {
        return moviestarttime;
    }

    public void setMoviestarttime(Date moviestarttime) {
        this.moviestarttime = moviestarttime;
    }

    public Date getMovieendtime() {
        return movieendtime;
    }

    public void setMovieendtime(Date movieendtime) {
        this.movieendtime = movieendtime;
    }
}