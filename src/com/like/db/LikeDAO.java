package com.like.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LikeDAO {
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
	public int likeOn(int num, String useremail) {
		int result = 0;
		
		try {
			con = getConnection();
			
			sql = "insert into class_like(class_registrynum,useremail) "
					+ " values(?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, useremail);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return result;
	}
	public int likeOff(int num, String useremail) {
		int result = 0;
		
		try {
			con = getConnection();
			
			sql = "delete from class_like where class_registrynum=? and useremail=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, useremail);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return result;
	}
	public int isLike(int num, String useremail) {
		int result = 0;
		
		try {
			con = getConnection();
			
			sql = "select* from class_like where class_registrynum =? and useremail=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, useremail);
			
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
	

	
	
	
	
	
}
