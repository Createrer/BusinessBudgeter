package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.IncomeCentres;

public class IncomeCentresRowMapper implements ParameterizedRowMapper<IncomeCentres>{

	@Override
	public IncomeCentres mapRow(ResultSet rs, int index) throws SQLException {
		IncomeCentres incomeCentres = new IncomeCentres();
		try {
			incomeCentres.setIncomeCentreId(rs.getInt("income_centre_id"));
			incomeCentres.setCompanyId(rs.getInt("company_id"));
			incomeCentres.setIcName(rs.getString("ic_name"));
			try {
				incomeCentres.setCompanyName(rs.getString("company_name"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			incomeCentres.setLocation(rs.getString("location"));
			incomeCentres.setDetails(rs.getString("details"));
			incomeCentres.setRestaurant(rs.getBoolean("restaurant"));
			incomeCentres.setCafe(rs.getBoolean("cafe"));
			incomeCentres.setTakeAway(rs.getBoolean("takeaway"));
			incomeCentres.setBar(rs.getBoolean("bar"));
			incomeCentres.setDeli(rs.getBoolean("deli"));
			incomeCentres.setRetail(rs.getBoolean("retail"));
			incomeCentres.setCatering(rs.getBoolean("catering"));
			incomeCentres.setDelivery(rs.getBoolean("delivery"));
			incomeCentres.setEvent(rs.getBoolean("event"));
			incomeCentres.setRoomService(rs.getBoolean("room_service"));
			incomeCentres.setCustom1(rs.getBoolean("custom1"));
			incomeCentres.setCustom2(rs.getBoolean("custom2"));
			incomeCentres.setIsEnable(rs.getBoolean("is_enable"));
			incomeCentres.setUpdatedOn(rs.getDate("updated_on"));
			incomeCentres.setUpdatedBy(rs.getString("updated_by"));
			incomeCentres.setSlush(rs.getDouble("Slush_pct"));
			incomeCentres.setFees(rs.getDouble("Fees_pct"));
			incomeCentres.setFoodCost(rs.getDouble("Food_cost_pct"));
			incomeCentres.setBeverageCost(rs.getDouble("Bev_cost_pct"));
			incomeCentres.setFoodIncome(rs.getDouble("Food_Income_pct"));
			incomeCentres.setBeverageIncome(rs.getDouble("Beverage_Income_pct"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return incomeCentres;
	}

}
