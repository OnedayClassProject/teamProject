package com.member.db;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth = new PasswordAuthentication("itwilltest123", "qweasdzxc1!");
	public PasswordAuthentication getPasswordAuthentication(){
		return this.passAuth;
	}
}
