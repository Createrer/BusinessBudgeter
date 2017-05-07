/**
 * 
 */
package com.f5infosol.businessbudgeter.service;

import java.util.List;

import com.f5infosol.businessbudgeter.domain.User;

/**
 * @author dinesh.bhavsar
 * 
 */
public interface UserService {

	List<User> getUserDetails();

	User getUserDetails(String username, String email);
	
	boolean resetPassword(String username, String confirm_password);
}