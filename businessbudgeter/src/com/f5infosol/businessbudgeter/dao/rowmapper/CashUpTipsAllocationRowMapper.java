package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashUpTipsAllocation;

public class CashUpTipsAllocationRowMapper implements ParameterizedRowMapper<CashUpTipsAllocation>{

	@Override
	public CashUpTipsAllocation mapRow(ResultSet rs, int index) throws SQLException {
		CashUpTipsAllocation cashUpTipAllocation = new CashUpTipsAllocation();
		try {
			cashUpTipAllocation.setCashUpTipsAllocationId(rs.getInt("cashup_tips_allocation_id"));
			cashUpTipAllocation.setCashUpTipsId(rs.getInt("cashup_tips_id"));
			cashUpTipAllocation.setStaffId(rs.getInt("staff_id"));
			cashUpTipAllocation.setTypeAllocated(rs.getInt("type_allocated"));
			cashUpTipAllocation.setUpdatedOn(rs.getDate("updated_on"));
			cashUpTipAllocation.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cashUpTipAllocation;
	}

}
