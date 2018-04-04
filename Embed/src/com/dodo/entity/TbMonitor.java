package com.dodo.entity;

import java.sql.Timestamp;

public class TbMonitor implements java.io.Serializable {

	private String id;
	private String ip;
	private String flag;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public TbMonitor() {
		// TODO Auto-generated constructor stub
	}
	public TbMonitor(String id, String ip, String flag) {
		super();
		this.id = id;
		this.ip = ip;
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "TbMonitor [id=" + id + ", ip=" + ip + ", flag=" + flag + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
