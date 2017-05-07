package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.StaffVoid;

public class StaffVoidRowMapper implements ParameterizedRowMapper<StaffVoid>{

	@Override
	public StaffVoid mapRow(ResultSet rs, int index) throws SQLException {
		StaffVoid staffVoid = new StaffVoid();
		try {
			staffVoid.setStaffId(rs.getString("staff_id"));
			staffVoid.setSatffName(rs.getString("staff_name"));
			staffVoid.setPosition(rs.getString("position"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		return staffVoid;
	}
}
