package com.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReservationDAO {
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
	public void addReservation(ReservationBean rbean) {
		int result = 0;
		try {
			con = getConnection();
			
			sql ="insert into classreservation(useremail,pay_date,class_name,reservation_category,"
					+ "reservation_personnel,reservation_date,reservation_price,reservation_pay,reservation_tel,"
					+ "reservation_location,point,class_registrynum) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, rbean.getUseremail());
			pstmt.setTimestamp(2, rbean.getPay_date());
			pstmt.setString(3, rbean.getClass_name());
			pstmt.setString(4, rbean.getReservation_category());
			pstmt.setString(5, rbean.getReservation_personnel());
			pstmt.setString(6, rbean.getReservation_date());
			pstmt.setString(7, rbean.getReservation_price());
			pstmt.setString(8, rbean.getReservation_pay());
			pstmt.setString(9, rbean.getReservation_tel());
			pstmt.setString(10, rbean.getReservation_location());
			pstmt.setString(11, rbean.getPoint());
			pstmt.setInt(12, rbean.getClass_registrynum());
			
			result = pstmt.executeUpdate();
			
			System.out.println("result"+result);
			if(result != 0){
				// 클래스 예약자 수 +1
				sql = "update class set reservation_count = reservation_count+1 where class_registrynum=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, rbean.getClass_registrynum());
				
				pstmt.executeUpdate();
				
				
				// 멤버 포인트 적립
				sql = "update member set point = point+? where useremail=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, rbean.getPoint());
				pstmt.setString(2, rbean.getUseremail());
				
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
	}
	
	
	
	
}
