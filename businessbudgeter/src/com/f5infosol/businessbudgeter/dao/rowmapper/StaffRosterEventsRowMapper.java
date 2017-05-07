package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.StaffRostersEvents;

public class StaffRosterEventsRowMapper implements ParameterizedRowMapper<StaffRostersEvents>{

	@Override
	public StaffRostersEvents mapRow(ResultSet rs, int index) throws SQLException {
		StaffRostersEvents staffRosterEvent = new StaffRostersEvents();
		try {
			staffRosterEvent.setStaffRosterId(rs.getInt("satff_roster_event_id"));
			staffRosterEvent.setEventId(rs.getInt("event_id"));
			staffRosterEvent.setStaffRosterId(rs.getInt("satff_roster_id"));
			staffRosterEvent.setNoOfHours(rs.getDouble("no_of_hours"));
			staffRosterEvent.setUpdatedOn(rs.getDate("updated_on"));
			staffRosterEvent.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return staffRosterEvent;
	}

}
