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
public class EventStaff implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer eventLabourId;
	
	private Integer staffId;
	
	private Integer eventId;
	
	private Integer eventHours;
	
	private Integer cost;
	
	private Date updatedOn;
	
	private String updatedBy;

	public Integer getEventLabourId() {
		return eventLabourId;
	}

	public void setEventLabourId(Integer eventLabourId) {
		this.eventLabourId = eventLabourId;
	}

	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public Integer getEventHours() {
		return eventHours;
	}

	public void setEventHours(Integer eventHours) {
		this.eventHours = eventHours;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
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

	public void setUpdatedBy(String string) {
		this.updatedBy = string;
	}
	
}
