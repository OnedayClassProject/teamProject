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
			
			sql = "insert into review(class_registrynum,storenum,company_name,class_name,email,reservation_date,content,thumbnail,rating,reviewdate) "
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
}
