package com.review.db;

import java.sql.Timestamp;

public class ReviewBean {
	private String company_name,class_name,email,res_date,content,fileImage;
	private int class_reg,classnum;
	private int rating;
	private Timestamp reviewdate;
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileImage() {
		return fileImage;
	}
	public void setFileImage(String fileImage) {
		this.fileImage = fileImage;
	}
	public int getClass_reg() {
		return class_reg;
	}
	public void setClass_reg(int class_reg) {
		this.class_reg = class_reg;
	}
	public int getClassnum() {
		return classnum;
	}
	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Timestamp getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Timestamp reviewdate) {
		this.reviewdate = reviewdate;
	}
	
	
}
