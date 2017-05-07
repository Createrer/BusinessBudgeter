package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashUpSales;

public class CashUpSalesRowMapper implements ParameterizedRowMapper<CashUpSales>{
	
	@Override
	public CashUpSales mapRow(ResultSet rs, int index) throws SQLException {
		CashUpSales cashUpSale = new CashUpSales();
		try {
			cashUpSale.setCashUpSalesId(rs.getInt("cashup_sales_id"));
			cashUpSale.setServiceId(rs.getInt("service_id"));
			cashUpSale.setBarFoodSales(rs.getInt("bar_food_sales"));
			cashUpSale.setBarBeverageSales(rs.getInt("bar_beverage_sales"));
			cashUpSale.setEventFoodSales(rs.getInt("event_food_sales"));
			cashUpSale.setEventBeverageSales(rs.getInt("event_beverage_sales"));
			cashUpSale.setCateringFoodSales(rs.getInt("catering_food_sales"));
			cashUpSale.setCateringBeverageSales(rs.getInt("catering_beverage_sales"));
			cashUpSale.setRetailFoodSales(rs.getInt("retail_food_sales"));
			cashUpSale.setRetailBeverageSales(rs.getInt("retail_beverage_sales"));
			cashUpSale.setRoomServiceFoodSales(rs.getInt("room_service_food_sales"));
			cashUpSale.setRoomServiceBeverageSales(rs.getInt("room_service_beverage_sales"));
			cashUpSale.setBarFoodSalesPax(rs.getInt("bar_food_sales_pax"));
			cashUpSale.setBarBeverageSalesPax(rs.getInt("bar_beverage_sales_pax"));
			cashUpSale.setEventFoodSalesPax(rs.getInt("event_food_sales_pax"));
			cashUpSale.setEventBeverageSalesPax(rs.getInt("event_beverage_sales_pax"));
			cashUpSale.setCateringFoodSalesPax(rs.getInt("catering_food_sales_pax"));
			cashUpSale.setCateringBeverageSalesPax(rs.getInt("catering_beverage_sales_pax"));
			cashUpSale.setRetailFoodSalesPax(rs.getInt("retail_food_sales_pax"));
			cashUpSale.setRetailBeverageSalesPax(rs.getInt("retail_beverage_sales_pax"));
			cashUpSale.setRoomServiceFoodSalesPax(rs.getInt("room_service_food_sales_pax"));
			cashUpSale.setRoomServiceBeverageSalesPax(rs.getInt("room_service_beverage_sales_pax"));
			cashUpSale.setUpdatedOn(rs.getDate("updated_on"));
			cashUpSale.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cashUpSale;
	}

}
