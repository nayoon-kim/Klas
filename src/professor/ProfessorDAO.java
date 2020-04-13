package professor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class ProfessorDAO {

	public int login(String userID, String userPassword)
	{
		String SQL = "SELECT password FROM PROFESSOR WHERE professorID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	//sql�� ������� ó���� �� ����Ѵ�
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}
				else {
					return 0;//��й�ȣ Ʋ��
				}
			}
			return -1;//���̵� ����
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			try {if(conn != null)conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null)conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs != null)conn.close();} catch(Exception e) {e.printStackTrace();}
			
		}
		return -2;	//������ ���̽� ����
	}
	

    public ArrayList<String> info(String studentID){
    	ArrayList<String> info = new ArrayList<String>();
    	String SQL= "select name, email, department, phonenumber, grade from student where studentID = ? ";
    	Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	//sql�� ������� ó���� �� ����Ѵ�
    	try {
    		conn = DatabaseUtil.getConnection();
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1,  studentID);
    		 rs = pstmt.executeQuery();
    		 if(rs.next()) {
    			 info.add(rs.getString("name"));
    			 info.add(rs.getString("department"));
    			 info.add(rs.getString("grade"));
    			 info.add(rs.getString("email"));
    			 info.add(rs.getString("phonenumber"));
    			 
    		 }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return info;
    }

    public ArrayList<String> getInfo(String professorID){
        String SQL= "select email, password from professor where professorID = ? ";
        ArrayList<String> pro_info = new ArrayList<String>();
        Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	//sql�� ������� ó���� �� ����Ѵ�
         try {
        	 conn = DatabaseUtil.getConnection();
             pstmt = conn.prepareStatement(SQL);
             pstmt.setString(1, professorID);
             rs = pstmt.executeQuery();
             if (rs.next()) {
             pro_info.add(rs.getString("email"));
             pro_info.add(rs.getString("password"));
          } 

       } catch (Exception e) {
          e.printStackTrace();
       }
         return pro_info;
    }
	
}
