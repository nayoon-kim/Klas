package takes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class TakesDAO {
	private Connection conn;   //데이터베이스에 접근하기 위한 객체
    private PreparedStatement pstmt;  
    private ResultSet rs;   //정보를 담을 수 있는 변수를 생성
    
    public TakesDAO() {
        try {
            //생성자
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
