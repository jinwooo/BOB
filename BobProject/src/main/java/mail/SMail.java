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
		String subject = "�ȳ��ϼ��� BOBJO�Դϴ�.";
		
		Properties p = new Properties(); // ������ ���� ��ü
		
		p.put("mail.smtp.host", "smtp.naver.com"); //���̹� SMTP
		
		p.put("mail.smtp.prot", "465");	
		p.put("mail.smtp.starttle.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		//SMTP ������ �����ϱ� ���� ������
		
		try {
		    Authenticator auth = new SMTPAuthenticator();
		    Session ses = Session.getInstance(p, auth);
			
			ses.setDebug(true);
			
			MimeMessage msg = new MimeMessage(ses); //������ ������ ���� ��ü
			msg.setSubject(subject);//����
			
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);//������ ���
			
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // �޴� ���
			
			msg.setContent(content,"text/html;charset=UTF-8"); // ����� ���ڵ�
			
			Transport.send(msg);//����
			
		}catch(Exception e) {
			e.printStackTrace();
			
			 return;
		}
	}

}
*/