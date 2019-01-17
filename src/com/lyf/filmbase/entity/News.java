package com.lyf.filmbase.entity;


import java.io.Serializable;
import java.sql.Timestamp;

public class News implements Serializable{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private String id;
  private String author;
  private String contents;
  private Timestamp time;
  private String head;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public Timestamp getTime() {
	return time;
}
public void setTime(Timestamp time) {
	this.time = time;
}
public String getHead() {
	return head;
}
public void setHead(String head) {
	this.head = head;
}
  
}
