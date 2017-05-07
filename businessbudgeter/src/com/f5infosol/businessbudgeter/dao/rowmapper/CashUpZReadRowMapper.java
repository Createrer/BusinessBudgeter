package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashUpZRead;

public class CashUpZReadRowMapper implements ParameterizedRowMapper<CashUpZRead>{

	@Override
	public CashUpZRead mapRow(ResultSet rs, int index) throws SQLException {
		CashUpZRead cashUpZRead = new CashUpZRead();
		try {
			cashUpZRead.setCashUpZReadId(rs.getInt("cashup_z_read_id"));
			cashUpZRead.setServiceId(rs.getInt("service_id"));
			cashUpZRead.setzRead(rs.getDouble("z_read"));
			cashUpZRead.setTotalCashZRead(rs.getInt("total_cash_z_read"));
			cashUpZRead.setUpdatedOn(rs.getDate("updated_on"));
			cashUpZRead.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cashUpZRead;
	}

}
