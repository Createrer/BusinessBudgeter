/*package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.Roster;
import com.f5infosol.businessbudgeter.domain.RosterDetails;

public class RosterDetailRowMapper implements ParameterizedRowMapper<Roster> {

	@Override
	public Roster mapRow(ResultSet rs, int index) throws SQLException {

		RosterDetails rosterDetails = new RosterDetails();
		try {

			try {
				rosterDetails.setRosterId(rs.getInt("roster_id"));
				roster.setShiftName(rs.getString("shift_name"));
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return roster;
	}

}
*/