package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.Events;

public class EventsRowMapper implements ParameterizedRowMapper<Events>{

	@Override
	public Events mapRow(ResultSet rs, int index) throws SQLException {
		Events event = new Events();
		try {
			event.setEventId(rs.getInt("event_id"));
			event.setEventName(rs.getString("event_name"));
			event.setFoodBudgetedIncome(rs.getDouble("food_budgeted_income"));
			event.setFoodActual(rs.getDouble("food_actual"));
			event.setBeverageBudgetedIncome(rs.getDouble("beverage_budgeted_income"));
			event.setBeverageActual(rs.getDouble("beverage_actual"));
			event.setOtherBudgetedIncome(rs.getDouble("other_budgeted_income"));
			event.setOtherActual(rs.getDouble("other_actual"));
			event.setTotalBudgetedIncome(rs.getDouble("total_budgeted_income"));
			event.setTotalActual(rs.getDouble("total_actual"));
			event.setLabourCostPct(rs.getDouble("labour_cost_pct"));
			event.setUpdatedOn(rs.getDate("updated_on"));
			event.setUpdatedBy(rs.getString("updated_by"));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return event;
	}

}
