package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.CashupSalesDomain;

public class CashUpSalesDomainRowMapper implements ParameterizedRowMapper<List<CashupSalesDomain>>{

	@Override
	public List<CashupSalesDomain> mapRow(ResultSet rs, int index) throws SQLException {
		
		List<CashupSalesDomain> list = new ArrayList<CashupSalesDomain>();
		try {
			
			int cashupSalesId = rs.getInt("cashup_sales_id");
			list.add(getCashupObjectFor(cashupSalesId, "food_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "beverage_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "bar_food_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "bar_beverage_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "event_food_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "event_beverage_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "catering_food_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "catering_beverage_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "retail_food_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "retail_beverage_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "room_service_food_sales", rs));
			list.add(getCashupObjectFor(cashupSalesId, "room_service_beverage_sales", rs));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	private CashupSalesDomain getCashupObjectFor(int cashupSalesId , String cashupSaleName,ResultSet rs) throws SQLException{
		CashupSalesDomain cashUpSales = new CashupSalesDomain();
		cashUpSales.setCashUpSalesId(cashupSalesId);
		cashUpSales.setCashUpSaleName(cashupSaleName);
		cashUpSales.setAvailable(rs.getBoolean(cashupSaleName));
		return cashUpSales;
	
	}
}
