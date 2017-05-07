package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.BudgetSetting;
import com.f5infosol.businessbudgeter.domain.RosterEvent;

public class BudgetSettingRowMapper implements ParameterizedRowMapper<BudgetSetting>{

	@Override
	public BudgetSetting mapRow(ResultSet rs, int index) throws SQLException {
		
		BudgetSetting budgetSetting = new BudgetSetting();
		
		try {
			
			budgetSetting.setBudget_setting_id(rs.getInt("budget_settingid"));
			budgetSetting.setBudget_type(rs.getInt("budget_type"));
			budgetSetting.setIncome_center_id(rs.getInt("income_ceneter_id"));
			budgetSetting.setTurnover(rs.getDouble("turnover"));
			budgetSetting.setService_id(rs.getInt("service_id"));
			budgetSetting.setDay_of_week(rs.getInt("day_of_week"));
			budgetSetting.setFood_cost_pct(rs.getDouble("food_cost_pct"));
			budgetSetting.setBev_cost_pct(rs.getDouble("bev_cost_pct"));
			budgetSetting.setFood_income(rs.getDouble("food_income"));
			budgetSetting.setBev_income(rs.getDouble("bev_income"));
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return budgetSetting;
	}

}
