package com.dodo.entity;

import java.sql.Timestamp;

/**
 * TbNote entity. @author MyEclipse Persistence Tools
 */

public class TbNote implements java.io.Serializable {

	// Fields

	private String id;
	private String note;
	private Timestamp createtime;
	private String userid;

	// Constructors

	/** default constructor */
	public TbNote() {
	}

	public TbNote(String id, String note, Timestamp createtime, String userid) {
		super();
		this.id = id;
		this.note = note;
		this.createtime = createtime;
		this.userid = userid;
	}

	/** full constructor */


	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "TbNote [id=" + id + ", note=" + note + ", createtime="
				+ createtime + ", userid=" + userid + "]";
	}

}