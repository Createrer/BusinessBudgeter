/**
 * 
 */
package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * @author f5
 *
 */
public class Events implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer eventId;
	
	private String eventName;
	
	private Double foodBudgetedIncome;
	
	private Double foodActual;
	
	private Double beverageBudgetedIncome;
	
	private Double beverageActual;
	
	private Double otherBudgetedIncome;
	
	private Double otherActual;
	
	private Double totalBudgetedIncome;
	
	private Double totalActual;
	
	private Double labourCostPct;
	
	private Date updatedOn;
	
	private String updatedBy;

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public Double getFoodBudgetedIncome() {
		return foodBudgetedIncome;
	}

	public void setFoodBudgetedIncome(Double foodBudgetedIncome) {
		this.foodBudgetedIncome = foodBudgetedIncome;
	}

	public Double getFoodActual() {
		return foodActual;
	}

	public void setFoodActual(Double foodActual) {
		this.foodActual = foodActual;
	}

	public Double getBeverageBudgetedIncome() {
		return beverageBudgetedIncome;
	}

	public void setBeverageBudgetedIncome(Double beverageBudgetedIncome) {
		this.beverageBudgetedIncome = beverageBudgetedIncome;
	}

	public Double getBeverageActual() {
		return beverageActual;
	}

	public void setBeverageActual(Double beverageActual) {
		this.beverageActual = beverageActual;
	}

	public Double getOtherBudgetedIncome() {
		return otherBudgetedIncome;
	}

	public void setOtherBudgetedIncome(Double otherBudgetedIncome) {
		this.otherBudgetedIncome = otherBudgetedIncome;
	}

	public Double getOtherActual() {
		return otherActual;
	}

	public void setOtherActual(Double otherActual) {
		this.otherActual = otherActual;
	}

	public Double getTotalBudgetedIncome() {
		return totalBudgetedIncome;
	}

	public void setTotalBudgetedIncome(Double totalBudgetedIncome) {
		this.totalBudgetedIncome = totalBudgetedIncome;
	}

	public Double getTotalActual() {
		return totalActual;
	}

	public void setTotalActual(Double totalActual) {
		this.totalActual = totalActual;
	}

	public Double getLabourCostPct() {
		return labourCostPct;
	}

	public void setLabourCostPct(Double labourCostPct) {
		this.labourCostPct = labourCostPct;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	
	
}
