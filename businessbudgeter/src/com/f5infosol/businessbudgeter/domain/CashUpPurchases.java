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
public class CashUpPurchases implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer purchaseId;

	private Integer serviceId;

	private String purchaseName;

	private Double purchaseCost;

	private String purcahseType;

	private Date updatedOn;

	private String updatedBy;

	private Date cashUpCashDate;

	private Integer incomeCentreId;

	public CashUpPurchases() {
	}

	public CashUpPurchases(String purchaseFoodName, double purchaseFoodvalue, Date updatedOn2, String userName, int purchaseId2, Date cashUpCashDate, int serviceId2, int income_center_id) {
		this.purchaseName = purchaseFoodName;
		this.purchaseCost = purchaseFoodvalue;
		this.updatedOn = updatedOn2;
		this.updatedBy = userName;
		this.purchaseId = purchaseId2;
		this.cashUpCashDate = cashUpCashDate;
		this.incomeCentreId = income_center_id;

	}

	public Date getCashUpCashDate() {
		return cashUpCashDate;
	}

	public void setCashUpCashDate(Date cashUpCashDate) {
		this.cashUpCashDate = cashUpCashDate;
	}

	public Integer getIncomeCentreId() {
		return incomeCentreId;
	}

	public void setIncomeCentreId(Integer incomeCentreId) {
		this.incomeCentreId = incomeCentreId;
	}

	public Integer getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(Integer purchaseId) {
		this.purchaseId = purchaseId;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public String getPurchaseName() {
		return purchaseName;
	}

	public void setPurchaseName(String purchaseName) {
		this.purchaseName = purchaseName;
	}

	public Double getPurchaseCost() {
		return purchaseCost;
	}

	public void setPurchaseCost(Double purchaseCost) {
		this.purchaseCost = purchaseCost;
	}

	public String getPurcahseType() {
		return purcahseType;
	}

	public void setPurcahseType(String purcahseType) {
		this.purcahseType = purcahseType;
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
