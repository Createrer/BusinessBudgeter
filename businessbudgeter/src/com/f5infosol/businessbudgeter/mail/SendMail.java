package com.f5infosol.businessbudgeter.mail;

import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class SendMail {
	protected final static Log logger = LogFactory.getLog(SendMail.class);

	public static void main(String[] args) throws Exception {

		final String username = "businessbudgeter@gmail.com";
		final String password = "bb@123456789";

		String host = "smtp.gmail.com";

		Properties props = System.getProperties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", username);
		props.put("mail.smtp.password", password);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("dinesh94@gmail.com"));
			message.setSubject("Testing Subject");

			BodyPart body = new MimeBodyPart();

			// freemarker stuff.
			Configuration cfg = new Configuration();
			Template template = cfg.getTemplate("html-mail-template.ftl");
			Map<String, String> rootMap = new HashMap<String, String>();
			rootMap.put("to", "Dinesh Bhavsar");
			rootMap.put("body", "Sample html email using freemarker");
			rootMap.put("startEndTime", "555");
			rootMap.put("service", "115");

			rootMap.put("from", "Vijaya.");
			Writer out = new StringWriter();
			template.process(rootMap, out);
			// freemarker stuff ends.

			/* you can add html tags in your text to decorate it. */
			body.setContent(out.toString(), "text/html");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(body);

			/*
			 * body = new MimeBodyPart();
			 * 
			 * String filename = "hello.txt"; DataSource source = new
			 * FileDataSource(filename); body.setDataHandler(new
			 * DataHandler(source)); body.setFileName(filename);
			 * multipart.addBodyPart(body);
			 */

			message.setContent(multipart, "text/html");

			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}

		logger.info("Done....");
	}
}