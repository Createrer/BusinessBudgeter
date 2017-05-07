package com.f5infosol.businessbudgeter.domain;

public class BudgetSetting {
	Integer budget_setting_id;
	Integer budget_type;
	Integer income_center_id;
	Double turnover;
	Integer service_id;
	Integer day_of_week;
	Double food_cost_pct;
	Double bev_cost_pct;
	Double food_income;
	Double bev_income;

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
	public Double getTurnover() {
		return turnover;
	}
	public void setTurnover(Double turnover) {
		this.turnover = turnover;
	}
	public Integer getService_id() {
		return service_id;
	}
	public void setService_id(Integer service_id) {
		this.service_id = service_id;
	}
	public Integer getDay_of_week() {
		return day_of_week;
	}
	public void setDay_of_week(Integer day_of_week) {
		this.day_of_week = day_of_week;
	}
	public Double getFood_cost_pct() {
		return food_cost_pct;
	}
	public void setFood_cost_pct(Double food_cost_pct) {
		this.food_cost_pct = food_cost_pct;
	}
	public Double getBev_cost_pct() {
		return bev_cost_pct;
	}
	public void setBev_cost_pct(Double bev_cost_pct) {
		this.bev_cost_pct = bev_cost_pct;
	}
	public Double getFood_income() {
		return food_income;
	}
	public void setFood_income(Double food_income) {
		this.food_income = food_income;
	}
	public Double getBev_income() {
		return bev_income;
	}
	public void setBev_income(Double bev_income) {
		this.bev_income = bev_income;
	}
	
	
	
	
}
