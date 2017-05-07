package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.EventStaff;

public class EventStaffRowMapper implements ParameterizedRowMapper<EventStaff>{

	@Override
	public EventStaff mapRow(ResultSet rs, int index) throws SQLException {
		EventStaff eventStaff = new EventStaff();
		try {
			eventStaff.setEventLabourId(rs.getInt("event_labour_id"));
			eventStaff.setStaffId(rs.getInt("staff_id"));
			eventStaff.setEventId(rs.getInt("event_id"));
			eventStaff.setEventHours(rs.getInt("event_hours"));
			eventStaff.setCost(rs.getInt("cost"));
			eventStaff.setUpdatedOn(rs.getDate("updated_on"));
			eventStaff.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return eventStaff;
	}

}
