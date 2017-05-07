package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashTypes;

public class CashTypeRowMapper implements ParameterizedRowMapper<CashTypes>{

	@Override
	public CashTypes mapRow(ResultSet rs, int index) throws SQLException {
		CashTypes cashType = new CashTypes();
		try {
			cashType.setCashTypeId(rs.getInt("cash_type_id"));
			cashType.setCashTypeName(rs.getString("cash_type_name"));
			cashType.setUpdatedOn(rs.getDate("updated_on"));
			cashType.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cashType;
	}

}
