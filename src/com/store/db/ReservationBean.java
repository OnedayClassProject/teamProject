package com.store.db;

import java.sql.Timestamp;

public class ReservationBean {
	
	private String useremail;
	
	private Timestamp pay_date;
	
	private String class_name;
	private String reservation_category;
	private String reservation_personnel;
	private String reservation_date;
	private String reservation_price;
	private String reservation_pay;
	private String reservation_tel;
	private String reservation_location;
	private String point;
	
	private int class_registrynum;

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public Timestamp getPay_date() {
		return pay_date;
	}

	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getReservation_category() {
		return reservation_category;
	}

	public void setReservation_category(String reservation_category) {
		this.reservation_category = reservation_category;
	}

	public String getReservation_personnel() {
		return reservation_personnel;
	}

	public void setReservation_personnel(String reservation_personnel) {
		this.reservation_personnel = reservation_personnel;
	}

	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public String getReservation_price() {
		return reservation_price;
	}

	public void setReservation_price(String reservation_price) {
		this.reservation_price = reservation_price;
	}

	public String getReservation_pay() {
		return reservation_pay;
	}

	public void setReservation_pay(String reservation_pay) {
		this.reservation_pay = reservation_pay;
	}

	public String getReservation_tel() {
		return reservation_tel;
	}

	public void setReservation_tel(String reservation_tel) {
		this.reservation_tel = reservation_tel;
	}

	public String getReservation_location() {
		return reservation_location;
	}

	public void setReservation_location(String reservation_location) {
		this.reservation_location = reservation_location;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public int getClass_registrynum() {
		return class_registrynum;
	}

	public void setClass_registrynum(int class_registrynum) {
		this.class_registrynum = class_registrynum;
	}
	
	
}
