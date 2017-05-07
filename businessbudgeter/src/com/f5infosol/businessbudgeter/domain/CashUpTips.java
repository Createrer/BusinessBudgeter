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
public class CashUpTips implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer cashUpTipsId;
	
	private Integer serviceId;
	
	private Double cerditCardTips;
	
	private Double cashTips;
	
	private Date updatedOn;
	
	private String updatedBy;
	
	private Date tipsDate;
	
	private Double feesPct;
	
	private Double slushPct;
	
	
	public Integer getCashUpTipsId() {
		return cashUpTipsId;
	}

	public void setCashUpTipsId(Integer cashUpTipsId) {
		this.cashUpTipsId = cashUpTipsId;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Double getCerditCardTips() {
		return cerditCardTips;
	}

	public void setCerditCardTips(Double cerditCardTips) {
		this.cerditCardTips = cerditCardTips;
	}

	public Double getCashTips() {
		return cashTips;
	}

	public void setCashTips(Double cashTips) {
		this.cashTips = cashTips;
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

	public Date getTipsDate() {
		return tipsDate;
	}

	public void setTipsDate(Date tipsDate) {
		this.tipsDate = tipsDate;
	}

	public Double getFeesPct() {
		return feesPct;
	}

	public void setFeesPct(Double feesPct) {
		this.feesPct = feesPct;
	}

	public Double getSlushPct() {
		return slushPct;
	}

	public void setSlushPct(Double slushPct) {
		this.slushPct = slushPct;
	}
	
	

}
