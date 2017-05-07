package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class TotalCashUpReport implements Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private String cashupCreditCardDate;
	private Integer ServiceId;
	private String serviceName;
	private List<CashUpCreditCard> cashUpCreditCards;
	private CashSales cashSales;
	private Integer totalCovers;
	private Double totalFoodIncome;
	private Double totalBeverageIncome;
	private Double dailyZRead;
	private Double tipsLessFees;
	private Double dailyTake;
	
	public String getCashupCreditCardDate() {
		return cashupCreditCardDate;
	}
	public void setCashupCreditCardDate(String cashupCreditCardDate) {
		this.cashupCreditCardDate = cashupCreditCardDate;
	}
	public Integer getServiceId() {
		return ServiceId;
	}
	public void setServiceId(Integer serviceId) {
		ServiceId = serviceId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	
	public List<CashUpCreditCard> getCashUpCreditCards() {
		return cashUpCreditCards;
	}
	public void setCashUpCreditCards(List<CashUpCreditCard> cashUpCreditCards) {
		this.cashUpCreditCards = cashUpCreditCards;
	}
	public CashSales getCashSales() {
		return cashSales;
	}
	public void setCashSales(CashSales cashSales) {
		this.cashSales = cashSales;
	}
	public Integer getTotalCovers() {
		return totalCovers;
	}
	public void setTotalCovers(Integer totalCovers) {
		this.totalCovers = totalCovers;
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
	public Double getDailyZRead() {
		return dailyZRead;
	}
	public void setDailyZRead(Double dailyZRead) {
		this.dailyZRead = dailyZRead;
	}
	public Double getTipsLessFees() {
		return tipsLessFees;
	}
	public void setTipsLessFees(Double tipsLessFees) {
		this.tipsLessFees = tipsLessFees;
	}
	public Double getDailyTake() {
		return dailyTake;
	}
	public void setDailyTake(Double dailyTake) {
		this.dailyTake = dailyTake;
	}
	
}
