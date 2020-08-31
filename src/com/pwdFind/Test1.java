package com.pwdFind;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.member.db.GoogleAuthentication;

public class Test1 {

	public static void main(String[] args) {
			String email="jr8988@naver.com";
			String authNum="123456";
			boolean result=false;
			String sender = "itwilltest123@gmail.com";
			String subject="Check Number for Finding PassWord";
			String content ="email : " + email+"<br>"+"Check Number : [<b>" + authNum + "</b>]";
			try {
				Properties properties = System.getProperties();
				properties.put("mail.smtp.starttls.enable", "true");
				properties.put("mail.smtp.host", "smtp.gmail.com");
				properties.put("mail.smtp.auth","true");
				properties.put("mail.smtp.port","587");
				
				Authenticator auth= new GoogleAuthentication();
				//GoolgleAuth~->Authen~ �긽�냽 諛쏆븘�꽌 �뾽罹먯뒪�똿?(遺�紐� �씤�뜳�뒪�뿉 �옄�떇媛앹껜)
				
				Session session =Session.getDefaultInstance(properties, auth);
				Message message = new MimeMessage(session);
				Address senderAd = new InternetAddress(sender);
				Address receiverAd= new InternetAddress(email);
				
				message.setHeader("content-type", "text/html;charset=UTF-8");
				message.setFrom(senderAd);
				message.addRecipient(RecipientType.TO,receiverAd);
				message.setSubject(subject);
				message.setContent(content,"text/html;charset=UTF-8");
				message.setSentDate(new Date());
				Transport.send(message);
				result=true;
				
			} catch (Exception e) {
				result=false;
				System.out.println("Error in sendEmail()");
				e.printStackTrace();
			}
		}
	

}
