package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.RosterEvent;

public class RosterEventRowMapper implements ParameterizedRowMapper<RosterEvent>{

	@Override
	public RosterEvent mapRow(ResultSet rs, int index) throws SQLException {
		
		RosterEvent rosterEvent = new RosterEvent();
		
		try {
			
			rosterEvent.setRosterEventId(rs.getInt("roster_event_id"));
			rosterEvent.setEventId(rs.getInt("event_id"));
			rosterEvent.setEventName(rs.getString("event_name"));
			rosterEvent.setTotalActual(rs.getDouble("total_actual"));
			rosterEvent.setLabourCostPct(rs.getDouble("labour_cost_pct"));
			rosterEvent.setNoOfHours(rs.getDouble("event_hours"));
			rosterEvent.setRosterEventDate(rs.getDate("roster_event_date"));
			rosterEvent.setUpdatedOn(rs.getDate("updated_on"));
			rosterEvent.setUpdatedBy(rs.getString("updated_by"));
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rosterEvent;
	}

}
