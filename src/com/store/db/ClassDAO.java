package com.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ClassDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
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
	
	public Vector<ClassBean> getClassInfo(){
		Vector<ClassBean> v = new Vector<ClassBean>();
		try {
			con = getConnection();
			String sql = "select class_registrynum,thumbnail,category,class_name,reservation_count from class"
					+ "order by reservation_count desc limit 1,6";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				ClassBean cbean = new ClassBean();
				
				cbean.setClass_registrynum(rs.getInt("class_registrynum"));
				cbean.setThumbnail(rs.getString("thumbnail"));
				cbean.setCategory(rs.getString("category"));
				cbean.setClass_name(rs.getString("class_name"));
				
				v.add(cbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		
		return v;
	}
	
}
