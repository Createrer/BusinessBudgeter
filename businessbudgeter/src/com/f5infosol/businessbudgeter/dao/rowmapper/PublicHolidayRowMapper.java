package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.PublicHoliday;

public class PublicHolidayRowMapper implements ParameterizedRowMapper<PublicHoliday>{

	@Override
	public PublicHoliday mapRow(ResultSet rs, int index) throws SQLException {
		PublicHoliday holiday = new PublicHoliday();
		try {
			holiday.setHolidayId(rs.getInt("holiday_id"));
			holiday.setHolidayDate(rs.getDate("holiday_date"));
			holiday.setUpdatedOn(rs.getDate("updated_on"));
			holiday.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return holiday;
	}

}
