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
public class Users implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	
	private Integer companyId;
	
	private String userName;
	
	private String companyName;
	
	private Date updatedOn;
	
	private String updatedBy;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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
