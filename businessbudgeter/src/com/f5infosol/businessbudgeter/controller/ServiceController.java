package com.f5infosol.businessbudgeter.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.domain.User;
import com.f5infosol.businessbudgeter.service.ServicesService;

@Controller
public class ServiceController {

	@Resource
	ServicesService servicesServices;
	
	@RequestMapping(value = "/services")
	public String getCashup(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		List<Services> service = servicesServices.getServices();
		model.put("service", service);
		model.put("serviceCount", service.size());
		HttpSession session = request.getSession(true);
		
		String transactionDate = (String) session.getAttribute("serviceDate");
		model.put("transactionDate", transactionDate);
		return "/services";
	}
}
