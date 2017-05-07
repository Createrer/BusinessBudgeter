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
public class CashDrawers implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer cashDrawerId;
	
	private Integer userId;
	
	private Integer incomeCentreId;
	
	private String tillName;
	
	private String description;
	
	private Date updatedOn;
	
	private String updatedBy;
	
	private List<CashUpCash> cashUpCashsList;

	public List<CashUpCash> getCashUpCashsList() {
		return cashUpCashsList;
	}

	public void setCashUpCashsList(List<CashUpCash> cashUpCashsList) {
		this.cashUpCashsList = cashUpCashsList;
	}

	public Integer getCashDrawerId() {
		return cashDrawerId;
	}

	public void setCashDrawerId(Integer cashDrawerId) {
		this.cashDrawerId = cashDrawerId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getIncomeCentreId() {
		return incomeCentreId;
	}

	public void setIncomeCentreId(Integer incomeCentreId) {
		this.incomeCentreId = incomeCentreId;
	}

	public String getTillName() {
		return tillName;
	}

	public void setTillName(String tillName) {
		this.tillName = tillName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
