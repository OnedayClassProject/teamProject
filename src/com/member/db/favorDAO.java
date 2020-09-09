package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.store.db.ClassBean;

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
			sql = "insert into favor(useremail, class_registrynum) "
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
			
			sql = "delete from favor "
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
	
	public int isFavor(String useremail,int num){
		int result=0;
		
		try {
			con=getConnection();
			sql="select * from favor where useremail=? and class_registrynum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, useremail);
			pstmt.setInt(2, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				result=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return result;
		
	}
	
	public int favorCount(String email) {
		int count = 0;
		
		try {
			con = getConnection();
			
			sql = "select count(*) from favor where useremail=?";
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
	public ArrayList<ClassBean> favorList(String email, int startRow, int endRow) {
		
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		
		try {
			con = getConnection();
			
			sql = "select c.category,c.class_name,c.rating,c.thumbnail,c.class_registrynum"
					+ " from class as c join favor as f on f.class_registrynum = c.class_registrynum where f.useremail=? limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ClassBean vo = new ClassBean();
				
				vo.setCategory(rs.getString("category"));
				vo.setClass_name(rs.getString("class_name"));
				vo.setRating(rs.getInt("rating"));
				vo.setThumbnail(rs.getString("thumbnail"));
				vo.setClass_registrynum(rs.getInt("class_registrynum"));
				
				list.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return list;
	}
}

