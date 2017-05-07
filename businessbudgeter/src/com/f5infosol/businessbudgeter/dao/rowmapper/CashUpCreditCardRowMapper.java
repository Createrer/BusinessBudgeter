package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashUpCreditCard;

public class CashUpCreditCardRowMapper implements ParameterizedRowMapper<CashUpCreditCard>{

	@Override
	public CashUpCreditCard mapRow(ResultSet rs, int index) throws SQLException {
		CashUpCreditCard cashUpCreditCard = new CashUpCreditCard();
		try {
			cashUpCreditCard.setCashUpCreditCardId(rs.getInt("cashup_credit_card_id"));
			cashUpCreditCard.setServiceId(rs.getInt("service_id"));
			cashUpCreditCard.setCreditCardTypeId(rs.getInt("credit_card_type_id"));
			cashUpCreditCard.setCashTypeId(rs.getInt("cash_type_id"));
			cashUpCreditCard.setCcReading(rs.getDouble("cc_reading"));
			cashUpCreditCard.setTillReading(rs.getDouble("till_reading"));
			cashUpCreditCard.setFoodBeverageSales(rs.getDouble("food_beverage_sales"));
			cashUpCreditCard.setEventFoodBeverageSales(rs.getDouble("event_food_beverage_sales"));
			cashUpCreditCard.setUpdatedOn(rs.getDate("updated_on"));
			cashUpCreditCard.setUpdatedBy(rs.getString("updated_by"));
			cashUpCreditCard.setCashupCreditDate(rs.getDate("cashup_credit_date"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cashUpCreditCard;
	}

}
