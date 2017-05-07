package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashUpPurchases;

public class CashUpPurchasesRowMapper implements ParameterizedRowMapper<CashUpPurchases>{

	@Override
	public CashUpPurchases mapRow(ResultSet rs, int index) throws SQLException {
		CashUpPurchases	cashUpPurchase = new CashUpPurchases();	
		try {
			cashUpPurchase.setPurchaseId(rs.getInt("purchase_id"));
			cashUpPurchase.setServiceId(rs.getInt("service_id"));
			cashUpPurchase.setPurchaseName(rs.getString("purchase_name"));
			cashUpPurchase.setPurchaseCost(rs.getDouble("purchase_cost"));
			cashUpPurchase.setPurcahseType(rs.getString("purchase_type"));
			cashUpPurchase.setUpdatedOn(rs.getDate("updated_on"));
			cashUpPurchase.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cashUpPurchase;
	}

}
