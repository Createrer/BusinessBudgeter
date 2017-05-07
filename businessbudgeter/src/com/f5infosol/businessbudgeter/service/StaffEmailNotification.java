package com.f5infosol.businessbudgeter.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
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
import javax.servlet.ServletContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;

import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.StaffRosters;
import com.f5infosol.businessbudgeter.domain.StaffRostersServices;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

@Service
public class StaffEmailNotification implements ResourceLoaderAware, ServletContextAware {
	protected final Log logger = LogFactory.getLog(getClass());
	private Session session;

	private ServletContext servletContext;

	private Properties props;

	@Resource
	private MessageSource messageSource;

	public void send(StaffRosters staffRosters, Staff staff) {
		if (staff.getEmailID() == null) {
			return;
		}
		try {
			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(props.getProperty("mail.from")));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(staff.getEmailID()));
			message.setSubject("Staff Allocation Notification");

			BodyPart body = new MimeBodyPart();

			// freemarker stuff.
			Configuration cfg = new Configuration();
			String filePath = servletContext.getRealPath("/") + "email-templates\\html-mail-template.ftl";
			logger.info("StaffEmailNotification.send() filePath  =  " + filePath);
			Template template = cfg.getTemplate("html-mail-template.ftl");

			Map<String, String> rootMap = new HashMap<String, String>();

			rootMap.put("to", staff.getSatffName());
			rootMap.put("startEndTime", staffRosters.getStartTime() + " to " + staffRosters.getFinishTime());

			String services = "";
			for (StaffRostersServices staffRostersServices : staffRosters.getStaffRostersServices()) {
				services += staffRostersServices.getServices().getServiceName() + ", ";
			}
			if (services.length() > 3)
				services = services.substring(0, services.length() - 2);

			rootMap.put("service", services);

			Writer out = new StringWriter();
			template.process(rootMap, out);
			// freemarker stuff ends.

			/* you can add html tags in your text to decorate it. */
			body.setContent(out.toString(), "text/html");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(body);

			message.setContent(multipart, "text/html");

			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setResourceLoader(ResourceLoader resourceLoader) {
		props = new Properties();
		try {
			org.springframework.core.io.Resource resource = resourceLoader.getResource("classpath:mail.properties");

			props.load(resource.getInputStream());
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		final String username = props.getProperty("mail.smtp.user");
		final String password = props.getProperty("mail.smtp.password");
		session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
