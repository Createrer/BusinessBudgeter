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
public class CashUpCreditCard implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer cashUpCreditCardId;
	
	private Integer serviceId;
	
	private Integer creditCardTypeId;
	
	private Integer cashTypeId;
	
	private double ccReading;
	
	private double tillReading;
	
	private double foodBeverageSales;
	
	private double eventFoodBeverageSales;
	
	private Date cashupCreditDate;
	
	private Date updatedOn;
	
	private String updatedBy;
	
	private CreditCardTypes creditCardType;

	public CreditCardTypes getCreditCardType() {
		return creditCardType;
	}

	public void setCreditCardType(CreditCardTypes creditCardType) {
		this.creditCardType = creditCardType;
	}

	public Integer getCashUpCreditCardId() {
		return cashUpCreditCardId;
	}

	public void setCashUpCreditCardId(Integer cashUpCreditCardId) {
		this.cashUpCreditCardId = cashUpCreditCardId;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getCreditCardTypeId() {
		return creditCardTypeId;
	}

	public void setCreditCardTypeId(Integer creditCardTypeId) {
		this.creditCardTypeId = creditCardTypeId;
	}

	public Integer getCashTypeId() {
		return cashTypeId;
	}

	public void setCashTypeId(Integer cashTypeId) {
		this.cashTypeId = cashTypeId;
	}

	public double getCcReading() {
		return ccReading;
	}

	public void setCcReading(double ccReading) {
		this.ccReading = ccReading;
	}

	public double getTillReading() {
		return tillReading;
	}

	public void setTillReading(double tillReading) {
		this.tillReading = tillReading;
	}

	

	public double getFoodBeverageSales() {
		return foodBeverageSales;
	}

	public void setFoodBeverageSales(double foodBeverageSales) {
		this.foodBeverageSales = foodBeverageSales;
	}

	public double getEventFoodBeverageSales() {
		return eventFoodBeverageSales;
	}

	public void setEventFoodBeverageSales(double eventFoodBeverageSales) {
		this.eventFoodBeverageSales = eventFoodBeverageSales;
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

	public Date getCashupCreditDate() {
		return cashupCreditDate;
	}

	public void setCashupCreditDate(Date cashupCreditDate) {
		this.cashupCreditDate = cashupCreditDate;
	}
	
	
}
