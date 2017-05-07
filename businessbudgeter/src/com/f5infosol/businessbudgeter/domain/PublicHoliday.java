package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;

public class PublicHoliday implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer holidayId;
	private Date holidayDate;
	private Date updatedOn;
	private String updatedBy;
	public Integer getHolidayId() {
		return holidayId;
	}
	public void setHolidayId(Integer holidayId) {
		this.holidayId = holidayId;
	}
	public Date getHolidayDate() {
		return holidayDate;
	}
	public void setHolidayDate(Date holidayDate) {
		this.holidayDate = holidayDate;
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
