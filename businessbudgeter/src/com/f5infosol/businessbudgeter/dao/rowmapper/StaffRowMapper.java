package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.Staff;

public class StaffRowMapper implements ParameterizedRowMapper<Staff>{

	@Override
	public Staff mapRow(ResultSet rs, int index) throws SQLException {
		Staff staff = new Staff();
		try {
			staff.setStaffId(rs.getInt("staff_id"));
			staff.setCompanyId(rs.getInt("company_id"));
			staff.setSatffName(rs.getString("staff_name"));
			staff.setPosition(rs.getString("position"));
			staff.setLevel(rs.getInt("level"));
			staff.setWeekDayRate(rs.getDouble("week_day_rate"));
			staff.setSaturdayDayRate(rs.getDouble("saturday_day_rate"));
			staff.setSundayDayRate(rs.getDouble("sunday_day_rate"));
			staff.setPublicHolidayDayRate(rs.getDouble("public_holiday_day_rate"));
			staff.setOtherRate(rs.getDouble("other_rate"));
			staff.setEmployeeStatus(rs.getString("employee_status"));
			staff.setAgency(rs.getString("agency"));
			staff.setUpdatedOn(rs.getDate("updated_on"));
			staff.setUpdatedBy(rs.getString("updated_by"));
			staff.setAddress(rs.getString("address"));
			staff.setEmailID(rs.getString("emailid"));
			staff.setCellNo(rs.getLong("cellno"));
			staff.setPostalCode(rs.getString("postal_code"));
			
			staff.setSettingAccess(rs.getBoolean("setting"));
			staff.setRosterAccess(rs.getBoolean("roster"));
			staff.setCashupAccess(rs.getBoolean("cashup"));
			staff.setReportAccess(rs.getBoolean("report"));
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return staff;
	}

}
