package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashUpTips;

public class CashUpTipsRowMapper implements ParameterizedRowMapper<CashUpTips>{

	@Override
	public CashUpTips mapRow(ResultSet rs, int index) throws SQLException {
		CashUpTips cashUpTip = new CashUpTips();
		try {
			cashUpTip.setCashUpTipsId(rs.getInt("cashup_tips_id"));
			cashUpTip.setServiceId(rs.getInt("service_id"));
			cashUpTip.setCerditCardTips(rs.getDouble("credit_card_tips"));
			cashUpTip.setCashTips(rs.getDouble("cash_tips"));
			cashUpTip.setUpdatedOn(rs.getDate("updated_on"));
			cashUpTip.setUpdatedBy(rs.getString("updated_by"));
			cashUpTip.setTipsDate(rs.getDate("tips_date"));
			cashUpTip.setFeesPct(rs.getDouble("fees_pct"));
			cashUpTip.setSlushPct(rs.getDouble("slush_pct"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cashUpTip;
	}

}
