package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class WagesReport implements Serializable{
	
		
	private static final long serialVersionUID = 1L;
	private Integer satffRosterId;
	private Date rosterDate;
	private Double staffIncome;//rate* total hr
	private Double workHour;
	private Double rate;
	private String staffName;
	private Double holidayWorkHour;
	
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public Integer getSatffRosterId() {
		return satffRosterId;
	}
	public void setSatffRosterId(Integer satffRosterId) {
		this.satffRosterId = satffRosterId;
	}
	public Date getRosterDate() {
		return rosterDate;
	}
	public void setRosterDate(Date rosterDate) {
		this.rosterDate = rosterDate;
	}
	public Double getStaffIncome() {
		return staffIncome;
	}
	public void setStaffIncome(Double staffIncome) {
		this.staffIncome = staffIncome;
	}
	public Double getWorkHour() {
		return workHour;
	}
	public void setWorkHour(Double workHour) {
		this.workHour = workHour;
	}
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
		this.rate = rate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Double getHolidayWorkHour() {
		return holidayWorkHour;
	}
	public void setHolidayWorkHour(Double holidayWorkHour) {
		this.holidayWorkHour = holidayWorkHour;
	}
	
}
