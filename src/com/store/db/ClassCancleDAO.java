package com.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ClassCancleDAO {

	Connection con = null;
	ResultSet  rs = null;
	PreparedStatement pstmt = null;
	String sql="";
	
	public void resourceClose(){
		  try{	
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(con != null) con.close();
		  }catch(Exception e){
			  System.out.println("�ڿ����� ���� : " + e);
		  }
		}//resourceClose()
	
	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:/comp/env/jdbc/teamProject");
		con = ds.getConnection();
		return con;
	}

	public List<ClassCancleBean> StoreGetCancle(Integer storenum) {
		List<ClassCancleBean> list = new ArrayList<ClassCancleBean>();
		
		try {
			
			con = getConnection();
			
			sql = "select* from class where storenum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, storenum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				sql = "select* from classcancle where class_registrynum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("class_registrynum"));
				
				ResultSet rss = pstmt.executeQuery();
				
				while(rss.next()){
					ClassCancleBean vo = new ClassCancleBean();
					
					vo.setClass_name(rss.getString("class_name"));
					vo.setUseremail(rss.getString("useremail"));
					vo.setReservation_date(rss.getString("reservation_date"));
					vo.setTime(rss.getString("time"));
					vo.setRefund_price(rss.getString("refund_price"));
					vo.setReservation_pay(rss.getString("reservation_pay"));
					vo.setPoint(rss.getString("point"));
					vo.setPay_date(rss.getString("pay_date"));
					vo.setRefund_date(rss.getString("refund_date"));
					vo.setReservation_personnel(rss.getString("reservation_personnel"));
				
					list.add(vo);
				
				}
			}
			
		} catch (Exception e) {
			System.out.println("StoreGetCancle() 내부에서 예외발생");
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		return list;
	}

	public int mrefundCount(String email) {
		int count = 0;
		
		try {
			con = getConnection();
			sql = "select count(*) from classcancle where useremail=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return count;
	}

	public ArrayList<ClassCancleBean> refundList(String email, int startRow, int endRow) {
		ArrayList<ClassCancleBean> list = new ArrayList<ClassCancleBean>();
		
		try {
			con = getConnection();
			sql = "select c.thumnail c.class_name,c.category,c.class_registrynum"
					+ "r.user_name,r.reservation_personnel,r.reservation_date,r.time,r.refund_price,r.request_day,r.refund_date,r.status,r.point "
					+ "from class as c join classcancle as r on r.class_registrynum = c.class_registrynum where r.useremail=? orber by request_day desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ClassCancleBean ccbean = new ClassCancleBean();
				ccbean.setThumbnail(rs.getString("thumbnail"));
				ccbean.setClass_name(rs.getString("class_name"));
				ccbean.setClass_registrynum(rs.getInt("class_registrynum"));
				ccbean.setUser_name(rs.getString("user_name"));
				ccbean.setReservation_date(rs.getString("reservation_date"));
				ccbean.setTime(rs.getString("time"));
				ccbean.setPoint(rs.getString("point"));
				ccbean.setRefund_price(rs.getString("refund_price"));
				ccbean.setRefund_date(rs.getString("refund_date"));
				ccbean.setRequest_day(rs.getTimestamp("request_day"));
				ccbean.setStatus(rs.getString("status"));
				ccbean.setReservation_personnel(rs.getString("reservation_personnel"));
				
				list.add(ccbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		
		return list;
	}
	
	
	
	
	
	
	
	
	
}
