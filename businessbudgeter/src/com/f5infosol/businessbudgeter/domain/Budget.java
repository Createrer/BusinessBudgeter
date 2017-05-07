package com.f5infosol.businessbudgeter.domain;

import java.util.List;

public class Budget {
	
	Integer budget_setting_id;
	Integer budget_type;
	Integer income_center_id;
	
	List<BudgetSetting> settings;

	List<Services> services;
	
	public List<Services> getServices() {
		return services;
	}

	public void setServices(List<Services> services) {
		this.services = services;
	}

	public Integer getBudget_setting_id() {
		return budget_setting_id;
	}

	public void setBudget_setting_id(Integer budget_setting_id) {
		this.budget_setting_id = budget_setting_id;
	}

	public Integer getBudget_type() {
		return budget_type;
	}

	public void setBudget_type(Integer budget_type) {
		this.budget_type = budget_type;
	}

	public Integer getIncome_center_id() {
		return income_center_id;
	}

	public void setIncome_center_id(Integer income_center_id) {
		this.income_center_id = income_center_id;
	}

	public List<BudgetSetting> getSettings() {
		return settings;
	}

	public void setSettings(List<BudgetSetting> settings) {
		this.settings = settings;
	}
	
	
	

}
