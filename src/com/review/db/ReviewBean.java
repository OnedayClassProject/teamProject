package com.review.db;

import java.sql.Timestamp;

public class ReviewBean {
	private String company_name,storenum,class_name,useremail,reservation_date,content,thumbnail;
	private int class_registrynum;
	private int rating;
	private Timestamp reviewdate;
	
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	
	public String getStorenum() {
		return storenum;
	}
	public void setStorenum(String storenum) {
		this.storenum = storenum;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getClass_registrynum() {
		return class_registrynum;
	}
	public void setClass_registrynum(int class_registrynum) {
		this.class_registrynum = class_registrynum;
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
