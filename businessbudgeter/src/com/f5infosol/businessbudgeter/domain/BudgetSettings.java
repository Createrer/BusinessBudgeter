package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;

public class BudgetSettings implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 340508820253373955L;

	private Integer budgetSettingId;
	private Integer budgetType;
	private Integer incomeCeneterId;
	private Double turnover;
	private Integer serviceId;
	private Integer dayOfWeek;
	private Double foodCostPct;
	private Double bevCostPct;
	private Double foodIncome;
	private Double bevIncome;

	
	private Double breakFastCost;
	private Double lunchCost;
	private Double dinnerCost;
	
	
	
	public Double getBreakFastCost() {
		return breakFastCost;
	}

	public void setBreakFastCost(Double breakFastCost) {
		this.breakFastCost = breakFastCost;
	}

	public Double getLunchCost() {
		return lunchCost;
	}

	public void setLunchCost(Double lunchCost) {
		this.lunchCost = lunchCost;
	}

	public Double getDinnerCost() {
		return dinnerCost;
	}

	public void setDinnerCost(Double dinnerCost) {
		this.dinnerCost = dinnerCost;
	}

	public Integer getBudgetSettingId() {
		return budgetSettingId;
	}

	public void setBudgetSettingId(Integer budgetSettingId) {
		this.budgetSettingId = budgetSettingId;
	}

	public Integer getBudgetType() {
		return budgetType;
	}

	public void setBudgetType(Integer budgetType) {
		this.budgetType = budgetType;
	}

	public Integer getIncomeCeneterId() {
		return incomeCeneterId;
	}

	public void setIncomeCeneterId(Integer incomeCeneterId) {
		this.incomeCeneterId = incomeCeneterId;
	}

	public Double getTurnover() {
		return turnover;
	}

	public void setTurnover(Double turnover) {
		this.turnover = turnover;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(Integer dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public Double getFoodCostPct() {
		return foodCostPct;
	}

	public void setFoodCostPct(Double foodCostPct) {
		this.foodCostPct = foodCostPct;
	}

	public Double getBevCostPct() {
		return bevCostPct;
	}

	public void setBevCostPct(Double bevCostPct) {
		this.bevCostPct = bevCostPct;
	}

	public Double getFoodIncome() {
		return foodIncome;
	}

	public void setFoodIncome(Double foodIncome) {
		this.foodIncome = foodIncome;
	}

	public Double getBevIncome() {
		return bevIncome;
	}

	public void setBevIncome(Double bevIncome) {
		this.bevIncome = bevIncome;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BudgetSettings [budgetSettingId=" + budgetSettingId + ", budgetType=" + budgetType + ", incomeCeneterId=" + incomeCeneterId + ", turnover=" + turnover + ", serviceId=" + serviceId + ", dayOfWeek=" + dayOfWeek + ", foodCostPct=" + foodCostPct + ", bevCostPct=" + bevCostPct + ", foodIncome=" + foodIncome + ", bevIncome=" + bevIncome + "]";
	}

}
