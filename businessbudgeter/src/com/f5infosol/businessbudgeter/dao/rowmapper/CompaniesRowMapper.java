package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.Companies;

public class CompaniesRowMapper implements ParameterizedRowMapper<Companies>{

	@Override
	public Companies mapRow(ResultSet rs, int index) throws SQLException {
		Companies companies = new Companies();
		try {
			companies.setCompanyId(rs.getInt("company_id"));
			companies.setCompanyName(rs.getString("company_name"));
			companies.setUpdatedOn(rs.getDate("updated_on"));
			companies.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return companies;
	}

}
