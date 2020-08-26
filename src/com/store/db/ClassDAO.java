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
	
	
	public int beginnerCount() {
		
		int cnt = 0;
		
		try {
			con = getConnection();
			
			String sql = "select count(*) from class "
					+ "where level = 'easy'";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			resourceClose();
		}
		
		return cnt;
	}
	
	
	
	// 클래스 list 메서드 
	public Vector<ClassBean> getAllClassList(int startRow, int endRow) {
		
		Vector<ClassBean> v = new Vector<ClassBean>();
		
		ClassBean cbean = null;
		
		try {
			con = getConnection();
			
			// level 중 하(easy)를 가져옴 
			String sql = "select storenum, class_registrynum, class_name, category, level, thumbnail "
					+ "from class "
					+ "where level = 'easy' limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
			
			cbean = new ClassBean();
			cbean.setStorenum(rs.getInt("storenum"));
			cbean.setClass_registrynum(rs.getInt("class_registrynum"));
			cbean.setClass_name(rs.getString("class_name"));
			cbean.setCategory(rs.getString("category"));
			cbean.setLevel(rs.getString("level"));
			cbean.setThumbnail(rs.getString("thumbnail"));
			
			// vector에 classbean 객체 저장 
			v.add(cbean);
		}
		
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			resourceClose();
		}
		return v;
	}

	public int popularCount(){
		int count=0;
		try{
			con=getConnection();
			String sql= "select count(*) from class";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return count;
	}//popularCount 硫붿냼�뱶 �걹
	
	public ArrayList <ClassBean> popularList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		try{
			con= getConnection();
			String sql = "select class_registrynum,thumbnail,category,class_name from class order by reservation_count desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ClassBean cbean = new ClassBean();
				cbean.setClass_registrynum(rs.getInt("class_registrynum"));
				cbean.setThumbnail(rs.getString("thumbnail"));
				cbean.setCategory(rs.getString("category"));
				cbean.setClass_name(rs.getString("class_name"));
				
				list.add(cbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		
		return list;
	
	}//popularList 硫붿냼�뱶 �걹
	
	public ArrayList<ClassBean> diffuserClassList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		//하나의 레코드를 저장할 객체 선언
		ClassBean bean =null;
		try{
			//커넥션 메소드 호출하여 DB연결객체 하나 얻기
			con=getConnection();
			//쿼리준비 : 전체 차량 레코드 검색
			String sql="select class_registrynum,thumbnail,category,class_name from class where category='디퓨저'";
			//쿼리를 실행할 수 있는 객체 선언
			pstmt=con.prepareStatement(sql);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			//반복문을 돌면서 빈 클래스에 컬럼데이터를 저장
			while(rs.next()){
				bean=new ClassBean();
				bean.setClass_registrynum(rs.getInt("class_registrynum"));
				bean.setThumbnail(rs.getString("thumbnail"));
				bean.setCategory(rs.getString("category"));
				bean.setClass_name(rs.getString("class_name"));
				list.add(bean);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return list;
	}//diffuserClassList()메소드 끝
	
	public ArrayList<ClassBean> candleClassList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		//하나의 레코드를 저장할 객체 선언
		ClassBean bean =null;
		try{
			//커넥션 메소드 호출하여 DB연결객체 하나 얻기
			con=getConnection();
			//쿼리준비 : 전체 차량 레코드 검색
			String sql="select class_registrynum,thumbnail,category,class_name from class where category='캔들'";
			//쿼리를 실행할 수 있는 객체 선언
			pstmt=con.prepareStatement(sql);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			//반복문을 돌면서 빈 클래스에 컬럼데이터를 저장
			while(rs.next()){
				bean=new ClassBean();
				bean.setClass_registrynum(rs.getInt("class_registrynum"));
				bean.setThumbnail(rs.getString("thumbnail"));
				bean.setCategory(rs.getString("category"));
				bean.setClass_name(rs.getString("class_name"));
				list.add(bean);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return list;
	}//candleClassList()메소드 끝
	
	public ArrayList<ClassBean> cookingClassList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		//하나의 레코드를 저장할 객체 선언
		ClassBean bean =null;
		try{
			//커넥션 메소드 호출하여 DB연결객체 하나 얻기
			con=getConnection();
			//쿼리준비 : 전체 차량 레코드 검색
			String sql="select class_registrynum,thumbnail,category,class_name from class where category='요리'";
			//쿼리를 실행할 수 있는 객체 선언
			pstmt=con.prepareStatement(sql);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			//반복문을 돌면서 빈 클래스에 컬럼데이터를 저장
			while(rs.next()){
				bean=new ClassBean();
				bean.setClass_registrynum(rs.getInt("class_registrynum"));
				bean.setThumbnail(rs.getString("thumbnail"));
				bean.setCategory(rs.getString("category"));
				bean.setClass_name(rs.getString("class_name"));
				list.add(bean);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return list;
	}//cookingClassList()메소드 끝
	
	public ArrayList<ClassBean> bakingClassList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		//하나의 레코드를 저장할 객체 선언
		ClassBean bean =null;
		try{
			//커넥션 메소드 호출하여 DB연결객체 하나 얻기
			con=getConnection();
			//쿼리준비 : 전체 차량 레코드 검색
			String sql="select class_registrynum,thumbnail,category,class_name from class where category='베이킹'";
			//쿼리를 실행할 수 있는 객체 선언
			pstmt=con.prepareStatement(sql);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			//반복문을 돌면서 빈 클래스에 컬럼데이터를 저장
			while(rs.next()){
				bean=new ClassBean();
				bean.setClass_registrynum(rs.getInt("class_registrynum"));
				bean.setThumbnail(rs.getString("thumbnail"));
				bean.setCategory(rs.getString("category"));
				bean.setClass_name(rs.getString("class_name"));
				list.add(bean);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return list;
	}//bakingClassList()메소드 끝
	
	public ArrayList<ClassBean> potteryClassList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		//하나의 레코드를 저장할 객체 선언
		ClassBean bean =null;
		try{
			//커넥션 메소드 호출하여 DB연결객체 하나 얻기
			con=getConnection();
			//쿼리준비 : 전체 차량 레코드 검색
			String sql="select class_registrynum,thumbnail,category,class_name from class where category='도자기'";
			//쿼리를 실행할 수 있는 객체 선언
			pstmt=con.prepareStatement(sql);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			//반복문을 돌면서 빈 클래스에 컬럼데이터를 저장
			while(rs.next()){
				bean=new ClassBean();
				bean.setClass_registrynum(rs.getInt("class_registrynum"));
				bean.setThumbnail(rs.getString("thumbnail"));
				bean.setCategory(rs.getString("category"));
				bean.setClass_name(rs.getString("class_name"));
				list.add(bean);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return list;
	}//potteryClassList()메소드 끝
	
	public ArrayList<ClassBean> perfumeClassList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		//하나의 레코드를 저장할 객체 선언
		ClassBean bean =null;
		try{
			//커넥션 메소드 호출하여 DB연결객체 하나 얻기
			con=getConnection();
			//쿼리준비 : 전체 차량 레코드 검색
			String sql="select class_registrynum,thumbnail,category,class_name from class where category='향수'";
			//쿼리를 실행할 수 있는 객체 선언
			pstmt=con.prepareStatement(sql);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			//반복문을 돌면서 빈 클래스에 컬럼데이터를 저장
			while(rs.next()){
				bean=new ClassBean();
				bean.setClass_registrynum(rs.getInt("class_registrynum"));
				bean.setThumbnail(rs.getString("thumbnail"));
				bean.setCategory(rs.getString("category"));
				bean.setClass_name(rs.getString("class_name"));
				list.add(bean);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return list;
	}//perfumeClassList()메소드 끝
	
	public ArrayList<ClassBean> soapClassList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		//하나의 레코드를 저장할 객체 선언
		ClassBean bean =null;
		try{
			//커넥션 메소드 호출하여 DB연결객체 하나 얻기
			con=getConnection();
			//쿼리준비 : 전체 차량 레코드 검색
			String sql="select class_registrynum,thumbnail,category,class_name from class where category='비누'";
			//쿼리를 실행할 수 있는 객체 선언
			pstmt=con.prepareStatement(sql);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			//반복문을 돌면서 빈 클래스에 컬럼데이터를 저장
			while(rs.next()){
				bean=new ClassBean();
				bean.setClass_registrynum(rs.getInt("class_registrynum"));
				bean.setThumbnail(rs.getString("thumbnail"));
				bean.setCategory(rs.getString("category"));
				bean.setClass_name(rs.getString("class_name"));
				list.add(bean);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			resourceClose();
		}
		return list;
	}//soapClassList()메소드 끝
	
	
	
}