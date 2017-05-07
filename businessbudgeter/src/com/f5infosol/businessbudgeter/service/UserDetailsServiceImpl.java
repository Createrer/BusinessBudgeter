package com.f5infosol.businessbudgeter.service;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.f5infosol.businessbudgeter.dao.UsersDAO;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

	@Resource
	private UsersDAO usersDao;

	@Override
	public UserDetails loadUserByUsername(String loginId) throws UsernameNotFoundException, DataAccessException {
		return usersDao.loadUserByUsername(loginId);
	}

}
