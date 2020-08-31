package com.member.db;

import java.sql.Timestamp;

public class memberBean {
	
	
	private String useremail;
	private String userpassword;
	private String username;
	private String phone;
	private String postcode;
	private String address;
	private String detailadd;
	private String extraadd;
	
	private Timestamp joindate;
	
	private String vip_startdate;
	private String vip_finish;
	
	private String point;
	private String membership;
	
	
	
	
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}

	
	
	public String getVip_startdate() {
		return vip_startdate;
	}
	public void setVip_startdate(String vip_startdate) {
		this.vip_startdate = vip_startdate;
	}
	public String getVip_finish() {
		return vip_finish;
	}
	public void setVip_finish(String vip_finish) {
		this.vip_finish = vip_finish;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getMembership() {
		return membership;
	}
	public void setMembership(String membership) {
		this.membership = membership;
	}
	public String getDetailadd() {
		return detailadd;
	}
	public void setDetailadd(String detailadd) {
		this.detailadd = detailadd;
	}
	public String getExtraadd() {
		return extraadd;
	}
	public void setExtraadd(String extraadd) {
		this.extraadd = extraadd;
	}
	
	
	
	
}
