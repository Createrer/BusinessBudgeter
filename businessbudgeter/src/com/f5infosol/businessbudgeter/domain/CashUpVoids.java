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
public class CashUpVoids implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer cashUpVoidsId;
	
	private Integer staffId;
	
	private String staffName;
	
	private Integer serviceId;
	
	private Double amount;
	
	private String time;
	
	private String reason;
	
	public String getTime() {
		return time;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	private Date updatedOn;
	
	public Integer getCashUpVoidsId() {
		return cashUpVoidsId;
	}

	public void setCashUpVoidsId(Integer cashUpVoidsId) {
		this.cashUpVoidsId = cashUpVoidsId;
	}

	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
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

	private String updatedBy;
}
