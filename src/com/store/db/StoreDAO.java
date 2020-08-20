package com.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



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
	//로그인
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
	//회원가입
	public boolean insertStore(StoreBean bean) {
		int result = 0; //회원가입 성공여부
		try {
			con = getConnection();
			String sql = "select max(storenum) from store";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int num = rs.getInt(1);
			sql = "insert into store(storenum,storeemail,storepw,storename,storetel,storepostcode,storeaddress1,storeaddress2,storeaddress3)"
					+ "values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num + 1);
			pstmt.setString(2, bean.getStoreemail());
			pstmt.setString(3, bean.getStorepw());
			pstmt.setString(4, bean.getStorename());
			pstmt.setString(5, bean.getStoretel());
			pstmt.setString(6, bean.getStorepostcode());
			pstmt.setString(7, bean.getStoreaddress1());
			pstmt.setString(8, bean.getStoreaddress2());
			pstmt.setString(9, bean.getStoreaddress3());
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
	//이메일 존재 여부 확인
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
	//가계계정 수정
	public void updateStore(StoreBean bean){
		try {
			con = getConnection();
			String sql = "update store set storepw = ?, storename = ?, storetel = ?, storepostcode = ?, storeaddress1 = ?, storeaddress2 = ?, storeaddress3 = ? where storeemail = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getStorepw());
			pstmt.setString(2, bean.getStorename());
			pstmt.setString(3, bean.getStoretel());
			pstmt.setString(4, bean.getStorepostcode());
			pstmt.setString(5, bean.getStoreaddress1());
			pstmt.setString(6, bean.getStoreaddress2());
			pstmt.setString(7, bean.getStoreaddress3());
			pstmt.setString(8, bean.getStoreemail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateStore()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}
	}
	
	//가계계정 지우기
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
	
	//현재 로그인중인 가계계정 가지고오기
	public StoreBean getStore(String email){
		StoreBean bean =null;
		try {
			con = getConnection();
			String sql = "select * from store where storeemail = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()){	
				bean = new StoreBean();
				bean.setStorenum(rs.getInt("storenum"));
				bean.setStoreemail(rs.getString("storeemail"));
				bean.setStorepw(rs.getString("storepw"));
				bean.setStorename(rs.getString("storename"));
				bean.setStoretel(rs.getString("storetel"));
				bean.setStorepostcode(rs.getString("storepostcode"));
				bean.setStoreaddress1(rs.getString("storeaddress1"));
				bean.setStoreaddress2(rs.getString("storeaddress2"));
				bean.setStoreaddress3(rs.getString("storeaddress3"));
			}
		} catch (Exception e) {
			System.out.println("getStore()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}
		return bean;
	}
	
}
