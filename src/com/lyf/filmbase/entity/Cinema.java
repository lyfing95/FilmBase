package com.lyf.filmbase.entity;

import java.io.Serializable;

public class Cinema implements Serializable{
    /**
	 * 
	 */
	

	private String id;

    private String name;

    private String address;
    private String tell; 
    private String imgurl;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public String getTell() {
        return tell;
    }

    public void setTell(String tell) {
        this.tell = tell;
    }
    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }
}