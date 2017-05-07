package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.Users;

public class UsersRowMapper implements ParameterizedRowMapper<Users>{

	@Override
	public Users mapRow(ResultSet rs, int index) throws SQLException {
		Users user = new Users();
		try {
			user.setUserId(rs.getInt("user_id"));
			user.setCompanyId(rs.getInt("company_id"));
			user.setUserName(rs.getString("user_name"));
			user.setCompanyName(rs.getString("company_name"));
			user.setUpdatedOn(rs.getDate("updated_on"));
			user.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}

}
