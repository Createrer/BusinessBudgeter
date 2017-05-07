package com.f5infosol.businessbudgeter.domain;

import org.springframework.data.domain.Persistable;
import org.apache.commons.lang.builder.ToStringBuilder;
import java.util.Date;

/**
 * This class is generated by Spring Data Jdbc code generator.
 * 
 * @author Spring Data Jdbc Code Generator
 */
public class StaffRostersServices implements Persistable<Integer> {

	private static final long serialVersionUID = 1L;

	private Integer staffRosterServiceId;

	private Integer serviceId;

	private Integer staffRosterId;

	private Integer staffId;

	private Date rosterDate;

	private Double noOfHours;

	private Boolean publicHoliday;

	private Date updatedOn;

	private String updatedBy;

	private Integer incomeCenterId;

	private transient boolean persisted;

	private Services services;
	private IncomeCentres incomeCentres;
	private Staff staff;
	
	private boolean isEligible;
	
	private String staffName;

	public StaffRostersServices() {

	}

	public Integer getId() {
		return this.staffRosterServiceId;
	}

	public boolean isNew() {
		return this.staffRosterServiceId == null;
	}

	public Integer getStaffRosterServiceId() {
		return staffRosterServiceId;
	}

	public void setStaffRosterServiceId(Integer staffRosterServiceId) {
		this.staffRosterServiceId = staffRosterServiceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getServiceId() {
		return this.serviceId;
	}

	public Integer getStaffRosterId() {
		return staffRosterId;
	}

	public void setStaffRosterId(Integer staffRosterId) {
		this.staffRosterId = staffRosterId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public Integer getStaffId() {
		return this.staffId;
	}

	public void setRosterDate(Date rosterDate) {
		this.rosterDate = rosterDate;
	}

	public Date getRosterDate() {
		return this.rosterDate;
	}

	public void setNoOfHours(Double noOfHours) {
		this.noOfHours = noOfHours;
	}

	public Double getNoOfHours() {
		return this.noOfHours;
	}

	public void setPublicHoliday(Boolean publicHoliday) {
		this.publicHoliday = publicHoliday;
	}

	public Boolean getPublicHoliday() {
		return this.publicHoliday;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public Date getUpdatedOn() {
		return this.updatedOn;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public String getUpdatedBy() {
		return this.updatedBy;
	}

	public void setIncomeCenterId(Integer incomeCenterId) {
		this.incomeCenterId = incomeCenterId;
	}

	public Integer getIncomeCenterId() {
		return this.incomeCenterId;
	}

	public void setPersisted(Boolean persisted) {
		this.persisted = persisted;
	}

	public Boolean getPersisted() {
		return this.persisted;
	}

	public void setServices(Services services) {
		this.services = services;
	}

	public Services getServices() {
		return this.services;
	}

	public void setIncomeCentres(IncomeCentres incomeCentres) {
		this.incomeCentres = incomeCentres;
	}

	public IncomeCentres getIncomeCentres() {
		return this.incomeCentres;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public Staff getStaff() {
		return this.staff;
	}

	
	public boolean isEligible() {
		return isEligible;
	}

	public void setEligible(boolean isEligible) {
		this.isEligible = isEligible;
	}

	
	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	/*
	 * START Do not remove/edit this line. CodeGenerator will preserve any code
	 * between start and end tags.
	 */

	/*
	 * END Do not remove/edit this line. CodeGenerator will preserve any code
	 * between start and end tags.
	 */
	

}