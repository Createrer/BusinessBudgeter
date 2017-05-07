package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.List;

public class ProfitLossReportAll implements Serializable{

	
	private List<ProfitLossReport> profitLoss;
	private Double actualDailyRevenue;
	private Double actualFoodSpendTotal;
	private Double actualBeverageSpendTotal;
	
	public List<ProfitLossReport> getProfitLoss() {
		return profitLoss;
	}
	public void setProfitLoss(List<ProfitLossReport> profitLoss) {
		this.profitLoss = profitLoss;
	}
	public Double getActualFoodSpendTotal() {
		return actualFoodSpendTotal;
	}
	public void setActualFoodSpendTotal(Double actualFoodSpendTotal) {
		this.actualFoodSpendTotal = actualFoodSpendTotal;
	}
	public Double getActualBeverageSpendTotal() {
		return actualBeverageSpendTotal;
	}
	public void setActualBeverageSpendTotal(Double actualBeverageSpendTotal) {
		this.actualBeverageSpendTotal = actualBeverageSpendTotal;
	}
	public Double getActualDailyRevenue() {
		return actualDailyRevenue;
	}
	public void setActualDailyRevenue(Double actualDailyRevenue) {
		this.actualDailyRevenue = actualDailyRevenue;
	}
	
}
