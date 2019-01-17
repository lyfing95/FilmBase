package com.lyf.filmbase.entity;



import java.io.Serializable;
import java.util.Date;


public class Review implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    
	private String userid;

    private String movieid;

    private String contents;

    private Date time;
    private User user;
    
  public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
   

	/*private List<User> user;

    public List<User> user() {
		return user;
	}

	public void user(List<User> user) {
		this.user = user;
	}*/

	@Override
	public String toString() {
		return "Review [userid=" + userid + ", movieid=" + movieid + ", contents=" + contents + ", time=" + time
				+ ", user=" + user + "]";
	}

	public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    
    public String getMovieid() {
        return movieid;
    }

    public void setMovieid(String movieid) {
        this.movieid = movieid == null ? null : movieid.trim();
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents == null ? null : contents.trim();
    }

    

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(String userid, String movieid, String contents, Date time, User user) {
		super();
		this.userid = userid;
		this.movieid = movieid;
		this.contents = contents;
		this.time = time;
		this.user = user;
	}
    
}