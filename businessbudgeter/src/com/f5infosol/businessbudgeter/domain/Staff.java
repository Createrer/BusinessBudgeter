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
public class Staff implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer staffId;
	
	private Integer companyId;
	
	private String satffName;
	
	private String position;
	
	private Integer level;
	
	private Double weekDayRate;
	
	private Double saturdayDayRate;
	
	private Double sundayDayRate;
	
	private Double publicHolidayDayRate;
	
	private Double otherRate;
	
	private String employeeStatus;
	
	private String  agency;
	
	private Date updatedOn;
	
	private String updatedBy;
	
	private String address;
	
	
	private User user;
	
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public Long getCellNo() {
		return cellNo;
	}

	public void setCellNo(Long cellNo) {
		this.cellNo = cellNo;
	}

	private String emailID;
	
	private Long cellNo;
	
	private String postalCode;
	
	private Boolean settingAccess;
	
	private Boolean rosterAccess;
	
	private Boolean cashupAccess;
	
	private Boolean reportAccess;
	
	private Boolean systemEnable;
	
	
	public Boolean getSystemEnable() {
		return systemEnable;
	}

	public void setSystemEnable(Boolean systemEnable) {
		this.systemEnable = systemEnable;
	}

	public Boolean getSettingAccess() {
		return settingAccess;
	}

	public void setSettingAccess(Boolean settingAccess) {
		this.settingAccess = settingAccess;
	}

	public Boolean getRosterAccess() {
		return rosterAccess;
	}

	public void setRosterAccess(Boolean rosterAccess) {
		this.rosterAccess = rosterAccess;
	}

	public Boolean getCashupAccess() {
		return cashupAccess;
	}

	public void setCashupAccess(Boolean cashupAccess) {
		this.cashupAccess = cashupAccess;
	}

	public Boolean getReportAccess() {
		return reportAccess;
	}

	public void setReportAccess(Boolean reportAccess) {
		this.reportAccess = reportAccess;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer satffId) {
		this.staffId = satffId;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getSatffName() {
		return satffName;
	}

	public void setSatffName(String satffName) {
		this.satffName = satffName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	

	public Double getWeekDayRate() {
		return weekDayRate;
	}

	public void setWeekDayRate(Double weekDayRate) {
		this.weekDayRate = weekDayRate;
	}

	public Double getSaturdayDayRate() {
		return saturdayDayRate;
	}

	public void setSaturdayDayRate(Double saturdayDayRate) {
		this.saturdayDayRate = saturdayDayRate;
	}

	public Double getSundayDayRate() {
		return sundayDayRate;
	}

	public void setSundayDayRate(Double sundayDayRate) {
		this.sundayDayRate = sundayDayRate;
	}

	public Double getPublicHolidayDayRate() {
		return publicHolidayDayRate;
	}

	public void setPublicHolidayDayRate(Double publicHolidayDayRate) {
		this.publicHolidayDayRate = publicHolidayDayRate;
	}

	public Double getOtherRate() {
		return otherRate;
	}

	public void setOtherRate(Double otherRate) {
		this.otherRate = otherRate;
	}

	public String getEmployeeStatus() {
		return employeeStatus;
	}

	public void setEmployeeStatus(String employeeStatus) {
		this.employeeStatus = employeeStatus;
	}

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
