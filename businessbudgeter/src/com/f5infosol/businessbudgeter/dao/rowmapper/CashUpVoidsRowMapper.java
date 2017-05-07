package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashUpVoids;

public class CashUpVoidsRowMapper implements ParameterizedRowMapper<CashUpVoids>{

	@Override
	public CashUpVoids mapRow(ResultSet rs, int index) throws SQLException {
		CashUpVoids cashUpVoid = new CashUpVoids();
		try {
			cashUpVoid.setCashUpVoidsId(rs.getInt("cashup_voids_id"));
			cashUpVoid.setStaffId(rs.getInt("staff_id"));
			cashUpVoid.setStaffName(rs.getString("staff_name"));
			cashUpVoid.setServiceId(rs.getInt("service_id"));
			cashUpVoid.setAmount(rs.getDouble("amount"));
			cashUpVoid.setTime(rs.getString("time"));
			cashUpVoid.setReason(rs.getString("reason"));
			cashUpVoid.setUpdatedOn(rs.getDate("updated_on"));
			cashUpVoid.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cashUpVoid;
	}

}
