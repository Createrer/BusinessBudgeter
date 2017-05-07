package com.f5infosol.businessbudgeter.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.f5infosol.businessbudgeter.service.CashUpCreditCardService;

@Controller
public class CashUpCreditCardController {
	
	@Resource
	CashUpCreditCardService cashUpCreditCardService;
	
	@RequestMapping(value = "/cashup-creditcard")
	public String getCashupCreditCard(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		return "/cashup-creditcard";
	}
}
