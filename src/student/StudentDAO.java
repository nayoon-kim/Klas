package student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

	
	public class StudentDAO {
		public int login(String userID, String userPassword)
		{
			String SQL = "SELECT password FROM STUDENT WHERE studentID = ?";
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
		
		  public String get_email(String studentID) {
	          String SQL= "select email from student where studentID = ? ";
	          Connection conn = null;
	          PreparedStatement pstmt = null;
	          ResultSet rs = null;	//sql�� ������� ó���� �� ����Ѵ�
	          String email = null;
	           try {
	        	   conn = DatabaseUtil.getConnection();
	               pstmt = conn.prepareStatement(SQL);
	               pstmt.setString(1, studentID);
	               rs = pstmt.executeQuery();
	               if (rs.next()) {
	               email = rs.getString("email");
	            } 

	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         return email; // �����ͺ��̽� ������ �ǹ�
	    }
		  
		  public String get_phone(String studentID) {
	          String SQL= "select phonenumber from student where studentID = ? ";
	          Connection conn = null;
	          PreparedStatement pstmt = null;
	          ResultSet rs = null;	//sql�� ������� ó���� �� ����Ѵ�
	          String email = null;
	           try {
	        	   conn = DatabaseUtil.getConnection();
	               pstmt = conn.prepareStatement(SQL);
	               pstmt.setString(1, studentID);
	               rs = pstmt.executeQuery();
	               if (rs.next()) {
	               email = rs.getString("phonenumber");
	            } 

	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         return email; // �����ͺ��̽� ������ �ǹ�
	    }
		
	}

