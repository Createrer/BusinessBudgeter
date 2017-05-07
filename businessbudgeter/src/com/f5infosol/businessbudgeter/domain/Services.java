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
public class Services implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer serviceId;
	
	private Integer incomeCentreId;
	
	private String serviceName;
	
	private String description;
	
	private String startTime;
	
	private String endTime;
	
	private String startDate;
	
	private String endDate;
	
	private Boolean recurrence;
	
	private Integer revenueProjection;
	
	private Integer labourCostPct;
	
	private Date updatedOn;
	
	private String updatedBy;

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getIncomeCentreId() {
		return incomeCentreId;
	}

	public void setIncomeCentreId(Integer incomeCentreId) {
		this.incomeCentreId = incomeCentreId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Boolean getRecurrence() {
		return recurrence;
	}

	public void setRecurrence(Boolean recurrence) {
		this.recurrence = recurrence;
	}

	public Integer getRevenueProjection() {
		return revenueProjection;
	}

	public void setRevenueProjection(Integer revenueProjection) {
		this.revenueProjection = revenueProjection;
	}

	public Integer getLabourCostPct() {
		return labourCostPct;
	}

	public void setLabourCostPct(Integer labourCostPct) {
		this.labourCostPct = labourCostPct;
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
