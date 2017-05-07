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
public class CashTypes implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer cashTypeId;
	
	private String cashTypeName;
	
	private Date updatedOn;
	
	private String updatedBy;

	public Integer getCashTypeId() {
		return cashTypeId;
	}

	public void setCashTypeId(Integer cashTypeId) {
		this.cashTypeId = cashTypeId;
	}

	public String getCashTypeName() {
		return cashTypeName;
	}

	public void setCashTypeName(String cashTypeName) {
		this.cashTypeName = cashTypeName;
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
