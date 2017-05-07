/**
 * 
 */
package com.f5infosol.businessbudgeter.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.UserRowMapper;
import com.f5infosol.businessbudgeter.domain.User;

/**
 * @author dinesh.bhavsar
 * 
 */
@Repository
public class UserDAOImpl extends BaseDAOImpl implements UserDAO {

	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	public List<User> getUserDetails() {

		List<User> userList = jdbcTemplate.query(Queries.GET_ALL_USER_DETAILS, new UserRowMapper());

		if (userList != null && userList.size() > 0) {
			return userList;
		} else {
			return null;
		}

	}

	@Override
	public User getUserDetails(String username, String email) {
		Object[] param = { username, email };
		List<User> userList = jdbcTemplate.query(Queries.GET_USER_BY_USERNAME_AND_EMAIL, param, new UserRowMapper());
		if (userList != null && userList.size() > 0) {
			return userList.get(0);
		} else {
			return null;
		}
	}

	@Override
	public boolean resetPassword(String username, String confirm_password) {
		boolean isAdded = false;
		try {
			Object[] param = { username, confirm_password };

			jdbcTemplate.update(Queries.RESET_PASSWORD, param);
			// UPDATE accessuser SET password = ? WHERE username =?
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

}