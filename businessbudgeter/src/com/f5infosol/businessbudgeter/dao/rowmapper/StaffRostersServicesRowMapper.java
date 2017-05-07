package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.StaffRostersServices;

public class StaffRostersServicesRowMapper implements ParameterizedRowMapper<StaffRostersServices>{

	@Override
	public StaffRostersServices mapRow(ResultSet rs, int index) throws SQLException {
		StaffRostersServices staffRosterService = new StaffRostersServices();
		try {
			try {
				staffRosterService.setStaffRosterServiceId(rs.getInt("satff_roster_service_id"));
				staffRosterService.setStaffRosterId(rs.getInt("satff_roster_id"));
				staffRosterService.setServiceId(rs.getInt("service_id"));
				staffRosterService.setStaffId(rs.getInt("staff_id"));
				staffRosterService.setNoOfHours(rs.getDouble("no_of_hours"));
				staffRosterService.setUpdatedOn(rs.getDate("updated_on"));
				staffRosterService.setUpdatedBy(rs.getString("updated_by"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			staffRosterService.setStaffName(rs.getString("staff_name"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return staffRosterService;
	}

}
