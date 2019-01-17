package com.lyf.filmbase.entity;


import java.io.Serializable;
import java.util.Date;

public class Orders implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private String id;

    private String userid;

    private String watchid;

    private String seatid;
   
    private Integer number;

    private Integer payment;

    private Date time;
    
    private String status;
    
    
    
    private WatchPlan watchplan;
    private CinemaPlan cinemaplan;
    private Cinema cinema;
    private Movie movie;
    private Seat seat;
    
    public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Seat getSeat() {
		return seat;
	}

	public void setSeat(Seat seat) {
		this.seat = seat;
	}

	public WatchPlan getWatchplan() {
		return watchplan;
	}

	public void setWatchplan(WatchPlan watchplan) {
		this.watchplan = watchplan;
	}

	public CinemaPlan getCinemaplan() {
		return cinemaplan;
	}

	public void setCinemaplan(CinemaPlan cinemaplan) {
		this.cinemaplan = cinemaplan;
	}

	public Cinema getCinema() {
		return cinema;
	}

	public void setCinema(Cinema cinema) {
		this.cinema = cinema;
	}

	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getWatchid() {
		return watchid;
	}

	public void setWatchid(String watchid) {
		this.watchid = watchid;
	}

	public String getSeatid() {
		return seatid;
	}

	public void setSeatid(String seatid) {
		this.seatid = seatid;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getPayment() {
		return payment;
	}

	public void setPayment(Integer payment) {
		this.payment = payment;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Orders(String id, String userid, String watchid, String seatid, Integer number, Integer payment, Date time,
			String status, WatchPlan watchplan, CinemaPlan cinemaplan, Cinema cinema,Movie movie,Seat seat) {
		super();
		this.id = id;
		this.userid = userid;
		this.watchid = watchid;
		this.seatid = seatid;
		this.number = number;
		this.payment = payment;
		this.time = time;
		this.status = status;
		this.watchplan = watchplan;
		this.cinemaplan = cinemaplan;
		this.cinema = cinema;
		this.movie = movie;
		this.seat = seat;
		
	}
	public Orders(String id, WatchPlan watchplan, String watchid) {
		super();
		this.id = id;
		this.watchid = watchid;
		this.watchplan = watchplan;
	}

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Orders [id=" + id + ", userid=" + userid + ", watchid=" + watchid + ", seatid=" + seatid + ", number="
				+ number + ", payment=" + payment + ", time=" + time + ", status=" + status + ", watchplan=" + watchplan
				+ ", cinemaplan=" + cinemaplan + ", cinema=" + cinema + ", movie=" + movie + ", seat=" + seat + "]";
	}
	
	
}