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
public class CashUpTipsAllocation implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer cashUpTipsAllocationId;
	
	private Integer cashUpTipsId;
	
	private Integer staffId;
	
	private Integer typeAllocated;
	
	private Date updatedOn;
	
	private String updatedBy;

	public Integer getCashUpTipsAllocationId() {
		return cashUpTipsAllocationId;
	}

	public void setCashUpTipsAllocationId(Integer cashUpTipsAllocationId) {
		this.cashUpTipsAllocationId = cashUpTipsAllocationId;
	}

	public Integer getCashUpTipsId() {
		return cashUpTipsId;
	}

	public void setCashUpTipsId(Integer cashUpTipsId) {
		this.cashUpTipsId = cashUpTipsId;
	}

	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public Integer getTypeAllocated() {
		return typeAllocated;
	}

	public void setTypeAllocated(Integer typeAllocated) {
		this.typeAllocated = typeAllocated;
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
