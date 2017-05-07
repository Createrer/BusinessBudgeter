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
public class CashUpCash implements Serializable {

	private static final long serialVersionUID = 1L;

	private int cashUpCashId;

	private int serviceId;

	private int cashDrawerId;

	private int cashTypeId;

	private double floatAmount;

	private double drawerAmount;

	private Date updatedOn;

	private String updatedBy;

	private String cashTypeName;

	private CashTypes cashType;

	private int cashupCashCount;

	private Date cashUpCashDate;

	private Integer incomeCentreId;

	public CashUpCash() {
	}

	public CashUpCash(double floatAmount, double drawerAmt, Date updatedOn, String updatedBy, Date cashUpCashDate, int serviceId, int cashUpId, int incomeCentreId) {
		this.floatAmount = floatAmount;
		this.drawerAmount = drawerAmt;
		this.updatedOn = updatedOn;
		this.updatedBy = updatedBy;
		this.cashUpCashDate = cashUpCashDate;
		this.cashUpCashId = cashUpId;
		this.incomeCentreId = incomeCentreId;
		this.serviceId = serviceId;
	}

	public Integer getIncomeCentreId() {
		return incomeCentreId;
	}

	public void setIncomeCentreId(Integer incomeCentreId) {
		this.incomeCentreId = incomeCentreId;
	}

	public Date getCashUpCashDate() {
		return cashUpCashDate;
	}

	public void setCashUpCashDate(Date cashUpCashDate) {
		this.cashUpCashDate = cashUpCashDate;
	}

	public int getCashUpCashId() {
		return cashUpCashId;
	}

	public void setCashUpCashId(int cashUpCashId) {
		this.cashUpCashId = cashUpCashId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public int getCashDrawerId() {
		return cashDrawerId;
	}

	public void setCashDrawerId(int cashDrawerId) {
		this.cashDrawerId = cashDrawerId;
	}

	public int getCashTypeId() {
		return cashTypeId;
	}

	public void setCashTypeId(int cashTypeId) {
		this.cashTypeId = cashTypeId;
	}

	public double getFloatAmount() {
		return floatAmount;
	}

	public void setFloatAmount(double floatAmount) {
		this.floatAmount = floatAmount;
	}

	public double getDrawerAmount() {
		return drawerAmount;
	}

	public void setDrawerAmount(double drawerAmount) {
		this.drawerAmount = drawerAmount;
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

	public String getCashTypeName() {
		return cashTypeName;
	}

	public void setCashTypeName(String cashTypeName) {
		this.cashTypeName = cashTypeName;
	}

	public CashTypes getCashType() {
		return cashType;
	}

	public void setCashType(CashTypes cashType) {
		this.cashType = cashType;
	}

	public int getCashupCashCount() {
		return cashupCashCount;
	}

	public void setCashupCashCount(int cashupCashCount) {
		this.cashupCashCount = cashupCashCount;
	}

}
