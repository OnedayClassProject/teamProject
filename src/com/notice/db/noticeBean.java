package com.notice.db;

import java.sql.Timestamp;

public class noticeBean {
	private int num;
	private String title;
	private String content;
	private Timestamp date;
	private int header;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getHeader() {
		return header;
	}
	public void setHeader(int header) {
		this.header = header;
	}
}
