package com.f5infosol.businessbudgeter.dao.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.util.BusinessBudgeterUtil;

public class ServicesRowMapper implements ParameterizedRowMapper<Services>{

	@Override
	public Services mapRow(ResultSet rs, int index) throws SQLException {
		Services service = new Services();
		try {
			service.setServiceId(rs.getInt("service_id"));
			service.setIncomeCentreId(rs.getInt("income_centre_id"));
			service.setServiceName(rs.getString("service_name"));
			service.setDescription(rs.getString("description"));
			service.setStartTime(rs.getString("start_time"));
			service.setEndTime(rs.getString("end_time"));
			Date startDate = rs.getDate("start_date");
			service.setStartDate(BusinessBudgeterUtil.convertDateToString(startDate));
			Date endDate = rs.getDate("end_date");
			service.setEndDate(BusinessBudgeterUtil.convertDateToString(endDate));
			service.setRecurrence(rs.getBoolean("recurrence"));
			service.setRevenueProjection(rs.getInt("revenue_projection"));
			service.setLabourCostPct(rs.getInt("labour_cost_pct"));
			service.setUpdatedOn(rs.getDate("updated_on"));
			service.setUpdatedBy(rs.getString("updated_by"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return service;
	}

}
