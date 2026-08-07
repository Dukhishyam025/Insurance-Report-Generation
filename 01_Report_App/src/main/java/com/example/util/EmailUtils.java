package com.example.util;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import jakarta.mail.internet.MimeMessage;

@Component
public class EmailUtils {

	@Autowired
	private JavaMailSender mailSender;

	public boolean sendEmail(String subject, String body, String to, File f) {
		try {

			MimeMessage mimeMessage = mailSender.createMimeMessage();

			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true);

			helper.setSubject(subject);
			helper.setText(body, true);
			helper.setTo("dastudu25@gmail.com");
			helper.addAttachment("Plans-Info", f);

			mailSender.send(mimeMessage);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

}

//SimpleMessage: To send Plain emails (text format)
//MimeMessage: Emails with Attachment