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

	public List<ClassCancleBean> StoreGetCancle(Integer storenum) {
		List<ClassCancleBean> list = new ArrayList<ClassCancleBean>();
		
		try {
			
			con = getConnection();
			
			sql = "select* from class where storenum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, storenum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				sql = "select* from classcancle where class_registrynum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("class_registrynum"));
				
				ResultSet rss = pstmt.executeQuery();
				
				while(rss.next()){
					ClassCancleBean vo = new ClassCancleBean();
					
					vo.setClass_name(rss.getString("class_name"));
					vo.setUseremail(rss.getString("useremail"));
					vo.setReservation_date(rss.getString("reservation_date"));
					vo.setTime(rss.getString("time"));
					vo.setRefund_price(rss.getString("refund_price"));
					vo.setReservation_pay(rss.getString("reservation_pay"));
					vo.setPoint(rss.getString("point"));
					vo.setPay_date(rss.getString("pay_date"));
					vo.setRefund_date(rss.getString("refund_date"));
					vo.setReservation_personnel(rss.getString("reservation_personnel"));
				
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
	
	
	
	
	
	
	
	
	
}
