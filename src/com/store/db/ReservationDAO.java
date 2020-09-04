package com.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
					+ "reservation_location,point,class_registrynum,content) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
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
			pstmt.setString(13, rbean.getContent());
			
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
	
	public ReservationBean getOneReservation(int reservationnum){
		ReservationBean bean = null;
		try{
			con = getConnection();
			String sql="select * from classreservation where reservationnum=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, reservationnum);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				bean= new ReservationBean();
				bean.setreservationnum(rs.getInt(1));
				bean.setmembernum(rs.getInt(2));
				bean.setUseremail(rs.getString(3));
				bean.setPay_date(rs.getTimestamp(4));
				bean.setClass_name(rs.getString(5));
				bean.setReservation_category(rs.getString(6));
				bean.setReservation_personnel(rs.getString(7));
				bean.setReservation_date(rs.getString(8));
				bean.setReservation_price(rs.getString(9));
				bean.setReservation_pay(rs.getString(10));
				bean.setReservation_tel(rs.getString(11));
				bean.setReservation_location(rs.getString(12));
				bean.setPoint(rs.getString(13));
				bean.setClass_registrynum(rs.getInt(14));
			}
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return bean;
	}
	public List<ReservationBean> GetReserve(int storenum) {
		
		List<ReservationBean> list = new ArrayList<ReservationBean>();
		
		try {
			con = getConnection();
			
			sql = "select* from class where storenum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, storenum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println("class"+rs.getInt("class_registrynum"));
				sql ="select* from classreservation where class_registrynum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rs.getString("class_registrynum"));
				
				ResultSet rs2 = pstmt.executeQuery();
				
				while(rs2.next()){
					ReservationBean vo = new ReservationBean();
					
					vo.setClass_name(rs2.getString("class_name"));
					vo.setReservation_price(rs2.getString("reservation_price"));
					vo.setUseremail(rs2.getString("useremail"));
					vo.setReservation_personnel(rs2.getString("reservation_personnel"));
					vo.setReservation_date(rs2.getString("reservation_date"));
					vo.setContent(rs2.getString("content"));
					vo.setReservation_tel(rs2.getString("reservation_tel"));
					list.add(vo);
				}
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return list;
	}
	
	
	
	
	
	
	
}
