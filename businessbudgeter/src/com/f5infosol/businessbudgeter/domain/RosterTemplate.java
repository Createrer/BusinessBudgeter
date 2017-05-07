package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;

public class RosterTemplate implements Serializable {

	private Integer rosterTemplateId;
	private Integer templateId;
	private Integer staffId;
	private String startTime;
	private String finishTime;
	private Double totalHours;
	private Boolean publicHoliday;
	private String workofhouse;
	private String role;
	private Date updatedOn;
	private String updatedBy;
	public Integer getRosterTemplateId() {
		return rosterTemplateId;
	}
	public void setRosterTemplateId(Integer rosterTemplateId) {
		this.rosterTemplateId = rosterTemplateId;
	}
	public Integer getTemplateId() {
		return templateId;
	}
	public void setTemplateId(Integer templateId) {
		this.templateId = templateId;
	}
	public Integer getStaffId() {
		return staffId;
	}
	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}
	public Double getTotalHours() {
		return totalHours;
	}
	public void setTotalHours(Double totalHours) {
		this.totalHours = totalHours;
	}
	public Boolean getPublicHoliday() {
		return publicHoliday;
	}
	public void setPublicHoliday(Boolean publicHoliday) {
		this.publicHoliday = publicHoliday;
	}
	public String getWorkofhouse() {
		return workofhouse;
	}
	public void setWorkofhouse(String workofhouse) {
		this.workofhouse = workofhouse;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
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
