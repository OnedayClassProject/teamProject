package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	
		//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
		Connection con = null;
		ResultSet  rs = null;
		PreparedStatement pstmt = null;
		String sql="";
			
		//�뜝�뙓�슱�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�떦�뙋�삕 �뜝�뙣�냼�벝�삕 
		public void resourceClose(){
		  try{	
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(con != null) con.close();
		  }catch(Exception e){
			  System.out.println("�뜝�뙓�슱�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 : " + e);
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
				//System.out.println("checkEmail() �뜝�뙣�냼�벝�삕 �뜝�룞�삕�뜝�떥�슱�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�뙥�궪�삕 "+e);
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
					mbean.setAddress(rs.getString("address1"));
					mbean.setDetailadd(rs.getString("address2"));
					mbean.setExtraadd(rs.getString("address3"));
					mbean.setPoint(rs.getString("point"));
					mbean.setMembership(rs.getString("membership"));
					mbean.setVip_finish(rs.getString("vip_finish"));
					
					
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
			if(!email.equals("admin@class.com")) {
				return check;
			}
			try{
				con = getConnection();
				sql = "select* from member where useremail=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				if(rs.next()){
					if(password.equals(rs.getString("userpassword"))){
						check = 1; // �뜝�떛紐뚯삕�뜝�룞�삕, �뜝�룞�삕艅섇뜝�떕占� �뜝�룞�삕�뜝�룞�삕
					}
				}else{ //�뜝�떛紐뚯삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕
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
			
			
		}//deleteMember
		public int pwdEmail(String email) {
			int result = 0;
			
			try{
				con = getConnection();
				
				sql = "select * from store s ,member m where s.storeemail=? || m.useremail=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				pstmt.setString(2, email);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()){
					result = 1;
				}else{
					result = 0;
				}
			}catch(Exception e){
				//System.out.println("checkEmail() �뜝�뙣�냼�벝�삕 �뜝�룞�삕�뜝�떥�슱�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�뙥�궪�삕 "+e);
				e.printStackTrace();
			}finally {
				resourceClose();
			}
			
			return result;
		}
		//auth Num start
		public String authNum() {
			StringBuffer authNum = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				int random = (int)(Math.random()*10.0d);
				authNum.append(random);
			}
			return authNum.toString();
		}
		public boolean sendEmail(String email,String authNum) {
			boolean result=false;
			String sender = "itwilltest123@gmail.com";
			String subject="Check Number for Finding PassWord";
			String content ="email : " + email+"<br>"+"Check Number : [<b>" + authNum + "</b>]";
			try {
				Properties properties = System.getProperties();
				properties.put("mail.smtp.starttls.enable", "true");
				properties.put("mail.smtp.host", "smtp.gmail.com");
				properties.put("mail.smtp.auth","true");
				properties.put("mail.smtp.port","587");
				
				Authenticator auth= new GoogleAuthentication();
				//GoolgleAuth~->Authen~ �긽�냽 諛쏆븘�꽌 �뾽罹먯뒪�똿?(遺�紐� �씤�뜳�뒪�뿉 �옄�떇媛앹껜)
				
				Session session =Session.getDefaultInstance(properties, auth);
				Message message = new MimeMessage(session);
				Address senderAd = new InternetAddress(sender);
				Address receiverAd= new InternetAddress(email);
				
				message.setHeader("content-type", "text/html;charset=UTF-8");
				message.setFrom(senderAd);
				message.addRecipient(RecipientType.TO,receiverAd);
				message.setSubject(subject);
				message.setContent(content,"text/html;charset=UTF-8");
				message.setSentDate(new Date());
				Transport.send(message);
				result=true;
				
			} catch (Exception e) {
				result=false;
				System.out.println("Error in sendEmail()");
				e.printStackTrace();
			}finally {
				resourceClose();
			}
			return result;
		}
		public int pwdUpdate(String email,String userpassword){
			System.out.println(userpassword);
			System.out.println(email);
			try {
				
					con = getConnection();
					sql="select useremail from member where useremail=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, email);
					rs=pstmt.executeQuery();
					if(rs.next()){
					
					sql = "update member set userpassword=? where useremail=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, userpassword);
					pstmt.setString(2, email);
					
					pstmt.executeUpdate();
					return 1;
					}else{
						sql = "update store set storepw=? where storeemail=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, userpassword);
						pstmt.setString(2, email);
						
						pstmt.executeUpdate();
						return 1;
						
					}
				} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}finally {
				resourceClose();
			}
		}
		public List<memberBean> AllGetMember() {
			
			List<memberBean> list = new ArrayList<memberBean>();
			
			try {
				con = getConnection();
				
				sql = "select* from member order by joindate desc";
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
				
					memberBean vo = new memberBean();
					
					vo.setUseremail(rs.getString("useremail"));
					vo.setUsername(rs.getString("username"));
					vo.setPhone(rs.getString("phone"));
					vo.setPostcode(rs.getString("postcode"));
					vo.setAddress(rs.getString("address1"));
					vo.setJoindate(rs.getTimestamp("joindate"));
					vo.setPoint(rs.getString("point"));
					vo.setMembership(rs.getString("membership"));
					vo.setVip_startdate(rs.getString("vip_startdate"));
					vo.setVip_finish(rs.getString("vip_finish"));
					
					
					list.add(vo);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				resourceClose();
			}
			
			return list;
		}
		public int registerVIP(String id) {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
			Calendar startTime = Calendar.getInstance();
			Calendar finishTime = Calendar.getInstance();
		    finishTime.add(Calendar.DATE, 31);
			String vip_start = format.format(startTime.getTime());
			String vip_finish = format.format(finishTime.getTime());
			System.out.println("시작날짜 : "+vip_start);
			System.out.println("끝날짜 : "+vip_finish);
			try {
				con = getConnection();
				sql = "update member set vip_startdate = ?, vip_finish =?, membership=? where useremail = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vip_start);
				pstmt.setString(2, vip_finish);
				pstmt.setString(3, "VIP");
				pstmt.setString(4, id);
				pstmt.executeUpdate();
				return 1;
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				resourceClose();
			}
			
			return 0;
		}
		
	//vip 만료
	public void vipFinish(String email) {
		
		try {
			con = getConnection();
			String sql = "update member set membership = 'basic', vip_startdate = '0',vip_finish = '0' where useremail = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
