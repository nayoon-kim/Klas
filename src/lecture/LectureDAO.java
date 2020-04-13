package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DatabaseUtil;

public class LectureDAO {

	private Connection conn;   //데이터베이스에 접근하기 위한 객체
	private PreparedStatement pstmt;  
	private ResultSet rs;   //정보를 담을 수 있는 변수를 생성
	
	public LectureDAO() {
		try {
	        //생성자
	        /*String dbURL="jdbc:mysql://localhost:3306/tempdb?serverTimezone=UTC";                             
	        String dbID="root";
	        String dbPassword="system";
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        conn= DriverManager.getConnection(dbURL,dbID,dbPassword);*/
			conn = DatabaseUtil.getConnection();
	    }
	     catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<String> Title(String sectionID){
		ArrayList<String> lec_list = new ArrayList<String>();
    	String SQL= "select Title from Lecture where Secid = ? ";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1, sectionID);
    		 rs = pstmt.executeQuery();
    		 while(rs.next()) {
    			 lec_list.add(rs.getString("Title"));
    		 }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return lec_list;
	}
	
	public ArrayList<String> UpDate(String sectionID){
		ArrayList<String> lec_list = new ArrayList<String>();
    	String SQL= "select _update from Lecture where Secid = ? ";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1,  sectionID);
    		 rs = pstmt.executeQuery();
    		 while(rs.next()) {
    			 lec_list.add(rs.getString("_update"));
    		 }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return lec_list;
	}
	
	public String Content(int _upno){
		String content = new String();
    	String SQL= "select content from Lecture where _upno = ? ";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1,  _upno);
    		 rs = pstmt.executeQuery();
    		 if(rs.next()) {
    			 content = rs.getString("content");
    		 }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return content;
	}
	
	public String Title(int _upno) {
		String title = new String();
    	String SQL= "select Title from Lecture where _upno = ? ";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1,  _upno);
    		 rs = pstmt.executeQuery();
    		 if(rs.next()) {
    			 title = rs.getString("Title");
    		 }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return title;
	}
	
	public ArrayList<String> UpNo(String sectionID){
		ArrayList<String> lec_list = new ArrayList<String>();
    	String SQL= "select _upno from Lecture where Secid = ? ";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1,  sectionID);
    		 rs = pstmt.executeQuery();
    		 while(rs.next()) {
    			 lec_list.add(rs.getString("_upno"));
    		 }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return lec_list;
	}
	
	public ArrayList<String> View(String sectionID){
		ArrayList<String> view_list = new ArrayList<String>();
    	String SQL= "select _view from Lecture where Secid = ? ";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1,  sectionID);
    		 rs = pstmt.executeQuery();
    		 while(rs.next()) {
    			 view_list.add(rs.getString("_view"));
    		 }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return view_list;
	}
	
	public String CUrl(int _upno) {
		String curl = new String();
    	String SQL= "select CUrl from Lecture where _upno = ? ";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1, _upno);
    		 rs = pstmt.executeQuery();
    		 if(rs.next()) {
    			 curl = rs.getString("CUrl");
    		 }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return curl;
	}
	
	public String CFName(int _upno) {
		String cfname = new String();
    	String SQL= "select CFName from lecture where _upno = ? ";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1,  _upno);
    		 rs = pstmt.executeQuery();
    		 if(rs.next()) {
    			 cfname = rs.getString("CFName");
    		 }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return cfname;
	}

	public int upload(String sectionID,String title,String cfname, String curl, String content,String view) {
		String SQL="INSERT INTO lecture(Title, _update, _view, content,CUrl, CFName, Secid) VALUES(?,?,?,?,?,?,?)";
		//TITLE, UPDATE, VIEW, UPNO, CURL, CFNAME, sectionID
		PreparedStatement pstmt = null; 
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, (new java.util.Date()).toLocaleString());
			pstmt.setString(3, view);
			pstmt.setString(4, content);
			pstmt.setString(5, curl);
			pstmt.setString(6, cfname);
			pstmt.setString(7, sectionID);
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return -1;
	}

}
