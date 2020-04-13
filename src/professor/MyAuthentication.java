package professor;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator{
	PasswordAuthentication pa;
	public MyAuthentication(String id, String password) {
		pa = new PasswordAuthentication(id, password); 
	}
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}	

}
