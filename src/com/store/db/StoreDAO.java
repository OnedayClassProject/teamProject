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
	//로그인
	public int loginStore(String storeemail, String storepw){
		int check = 0;
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
		return check;
	}
	//회원가입
	public int insertStore(StoreBean bean) {
		int result = 0; //회원가입 성공여부
		try {
			con = getConnection();
			String sql = "select max(storenum) from store";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int num = rs.getInt(1);
			sql = "insert into store(storenum,storeemail,storepw,storename,storetel,storepostcode,storeaddress1,storeaddress2,storeaddress3,store_joindate)"
					+ "values(?,?,?,?,?,?,?,?,?,now())";
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
				return 1;
		} catch (Exception e) {
			System.out.println("insertStore()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}
		return 0;
	}
	//이메일 존재 여부 확인
	public int emailCheck(String email){
		int check = 1; //아이디가 존재하는지 확인하는 변수 0 -> 존재하는 아이디, 1 -> 존재하지 않는 아이디
		System.out.println(email);
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
	//업체계정 수정
	public int updateStore(StoreBean bean){
		int result = 0;
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
			result = pstmt.executeUpdate();
			if(result != 0)
				return 1;
		} catch (Exception e) {
			System.out.println("updateStore()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}
		return 0;
	}
	
	//업체계정 지우기
	public int deleteStore(String storeemail, String storepw){
		int result = 0; //삭제 수행했는지 확인하는 변수
		try {
			con = getConnection();
			String sql = "delete from store where storeemail =? and storepw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, storeemail);
			pstmt.setString(2, storepw);
			result = pstmt.executeUpdate();
			if(result != 0)
				return 1;
		} catch (Exception e) {
			System.out.println("deleteStore()에서 예외발생:" + e);
		}finally{
			resourceClose();
		}
		return 0;
	}
	
	//현재 로그인중인 업체계정 가지고오기
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
	
	//예약시간입력하기
	public void insetTime(TimeSaveBean bean) {
		
		try {
			con = getConnection();
			String sql = "insert into operationdate(class_registrynum,class_date,class_day,class_starttime,class_endtime) values (?,?,?,?,?)";
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
	//예약날짜가져오기
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
	//예약시간가져오기
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
	
	//클래스등록
	public int classRegistry(ClassBean cb) {
		
		try {
			con = getConnection();
			
			String sql = "insert into class(storenum,class_name,category,class_company,location,level,time,personnel,content,thumbnail,price,sale,parking,reservation_count,rating)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cb.getStorenum());
			pstmt.setString(2, cb.getClass_name());
			pstmt.setString(3, cb.getCategory());
			pstmt.setString(4, cb.getClass_company());
			pstmt.setString(5, cb.getLocation());
			pstmt.setString(6, cb.getLevel());
			pstmt.setString(7, cb.getTime());
			pstmt.setString(8, cb.getPersonnel());
			pstmt.setString(9, cb.getContent());
			pstmt.setString(10, cb.getThumbnail());
			pstmt.setString(11, cb.getPrice());
			pstmt.setString(12, cb.getSale());
			pstmt.setString(13, cb.getParking());
			pstmt.setInt(14, 0);
			pstmt.setInt(15, 0);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			resourceClose();
		}
		
		return 1;
	}
	
	//날짜저장한거 전부 삭제
	public int classCancleTimeDelete(int num) {
		try {
			con = getConnection();
			String sql = "delete from operationdate where class_registrynum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			resourceClose();
		}
		return 1;
	}
	
	//하나의 클래스 정보 가져오기
	public ClassBean getClass(int classNum) {

		ClassBean cb = new ClassBean();
		try {
			con = getConnection();
			String sql = "select * from class where class_registrynum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, classNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cb.setClass_registrynum(rs.getInt(1));
				cb.setStorenum(rs.getInt(2));
				cb.setClass_name(rs.getString(3));
				cb.setCategory(rs.getString(4));
				cb.setClass_company(rs.getString(5));
				cb.setLocation(rs.getString(6));
				cb.setLevel(rs.getString(7));
				cb.setTime(rs.getString(8));
				cb.setPersonnel(rs.getString(9));
				cb.setContent(rs.getString(10));
				cb.setThumbnail(rs.getString(11));
				cb.setPrice(rs.getString(12));
				cb.setSale(rs.getString(13));
				cb.setParking(rs.getString(14));
				cb.setReservation_count(rs.getInt(15));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
		
		return cb;
	}
	
}
