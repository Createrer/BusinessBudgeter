package com.f5infosol.businessbudgeter.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRostersDB;
import com.f5infosol.businessbudgeter.domain.StaffRosters;
import com.f5infosol.businessbudgeter.domain.User;

/**
 * This class is generated by Spring Data Jdbc code generator.
 * 
 * @author Spring Data Jdbc Code Generator
 */
@Repository
public class StaffRostersDAO extends BaseDAOImpl {

	final static Logger logger = LoggerFactory.getLogger(StaffRostersDAO.class);

	public List<StaffRosters> getStaffRostersByIncomeCenterId(Long incomeCenterId) {
		String sql = "select * from " + StaffRostersDB.getTableName() + " where " + StaffRostersDB.COLUMNS.INCOME_CENTER_ID.getColumnName() + " = ? ";
		return null;// this.getJdbcOperations ().query (sql, new Object[] {
					// incomeCenterId }, StaffRostersDB.ROW_MAPPER);
	}

	public List<StaffRosters> getStaffRostersByStaffId(Long staffId) {
		String sql = "select * from " + StaffRostersDB.getTableName() + " where " + StaffRostersDB.COLUMNS.STAFF_ID.getColumnName() + " = ? ";
		return null;// this.getJdbcOperations ().query (sql, new Object[] {
					// staffId }, StaffRostersDB.ROW_MAPPER);
	}

	public List<StaffRosters> getStaffRosters(Date transactionRosterDate, Integer incomeCenterId, User userDetails, String workofhouse) {

		Object[] param = { incomeCenterId, transactionRosterDate, workofhouse };
		if (workofhouse.equals("boh")) {
			return jdbcTemplate.query(Queries.GET_STAFF_ROSTERS_BOH, param, StaffRostersDB.ROW_MAPPER);
		} else if (workofhouse.equals("foh")) {
			return jdbcTemplate.query(Queries.GET_STAFF_ROSTERS_FOH, param, StaffRostersDB.ROW_MAPPER);
		} else if (workofhouse.equals("All")) {
			Object[] param1 = { incomeCenterId, transactionRosterDate };
			return jdbcTemplate.query(Queries.GET_STAFF_ROSTERS_ALL, param1, StaffRostersDB.ROW_MAPPER);
		} else {
			return null;
		}
	}

	public void updateShiftRoster(int satff_roster_id, String start_time, String finish_time, String total_hours) {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		total_hours = total_hours.replace(":", ".");
		try {
			jdbcTemplate.update(Queries.UPDATE_SHIFT_ROSTER, new Object[] { sdf.parse(start_time), sdf.parse(finish_time), new Double(total_hours), satff_roster_id });
		} catch (DataAccessException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

}
