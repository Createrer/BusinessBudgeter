package com.f5infosol.businessbudgeter.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.f5infosol.businessbudgeter.domain.User;
import com.f5infosol.businessbudgeter.exception.UserNotLoginException;
import com.f5infosol.businessbudgeter.service.UserService;
import com.f5infosol.businessbudgeter.util.UserUtil;

@Controller
public class LoginController {

	protected final Log logger = LogFactory.getLog(getClass());

	
	@Resource
	@SuppressWarnings("deprecation")
	private PasswordEncoder passwordEncoder;

	@Resource
	UserService loginService;

	@RequestMapping({ "/", "/login" })
	public String login(Model model, HttpServletRequest request, HttpServletResponse response) {

		ArrayList<String> errors = new ArrayList<String>();
		String url = "";
		try {
			User userObject = UserUtil.getUser();
			if (userObject != null) {
				url =  "redirect:/welcome";
			}
			else{
				url = "/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("" + e.getMessage());
			url = "/login";
		}

		if (request.getParameter("error") != null && request.getParameter("error").equals("1")) {
			if (request.getParameter("sessiontimeout") != null) {
				errors.add("* Session timeout. Please re-login.");
			} else {
				errors.add("* Please enter valid Username");
				errors.add("* Please enter valid Password");
			}
			model.addAttribute("errors", errors);
			url = "/login";
		}
		return url;
	}

	@RequestMapping(value = "/welcome")
	public String welcome(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		logger.info("START");

		User userObject = null;
		try {
			userObject = UserUtil.getUser();
			request.getSession().setAttribute("userDetails", userObject);
		} catch (UserNotLoginException e) {
			e.printStackTrace();
		}

		logger.info("result received " + userObject);

		if (userObject != null) {
			User userDetails = (User) session.getAttribute("userDetails");
			model.put("userName", userDetails);
			return "/home";
		} else {

			return "redirect:/login?error=1";
		}

	}

	@RequestMapping(value = "/change-password")
	public String changePassword(@RequestParam(value = "newPassword", required = true) String newPassword) throws IOException {

		logger.info("START");

		logger.info("LoginController.changePassword() New Password Text = " + passwordEncoder.encodePassword(newPassword, null));

		logger.info("END");

		return "/change-password";

	}

	@RequestMapping(value = "/home")
	public String getHome(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		logger.info("START");
		User userDetails = (User) session.getAttribute("userDetails");
		model.put("userName", userDetails);
		return "/home";
	}

	@RequestMapping(value = "/logout.htm")
	public String logout(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		return "redirect:/login";
	}
		 
	@RequestMapping(value = "/check_availability", method=RequestMethod.GET)
	public String getCheckAvailabilityPage(Model model, HttpServletRequest request, HttpServletResponse response) {
	 		
		List<User>  userData =  loginService.getUserDetails();
		if(userData != null)
	 	{ model.addAttribute("userData",userData);
		  return "/check_availability";			  
	 	}
		else
			return null;
	}
	
	@RequestMapping(value = "/check-availability ",method=RequestMethod.POST)
	public String checkAvailability(@ModelAttribute User user,Model model, 
		   HttpServletRequest request, HttpServletResponse response ) {
		 
		try {		
			String user_Name = user.getUserName();
			String email_Id = user.getEmailID();
			String user_name = request.getParameter("user_name");
	 		String email_id = request.getParameter("email_id");
			logger.info("User Name : "+user_name+" Mail Id : "+email_id);
			model.addAttribute("user", user);

			if (user_name != null && user_name.equalsIgnoreCase(user_Name) && email_id.equalsIgnoreCase(email_Id) && email_id != null ){
				return "redirect:/reset_old_password";	 				 
			}
		} catch (Exception e) {
			logger.info("" + e.getMessage());
		}
		
		return "/reset_old_password";
	}
    
	@RequestMapping(value = "/reset_old_password",method=RequestMethod.GET)
	public String getResetOldPassword(Model model, HttpServletRequest request, HttpServletResponse response) {
		 		
		return "/reset_old_password";
	}
	
	@RequestMapping(value = "/reset-password",method=RequestMethod.POST)
	public String resetLoginPassword(Model model, HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String confirm_pass = request.getParameter("confirm_pass");	
		
		boolean isupdated = loginService.resetPassword(username, confirm_pass);		
		return "/login";
	}
}
