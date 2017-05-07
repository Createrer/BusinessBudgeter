package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.RosterShift;

public class RosterShiftRowMapper implements ParameterizedRowMapper<RosterShift> {

	@Override
	public RosterShift mapRow(ResultSet rs, int index) throws SQLException {

		RosterShift rosterShift = new RosterShift();
		try {
			rosterShift.setShiftId(rs.getInt("shift_id"));
			rosterShift.setShiftName(rs.getString("shift_name"));
			rosterShift.setStartTime(rs.getString("start_time"));
			rosterShift.setFinishTime(rs.getString("finish_time"));
			rosterShift.setDescription(rs.getString("description"));
			rosterShift.setUpdatedOn(rs.getDate("updated_on"));
			rosterShift.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rosterShift;
	}
}
