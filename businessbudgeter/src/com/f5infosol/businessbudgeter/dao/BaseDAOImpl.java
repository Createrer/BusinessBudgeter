/*******************************************************************************
 * (C) 2013, Siemens Building Technologies, Inc.
 * 
 * 
 * *********Siemens Restricted  ************************************************
 * 
 *  @author: 
 * 
 *  @Description: 
 * 
 *  
 *  @see: src/main/java/com/siemens/rcs/dc/rest/dao/impl/BaseDAOImpl.java
 ******************************************************************************/

package com.f5infosol.businessbudgeter.dao;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.f5infosol.businessbudgeter.domain.User;

public abstract class BaseDAOImpl implements BaseDAO {

	private static Logger logger = Logger.getLogger(BaseDAOImpl.class);

	@Resource
	protected JdbcTemplate jdbcTemplate;

	public User getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			logger.info("authentication == null");
			return null;
		} else {
			if (authentication.getPrincipal() instanceof User) {
				logger.info("authentication.getPrincipal() instanceof User");
				return ((User) authentication.getPrincipal());
			}
			logger.info("authentication.getPrincipal() NOT instanceof User " + authentication.getPrincipal().toString());
			return null;
		}
	}
	
	public SqlRowSet selectResults(String _query) {
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(_query);
		return rowSet;
	}

	public int update(String query) {

		return jdbcTemplate.update(query);
	}
}



