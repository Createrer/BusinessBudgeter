/**
 * 
 */
package com.f5infosol.businessbudgeter.dao;

import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.UserRowMapper;
import com.f5infosol.businessbudgeter.domain.User;


/**
 * @author dinesh.bhavsar
 * 
 */

@Repository("usersDao")
public class UsersDAOImpl extends BaseDAOImpl implements UsersDAO {

	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException, DataAccessException {
		User user = null;
		try {
			user = jdbcTemplate.queryForObject(Queries.GET_USER_BY_USERNAME, new Object[] { userName }, new UserRowMapper());
		} catch (EmptyResultDataAccessException e) {
			throw new UsernameNotFoundException("user '" + userName + "' not found...");
		}

		if (user == null) {
			throw new UsernameNotFoundException("user '" + userName + "' not found...");
		} else {
			return user;
		}
	}

	@Override
	public List<User> getUsersById(Set<Long> userIds) {
		return null;
	}



}
