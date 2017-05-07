package com.f5infosol.businessbudgeter.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.ServicesRowMapper;
import com.f5infosol.businessbudgeter.domain.Services;

@Repository
public class ServiceDAOImpl extends BaseDAOImpl implements ServiceDAO {
	
	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	public List<Services> getServices() {
		List<Services> serviceList = jdbcTemplate.query(Queries.GET_ALL_SERVICES, new ServicesRowMapper());
		if (serviceList != null && serviceList.size() > 0) {
			return serviceList;
		} else {
			return null;
		}
	}
	
}
