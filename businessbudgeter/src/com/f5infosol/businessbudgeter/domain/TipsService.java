package com.f5infosol.businessbudgeter.domain;

import java.util.List;

public class TipsService {

	private String serviceName;
	private int serviceId;
	private double totalCash;
	private double toatalCrdCardPay;
	private double crdCardFees;
	private double slushAmount;
	private double shares;
	private double slushPct;
	
	List<CashUpTips> cashUpTips;
	List<StaffRostersServices> staffRosterService;

	public String getServiceName() {
		return serviceName;
	}


	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}


	public int getServiceId() {
		return serviceId;
	}


	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}


	public double getTotalCash() {
		return totalCash;
	}


	public void setTotalCash(double totalCash) {
		this.totalCash = totalCash;
	}


	public double getToatalCrdCardPay() {
		return toatalCrdCardPay;
	}


	public void setToatalCrdCardPay(double toatalCrdCardPay) {
		this.toatalCrdCardPay = toatalCrdCardPay;
	}


	public double getCrdCardFees() {
		return crdCardFees;
	}


	public void setCrdCardFees(double crdCardFees) {
		this.crdCardFees = crdCardFees;
	}


	public double getSlushAmount() {
		return slushAmount;
	}


	public void setSlushAmount(double slushAmount) {
		this.slushAmount = slushAmount;
	}


	public List<CashUpTips> getCashUpTips() {
		return cashUpTips;
	}


	public void setCashUpTips(List<CashUpTips> cashUpTips) {
		this.cashUpTips = cashUpTips;
	}


	public List<StaffRostersServices> getStaffRosterService() {
		return staffRosterService;
	}


	public void setStaffRosterService(List<StaffRostersServices> staffRosterService) {
		this.staffRosterService = staffRosterService;
	}


	public double getShares() {
		return shares;
	}


	public void setShares(double shares) {
		this.shares = shares;
	}


	public double getSlushPct() {
		return slushPct;
	}


	public void setSlushPct(double slushPct) {
		this.slushPct = slushPct;
	}
	
}
