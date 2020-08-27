package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	
		//�������� ����
		Connection con = null;
		ResultSet  rs = null;
		PreparedStatement pstmt = null;
		String sql="";
			
		//�ڿ� ���� �ϴ� �޼ҵ� 
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
		
		public boolean insertMember(memberBean mbean){
			
			
			int result = 0;
			try {
				con = getConnection();
				
				
				sql = "insert into member(useremail,userpassword,username,phone,postcode,address1,address2,address3,joindate,point,membership,vip_startdate,vip_finish) "
						+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
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
				
				pstmt.setString(12, "0");
				pstmt.setString(13, "0");
				result = pstmt.executeUpdate();
				
				if(result != 0){
					return true;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
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
				//System.out.println("checkEmail() �޼ҵ� ���ο��� ���� �߻� "+e);
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
			System.out.println(email);
			try{
				con = getConnection();
				sql = "select* from member where useremail=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(password.equals(rs.getString("userpassword"))){
						check = 1; // �̸���, ��й�ȣ ����
					}
				}else{ //�̸����� �������� ���� ��
					check = 0;
				}
				
			}catch (Exception e){
				e.printStackTrace();
			}finally {
				resourceClose();
			}
			System.out.println(check);
			return check;
		}
		public int updateMember(memberBean mbean) {
			
			try {
				con = getConnection();
				sql = "select* from member where useremail=? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mbean.getUseremail());
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					sql = "update member set username=?,phone=?,postcode=?,address1=?,address2=?,address3=?";
					
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
				return 0;
			}finally {
				resourceClose();
			}
			
			return 1;
		}
		
		public void deleteMember(String email, String password) {
			
			
			try {
				con = getConnection();
				sql = "delete from member where useremail=? and userpassword=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				
				pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				System.out.println(e);
			}finally {
				resourceClose();
			}
			
			
		}
		
		
		
	
	
}
