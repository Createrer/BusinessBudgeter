/**
 * 
 */
package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author f5
 * 
 */
public class IncomeCentres implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer incomeCentreId;

	private Integer companyId;

	private String icName;
	
	private String companyName;

	private String location;

	private String details;

	private Boolean restaurant;

	private Boolean cafe;

	private Boolean takeAway;

	private Boolean bar;

	private Boolean deli;

	private Boolean retail;

	private Boolean catering;

	private Boolean delivery;

	private Boolean event;

	private Boolean roomService;

	private Boolean custom1;

	private Boolean custom2;
	
	private Boolean isEnable;

	private Double slush;
	
	private Double fees;
	
	private Double foodCost;
	
	private Double beverageCost;
	
	private Double foodIncome;
	
	private Double beverageIncome;
	
	private Date updatedOn;

	private String updatedBy;

	private List<CashDrawers> cashDrawersSettings;
	
	private List<Services> servicesSettings;
	
	private Budget budget ; 
	
	

	public Budget getBudget() {
		return budget;
	}

	public void setBudget(Budget budget) {
		this.budget = budget;
	}

	public Integer getIncomeCentreId() {
		return incomeCentreId;
	}

	public void setIncomeCentreId(Integer incomeCentreId) {
		this.incomeCentreId = incomeCentreId;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getIcName() {
		return icName;
	}

	public void setIcName(String icName) {
		this.icName = icName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Boolean getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Boolean restaurant) {
		this.restaurant = restaurant;
	}

	public Boolean getCafe() {
		return cafe;
	}

	public void setCafe(Boolean cafe) {
		this.cafe = cafe;
	}

	public Boolean getTakeAway() {
		return takeAway;
	}

	public void setTakeAway(Boolean takeAway) {
		this.takeAway = takeAway;
	}

	public Boolean getBar() {
		return bar;
	}

	public void setBar(Boolean bar) {
		this.bar = bar;
	}

	public Boolean getDeli() {
		return deli;
	}

	public void setDeli(Boolean deli) {
		this.deli = deli;
	}

	public Boolean getRetail() {
		return retail;
	}

	public void setRetail(Boolean retail) {
		this.retail = retail;
	}

	public Boolean getCatering() {
		return catering;
	}

	public void setCatering(Boolean catering) {
		this.catering = catering;
	}

	public Boolean getDelivery() {
		return delivery;
	}

	public void setDelivery(Boolean delivery) {
		this.delivery = delivery;
	}

	public Boolean getEvent() {
		return event;
	}

	public void setEvent(Boolean event) {
		this.event = event;
	}

	public Boolean getRoomService() {
		return roomService;
	}

	public void setRoomService(Boolean roomService) {
		this.roomService = roomService;
	}

	public Boolean getCustom1() {
		return custom1;
	}

	public void setCustom1(Boolean custom1) {
		this.custom1 = custom1;
	}

	public Boolean getCustom2() {
		return custom2;
	}

	public void setCustom2(Boolean custom2) {
		this.custom2 = custom2;
	}

	public Double getSlush() {
		return slush;
	}

	public void setSlush(Double slush) {
		this.slush = slush;
	}

	public Double getFees() {
		return fees;
	}

	public void setFees(Double fees) {
		this.fees = fees;
	}

	public Double getFoodCost() {
		return foodCost;
	}

	public void setFoodCost(Double foodCost) {
		this.foodCost = foodCost;
	}

	public Double getBeverageCost() {
		return beverageCost;
	}

	public void setBeverageCost(Double beverageCost) {
		this.beverageCost = beverageCost;
	}

	public Double getFoodIncome() {
		return foodIncome;
	}

	public void setFoodIncome(Double foodIncome) {
		this.foodIncome = foodIncome;
	}

	public Double getBeverageIncome() {
		return beverageIncome;
	}

	public void setBeverageIncome(Double beverageIncome) {
		this.beverageIncome = beverageIncome;
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

	public List<CashDrawers> getCashDrawersSettings() {
		return cashDrawersSettings;
	}

	public void setCashDrawersSettings(List<CashDrawers> cashDrawersSettings) {
		this.cashDrawersSettings = cashDrawersSettings;
	}

	public List<Services> getServicesSettings() {
		return servicesSettings;
	}

	public void setServicesSettings(List<Services> servicesSettings) {
		this.servicesSettings = servicesSettings;
	}

	public Boolean getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Boolean isEnable) {
		this.isEnable = isEnable;
	}
	
}
