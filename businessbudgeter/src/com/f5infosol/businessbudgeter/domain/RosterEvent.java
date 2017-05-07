package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;

public class RosterEvent implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int rosterEventId;
	
	private int eventId;
	
	private String eventName;
	
	private double totalActual;
	
	private double labourCostPct;
	
	private double noOfHours;

	private Date  rosterEventDate;
	
	private Date updatedOn;

	private String updatedBy;

	public int getRosterEventId() {
		return rosterEventId;
	}

	public void setRosterEventId(int rosterEventId) {
		this.rosterEventId = rosterEventId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public double getTotalActual() {
		return totalActual;
	}

	public void setTotalActual(double totalActual) {
		this.totalActual = totalActual;
	}

	public double getLabourCostPct() {
		return labourCostPct;
	}

	public void setLabourCostPct(double labourCostPct) {
		this.labourCostPct = labourCostPct;
	}

	public Date getRosterEventDate() {
		return rosterEventDate;
	}

	public void setRosterEventDate(Date rosterEventDate) {
		this.rosterEventDate = rosterEventDate;
	}
	
	public double getNoOfHours() {
		return noOfHours;
	}

	public void setNoOfHours(double noOfHours) {
		this.noOfHours = noOfHours;
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
