package com.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
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
		  e.printStackTrace();
	  }
	}//resourceClose()
	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:/comp/env/jdbc/teamProject");
		con = ds.getConnection();
		return con;
	}
	public int reviewWrite(ReviewBean rbean) {
		int result = 0;
		
		try {
			con = getConnection();
			
			sql = "insert into review(class_registrynum,storenum,company_name,class_name,useremail,reservation_date,content,thumbnail,rating,reviewdate) "
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rbean.getClass_registrynum());
			pstmt.setString(2, rbean.getStorenum());
			pstmt.setString(3, rbean.getCompany_name());
			pstmt.setString(4, rbean.getClass_name());
			pstmt.setString(5, rbean.getUseremail());
			pstmt.setString(6, rbean.getReservation_date());
			pstmt.setString(7, rbean.getContent());
			pstmt.setString(8, rbean.getThumbnail());
			pstmt.setInt(9, rbean.getRating());
			pstmt.setTimestamp(10, rbean.getReviewdate());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return result;
	}
	public int reviewCount(int class_num) {
		
		int count = 0;
	 try {
		 
		 con = getConnection();
		 
		 String sql = "select count(*) from review where class_registrynum = ?";
		 pstmt = con.prepareStatement(sql);
		 pstmt.setInt(1, class_num);
		 rs = pstmt.executeQuery();
		 if(rs.next()) {
			 count = rs.getInt(1);
		 }
	 } catch (Exception e) {
		 e.printStackTrace();
	 } finally {
		resourceClose();
	}
		return count;
	}
public int sumRating(int class_num) {
		
		int sum = 0;
	 try {
		 con = getConnection();
		 
		 String sql = "select sum(rating) from review where class_registrynum = ?";
		 pstmt = con.prepareStatement(sql);
		 pstmt.setInt(1, class_num);
		 rs = pstmt.executeQuery();
		 if(rs.next()) {
			 sum = rs.getInt(1);
		 }
	 } catch (Exception e) {
		 e.printStackTrace();
	 } finally {
		resourceClose();
	}
		return sum;
	}
	public void ratingUpdate(int class_num, int sum) {
		
		try {
			
			con = getConnection();
			
			String sql = "update class set rating = ? where class_registrynum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sum);
			pstmt.setInt(2, class_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
	}
}
