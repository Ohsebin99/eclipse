package com.tjoeun.vo;

import java.util.Date;

public class FreeboardCommentVO {
	private int idx;
	private int gup;
	private String name;
	private String password;
	private String content;
	private Date writedate;
	private String ip;
	
	
	
	
	public int getGup() {
		return gup;
	}
	public void setGup(int gup) {
		this.gup = gup;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "FreeBoardCommentVO [idx=" + idx + ", gup=" + gup + ", name=" + name + ", password=" + password
				+ ", content=" + content + ", writedate=" + writedate + ", ip=" + ip + "]";
	}
	
	
}
