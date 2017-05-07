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
public class CashUpZRead implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer cashUpZReadId;
	
	private Integer serviceId;
	
	private Double zRead;
	
	private Integer totalCashZRead;
	
	private Date updatedOn;
	
	private String updatedBy;

	public Integer getCashUpZReadId() {
		return cashUpZReadId;
	}

	public void setCashUpZReadId(Integer cashUpZReadId) {
		this.cashUpZReadId = cashUpZReadId;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Double getzRead() {
		return zRead;
	}

	public void setzRead(Double zRead) {
		this.zRead = zRead;
	}

	public Integer getTotalCashZRead() {
		return totalCashZRead;
	}

	public void setTotalCashZRead(Integer totalCashZRead) {
		this.totalCashZRead = totalCashZRead;
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
