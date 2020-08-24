package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	
		//전역변수 선언
		Connection con = null;
		ResultSet  rs = null;
		PreparedStatement pstmt = null;
		String sql="";
			
		//자원 해제 하는 메소드 
		public void resourceClose(){
		  try{	
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(con != null) con.close();
		  }catch(Exception e){
			  System.out.println("자원해제 실패 : " + e);
		  }
		}//resourceClose()
		private Connection getConnection() throws Exception {

			Connection con = null;
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:/comp/env/jdbc/teamProject");
			con = ds.getConnection();
			return con;
		}
		
		public boolean insertMember(memberBean mbean){
			
			
			int result = 0;
			try {
				con = getConnection();
				
				
				sql = "insert into member(useremail,userpassword,username,phone,postcode,address,detailadd,extraadd,joindate,point,membership) "
						+ " values(?,?,?,?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				
				pstmt.setString(1, mbean.getUseremail());
				pstmt.setString(2, mbean.getUserpassword());
				pstmt.setString(3, mbean.getUsername());
				pstmt.setString(4, mbean.getPhone());
				pstmt.setString(5, mbean.getPostcode());
				pstmt.setString(6, mbean.getAddress());
				pstmt.setString(7, mbean.getDetailadd());
				pstmt.setString(8, mbean.getExtraadd());
				
				pstmt.setTimestamp(9, mbean.getJoindate());
				pstmt.setString(10, "0");
				pstmt.setString(11, "basic");
				
				result = pstmt.executeUpdate();
				
				if(result != 0){
					return true;
				}
				
			} catch (Exception e) {
				System.out.println("insertMember() 메소드 내부에서 예외 발생"+ e);
			}finally {
				resourceClose();
			}
			
			return false;
		}
		public int checkEmail(String email) {
			int result = 0;
			
			try{
				con = getConnection();
				
				sql = "select * from member where useremail=? ";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if (rs.next()){
					result = 1;
				}else{
					result = 0;
				}
			}catch(Exception e){
				//System.out.println("checkEmail() 메소드 내부에서 예외 발생 "+e);
				e.printStackTrace();
			}finally {
				resourceClose();
			}
			
			return result;
		}
		public memberBean getMember(String email) {
			memberBean mbean = new memberBean();
			
			try {
				con = getConnection();
				sql = "select* from member where useremail=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					mbean.setUseremail(rs.getString("useremail"));
					mbean.setUsername(rs.getString("username"));
					mbean.setPhone(rs.getString("phone"));
					mbean.setPostcode(rs.getString("postcode"));
					mbean.setAddress(rs.getString("address"));
					mbean.setDetailadd(rs.getString("detailadd"));
					mbean.setExtraadd(rs.getString("extraadd"));
					mbean.setPoint(rs.getString("point"));
					mbean.setMembership(rs.getString("membership"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				resourceClose();
			}
			
			return mbean;
		}
		public int loginCheck(String email, String password) {
			int check = 0;
			
			try{
				con = getConnection();
				sql = "select* from member where useremail=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(password.equals(rs.getString("userpassword"))){
						check = 1; // 이메일, 비밀번호 동일
					}
				}else{ //이메일이 존재하지 않을 때
					check = 0;
				}
				
			}catch (Exception e){
				e.printStackTrace();
			}finally {
				
			}
			
			return check;
		}
		public void updateMember(memberBean mbean) {
			
			try {
				con = getConnection();
				sql = "select* from member where useremail=? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mbean.getUseremail());
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					sql = "update member set username=?,phone=?,postcode=?,address=?,detailadd=?,extraadd=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, mbean.getUsername());
					pstmt.setString(2, mbean.getPhone());
					pstmt.setString(3, mbean.getPostcode());
					pstmt.setString(4, mbean.getAddress());
					pstmt.setString(5, mbean.getDetailadd());
					pstmt.setString(6, mbean.getExtraadd());
					
					pstmt.executeUpdate();
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				resourceClose();
			}
			
			
		}
		public int deleteMember(String email, String password) {
			int check = 0;
			
			try {
				con = getConnection();
				sql = "delete from member where useremail=? and userpassword=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				
				check = pstmt.executeUpdate();
				
				if(check != 0){
					return 1;
				}
				
			} catch (Exception e) {
				System.out.println(e);
			}finally {
				resourceClose();
			}
			
			return 0;
		}
		
		
	
}
