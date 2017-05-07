package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.RosterTemplate;

public class RosterTemplateRowMapper implements ParameterizedRowMapper<RosterTemplate>{

	@Override
	public RosterTemplate mapRow(ResultSet rs, int index) throws SQLException {
		RosterTemplate rosterTemplate = new RosterTemplate();
		try {
				rosterTemplate.setRosterTemplateId(rs.getInt("roster_template_id"));
				rosterTemplate.setTemplateId(rs.getInt("template_id"));
				rosterTemplate.setStaffId(rs.getInt("staff_id"));
				rosterTemplate.setStartTime(rs.getString("start_time"));
				rosterTemplate.setFinishTime(rs.getString("finish_time"));
				rosterTemplate.setTotalHours(rs.getDouble("total_hours"));
				rosterTemplate.setPublicHoliday(rs.getBoolean("public_holiday"));
				rosterTemplate.setWorkofhouse(rs.getString("boh_foh"));
				rosterTemplate.setRole(rs.getString("role"));
				rosterTemplate.setUpdatedOn(rs.getDate("updated_on"));
				rosterTemplate.setUpdatedBy(rs.getString("updated_by"));
	} catch (Exception e) {
		// TODO: handle exception
	}
		return rosterTemplate;
	}

}
