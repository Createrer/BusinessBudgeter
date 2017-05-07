package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.StaffRosters;

public class StaffRosterRowMapper implements ParameterizedRowMapper<StaffRosters>{

	@Override
	public StaffRosters mapRow(ResultSet rs, int index) throws SQLException {
		StaffRosters staffRoster = new StaffRosters();
		try {
				try {
					staffRoster.setSatffRosterId(rs.getInt("satff_roster_id"));
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				staffRoster.setStaffId(rs.getInt("staff_id"));
				try {
					staffRoster.setIncomeCenterId(rs.getInt("income_center_id"));
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
				staffRoster.setStaffName(rs.getString("staff_name"));
				} catch (Exception e) {
					// TODO: handle exception
				}
				staffRoster.setRosterDate(rs.getDate("roster_date"));
				staffRoster.setStartTime(rs.getString("start_time"));
				staffRoster.setFinishTime(rs.getString("finish_time"));
				staffRoster.setTotalHours(rs.getDouble("total_hours"));
				staffRoster.setPublicHoliday(rs.getBoolean("public_holiday"));
				staffRoster.setWorkofhouse(rs.getString("boh_foh"));
				staffRoster.setRole(rs.getString("role"));
				staffRoster.setUpdatedOn(rs.getDate("updated_on"));
				staffRoster.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return staffRoster;
	}

}
