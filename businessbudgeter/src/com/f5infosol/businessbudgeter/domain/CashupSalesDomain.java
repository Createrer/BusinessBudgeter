package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;

public class CashupSalesDomain implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int cashUpSalesId;
	
	private int serviceId;
	
	private boolean isAvailable;
	
	private String cashUpSaleName;
	
	private int incomeCenterId;

	public int getCashUpSalesId() {
		return cashUpSalesId;
	}

	public void setCashUpSalesId(int cashUpSalesId) {
		this.cashUpSalesId = cashUpSalesId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	public String getCashUpSaleName() {
		return cashUpSaleName;
	}

	public void setCashUpSaleName(String cashUpSaleName) {
		this.cashUpSaleName = cashUpSaleName;
	}

	public int getIncomeCenterId() {
		return incomeCenterId;
	}

	public void setIncomeCenterId(int incomeCenterId) {
		this.incomeCenterId = incomeCenterId;
	}
	
	
}
