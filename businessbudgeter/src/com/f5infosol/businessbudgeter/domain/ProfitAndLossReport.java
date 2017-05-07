package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ProfitAndLossReport implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer staffId;
	private String staffName;
	private Double totalHours;
	private Double totalIncome;
	private String rosterDate;
	private List<WagesReport> wages;
	private Double grossEFTWages;
	private Double cashWages;
	private Double weeklyRate;
	private Double publicHolidayRate;
	private Double holidayHours;
	
	public Integer getStaffId() {
		return staffId;
	}
	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public Double getTotalHours() {
		return totalHours;
	}
	public void setTotalHours(Double l) {
		this.totalHours = l;
	}
	public Double getTotalIncome() {
		return totalIncome;
	}
	public void setTotalIncome(Double totalIncome) {
		this.totalIncome = totalIncome;
	}
	public List<WagesReport> getWages() {
		return wages;
	}
	public void setWages(List<WagesReport> wages) {
		this.wages = wages;
	}
	public String getRosterDate() {
		return rosterDate;
	}
	public void setRosterDate(String rosterDate) {
		this.rosterDate = rosterDate;
	}
	public Double getGrossEFTWages() {
		return grossEFTWages;
	}
	public void setGrossEFTWages(Double grossEFTWages) {
		this.grossEFTWages = grossEFTWages;
	}
	public Double getCashWages() {
		return cashWages;
	}
	public void setCashWages(Double cashWages) {
		this.cashWages = cashWages;
	}
	public Double getWeeklyRate() {
		return weeklyRate;
	}
	public void setWeeklyRate(Double weeklyRate) {
		this.weeklyRate = weeklyRate;
	}
	public Double getPublicHolidayRate() {
		return publicHolidayRate;
	}
	public void setPublicHolidayRate(Double publicHolidayRate) {
		this.publicHolidayRate = publicHolidayRate;
	}
	public Double getHolidayHours() {
		return holidayHours;
	}
	public void setHolidayHours(Double holidayHours) {
		this.holidayHours = holidayHours;
	}
	
}
