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
public class CreditCardTypes implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer creditCardTypeId;
	
	private String creditCardTypeName;
	
	private Date updatedOn;
	
	public Integer getCreditCardTypeId() {
		return creditCardTypeId;
	}

	public void setCreditCardTypeId(Integer creditCardTypeId) {
		this.creditCardTypeId = creditCardTypeId;
	}

	public String getCreditCardTypeName() {
		return creditCardTypeName;
	}

	public void setCreditCardTypeName(String creditCardTypeName) {
		this.creditCardTypeName = creditCardTypeName;
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
