package com.bob.proj.api;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import org.springframework.stereotype.Controller;


@Controller
public class SMTPAuthenticator extends Authenticator {
	
	 @Override
	    protected PasswordAuthentication getPasswordAuthentication() {
	        return new PasswordAuthentication("ghdwns9a3@gmail.com","ghdwn@");
	    }
}
