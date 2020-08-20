package com.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;



public class StoreDAO {
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
	public int loginStore(String storeemail, String storepw){
		int check = -1;
		System.out.println(storeemail);
		try {
			con = getConnection();
			
			String sql = "select * from store where storeemail=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, storeemail);

			rs = pstmt.executeQuery();

			if(rs.next()){
				if(storepw.equals(rs.getString("storepw"))){
					check = 1;
				}else{
					check = 0;
				}
			}
		} catch (Exception e) {
			System.out.println("loginStore()에서 예외발생 : "+ e);
		}finally {
			resourceClose();
		}
		System.out.println("check : " +check);
		return check;
	}
	
	public boolean insertStore(StoreBean bean) {
		int result = 0; //회원가입 성공여부
		try {
			con = getConnection();
			String sql = "select max(storenum) from store";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int num = rs.getInt(1);
			sql = "insert into store(storenum,storeemail,storepw,storename,storetel,storeplace)"
					+ "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num + 1);
			pstmt.setString(2, bean.getStoreemail());
			pstmt.setString(3, bean.getStorepw());
			pstmt.setString(4, bean.getStorename());
			pstmt.setString(5, bean.getStoretel());
			pstmt.setString(6, bean.getStoreplace());
			result = pstmt.executeUpdate();
			
			if(result != 0)
				return true;
		} catch (Exception e) {
			System.out.println("insertStore()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}

		return false;
	}
	
	public int emailCheck(String email){
		int check = 1; //아이디가 존재하는지 확인하는 변수 0 -> 존재하는 아이디, 1 -> 존재하지 않는 아이디
		try {
			con = getConnection();
			String sql = "select * from store where storeemail = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = 0;
			}
		} catch (Exception e) {
			System.out.println("emailCheck()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}
		
		return check;
	}
	public void updateStore(StoreBean bean){
		try {
			con = getConnection();
			String sql = "update store set storepw = ?, storename = ?, storetel = ?, storeplace = ? where storeemail = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getStorepw());
			pstmt.setString(2, bean.getStorename());
			pstmt.setString(3, bean.getStoretel());
			pstmt.setString(4, bean.getStoreplace());
			pstmt.setString(5, bean.getStoreemail());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateStore()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}
	}
	
	public boolean deleteStore(String storeemail, String storepw){
		int result = 0; //삭제 수행했는지 확인하는 변수
		try {
			con = getConnection();
			String sql = "delete from store where storeemail =? and storepw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, storeemail);
			pstmt.setString(2, storepw);
			result = pstmt.executeUpdate();
			if(result != 0)
				return true;
		} catch (Exception e) {
			System.out.println("deleteStore()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}
		return false;
	}
	public StoreBean getStore(String email){
		StoreBean bean =null;
		try {
			con = getConnection();
			String sql = "select * from store where storeemail = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
		} catch (Exception e) {
			System.out.println("deleteStore()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}
		return bean;
	}
	
	
	public void insetTime(TimeSaveBean bean) {
		
		try {
			con = getConnection();
			String sql = "insert into operationdate values (?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getClass_registrynum());
			pstmt.setString(2, bean.getClass_date());
			pstmt.setString(3, bean.getClass_day());
			pstmt.setString(4, bean.getClass_starttime());
			pstmt.setString(5, bean.getClass_endtime());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
	}
	public ArrayList<TimeSaveBean> getAllDate(String date , int num){
		
		ArrayList<TimeSaveBean> list = new ArrayList<TimeSaveBean>();
		try {
			con = getConnection();
			String sql = "select distinct(class_date),class_day from operationdate where class_date = ? and class_registrynum = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TimeSaveBean bean = new TimeSaveBean();
				bean.setClass_date(rs.getString(1));
				bean.setClass_day(rs.getString(2));
				list.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return list;
	}
	public int getClassNum() {
		int num = 1;
		try {
			con = getConnection();
			String sql = "select count(*) from class";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return num;
	}
	public ArrayList<TimeSaveBean> getTime(String date, String day, int num){
		
		
			ArrayList<TimeSaveBean> list = new ArrayList<TimeSaveBean>();
		try {
			con = getConnection();
			String sql = "select class_starttime, class_endtime from operationdate where class_date = ? and class_day = ? and class_registrynum = ? order by class_starttime asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, day);
			pstmt.setInt(3, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TimeSaveBean bean = new TimeSaveBean();
				bean.setClass_starttime(rs.getString(1));
				bean.setClass_endtime(rs.getString(2));
				
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		return list;
	}
}
