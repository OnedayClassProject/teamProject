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
	public Vector<ClassBean> beginnerList(int startRow, int endRow) {
		
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

	
	// 전라도 Count
	public int jeollaCount() {
			
		int cnt = 0;
		
		try {
			con = getConnection();
			
			String sql = "select count(*) from class "
					+ "where location LIKE '%전남%' or location LIKE '%전북%'";
			
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
	
	// 전라도 List
	public Vector<ClassBean> jeollaList(int startRow, int endRow) {

		Vector<ClassBean> v = new Vector<ClassBean>();
		
		ClassBean cbean = null;
		
		try {
			con = getConnection();
			
			// location 중 '전남','전북'을 가져옴 
			String sql = "select storenum, class_registrynum, class_name, category, level, thumbnail "
					+ "from class "
					+ "where location LIKE '%전남%' or location LIKE '%전북%' limit ?,?";
			
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
	
	
	// 충청도 Count
	public int chungcheongCount() {
				
			int cnt = 0;
			
			try {
				con = getConnection();
				
				String sql = "select count(*) from class "
						+ "where location LIKE '%충남%' or location LIKE '%충북%'";
				
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
		
	// 충청도 List
	public Vector<ClassBean> chungcheongList(int startRow, int endRow) {

		Vector<ClassBean> v = new Vector<ClassBean>();
		
		ClassBean cbean = null;
		
		try {
			con = getConnection();
			
			// location 중 '충남','충북'을 가져옴 
			String sql = "select storenum, class_registrynum, class_name, category, level, thumbnail "
					+ "from class "
					+ "where location LIKE '%충남%' or location LIKE '%충북%' limit ?,?";
			
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

	// 강원도 Count
	public int gangwonCount() {
				
			int cnt = 0;
			
			try {
				con = getConnection();
				
				String sql = "select count(*) from class "
						+ "where location LIKE '%강원%'";
				
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
			
	// 강원도 List
	public Vector<ClassBean> gangwonList(int startRow, int endRow) {

		Vector<ClassBean> v = new Vector<ClassBean>();
		
		ClassBean cbean = null;
		
		try {
			con = getConnection();
			
			// location 중 '강원'을 가져옴 
			String sql = "select storenum, class_registrynum, class_name, category, level, thumbnail "
					+ "from class "
					+ "where location LIKE '%강원%' limit ?,?";
			
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


	// 경상도 Count
	public int gyeongsangCount() {
				
			int cnt = 0;
			
			try {
				con = getConnection();
				
				String sql = "select count(*) from class "
						+ "where location LIKE '%경남%' or location LIKE '%경북%'";
				
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
			
	// 경상도 List
	public Vector<ClassBean> gyeongsangList(int startRow, int endRow) {

		Vector<ClassBean> v = new Vector<ClassBean>();
		
		ClassBean cbean = null;
		
		try {
			con = getConnection();
			
			// location 중 '경남','경북'을 가져옴 
			String sql = "select storenum, class_registrynum, class_name, category, level, thumbnail "
					+ "from class "
					+ "where location LIKE '%경남%' or location LIKE '%경북%' limit ?,?";
			
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


	// 제주도 Count
	public int jejuCount() {
				
			int cnt = 0;
			
			try {
				con = getConnection();
				
				String sql = "select count(*) from class "
						+ "where location LIKE '%제주%'";
				
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
			
	// 제주도 List
	public Vector<ClassBean> jejuList(int startRow, int endRow) {

		Vector<ClassBean> v = new Vector<ClassBean>();
		
		ClassBean cbean = null;
		
		try {
			con = getConnection();
			
			// location 중 '제주'를 가져옴 
			String sql = "select storenum, class_registrynum, class_name, category, level, thumbnail "
					+ "from class "
					+ "where location LIKE '%제주%' limit ?,?";
			
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
	


	public int seoulCount(){
		int count=0;
		try{
			con=getConnection();
			String sql= "select count(*) from class where location like '%서울%'";
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
	
	public ArrayList <ClassBean> seoulList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		try{
			con= getConnection();
			String sql = "select class_registrynum,thumbnail,category,class_name from class where location LIKE '%서울%' limit ?,?";
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
	

	public int gyunggiCount(){
		int count=0;
		try{
			con=getConnection();
			String sql= "select count(*) from class where location like '%경기%'";
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
	
	public ArrayList <ClassBean> gyunggiList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		try{
			con= getConnection();
			String sql = "select class_registrynum,thumbnail,category,class_name from class where location LIKE '%경기%' limit ?,?";
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
	

	public int busanCount(){
		int count=0;
		try{
			con=getConnection();
			String sql= "select count(*) from class where location like '%부산%'";
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
	
	public ArrayList <ClassBean> busanList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		try{
			con= getConnection();
			String sql = "select class_registrynum,thumbnail,category,class_name from class where location LIKE '%부산%' limit ?,?";
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
	
	public int daeguCount(){
		int count=0;
		try{
			con=getConnection();
			String sql= "select count(*) from class where location like '%대구%'";
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
	
	public ArrayList <ClassBean> daeguList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		try{
			con= getConnection();
			String sql = "select class_registrynum,thumbnail,category,class_name from class where location LIKE '%대구%' limit ?,?";
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
	
	
	public int daejeonCount(){
		int count=0;
		try{
			con=getConnection();
			String sql= "select count(*) from class where location like '%대전%'";
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
			

	public ArrayList<ClassBean> diffuserClassList(int startRow,int endRow){
		//리턴할 Vector 객체를 선언
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		//하나의 레코드를 저장할 객체 선언
		ClassBean bean =null;
		try{
			//커넥션 메소드 호출하여 DB연결객체 하나 얻기
			con=getConnection();
			//쿼리준비 : 전체 차량 레코드 검색
			String sql="select class_registrynum,thumbnail,category,class_name from class where=?";
			//쿼리를 실행할 수 있는 객체 선언
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "diffuser");
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


		return list;//벡터 리턴
	}//diffuserClassList()메소드 끝

	 
	public ArrayList <ClassBean> daejeonList(int startRow,int endRow){
		ArrayList<ClassBean> list = new ArrayList<ClassBean>();
		try{
			con= getConnection();
			String sql = "select class_registrynum,thumbnail,category,class_name from class where location LIKE '%서울%' limit ?,?";
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
	
}
