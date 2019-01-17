package com.lyf.filmbase.entity;


import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

import org.springframework.format.annotation.DateTimeFormat;


public class WatchPlan implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private Time starttime;
	private Time endtime;
	private String language;
	private String hall;
	private double price;
	private String seatid;
	/*@DateTimeFormat(pattern="yyyy-MM-dd")*/ 
	private Date date;
	private CinemaPlan cinemaplan;
	private String movieid;
	public String getSeatid() {
		return seatid;
	}

	public void setSeatid(String seatid) {
		this.seatid = seatid;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Time getStarttime() {
		return starttime;
	}

	public void setStarttime(Time starttime) {
		this.starttime = starttime;
	}

	public Time getEndtime() {
		return endtime;
	}

	public void setEndtime(Time endtime) {
		this.endtime = endtime;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getHall() {
		return hall;
	}

	public void setHall(String hall) {
		this.hall = hall;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	public CinemaPlan getCinemaPlan() {
		return cinemaplan;
	}

	public void setCinemaPlan(CinemaPlan cinemaplan) {
		this.cinemaplan = cinemaplan;
	}
	public String getMovieid() {
		return hall;
	}

	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}

	public WatchPlan(String id, Time starttime, Time endtime, String language, String hall, double price, String seatid,
			Date date, CinemaPlan cinemaplan, String movieid) {
		super();
		this.id = id;
		this.starttime = starttime;
		this.endtime = endtime;
		this.language = language;
		this.hall = hall;
		this.price = price;
		this.seatid = seatid;
		this.date = date;
		this.cinemaplan = cinemaplan;
		this.movieid = movieid;
	}

	public WatchPlan() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
