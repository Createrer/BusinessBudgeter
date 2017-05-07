package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.Roster;

public class RosterRowMapper implements ParameterizedRowMapper<Roster>{

	@Override
	public Roster mapRow(ResultSet rs, int index) throws SQLException {
		
		Roster roster = new Roster();
		try {
				roster.setRosterId(rs.getInt("roster_id"));
				roster.setShiftId(rs.getInt("shift_id"));
				roster.setStaffId(rs.getInt("staff_id"));
				roster.setIncomeCenterId(rs.getInt("income_center_id"));
				roster.setServiceId(rs.getInt("service_id"));
				roster.setEventId(rs.getInt("event_id"));
				
				try {
					roster.setShiftName(rs.getString("shift_name"));
					roster.setStaffName(rs.getString("staff_name"));
					roster.setServiceName(rs.getString("service_name"));
					roster.setEventName(rs.getString("event_name"));
				} catch (Exception e) {
					//e.printStackTrace();
				}
				
				roster.setRosterDate(rs.getDate("roster_date"));
				roster.setStartTime(rs.getString("start_time"));
				roster.setFinishTime(rs.getString("finish_time"));
				roster.setTotalHours(rs.getDouble("total_hours"));
				roster.setUpdatedOn(rs.getDate("updated_on"));
				roster.setUpdatedBy(rs.getString("updated_by"));
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return roster;
	}

}
