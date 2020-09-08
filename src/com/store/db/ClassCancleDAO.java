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

	public List<ClassCancleBean> StoreGetCancle(int storenum,int startRow,int endRow) {
		List<ClassCancleBean> list = new ArrayList<ClassCancleBean>();
		
		try {
			
			con = getConnection();
			
			sql = "select* from class where storenum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, storenum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				sql = "select* from classcancle where class_registrynum=?  order by request_day desc limit ?,? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("class_registrynum"));
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				ResultSet rss = pstmt.executeQuery();
				
				while(rss.next()){
					ClassCancleBean vo = new ClassCancleBean();
					
					vo.setClass_name(rss.getString("class_name"));
					vo.setUseremail(rss.getString("useremail"));
					vo.setTime(rss.getString("time"));
					vo.setRefund_price(rss.getString("refund_price"));
					vo.setReservation_pay(rss.getString("reservation_pay"));
					vo.setPoint(rss.getString("point"));
					vo.setPay_date(rss.getString("pay_date"));
					vo.setRefund_date(rss.getString("refund_date"));
					vo.setReservation_personnel(rss.getString("reservation_personnel"));
					vo.setState(rss.getString("state"));
					vo.setReservation_date(rss.getString("reservation_date"));
					vo.setRequest_day(rss.getDate("request_day"));
					vo.setRefundnum(rss.getInt("refundnum"));
					
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
			sql = "select c.thumbnail, c.class_name,c.category,c.class_registrynum,"
					+ "r.user_name,r.reservation_date,r.reservation_personnel,r.time,r.refund_price,r.request_day,r.refund_date,r.state,r.point,r.refundnum "
					+ " from class as c join classcancle as r on r.class_registrynum = c.class_registrynum where r.useremail=? order by request_day desc limit ?,?";
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
				ccbean.setRequest_day(rs.getDate("request_day"));
				ccbean.setState(rs.getString("state"));
				ccbean.setReservation_personnel(rs.getString("reservation_personnel"));
				ccbean.setCategory(rs.getString("category"));
				ccbean.setRefundnum(rs.getInt("refundnum"));
				list.add(ccbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return list;
	}

	public int getClassCancle(int reservationnum) {
		int result = 0;
		
		try {
			con = getConnection();
			
			sql = "select* from classcancle where reservationnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reservationnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return result;
	}

	public int addRefund(int reservationnum, String price) {
		int check = 0;
		
		try {
			
			con = getConnection();
			sql = "select c.class_company,c.category,c.class_name,c.thumbnail,r.class_registrynum,r.useremail"
					+ ",r.reservationnum,r.reservation_date,r.reservation_pay"
					+ ",r.point,r.pay_date,r.reservation_personnel,r.time,r.user_name"
					+ " from class as c join classreservation as r on r.class_registrynum = c.class_registrynum where reservationnum=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reservationnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "insert into classcancle(class_company,category,class_name,thumbnail,class_registrynum,useremail"
						+ ",reservationnum,reservation_date,reservation_pay,point,pay_date,reservation_personnel"
						+ ",time,user_name,request_day,refund_price) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, rs.getString("class_company"));
				pstmt.setString(2, rs.getString("category"));
				pstmt.setString(3, rs.getString("class_name"));
				pstmt.setString(4, rs.getString("thumbnail"));
				pstmt.setInt(5, rs.getInt("class_registrynum"));
				pstmt.setString(6, rs.getString("useremail"));
				pstmt.setInt(7, rs.getInt("reservationnum"));
				pstmt.setString(8, rs.getString("reservation_date"));
				pstmt.setString(9, rs.getString("reservation_pay"));
				pstmt.setString(10, rs.getString("point"));
				pstmt.setString(11, rs.getString("pay_date"));
				pstmt.setString(12, rs.getString("reservation_personnel"));
				pstmt.setString(13, rs.getString("time"));
				pstmt.setString(14, rs.getString("user_name"));
				pstmt.setString(15, price);
				
				int i = pstmt.executeUpdate();
				
				if(i != 0){
					check = 1;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return check;
	}

	public int RefundCancle(int refundnum) {
		int check = 0;
		
		try {
			con = getConnection();
			
			sql = "delete from classcancle where refundnum=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, refundnum);
			
			check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return check;
	}

	public int srefundCount(int storenum) {
		int count = 0;
		
		try {
			
			con = getConnection();
			sql = "select * from class where storenum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, storenum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				sql = "select count(*) from classcancle where class_registrynum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("class_registrynum"));
				
				ResultSet rss = pstmt.executeQuery();
				if(rss.next()){
					count = count + rss.getInt(1);
				}
			}
			
			System.out.println("count"+count);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return count;
	}

	public int RefundCom(int refundnum) {
		int data = 0;
		
		try {
			con = getConnection();
			
			sql = "update classcancle set state = ? where refundnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "1");
			pstmt.setInt(2, refundnum);
			
			data = pstmt.executeUpdate();
			
			sql ="select* from classcancle where refundnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, refundnum);
			rs = pstmt.executeQuery();
			if(rs.next()){
				sql = "update classreservation set refundCheck=? where reservationnum =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, 1);
				pstmt.setInt(2,rs.getInt("reservationnum"));
				
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return data;
	}
	
	
	
	
	
	
	
	
	
}
