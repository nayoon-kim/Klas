package section;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DatabaseUtil;

	public class SectionDAO{
		public List<SectionDTO> getSection(){
			String SQL = "SELECT Secid, coursename, _time FROM section, courses WHERE section.Cid = courses.coursenum;";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;	
			
			List<SectionDTO> sections = new ArrayList<SectionDTO>();
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				
				SectionDTO section = null;
				while(rs.next()) {
					section = new SectionDTO();
					
					section.setSecid(rs.getString("Secid"));
					section.setCoursename(rs.getString("coursename"));
					section.setSchedule(rs.getString("_time"));
			
					sections.add(section);
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}finally {
				try {if(conn != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				try {if(pstmt != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				try {if(rs != null)conn.close();} catch(Exception e) {e.printStackTrace();}
			}
			
			return sections;
		}
		
		public int enroll(String sid, String secid) {
			String SQL = "INSERT INTO takes VALUES (?, ?);";
			Connection conn = null;
			PreparedStatement pstmt = null;
			int result = 0;
			//ResultSet rs = null;	
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, secid);
				pstmt.setString(2, sid);
				result = pstmt.executeUpdate();
				if(result != 0)//반영됨
					return 1;
				else
					return 0;	//반영되지 않음
				
			}catch(Exception e)
			{
				e.printStackTrace();
			}finally {
				try {if(conn != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				try {if(pstmt != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				//try {if(rs != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				
			}
			return -1; 	//데이터베이스 오류
		}
		
		public int cancel(String sid, String secid)
		{
			String SQL = "DELETE FROM takes WHERE studentID = ? and sectionID = ?  ;";
			Connection conn = null;
			PreparedStatement pstmt = null;
			int result = 0;
			//ResultSet rs = null;	
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, sid);
				pstmt.setString(2, secid);
				result = pstmt.executeUpdate();
				if(result != 0)//반영됨
					return 1;
				else
					return 0;	//반영되지 않음
				
			}catch(Exception e)
			{
				e.printStackTrace();
			}finally {
				try {if(conn != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				try {if(pstmt != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				//try {if(rs != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				
			}
			return -1; 	//데이터베이스 오류
		}
		
		public List<SectionDTO> s_getSection(String userID)
		{
			String SQL ="SELECT section.Secid, courses.coursename, section.Year, section.Bldg, section._time  FROM section, takes, courses WHERE section.Secid = takes.sectionID and section.Cid = courses.coursenum and takes.studentID = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;	
			
			List<SectionDTO> sections = new ArrayList<SectionDTO>();
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,  userID);
				rs = pstmt.executeQuery();
				
				SectionDTO section = null;
				while(rs.next()) {
					section = new SectionDTO();
					
					section.setSecid(rs.getString("Secid"));
					section.setCoursename(rs.getString("coursename"));
					section.setYear(rs.getString("Year"));
					section.setBuilding(rs.getString("Bldg"));
					section.setSchedule(rs.getString("_time"));
			
					sections.add(section);
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}finally {
				try {if(conn != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				try {if(pstmt != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				try {if(rs != null)conn.close();} catch(Exception e) {e.printStackTrace();}
			}
			
			return sections;
			
		}
		
		public List<SectionDTO> p_getSection(String userID)
		{
			String SQL ="SELECT Secid, coursename, section.Year, section.Bldg, section._time  FROM section, professor, courses WHERE professor.professorID = section.Pid and courses.coursenum = section.Cid and professor.professorID = ? ;";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;	
			
			List<SectionDTO> sections = new ArrayList<SectionDTO>();
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,  userID);
				rs = pstmt.executeQuery();
				
				SectionDTO section = null;
				while(rs.next()) {
					section = new SectionDTO();
					
					section.setSecid(rs.getString("Secid"));
					section.setCoursename(rs.getString("coursename"));
					section.setYear(rs.getString("Year"));
					section.setBuilding(rs.getString("Bldg"));
					section.setSchedule(rs.getString("_time"));
			
					sections.add(section);
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}finally {
				try {if(conn != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				try {if(pstmt != null)conn.close();} catch(Exception e) {e.printStackTrace();}
				try {if(rs != null)conn.close();} catch(Exception e) {e.printStackTrace();}
			}
			
			return sections;
			
		}
		
	    public String get_professorID(String sectionID) {
	        String professorID = new String();
	        String SQL= "select Pid from Section where Secid = ? ";
	        Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;	
	        try {
	           conn = DatabaseUtil.getConnection();
	           pstmt = conn.prepareStatement(SQL);
	           pstmt.setString(1,  sectionID);
	           rs = pstmt.executeQuery();
	            if(rs.next()) {
	               professorID = rs.getString("Pid");
	            }
	        }catch(Exception e) {
	           e.printStackTrace();
	        }
	        return professorID;
	     }
	}