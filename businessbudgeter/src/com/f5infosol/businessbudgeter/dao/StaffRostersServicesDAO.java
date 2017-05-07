package com.f5infosol.businessbudgeter.dao;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRostersServicesDB;
import com.f5infosol.businessbudgeter.domain.StaffRostersServices;
import com.f5infosol.businessbudgeter.domain.User;

/**
 * This class is generated by Spring Data Jdbc code generator.
 * 
 * @author Spring Data Jdbc Code Generator
 */
@Repository
public class StaffRostersServicesDAO extends BaseDAOImpl {

	final static Logger logger = LoggerFactory.getLogger(StaffRostersServicesDAO.class);

	public List<StaffRostersServices> getStaffRostersServices(Date transactionRosterDate, Integer incomeCenterId, User userDetails) {
		Object[] param = { incomeCenterId, transactionRosterDate };
		return jdbcTemplate.query(Queries.GET_STAFF_ROSTERS_SERVICES, StaffRostersServicesDB.ROW_MAPPER, param);
	}

}