package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.Roster;

public class RosterRowMapperForTrans implements ParameterizedRowMapper<Roster> {

	@Override
	public Roster mapRow(ResultSet rs, int index) throws SQLException {

		Roster roster = new Roster();
		try {

			try {
				roster.setShiftId(rs.getInt("shift_id"));
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
