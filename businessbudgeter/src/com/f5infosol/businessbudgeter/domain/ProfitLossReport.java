package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.List;

public class ProfitLossReport implements Serializable{

	
	private static final long serialVersionUID = 1L;

	private Double actualDailyRevenue;
	private Double totalFoodIncome;
	private Double totalBeverageIncome;
	private Double actualFoodSpend;
	private Double actualBeverageSpend;
	
	public Double getActualDailyRevenue() {
		return actualDailyRevenue;
	}
	public void setActualDailyRevenue(Double actualDailyRevenue) {
		this.actualDailyRevenue = actualDailyRevenue;
	}
	public Double getTotalFoodIncome() {
		return totalFoodIncome;
	}
	public void setTotalFoodIncome(Double totalFoodIncome) {
		this.totalFoodIncome = totalFoodIncome;
	}
	public Double getTotalBeverageIncome() {
		return totalBeverageIncome;
	}
	public void setTotalBeverageIncome(Double totalBeverageIncome) {
		this.totalBeverageIncome = totalBeverageIncome;
	}
	public Double getActualFoodSpend() {
		return actualFoodSpend;
	}
	public void setActualFoodSpend(Double actualFoodSpend) {
		this.actualFoodSpend = actualFoodSpend;
	}
	public Double getActualBeverageSpend() {
		return actualBeverageSpend;
	}
	public void setActualBeverageSpend(Double actualBeverageSpend) {
		this.actualBeverageSpend = actualBeverageSpend;
	}
	
	
}
