package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashUpCash;

public class CashUpCashRowMapper implements ParameterizedRowMapper<CashUpCash>{

	@Override
	public CashUpCash mapRow(ResultSet rs, int index) throws SQLException {
		CashUpCash cashUpCash = new CashUpCash();
		try {
			/*float f1 = rs.getFloat("cash_type_name");
			float f2 = rs.getFloat("float_amount");
			float f3 = rs.getFloat("drawer_amount");
			
			logger.info("CashUpCashRowMapper.mapRow() f1"+f1+" f2"+f2+"f3"+f3);*/
			cashUpCash.setCashUpCashId(rs.getInt("cashup_cash_id"));
			cashUpCash.setCashTypeName(rs.getString("cash_type_name"));
			cashUpCash.setServiceId(rs.getInt("service_id"));
			cashUpCash.setCashDrawerId(rs.getInt("cash_drawer_id"));
			cashUpCash.setCashTypeId(rs.getInt("cash_type_id"));
			cashUpCash.setFloatAmount(rs.getDouble("float_amount"));
			cashUpCash.setDrawerAmount(rs.getDouble("drawer_amount"));
			cashUpCash.setUpdatedOn(rs.getDate("updated_on"));
			cashUpCash.setUpdatedBy(rs.getString("updated_by"));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cashUpCash;
	}

}
