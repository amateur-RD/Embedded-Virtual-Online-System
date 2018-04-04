package com.dodo.entity;

import java.sql.Timestamp;

/**
 * TbUser entity. @author MyEclipse Persistence Tools
 */

public class TbUser implements java.io.Serializable {

	// Fields

	private String id;
	private String username;
	private String password;
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public TbUser() {
	}

	/** minimal constructor */
	public TbUser(String id) {
		this.id = id;
	}

	/** full constructor */
	public TbUser(String id, String username, String password, Timestamp createtime) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.createtime = createtime;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "TbUser [id=" + id + ", username=" + username + ", password="
				+ password + ", createtime=" + createtime + "]";
	}

}