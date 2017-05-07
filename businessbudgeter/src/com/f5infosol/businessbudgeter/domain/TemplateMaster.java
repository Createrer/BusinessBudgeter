package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;

public class TemplateMaster implements Serializable {

	private Integer templateId;
	private String templateName;
	private String rosterDate;
	private Date updatedOn;
	private String updatedBy;
	public Integer getTemplateId() {
		return templateId;
	}
	public void setTemplateId(Integer templateId) {
		this.templateId = templateId;
	}
	public String getTemplateName() {
		return templateName;
	}
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	
	public String getRosterDate() {
		return rosterDate;
	}
	public void setRosterDate(String rosterDate) {
		this.rosterDate = rosterDate;
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
