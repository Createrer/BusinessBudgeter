package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashDrawers;

public class CashDrawersRowMapper implements ParameterizedRowMapper<CashDrawers>{

	@Override
	public CashDrawers mapRow(ResultSet rs, int index) throws SQLException {
		CashDrawers cashDrawer = new CashDrawers();
		try {
			cashDrawer.setCashDrawerId(rs.getInt("cash_drawer_id"));
			cashDrawer.setUserId(rs.getInt("user_id"));
			cashDrawer.setIncomeCentreId(rs.getInt("income_centre_id"));
			cashDrawer.setTillName(rs.getString("till_name"));
			cashDrawer.setDescription(rs.getString("description"));
			cashDrawer.setUpdatedOn(rs.getDate("updated_on"));
			cashDrawer.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return cashDrawer;
	}

}
