package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.TemplateMaster;
import com.f5infosol.businessbudgeter.util.BusinessBudgeterUtil;

public class TemplateMasterRowMapper implements ParameterizedRowMapper<TemplateMaster>{

	@Override
	public TemplateMaster mapRow(ResultSet rs, int index) throws SQLException {
		TemplateMaster template = new TemplateMaster();
		try {
			template.setTemplateId(rs.getInt("template_id"));
			template.setTemplateName(rs.getString("templatename"));
			Date rosterDate = rs.getDate("rosterdate");
			template.setRosterDate(BusinessBudgeterUtil.convertDateToString(rosterDate));
			template.setUpdatedOn(rs.getDate("updated_on"));
			template.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return template;
	}

}
