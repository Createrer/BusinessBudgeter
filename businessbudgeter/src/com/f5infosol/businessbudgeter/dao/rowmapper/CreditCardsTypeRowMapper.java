package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CreditCardTypes;

public class CreditCardsTypeRowMapper implements ParameterizedRowMapper<CreditCardTypes>{

	@Override
	public CreditCardTypes mapRow(ResultSet rs, int index) throws SQLException {
		CreditCardTypes creditCardType = new CreditCardTypes(); 
		try {
			creditCardType.setCreditCardTypeId(rs.getInt("credit_card_type_id"));
			creditCardType.setCreditCardTypeName(rs.getString("credit_card_type_name"));
			creditCardType.setUpdatedOn(rs.getDate("updated_on"));
			creditCardType.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return creditCardType;
	}

}
