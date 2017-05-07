package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;

public class Roster implements Serializable {

	private static final long serialVersionUID = 1L;

	private int rosterId;

	private int shiftId;

	private int staffId;

	private int incomeCenterId;

	private int serviceId;

	private int eventId;

	private String shiftName;

	private String staffName;

	private String serviceName;

	private String eventName;

	private Date rosterDate;

	private String startTime;

	private String finishTime;

	private double totalHours;

	private Date updatedOn;

	private String updatedBy;

	public int getRosterId() {
		return rosterId;
	}

	public void setRosterId(int rosterId) {
		this.rosterId = rosterId;
	}

	public int getShiftId() {
		return shiftId;
	}

	public void setShiftId(int shiftId) {
		this.shiftId = shiftId;
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public int getIncomeCenterId() {
		return incomeCenterId;
	}

	public void setIncomeCenterId(int incomeCenterId) {
		this.incomeCenterId = incomeCenterId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getShiftName() {
		return shiftName;
	}

	public void setShiftName(String shiftName) {
		this.shiftName = shiftName;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public Date getRosterDate() {
		return rosterDate;
	}

	public void setRosterDate(Date rosterDate) {
		this.rosterDate = rosterDate;
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

	public double getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(double totalHours) {
		this.totalHours = totalHours;
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

	@Override
	public String toString() {
		return "Roster [rosterId=" + rosterId + ", shiftId=" + shiftId + ", staffId=" + staffId + ", eventId=" + eventId + ", staffName=" + staffName + ", eventName=" + eventName + ", startTime=" + startTime + ", finishTime=" + finishTime + "]";
	}

}
