/*package mail;

import java.net.Authenticator;
import java.util.Properties;
import mail.SMTPAuthenticator;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SMail {
	
	public void SMail(String to, String content) {
		
		String from = "na4777@naver.com";
		String subject = "안녕하세요 BOBJO입니다.";
		
		Properties p = new Properties(); // 정보를 담을 객체
		
		p.put("mail.smtp.host", "smtp.naver.com"); //네이버 SMTP
		
		p.put("mail.smtp.prot", "465");	
		p.put("mail.smtp.starttle.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		//SMTP 서버에 접속하기 위한 정보들
		
		try {
		    Authenticator auth = new SMTPAuthenticator();
		    Session ses = Session.getInstance(p, auth);
			
			ses.setDebug(true);
			
			MimeMessage msg = new MimeMessage(ses); //메일의 내용을 담을 객체
			msg.setSubject(subject);//제목
			
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);//보내는 사람
			
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
			
			msg.setContent(content,"text/html;charset=UTF-8"); // 내용과 인코딩
			
			Transport.send(msg);//전송
			
		}catch(Exception e) {
			e.printStackTrace();
			
			 return;
		}
	}

}
*/