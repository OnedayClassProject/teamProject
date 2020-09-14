package com.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.store.db.ClassBean;

public class ReviewDAO {
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
	public int reviewWrite(ReviewBean rbean) {
		int result = 0;
		
		try {
			con = getConnection();
			sql = "insert into review(class_registrynum,storenum,company_name,class_name,useremail,reservation_date,subject,content,thumbnail,rating,reviewdate,reservationnum) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rbean.getClass_registrynum());
			pstmt.setString(2, rbean.getStorenum());
			pstmt.setString(3, rbean.getCompany_name());
			pstmt.setString(4, rbean.getClass_name());
			pstmt.setString(5, rbean.getUseremail());
			pstmt.setString(6, rbean.getReservation_date());
			pstmt.setString(7,rbean.getSubject());
			pstmt.setString(8, rbean.getContent());
			pstmt.setString(9, rbean.getThumbnail());
			pstmt.setInt(10, rbean.getRating());
			pstmt.setDate(11, rbean.getReviewdate());
			pstmt.setInt(12, rbean.getReservationnum());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return result;
	}
	public int reviewCount(int class_num) {
		
		int count = 0;
	 try {	 
		 con = getConnection();
		 String sql = "select count(*) from review where class_registrynum = ?";
		 pstmt = con.prepareStatement(sql);
		 pstmt.setInt(1, class_num);
		 rs = pstmt.executeQuery();
		 if(rs.next()) {
			 count = rs.getInt(1);
		 }
	 } catch (Exception e) {
		 e.printStackTrace();
	 } finally {
		resourceClose();
	}
		return count;
	}
public int sumRating(int class_num) {
		
		int sum = 0;
	 try {
		 con= getConnection();

		 String sql = "select sum(rating) from review where class_registrynum = ?";
		 pstmt = con.prepareStatement(sql);
		 pstmt.setInt(1, class_num);
		 rs = pstmt.executeQuery();
		 if(rs.next()) {
			 sum = rs.getInt(1);
		 }
	 } catch (Exception e) {
		 e.printStackTrace();
	 } finally {
		resourceClose();
	}
		return sum;
	}
	public void ratingUpdate(int class_num, int sum) {
		
		try {
			con=getConnection();
			String sql = "update class set rating = ? where class_registrynum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sum);
			pstmt.setInt(2, class_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
	}
	public ArrayList<ReviewBean> reviewAllList(int class_num, int startRow, int endRow) {
		ArrayList<ReviewBean> list = new ArrayList<ReviewBean>();
		//하나의 레코드를 저장할 객체 선언
		ReviewBean bean =null;
		System.out.println(class_num);
		System.out.println(startRow);
		System.out.println(endRow);
		try{
			//커넥션 메소드 호출하여 DB연결객체 하나 얻기
			con=getConnection();
			//쿼리준비 : 전체 차량 레코드 검색
			String sql="select reservationnum,reviewnum,class_registrynum,storenum,class_name,useremail,thumbnail,subject,content,reviewdate,rating,reservation_date from review where class_registrynum=? limit ?,?";
			//쿼리를 실행할 수 있는 객체 선언
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, class_num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			//반복문을 돌면서 빈 클래스에 컬럼데이터를 저장
	
			
			while(rs.next()){
				bean=new ReviewBean();
				bean.setReservationnum(rs.getInt("reservationnum"));
				bean.setReviewnum(rs.getInt("reviewnum"));
				bean.setClass_registrynum(rs.getInt("class_registrynum"));
				bean.setStorenum(rs.getString("storenum"));
				bean.setClass_name(rs.getString("class_name"));
				bean.setUseremail(rs.getString("useremail"));
				bean.setThumbnail(rs.getString("thumbnail"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setReviewdate(rs.getDate("reviewdate"));
				bean.setRating(rs.getInt("rating"));
				bean.setReservation_date(rs.getString("reservation_date"));
				list.add(bean);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return list;
	}
	
	//예약한 클래스의 후기를 작성했는지 판단 여부
	public void reviewComplete(int reserveNum) {
		
		try {
			con = getConnection();
			String sql = "update classreservation set reviewCheck = 1 where reservationnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reserveNum);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
	}
	public int deleteReview(int class_registrynum,int reviewNum,String reviewId){
		int result=0;
		System.out.println(class_registrynum);
		System.out.println("reviewNum:"+reviewNum);
		System.out.println(reviewId);
		try {
			con = getConnection();
			
			sql = "select* from review where reviewnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reviewNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "update classreservation set reviewCheck=0 where reservationnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("reservationnum"));
				pstmt.executeUpdate();
				
			}
			
			sql = "delete from review where class_registrynum=? and reviewnum=? and useremail=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, class_registrynum);
			pstmt.setInt(2, reviewNum);
			pstmt.setString(3, reviewId);
			pstmt.executeUpdate();
			
			
			result=1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		
		return result;
	}
	public int mReviewCount(String email) {
		int count = 0;
		
		try {
			con = getConnection();
			sql ="select count(*) from review where useremail =?";
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
	public ArrayList<ReviewBean> MyReview(String email, int startRow, int endRow) {
		
		ArrayList<ReviewBean> list = new ArrayList<ReviewBean>();
		
		try {
			con = getConnection();
			sql = "select * from review where useremail =? order by reviewdate desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBean rbean = new ReviewBean();
				
				rbean.setThumbnail(rs.getString("thumbnail"));
				rbean.setClass_name(rs.getString("class_name"));
				rbean.setSubject(rs.getString("subject"));
				rbean.setRating(rs.getInt("rating"));
				rbean.setReservation_date(rs.getString("reservation_date"));
				rbean.setReviewdate(rs.getDate("reviewdate"));
				rbean.setClass_registrynum(rs.getInt("class_registrynum"));
				rbean.setReviewnum(rs.getInt("reviewnum"));
				rbean.setReservationnum(rs.getInt("reservationnum"));
				
				list.add(rbean);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return list;
	}
	
	
	
}
