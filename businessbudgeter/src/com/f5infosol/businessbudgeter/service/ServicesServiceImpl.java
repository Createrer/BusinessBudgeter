package com.f5infosol.businessbudgeter.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.f5infosol.businessbudgeter.dao.ServiceDAO;
import com.f5infosol.businessbudgeter.domain.Services;

@Service
public class ServicesServiceImpl implements ServicesService {

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource 
	ServiceDAO objDao;
	
	@Override
	public List<Services> getServices() {
		return objDao.getServices();
	}
	
	
}
