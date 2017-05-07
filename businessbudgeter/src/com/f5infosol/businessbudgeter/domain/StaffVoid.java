package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;

public class StaffVoid implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String staffId;
	private String satffName;
	private String position;
	

	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
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
	
}
