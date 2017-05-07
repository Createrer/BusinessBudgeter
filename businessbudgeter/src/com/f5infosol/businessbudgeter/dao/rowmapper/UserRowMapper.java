/**
 * 
 */
package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.User;

/**
 * @author dinesh.bhavsar
 * 
 */
public class UserRowMapper implements ParameterizedRowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int index) throws SQLException {
		User user = new User();
		try {
			user.setFailedLoginsCount(rs.getInt("failedLoginsCount"));
			user.setUserId(rs.getInt("userid"));
			user.setFirstName(rs.getString("firstName"));
			user.setLastName(rs.getString("lastName"));
			user.setPassword(rs.getString("password"));			
			user.setUserName(rs.getString("username"));
			user.setValidAfter(rs.getDate("validafter"));
			user.setValidBefore(rs.getDate("validbefore"));
			try {
				user.setCellNo(rs.getLong("cellno"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			user.setEmailID(rs.getString("emailid"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
}