package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class favorDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	private Connection getConnection() throws Exception{;
		Connection conn=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/teamProject");
		conn=ds.getConnection();
	return conn;
	}
	
	private void resourceClose(){
		try {
			if(con != null) con.close();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
		} catch (SQLException e) {
			System.out.println("resourceClose()에서 예외발생 : " + e);
		}
	}
	
	public int insertFavorite(String useremail, int num) {
		
		try {
			con = getConnection();
			sql = "insert into store_favor(useremail, class_registrynum) "
					+ "values(?, ?)";
			
			pstmt = con.prepareStatement(sql);		
	
			pstmt.setString(1, useremail);
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
			
		} finally {
			resourceClose();
		}
	}
	
	public int deleteFavorite(String useremail, int num) {
		
		try {
			con = getConnection();
			
			sql = "delete from store_favor "
				+ "where useremail=? and class_registrynum=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, useremail);
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
			
		} finally {
			resourceClose();
		}
	}
	
	public int isFavorite(String useremail, int num) {
		
		int result = 0;
		
		try {
			con = getConnection();
			
			sql = "select * from store_favor "
				+ "where useremail=? and class_registrynum=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, useremail);
			pstmt.setInt(2, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return result;
	}
	
	
}
