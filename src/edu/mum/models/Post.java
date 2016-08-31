package edu.mum.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="posts")
public class Post {
	
	@Id
	@GeneratedValue
	private int postid;

	@ManyToOne
	@JoinColumn(name="userid")
	private User user;
	private String post;
	private int posttype;
	private Date datecreated;	
	private Date dateupdated;	

	public Post(){}
	
	public int getPostid() {
		return postid;
	}
	
	public void setPostid(int postid) {
		this.postid = postid;
	}
	
	 
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	
	
	public int getPosttype() {
		return posttype;
	}

	public void setPosttype(int posttype) {
		this.posttype = posttype;
	}

	public Date getDatecreated() {
		return datecreated;
	}

	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}

	public Date getDateupdated() {
		return dateupdated;
	}

	public void setDateupdated(Date dateupdated) {
		this.dateupdated = dateupdated;
	}

	 
}
