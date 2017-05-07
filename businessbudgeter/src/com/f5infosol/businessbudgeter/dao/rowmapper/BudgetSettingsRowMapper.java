package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.BudgetSettings;

public class BudgetSettingsRowMapper implements ParameterizedRowMapper<BudgetSettings> {

	@Override
	public BudgetSettings mapRow(ResultSet rs, int arg1) throws SQLException {
		BudgetSettings budgetSettings = new BudgetSettings();
		try {
			budgetSettings.setBudgetSettingId(rs.getInt("budget_settingid"));
			budgetSettings.setBudgetType(rs.getInt("budget_type"));
			budgetSettings.setIncomeCeneterId(rs.getInt("income_ceneter_id"));
			budgetSettings.setTurnover(rs.getDouble("turnover"));
			budgetSettings.setServiceId(rs.getInt("service_id"));
			budgetSettings.setDayOfWeek(rs.getInt("day_of_week"));
			budgetSettings.setFoodCostPct(rs.getDouble("food_cost_pct"));
			budgetSettings.setBevCostPct(rs.getDouble("bev_cost_pct"));
			budgetSettings.setFoodIncome(rs.getDouble("food_income"));
			budgetSettings.setBevIncome(rs.getDouble("bev_income"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return budgetSettings;
	}

}
