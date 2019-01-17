package com.lyf.filmbase.entity;

import java.io.Serializable;

public class Seat implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private String seatid;
    private String seatx;
    private String seaty;

    private String cinemaid;

    @Override
	public String toString() {
		return "\'"+seatx+"_"+seaty+"\'".trim();
	}
    /*@Override
	public String toString() {
		return "'"+seatx+'_'+seaty+"'";
	}*/

	private String planid;

    private Integer oddseat;

    public String getSeatid() {
        return seatid;
    }

    public void setSeatid(String seatid) {
        this.seatid = seatid;
    }
    public String getSeatx() {
        return seatx;
    }

    public void setSeatx(String seatx) {
        this.seatx = seatx;
    }
    public String getSeaty() {
        return seaty;
    }

    public void setSeaty(String seaty) {
        this.seaty = seaty;
    }

    public String getCinemaid() {
        return cinemaid;
    }

    public void setCinemaid(String cinemaid) {
        this.cinemaid = cinemaid == null ? null : cinemaid.trim();
    }

    public String getplanid() {
        return planid;
    }

    public void setplanid(String planid) {
        this.planid = planid == null ? null : planid.trim();
    }

    public Integer getOddseat() {
        return oddseat;
    }

    public void setOddseat(Integer oddseat) {
        this.oddseat = oddseat;
    }
}