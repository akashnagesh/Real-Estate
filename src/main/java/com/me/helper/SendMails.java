package com.me.helper;

import com.me.controller.MailMail;

public class SendMails {
	
	static MailMail mailMail = new MailMail();
	
	public static void sendSellerMail(String email)
	{
		mailMail.sendMail("akashnagesh25@gmail.com",email, "User account has been created!",
				"Hello, \n\n Your user account has been created and you will "
						+ "be able to login once the account is activated by the admin.\n\n Regards,\n Team Perfect Property");;
	}
	
	public static void sendBuyerEmail(String email)
	{
		mailMail.sendMail("akashnagesh25@gmail.com", email, "User account has been created!",
				"Hello, \n\n Your user account has been created. Please "
						+ "login to continue browsing.\n\n Regards,\n Team Perfect Property");
	}

}
