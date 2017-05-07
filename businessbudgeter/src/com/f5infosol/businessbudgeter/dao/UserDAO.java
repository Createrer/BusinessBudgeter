/**
 * 
 */
package com.f5infosol.businessbudgeter.dao;

import java.util.List;
import com.f5infosol.businessbudgeter.domain.User;

/**
 * @author dinesh.bhavsar
 * 
 */
public interface UserDAO {

	List<User> getUserDetails();

	User getUserDetails(String username, String email);

	boolean resetPassword(String username, String confirm_password);

}