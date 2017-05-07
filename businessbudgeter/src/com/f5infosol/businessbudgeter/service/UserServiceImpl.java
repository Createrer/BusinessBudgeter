/**
 * 
 */
package com.f5infosol.businessbudgeter.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.f5infosol.businessbudgeter.dao.UserDAO;
import com.f5infosol.businessbudgeter.domain.User;

/**
 * @author dinesh.bhavsar
 * 
 */
@Service
public class UserServiceImpl implements UserService {

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource
	private UserDAO objDao;

	@Override
	public List<User> getUserDetails() {
		return objDao.getUserDetails();
	}

	@Override
	public User getUserDetails(String username, String email) {
		return objDao.getUserDetails(username, email);
	}

	@Override
	public boolean resetPassword(String username, String confirm_password) {
		return objDao.resetPassword(username, confirm_password);
	}

}