package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashSales;

public class CashSalesRowMapper implements ParameterizedRowMapper<CashSales>{

	@Override
	public CashSales mapRow(ResultSet rs, int index) throws SQLException {
		CashSales cashSale = new CashSales();
		try {
			cashSale.setCashSalesId(rs.getInt("cash_sales_id"));
			cashSale.setServiceId(rs.getInt("service_id"));
			cashSale.setIncomeCenterId(rs.getInt("income_center_id"));
			cashSale.setRestaurantCovers(rs.getInt("restaurant_covers"));
			cashSale.setRestaurantFoodSales(rs.getDouble("restaurant_food_sales"));
			cashSale.setRestaurantBeverageSales(rs.getDouble("restaurant_beverage_sales"));
			cashSale.setRestaurantOtherSales(rs.getDouble("restaurant_other_sales"));
			cashSale.setCafeCovers(rs.getInt("cafe_covers"));
			cashSale.setCafeFoodSales(rs.getDouble("cafe_food_sales"));
			cashSale.setCafeBeverageSales(rs.getDouble("cafe_beverage_sales"));
			cashSale.setCafeOtherSales(rs.getDouble("cafe_other_sales"));
			cashSale.setTakeAwayCovers(rs.getInt("takeaway_covers"));
			cashSale.setTakeAwayFoodSales(rs.getDouble("takeaway_food_sales"));
			cashSale.setTakeAwayBeverageSales(rs.getDouble("takeaway_beverage_sales"));
			cashSale.setTakeAwayOtherSales(rs.getDouble("takeaway_other_sales"));
			cashSale.setBarCovers(rs.getInt("bar_covers"));
			cashSale.setBarFoodSales(rs.getDouble("bar_food_sales"));
			cashSale.setBarBeverageSales(rs.getDouble("bar_beverage_sales"));
			cashSale.setBarOtherSales(rs.getDouble("bar_other_sales"));
			cashSale.setDeliCovers(rs.getInt("deli_covers"));
			cashSale.setDeliFoodSales(rs.getDouble("deli_food_sales"));
			cashSale.setDeliBeverageSales(rs.getDouble("deli_beverage_sales"));
			cashSale.setDeliOtherSales(rs.getDouble("deli_other_sales"));
			cashSale.setRetailCovers(rs.getInt("retail_covers"));
			cashSale.setRetailFoodSales(rs.getDouble("retail_food_sales"));
			cashSale.setRetailBeverageSales(rs.getDouble("retail_beverage_sales"));
			cashSale.setRetailOtherSales(rs.getDouble("retail_other_sales"));
			cashSale.setCateringCovers(rs.getInt("catering_covers"));
			cashSale.setCateringFoodSales(rs.getDouble("catering_food_sales"));
			cashSale.setCateringBeverageSales(rs.getDouble("deli_beverage_sales"));
			cashSale.setCateringOtherSales(rs.getDouble("catering_other_sales"));
			cashSale.setDeliveryCovers(rs.getInt("delivery_covers"));
			cashSale.setDeliveryFoodSales(rs.getDouble("delivery_food_sales"));
			cashSale.setDeliveryBeverageSales(rs.getDouble("delivery_beverage_sales"));
			cashSale.setDeliveryOtherSales(rs.getDouble("delivery_other_sales"));
			cashSale.setEventCovers(rs.getInt("event_covers"));
			cashSale.setEventFoodSales(rs.getDouble("event_food_sales"));
			cashSale.setEventBeverageSales(rs.getDouble("event_beverage_sales"));
			cashSale.setEventOtherSales(rs.getDouble("event_other_sales"));
			cashSale.setRoomServiceCovers(rs.getInt("room_service_covers"));
			cashSale.setRoomServiceFoodSales(rs.getDouble("room_service_food_sales"));
			cashSale.setRoomServiceBeverageSales(rs.getDouble("room_service_beverage_sales"));
			cashSale.setRoomServiceOtherSales(rs.getDouble("room_service_other_sales"));
			cashSale.setCustom1Covers(rs.getInt("custom1_covers"));
			cashSale.setCustom1FoodSales(rs.getDouble("custom1_food_sales"));
			cashSale.setCustom1BeverageSales(rs.getDouble("custom1_beverage_sales"));
			cashSale.setCustom1OtherSales(rs.getDouble("custom1_other_sales"));
			cashSale.setCustom2Covers(rs.getInt("custom2_covers"));
			cashSale.setCustom2FoodSales(rs.getDouble("custom2_food_sales"));
			cashSale.setCustom2BeverageSales(rs.getDouble("custom2_beverage_sales"));
			cashSale.setCustom2OtherSales(rs.getDouble("custom2_other_sales"));
			cashSale.setUpdatedOn(rs.getDate("updated_on"));
			cashSale.setUpdatedBy(rs.getString("updated_by"));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cashSale;
	}

}
