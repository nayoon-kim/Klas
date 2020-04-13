package takes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class TakesDAO {
	private Connection conn;   //�����ͺ��̽��� �����ϱ� ���� ��ü
    private PreparedStatement pstmt;  
    private ResultSet rs;   //������ ���� �� �ִ� ������ ����
    
    public TakesDAO() {
        try {
            //������
            /*String dbURL="jdbc:mysql://localhost:3306/tempdb?serverTimezone=UTC";                             
            String dbID="root";
            String dbPassword="system";
            
            Class.forName("com.mysql.jdbc.Driver");*/
            conn= DatabaseUtil.getConnection();
        }
         catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public ArrayList<String> user_list(String sectionID){
    	ArrayList<String> userList = new ArrayList<String>();
    	String SQL= "select studentID from Takes where sectionID = ? ";
 	   try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, sectionID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
					userList.add(rs.getString(1));
				}
			} catch (Exception e) {
			e.printStackTrace();
		}
 	return userList;
    }

}
