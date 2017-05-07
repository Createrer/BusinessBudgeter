package com.f5infosol.businessbudgeter.domain;

import java.io.Serializable;
import java.util.Date;

public class CashSales implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer cashSalesId;
	private Integer serviceId;
	private Integer incomeCenterId;
	private Integer restaurantCovers;
	private Double restaurantFoodSales;
	private Double restaurantBeverageSales;
	private Double restaurantOtherSales;
	private Integer cafeCovers;
	private Double cafeFoodSales;
	private Double cafeBeverageSales;
	private Double cafeOtherSales;
	private Integer takeAwayCovers;
	private Double takeAwayFoodSales;
	private Double takeAwayBeverageSales;
	private Double takeAwayOtherSales;
	private Integer barCovers;
	private Double barFoodSales;
	private Double barBeverageSales;
	private Double barOtherSales;
	private Integer deliCovers;
	private Double deliFoodSales;
	private Double deliBeverageSales;
	private Double deliOtherSales;
	private Integer retailCovers;
	private Double retailFoodSales;
	private Double retailBeverageSales;
	private Double retailOtherSales;
	private Integer cateringCovers;
	private Double cateringFoodSales;
	private Double cateringBeverageSales;
	private Double cateringOtherSales;
	private Integer deliveryCovers;
	private Double deliveryFoodSales;
	private Double deliveryBeverageSales;
	private Double deliveryOtherSales;
	private Integer eventCovers;
	private Double eventFoodSales;
	private Double eventBeverageSales;
	private Double eventOtherSales;
	private Integer roomServiceCovers;
	private Double roomServiceFoodSales;
	private Double roomServiceBeverageSales;
	private Double roomServiceOtherSales;
	private Integer custom1Covers;
	private Double custom1FoodSales;
	private Double custom1BeverageSales;
	private Double custom1OtherSales;
	private Integer custom2Covers;
	private Double custom2FoodSales;
	private Double custom2BeverageSales;
	private Double custom2OtherSales;
	private Date cashupSalesDate;
	private Date updatedOn;
	private String updatedBy;
	public Integer getCashSalesId() {
		return cashSalesId;
	}
	public void setCashSalesId(Integer cashSalesId) {
		this.cashSalesId = cashSalesId;
	}
	public Integer getServiceId() {
		return serviceId;
	}
	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}
	public Integer getIncomeCenterId() {
		return incomeCenterId;
	}
	public void setIncomeCenterId(Integer incomeCenterId) {
		this.incomeCenterId = incomeCenterId;
	}
	public Integer getRestaurantCovers() {
		return restaurantCovers;
	}
	public void setRestaurantCovers(Integer restaurantCovers) {
		this.restaurantCovers = restaurantCovers;
	}
	public Double getRestaurantFoodSales() {
		return restaurantFoodSales;
	}
	public void setRestaurantFoodSales(Double restaurantFoodSales) {
		this.restaurantFoodSales = restaurantFoodSales;
	}
	public Double getRestaurantBeverageSales() {
		return restaurantBeverageSales;
	}
	public void setRestaurantBeverageSales(Double restaurantBeverageSales) {
		this.restaurantBeverageSales = restaurantBeverageSales;
	}
	public Double getRestaurantOtherSales() {
		return restaurantOtherSales;
	}
	public void setRestaurantOtherSales(Double restaurantOtherSales) {
		this.restaurantOtherSales = restaurantOtherSales;
	}
	public Integer getCafeCovers() {
		return cafeCovers;
	}
	public void setCafeCovers(Integer cafeCovers) {
		this.cafeCovers = cafeCovers;
	}
	public Double getCafeFoodSales() {
		return cafeFoodSales;
	}
	public void setCafeFoodSales(Double cafeFoodSales) {
		this.cafeFoodSales = cafeFoodSales;
	}
	public Double getCafeBeverageSales() {
		return cafeBeverageSales;
	}
	public void setCafeBeverageSales(Double cafeBeverageSales) {
		this.cafeBeverageSales = cafeBeverageSales;
	}
	public Double getCafeOtherSales() {
		return cafeOtherSales;
	}
	public void setCafeOtherSales(Double cafeOtherSales) {
		this.cafeOtherSales = cafeOtherSales;
	}
	public Integer getTakeAwayCovers() {
		return takeAwayCovers;
	}
	public void setTakeAwayCovers(Integer takeAwayCovers) {
		this.takeAwayCovers = takeAwayCovers;
	}
	public Double getTakeAwayFoodSales() {
		return takeAwayFoodSales;
	}
	public void setTakeAwayFoodSales(Double takeAwayFoodSales) {
		this.takeAwayFoodSales = takeAwayFoodSales;
	}
	public Double getTakeAwayBeverageSales() {
		return takeAwayBeverageSales;
	}
	public void setTakeAwayBeverageSales(Double takeAwayBeverageSales) {
		this.takeAwayBeverageSales = takeAwayBeverageSales;
	}
	public Double getTakeAwayOtherSales() {
		return takeAwayOtherSales;
	}
	public void setTakeAwayOtherSales(Double takeAwayOtherSales) {
		this.takeAwayOtherSales = takeAwayOtherSales;
	}
	public Integer getBarCovers() {
		return barCovers;
	}
	public void setBarCovers(Integer barCovers) {
		this.barCovers = barCovers;
	}
	public Double getBarFoodSales() {
		return barFoodSales;
	}
	public void setBarFoodSales(Double barFoodSales) {
		this.barFoodSales = barFoodSales;
	}
	public Double getBarBeverageSales() {
		return barBeverageSales;
	}
	public void setBarBeverageSales(Double barBeverageSales) {
		this.barBeverageSales = barBeverageSales;
	}
	public Double getBarOtherSales() {
		return barOtherSales;
	}
	public void setBarOtherSales(Double barOtherSales) {
		this.barOtherSales = barOtherSales;
	}
	public Integer getDeliCovers() {
		return deliCovers;
	}
	public void setDeliCovers(Integer deliCovers) {
		this.deliCovers = deliCovers;
	}
	public Double getDeliFoodSales() {
		return deliFoodSales;
	}
	public void setDeliFoodSales(Double deliFoodSales) {
		this.deliFoodSales = deliFoodSales;
	}
	public Double getDeliBeverageSales() {
		return deliBeverageSales;
	}
	public void setDeliBeverageSales(Double deliBeverageSales) {
		this.deliBeverageSales = deliBeverageSales;
	}
	public Double getDeliOtherSales() {
		return deliOtherSales;
	}
	public void setDeliOtherSales(Double deliOtherSales) {
		this.deliOtherSales = deliOtherSales;
	}
	public Integer getRetailCovers() {
		return retailCovers;
	}
	public void setRetailCovers(Integer retailCovers) {
		this.retailCovers = retailCovers;
	}
	public Double getRetailFoodSales() {
		return retailFoodSales;
	}
	public void setRetailFoodSales(Double retailFoodSales) {
		this.retailFoodSales = retailFoodSales;
	}
	public Double getRetailBeverageSales() {
		return retailBeverageSales;
	}
	public void setRetailBeverageSales(Double retailBeverageSales) {
		this.retailBeverageSales = retailBeverageSales;
	}
	public Double getRetailOtherSales() {
		return retailOtherSales;
	}
	public void setRetailOtherSales(Double retailOtherSales) {
		this.retailOtherSales = retailOtherSales;
	}
	public Integer getCateringCovers() {
		return cateringCovers;
	}
	public void setCateringCovers(Integer cateringCovers) {
		this.cateringCovers = cateringCovers;
	}
	public Double getCateringFoodSales() {
		return cateringFoodSales;
	}
	public void setCateringFoodSales(Double cateringFoodSales) {
		this.cateringFoodSales = cateringFoodSales;
	}
	public Double getCateringBeverageSales() {
		return cateringBeverageSales;
	}
	public void setCateringBeverageSales(Double cateringBeverageSales) {
		this.cateringBeverageSales = cateringBeverageSales;
	}
	public Double getCateringOtherSales() {
		return cateringOtherSales;
	}
	public void setCateringOtherSales(Double cateringOtherSales) {
		this.cateringOtherSales = cateringOtherSales;
	}
	public Integer getDeliveryCovers() {
		return deliveryCovers;
	}
	public void setDeliveryCovers(Integer deliveryCovers) {
		this.deliveryCovers = deliveryCovers;
	}
	public Double getDeliveryFoodSales() {
		return deliveryFoodSales;
	}
	public void setDeliveryFoodSales(Double deliveryFoodSales) {
		this.deliveryFoodSales = deliveryFoodSales;
	}
	public Double getDeliveryBeverageSales() {
		return deliveryBeverageSales;
	}
	public void setDeliveryBeverageSales(Double deliveryBeverageSales) {
		this.deliveryBeverageSales = deliveryBeverageSales;
	}
	public Double getDeliveryOtherSales() {
		return deliveryOtherSales;
	}
	public void setDeliveryOtherSales(Double deliveryOtherSales) {
		this.deliveryOtherSales = deliveryOtherSales;
	}
	public Integer getEventCovers() {
		return eventCovers;
	}
	public void setEventCovers(Integer eventCovers) {
		this.eventCovers = eventCovers;
	}
	public Double getEventFoodSales() {
		return eventFoodSales;
	}
	public void setEventFoodSales(Double eventFoodSales) {
		this.eventFoodSales = eventFoodSales;
	}
	public Double getEventBeverageSales() {
		return eventBeverageSales;
	}
	public void setEventBeverageSales(Double eventBeverageSales) {
		this.eventBeverageSales = eventBeverageSales;
	}
	public Double getEventOtherSales() {
		return eventOtherSales;
	}
	public void setEventOtherSales(Double eventOtherSales) {
		this.eventOtherSales = eventOtherSales;
	}
	public Integer getRoomServiceCovers() {
		return roomServiceCovers;
	}
	public void setRoomServiceCovers(Integer roomServiceCovers) {
		this.roomServiceCovers = roomServiceCovers;
	}
	public Double getRoomServiceFoodSales() {
		return roomServiceFoodSales;
	}
	public void setRoomServiceFoodSales(Double roomServiceFoodSales) {
		this.roomServiceFoodSales = roomServiceFoodSales;
	}
	public Double getRoomServiceBeverageSales() {
		return roomServiceBeverageSales;
	}
	public void setRoomServiceBeverageSales(Double roomServiceBeverageSales) {
		this.roomServiceBeverageSales = roomServiceBeverageSales;
	}
	public Double getRoomServiceOtherSales() {
		return roomServiceOtherSales;
	}
	public void setRoomServiceOtherSales(Double roomServiceOtherSales) {
		this.roomServiceOtherSales = roomServiceOtherSales;
	}
	public Integer getCustom1Covers() {
		return custom1Covers;
	}
	public void setCustom1Covers(Integer custom1Covers) {
		this.custom1Covers = custom1Covers;
	}
	public Double getCustom1FoodSales() {
		return custom1FoodSales;
	}
	public void setCustom1FoodSales(Double custom1FoodSales) {
		this.custom1FoodSales = custom1FoodSales;
	}
	public Double getCustom1BeverageSales() {
		return custom1BeverageSales;
	}
	public void setCustom1BeverageSales(Double custom1BeverageSales) {
		this.custom1BeverageSales = custom1BeverageSales;
	}
	public Double getCustom1OtherSales() {
		return custom1OtherSales;
	}
	public void setCustom1OtherSales(Double custom1OtherSales) {
		this.custom1OtherSales = custom1OtherSales;
	}
	public Integer getCustom2Covers() {
		return custom2Covers;
	}
	public void setCustom2Covers(Integer custom2Covers) {
		this.custom2Covers = custom2Covers;
	}
	public Double getCustom2FoodSales() {
		return custom2FoodSales;
	}
	public void setCustom2FoodSales(Double custom2FoodSales) {
		this.custom2FoodSales = custom2FoodSales;
	}
	public Double getCustom2BeverageSales() {
		return custom2BeverageSales;
	}
	public void setCustom2BeverageSales(Double custom2BeverageSales) {
		this.custom2BeverageSales = custom2BeverageSales;
	}
	public Double getCustom2OtherSales() {
		return custom2OtherSales;
	}
	public void setCustom2OtherSales(Double custom2OtherSales) {
		this.custom2OtherSales = custom2OtherSales;
	}
	public Date getCashupSalesDate() {
		return cashupSalesDate;
	}
	public void setCashupSalesDate(Date cashupSalesDate) {
		this.cashupSalesDate = cashupSalesDate;
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
