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
public class CashUpSales implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int cashUpSalesId;
	
	private int serviceId;
	
	private double barFoodSales;
	
	private double barBeverageSales;
	
	private double eventFoodSales;
	
	private double eventBeverageSales;
	
	private double cateringFoodSales;
	
	private double cateringBeverageSales;
	
	private double retailFoodSales;
	
	private double retailBeverageSales;
	
	private double roomServiceFoodSales;
	
	private double roomServiceBeverageSales;
	
	private double barFoodSalesPax;
	
	private double barBeverageSalesPax;
	
	private double eventFoodSalesPax;
	
	private double eventBeverageSalesPax;
	
	private double cateringFoodSalesPax;
	
	private double cateringBeverageSalesPax;
	
	private double retailFoodSalesPax;
	
	private double retailBeverageSalesPax;
	
	private double roomServiceFoodSalesPax;
	
	private double roomServiceBeverageSalesPax;
	
	private Date updatedOn;
	
	private String updatedBy;

	public int getCashUpSalesId() {
		return cashUpSalesId;
	}

	public void setCashUpSalesId(int cashUpSalesId) {
		this.cashUpSalesId = cashUpSalesId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public double getBarFoodSales() {
		return barFoodSales;
	}

	public void setBarFoodSales(double barFoodSales) {
		this.barFoodSales = barFoodSales;
	}

	public double getBarBeverageSales() {
		return barBeverageSales;
	}

	public void setBarBeverageSales(double barBeverageSales) {
		this.barBeverageSales = barBeverageSales;
	}

	public double getEventFoodSales() {
		return eventFoodSales;
	}

	public void setEventFoodSales(double eventFoodSales) {
		this.eventFoodSales = eventFoodSales;
	}

	public double getEventBeverageSales() {
		return eventBeverageSales;
	}

	public void setEventBeverageSales(double eventBeverageSales) {
		this.eventBeverageSales = eventBeverageSales;
	}

	public double getCateringFoodSales() {
		return cateringFoodSales;
	}

	public void setCateringFoodSales(double cateringFoodSales) {
		this.cateringFoodSales = cateringFoodSales;
	}

	public double getCateringBeverageSales() {
		return cateringBeverageSales;
	}

	public void setCateringBeverageSales(double cateringBeverageSales) {
		this.cateringBeverageSales = cateringBeverageSales;
	}

	public double getRetailFoodSales() {
		return retailFoodSales;
	}

	public void setRetailFoodSales(double retailFoodSales) {
		this.retailFoodSales = retailFoodSales;
	}

	public double getRetailBeverageSales() {
		return retailBeverageSales;
	}

	public void setRetailBeverageSales(double retailBeverageSales) {
		this.retailBeverageSales = retailBeverageSales;
	}

	public double getRoomServiceFoodSales() {
		return roomServiceFoodSales;
	}

	public void setRoomServiceFoodSales(double roomServiceFoodSales) {
		this.roomServiceFoodSales = roomServiceFoodSales;
	}

	public double getRoomServiceBeverageSales() {
		return roomServiceBeverageSales;
	}

	public void setRoomServiceBeverageSales(double roomServiceBeverageSales) {
		this.roomServiceBeverageSales = roomServiceBeverageSales;
	}

	public double getBarFoodSalesPax() {
		return barFoodSalesPax;
	}

	public void setBarFoodSalesPax(double barFoodSalesPax) {
		this.barFoodSalesPax = barFoodSalesPax;
	}

	public double getBarBeverageSalesPax() {
		return barBeverageSalesPax;
	}

	public void setBarBeverageSalesPax(double barBeverageSalesPax) {
		this.barBeverageSalesPax = barBeverageSalesPax;
	}

	public double getEventFoodSalesPax() {
		return eventFoodSalesPax;
	}

	public void setEventFoodSalesPax(double eventFoodSalesPax) {
		this.eventFoodSalesPax = eventFoodSalesPax;
	}

	public double getEventBeverageSalesPax() {
		return eventBeverageSalesPax;
	}

	public void setEventBeverageSalesPax(double eventBeverageSalesPax) {
		this.eventBeverageSalesPax = eventBeverageSalesPax;
	}

	public double getCateringFoodSalesPax() {
		return cateringFoodSalesPax;
	}

	public void setCateringFoodSalesPax(double cateringFoodSalesPax) {
		this.cateringFoodSalesPax = cateringFoodSalesPax;
	}

	public double getCateringBeverageSalesPax() {
		return cateringBeverageSalesPax;
	}

	public void setCateringBeverageSalesPax(double cateringBeverageSalesPax) {
		this.cateringBeverageSalesPax = cateringBeverageSalesPax;
	}

	public double getRetailFoodSalesPax() {
		return retailFoodSalesPax;
	}

	public void setRetailFoodSalesPax(double retailFoodSalesPax) {
		this.retailFoodSalesPax = retailFoodSalesPax;
	}

	public double getRetailBeverageSalesPax() {
		return retailBeverageSalesPax;
	}

	public void setRetailBeverageSalesPax(double retailBeverageSalesPax) {
		this.retailBeverageSalesPax = retailBeverageSalesPax;
	}

	public double getRoomServiceFoodSalesPax() {
		return roomServiceFoodSalesPax;
	}

	public void setRoomServiceFoodSalesPax(double roomServiceFoodSalesPax) {
		this.roomServiceFoodSalesPax = roomServiceFoodSalesPax;
	}

	public double getRoomServiceBeverageSalesPax() {
		return roomServiceBeverageSalesPax;
	}

	public void setRoomServiceBeverageSalesPax(double roomServiceBeverageSalesPax) {
		this.roomServiceBeverageSalesPax = roomServiceBeverageSalesPax;
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
