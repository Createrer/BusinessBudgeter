package com.f5infosol.businessbudgeter.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.BudgetSettingRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.BudgetSettingsRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashDrawersRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CompaniesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.EventsRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.IncomeCentresRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.RosterEventRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.ServicesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.UserRowMapper;
import com.f5infosol.businessbudgeter.domain.Budget;
import com.f5infosol.businessbudgeter.domain.BudgetSetting;
import com.f5infosol.businessbudgeter.domain.BudgetSettings;
import com.f5infosol.businessbudgeter.domain.CashDrawers;
import com.f5infosol.businessbudgeter.domain.Companies;
import com.f5infosol.businessbudgeter.domain.Events;
import com.f5infosol.businessbudgeter.domain.IncomeCentres;
import com.f5infosol.businessbudgeter.domain.RosterEvent;
import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.User;

@Repository
public class SettingDAOImpl extends BaseDAOImpl implements SettingDAO {

	protected final Log logger = LogFactory.getLog(getClass());

	/*
	 * @Override public List<RosterEvent> getSettingEventList(Date
	 * transactionDate) { Object[] param = { transactionDate };
	 * List<RosterEvent> event =
	 * jdbcTemplate.query(Queries.GET_SETTING_EVENTS_LIST, param, new
	 * RosterEventRowMapper()); if (event != null && event.size() > 0) { return
	 * event; } else { return null; } }
	 * 
	 * @Override public boolean getSettingEventList(int eventid, String
	 * eventname) { boolean isAdded = false;
	 * 
	 * try { if (eventid > 0) {
	 * 
	 * Object[] param = { eventname , eventid };
	 * jdbcTemplate.update(Queries.UPDATE_SETTINGS_EVENT_DETAIL , param); } else
	 * { String qrymealId = "select max(eventid)+1 from roster_event ";
	 * SqlRowSet rsMaxId = selectResults(qrymealId);
	 * 
	 * int beverageid = 0; if (rsMaxId.next()) { beverageid = rsMaxId.getInt(1);
	 * }
	 * 
	 * Object[] param = { eventname , eventid };
	 * jdbcTemplate.update(Queries.INSERT_NEW_BEVERAGE, param); } isAdded =
	 * true; } catch (Exception e) { isAdded = false; e.printStackTrace(); }
	 * 
	 * return isAdded; }
	 */

	@Override
	public Staff getStaffDetail(int staffid) {
		Integer[] param = { staffid };
		List<Staff> staff = jdbcTemplate.query(Queries.GET_STAFF_DETAILS, param, new StaffRowMapper());
		if (staff != null && staff.size() > 0) {
			// /select user where staff is used as FK
			Staff st = staff.get(0);
			int staff_id = st.getStaffId();
			if(st.getSettingAccess() || st.getCashupAccess() || st.getRosterAccess() || st.getReportAccess())
				st.setSystemEnable(true);
			
			// select * from users where staffid = staff_id
			List<User> user = jdbcTemplate.query(Queries.GET_ACCESSUSER_DETAILS, param, new UserRowMapper());
			if (user != null && user.size() > 0){
				st.setUser(user.get(0));
				st.setSystemEnable(true);
			}
			return st;
		}

		else
			return null;
	}

	/*
	 * @Override public boolean addNewStaff(int staffid, String staffName,
	 * String address, String level, String position, String hourlyDailyRate,
	 * String saturdayRate, String sundayRate, String publicHolidaydayRate,
	 * String otherRate, String employeeStatus, String agency, User userDetails)
	 * {
	 * 
	 * boolean isAdded = false; Date updatedOn =
	 * Calendar.getInstance().getTime(); try { if (staffid > 0) { Object[] param
	 * = {staffName, address, position, Integer.parseInt(level),
	 * Double.parseDouble(hourlyDailyRate), Double.parseDouble(saturdayRate),
	 * Double.parseDouble(sundayRate), Double.parseDouble(publicHolidaydayRate),
	 * Double.parseDouble(otherRate), employeeStatus, agency, updatedOn,
	 * userDetails.getUserName(), staffid };
	 * jdbcTemplate.update(Queries.UPDATE_STAFF_DETAIL, param); } else { int
	 * companyId = 301; Object[] param = {companyId, staffName, address,
	 * position, Integer.parseInt(level), Double.parseDouble(hourlyDailyRate),
	 * Double.parseDouble(saturdayRate), Double.parseDouble(sundayRate),
	 * Double.parseDouble(publicHolidaydayRate), Double.parseDouble(otherRate),
	 * employeeStatus, agency, userDetails.getUserName() };
	 * jdbcTemplate.update(Queries.INSERT_NEW_STAFF, param); } isAdded = true; }
	 * catch (Exception e) { isAdded = false; e.printStackTrace(); }
	 * 
	 * return isAdded; }
	 */

	@Override
	public void deleteStaff(String staffId) {
		String deleteUser = "delete from accessuser where staff_id = " + staffId;
		update(deleteUser);
		String deleteStaff = "delete from staff where staff_id = " + staffId;
		update(deleteStaff);

	}

	@Override
	public List<Staff> searchStaffName(String staffName) {
		String[] s = { "%" + staffName + "%" };
		List<Staff> staff = jdbcTemplate.query(Queries.SEARCH_STAFF_BY_NAME, s, new StaffRowMapper());
		return staff;
	}

	@Override
	public List<Staff> getAllStaffList() {
		List<Staff> staffList = jdbcTemplate.query(Queries.GET_STAFF, new StaffRowMapper());
		if (staffList != null && staffList.size() > 0) {
			return staffList;
		} else {
			return null;
		}
	}

	@Override
	public List<Events> getAllEventList() {
		List<Events> eventList = jdbcTemplate.query(Queries.GET_EVENT_DETAILS, new EventsRowMapper());
		if (eventList != null && eventList.size() > 0) {
			return eventList;
		} else {
			return null;
		}
	}

	@Override
	public List<Events> searchEventByName(String eventName) {
		String[] s = { "%" + eventName + "%" };
		List<Events> event = jdbcTemplate.query(Queries.SEARCH_EVENT_BY_NAME, s, new EventsRowMapper());
		return event;
	}

	@Override
	public Events getEventDetail(int eventid) {
		Integer[] param = { eventid };
		List<Events> eventList = jdbcTemplate.query(Queries.GET_EVENT_DETAILS_BY_ID, param, new EventsRowMapper());
		if (eventList != null && eventList.size() > 0)
			return eventList.get(0);
		else
			return null;
	}

	@Override
	public boolean addNewEvent(int eventid, String eventName, String foodBudgetedIncome, String foodActual, String beverageBudgetedIncome, String beverageActual, String otherBudgetedIncome, String otherActual, String totalBudgetedIncome, String totalActual, String labourCost, User userDetails) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			if (eventid > 0) {
				Object[] param = { eventName, Double.parseDouble(foodBudgetedIncome), Double.parseDouble(foodActual), Double.parseDouble(beverageBudgetedIncome), Double.parseDouble(beverageActual), Double.parseDouble(otherBudgetedIncome), Double.parseDouble(otherActual), Double.parseDouble(totalBudgetedIncome), Double.parseDouble(totalActual), Double.parseDouble(labourCost), updatedOn, userDetails.getUserName(), eventid };
				jdbcTemplate.update(Queries.UPDATE_EVENT_DETAIL, param);
			} else {
				Object[] param = { eventName, Double.parseDouble(foodBudgetedIncome), Double.parseDouble(foodActual), Double.parseDouble(beverageBudgetedIncome), Double.parseDouble(beverageActual), Double.parseDouble(otherBudgetedIncome), Double.parseDouble(otherActual), Double.parseDouble(totalBudgetedIncome), Double.parseDouble(totalActual), Double.parseDouble(labourCost), userDetails.getUserName() };
				jdbcTemplate.update(Queries.INSERT_NEW_EVENT, param);
			}
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}

		return isAdded;
	}

	@Override
	public void deleteEvent(String eventId) {
		String deleteEvent = "delete from events where event_id = " + eventId;
		update(deleteEvent);
	}

	@Override
	public List<User> searchUserName(String userName) {
		String[] s = { "%" + userName + "%" };
		List<User> user = jdbcTemplate.query(Queries.SEARCH_USER_BY_NAME, s, new UserRowMapper());
		return user;
	}

	@Override
	public User getUserDetail(int userid) {
		Integer[] param = { userid };
		List<User> user = jdbcTemplate.query(Queries.GET_USER_DETAILS, param, new UserRowMapper());
		if (user != null && user.size() > 0)
			return user.get(0);
		else
			return null;
	}

	@Override
	public boolean addNewUser(int userid, String fullName, String userName, String password, String companyName) {

		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		String encryptPass = getMD5(password);
		try {
			if (userid > 0) {
				Object[] param = { fullName, userName, password, companyName, userid };
				jdbcTemplate.update(Queries.UPDATE_USER_DETAIL, param);
			} else {
				int companyId = 301;
				Object[] param = { companyId, fullName, userName, encryptPass, companyName };
				jdbcTemplate.update(Queries.INSERT_NEW_USER, param);
			}
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}

		return isAdded;
	}

	@Override
	public void deleteUser(String userId) {
		String deleteUser = "delete from accessuser where userid = " + userId;
		update(deleteUser);
	}

	@Override
	public List<User> getAllUserList() {
		List<User> userList = jdbcTemplate.query(Queries.GET_USER, new UserRowMapper());
		if (userList != null && userList.size() > 0) {
			return userList;
		} else {
			return null;
		}
	}

	@Override
	public boolean createNewPassword(int userid, String password) {

		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			if (userid > 0) {
				Object[] param = { password, userid };
				jdbcTemplate.update(Queries.UPDATE_PASSWORD, param);
			}
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}

		return isAdded;
	}

	public static String getMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashtext = number.toString(16);
			// Now we need to zero pad it if you actually want the full 32
			// chars.
			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<CashDrawers> getAllCashDrawerList() {
		List<CashDrawers> cashDrawerList = jdbcTemplate.query(Queries.GET_CASH_DRAWER, new CashDrawersRowMapper());
		if (cashDrawerList != null && cashDrawerList.size() > 0) {
			return cashDrawerList;
		} else {
			return null;
		}
	}

	@Override
	public List<Services> getAllServiceList() {
		List<Services> serviceList = jdbcTemplate.query(Queries.GET_ALL_SERVICES, new ServicesRowMapper());
		if (serviceList != null && serviceList.size() > 0) {
			return serviceList;
		} else {
			return null;
		}
	}

	@Override
	public CashDrawers getCashDrawerDetail(int drawerid) {
		Integer[] param = { drawerid };
		List<CashDrawers> cashDrawerList = jdbcTemplate.query(Queries.GET_CASH_DRAWER_DETAILS, param, new CashDrawersRowMapper());
		if (cashDrawerList != null && cashDrawerList.size() > 0) {
			return cashDrawerList.get(0);
		} else {
			return null;
		}
	}

	@Override
	public boolean addNewCashDrawer(int drawerid, String drawerName, String incomeCenterId, String description, User userDetails) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			if (drawerid > 0) {
				Object[] param = { userDetails.getUserId(), Integer.parseInt(incomeCenterId), drawerName, description, updatedOn, userDetails.getUserName(), drawerid };
				jdbcTemplate.update(Queries.UPDATE_CASH_DRAWER, param);
			} else {
				Object[] param = { userDetails.getUserId(), Integer.parseInt(incomeCenterId), drawerName, description, userDetails.getUserName() };
				jdbcTemplate.update(Queries.INSERT_NEW_CASH_DRAWER, param);
			}
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}

		return isAdded;
	}

	@Override
	public void deleteCashDrawer(String drawerId) {
		String deleteDrawer = "delete from cash_drawers where cash_drawer_id = " + drawerId;
		update(deleteDrawer);
	}

	@Override
	public List<CashDrawers> searchDrawerByName(String drawerName, String incomeCenterId) {

		Object[] param = { Integer.parseInt(incomeCenterId), "%" + drawerName + "%" };
		List<CashDrawers> drawer = jdbcTemplate.query(Queries.SEARCH_DRAWER_BY_NAME, param, new CashDrawersRowMapper());
		return drawer;
	}

	@Override
	public Services getServiceDetail(int serviceid) {
		Integer[] param = { serviceid };

		List<Services> services = jdbcTemplate.query(Queries.GET_SERVICES_NAME, param, new ServicesRowMapper());
		if (services != null && services.size() > 0) {
			return services.get(0);
		} else {
			return null;
		}
	}

	@Override
	public boolean addNewService(int serviceid, String serviceName, String incomeCenterId, String description, String recurrence, String startTime, String endTime, String startDate, String revenueProjection, String labourCost, User userDetails) {

		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		//Date start_Date = BusinessBudgeterUtil.convertStringToDateForTran(startDate);
		Date start_Date = new Date();
		// Date end_Date =
		// BusinessBudgeterUtil.convertStringToDateForTran(endDate);
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		try {
			if (serviceid > 0) {
				Object[] param = { serviceName, Integer.parseInt(incomeCenterId), description, Boolean.parseBoolean(recurrence), sdf.parse(startTime), sdf.parse(endTime), start_Date, Integer.parseInt(revenueProjection), Integer.parseInt(labourCost), updatedOn, userDetails.getUserName(), serviceid };
				jdbcTemplate.update(Queries.UPDATE_SERVICE_DETAIL, param);
			} else {
				Object[] param = { serviceName, Integer.parseInt(incomeCenterId), description, Boolean.parseBoolean(recurrence), sdf.parse(startTime), sdf.parse(endTime), start_Date, Integer.parseInt(revenueProjection), Integer.parseInt(labourCost), userDetails.getUserName() };
				jdbcTemplate.update(Queries.INSERT_NEW_SERVICE, param);
			}
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}

		return isAdded;
	}

	@Override
	public void deleteService(String serviceId) {
		String deleteService = "delete from services where service_id = " + serviceId;
		update(deleteService);

	}

	@Override
	public List<Services> searchServiceByName(String serviceName, String incomeCenterId) {

		Object[] param = { Integer.parseInt(incomeCenterId), "%" + serviceName + "%" };
		List<Services> service = jdbcTemplate.query(Queries.SEARCH_SERVICE_BY_NAME, param, new ServicesRowMapper());
		return service;
	}

	@Override
	public List<IncomeCentres> getAllIncomeCenters() {
		List<IncomeCentres> incomeCentreList = jdbcTemplate.query(Queries.GET_ALL_INCOME_CENTER, new IncomeCentresRowMapper());
		if (incomeCentreList != null && incomeCentreList.size() > 0) {
			return incomeCentreList;
		} else {
			return null;
		}
	}

	@Override
	public void deleteIncomeCenter(String incomeCenterId) {
		String deleteIncomeCenter = "delete from income_centres where income_centre_id = " + incomeCenterId;
		update(deleteIncomeCenter);

	}

	@Override
	public List<IncomeCentres> searchIncomeCenterByName(String incomeCenterName) {
		String[] s = { "%" + incomeCenterName + "%" };
		List<IncomeCentres> incomeCenter = jdbcTemplate.query(Queries.SEARCH_INCOME_CENTER_BY_NAME, s, new IncomeCentresRowMapper());
		return incomeCenter;
	}

	@Override
	public IncomeCentres getIncomeCenterDetail(int incomecenterid) {
		Integer[] param = { incomecenterid };

		List<IncomeCentres> incomeCentres = jdbcTemplate.query(Queries.GET_INCOME_CENTER_BY_ID, param, new IncomeCentresRowMapper());
		if (incomeCentres != null && incomeCentres.size() > 0) {
			return incomeCentres.get(0);
		} else
			return null;
	}

	@Override
	public boolean addNewIncomeCenter(int incomecenter_id, String income_center_name, String company_id, String location, String details, String restaurant, String cafe, String takeAway, String bar, String deli, String retail, String catering, String delivery, String event, String roomService, String custom1, String custom2, User userDetails, String slush, String fees, String food_cost, String beverage_cost, String food_income, String beverage_income, String weekly_turnover) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();

		try {
			if (incomecenter_id > 0) {
				Object[] param = { Integer.parseInt(company_id), income_center_name, location, details, Boolean.parseBoolean(restaurant), Boolean.parseBoolean(cafe), Boolean.parseBoolean(takeAway), Boolean.parseBoolean(bar), Boolean.parseBoolean(deli), Boolean.parseBoolean(retail), Boolean.parseBoolean(catering), Boolean.parseBoolean(delivery), Boolean.parseBoolean(event), Boolean.parseBoolean(roomService), Boolean.parseBoolean(custom1), Boolean.parseBoolean(custom2), updatedOn, userDetails.getUserName(), Double.parseDouble(slush), Double.parseDouble(fees), Double.parseDouble(food_cost), Double.parseDouble(beverage_cost), Double.parseDouble(food_income), Double.parseDouble(beverage_income), Double.parseDouble(weekly_turnover), incomecenter_id };
				jdbcTemplate.update(Queries.UPDATE_INCOMECENTER, param);
			} else {
				Object[] param = { Integer.parseInt(company_id), income_center_name, location, details, Boolean.parseBoolean(restaurant), Boolean.parseBoolean(cafe), Boolean.parseBoolean(takeAway), Boolean.parseBoolean(bar), Boolean.parseBoolean(deli), Boolean.parseBoolean(retail), Boolean.parseBoolean(catering), Boolean.parseBoolean(delivery), Boolean.parseBoolean(event), Boolean.parseBoolean(roomService), Boolean.parseBoolean(custom1), Boolean.parseBoolean(custom2), userDetails.getUserName(), Double.parseDouble(slush), Double.parseDouble(fees), Double.parseDouble(food_cost), Double.parseDouble(beverage_cost), Double.parseDouble(food_income), Double.parseDouble(beverage_income), Double.parseDouble(weekly_turnover) };
				jdbcTemplate.update(Queries.INSERT_NEW_INCOMECENTER, param);
			}
			isAdded = true;
			if(isAdded){
				String incomeCenterId = null;
				String qryIncomeCenterId = "select max(income_centre_id) from income_centres";
				SqlRowSet rsIncomeCenterId = selectResults(qryIncomeCenterId);

				if (rsIncomeCenterId.next()) {
					incomeCenterId = rsIncomeCenterId.getString(1);
				}
				/* Insert Default Cash Drawer*/ 
				int drawerid = 0;
				String drawerName = "till one";
				String drawerDescription = "This is till one";
				addNewCashDrawer(drawerid, drawerName, incomeCenterId, drawerDescription, userDetails);
				
				/* Insert Default Services*/
				int serviceid = 0;
				String breakfastService = "Breakfast";
				String lunchService = "Lunch";
				String dinnerService = "Dinner";
				String description = "Customer Service";
				String recurrence = "true";
				String startDate = null;
				
				String breakfastStartTime = "08:00:00";
				String lunchStartTime = "13:00:00";
				String dinnerStartTime = "20:00:00";
				
				String breakfastEndTime = "12:00:00";
				String lunchEndTime = "16:00:00";
				String dinnerEndTime = "23:00:00";
				
				String revenueProjection = "5000";
				String labourCost = "50";
				
				addNewService(serviceid, breakfastService, incomeCenterId, description, recurrence, breakfastStartTime, breakfastEndTime, startDate, revenueProjection, labourCost, userDetails);
				addNewService(serviceid, lunchService, incomeCenterId, description, recurrence, lunchStartTime, lunchEndTime, startDate, revenueProjection, labourCost, userDetails);
				addNewService(serviceid, dinnerService, incomeCenterId, description, recurrence, dinnerStartTime, dinnerEndTime, startDate, revenueProjection, labourCost, userDetails);
				
			}
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public List<Companies> getCompanies() {

		List<Companies> companyList = jdbcTemplate.query(Queries.GET_COMPANYNAME, new CompaniesRowMapper());
		if (companyList != null && companyList.size() > 0) {
			return companyList;
		} else
			return null;
	}

	@Override
	public List<IncomeCentres> getAllIncomeCentersOfCompany(int companyId) {
		Integer[] s = { companyId };
		List<IncomeCentres> incomeCenter = jdbcTemplate.query(Queries.INCOME_CENTER_BY_COMPANY, s, new IncomeCentresRowMapper());
		return incomeCenter;
	}

	@Override
	public boolean addNewStaff(int staffid, final String staffName, final String address, final String level, final String position, final String hourlyDailyRate, final String saturdayRate, final String sundayRate, final String publicHolidaydayRate, final String otherRate, final String employeeStatus, final String agency, final User userDetails, final String setting, final String roster, final String cashUp, final String reports, final int userid, String password, final String emailId, final String cellNo,final String postCode) {
		boolean isAdded = false;
		String encryptPass = getMD5(password);
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			if (staffid > 0) {
				Object[] param = { staffName, address, position, Integer.parseInt(level), Double.parseDouble(hourlyDailyRate), Double.parseDouble(saturdayRate), Double.parseDouble(sundayRate), Double.parseDouble(publicHolidaydayRate), Double.parseDouble(otherRate), employeeStatus, agency, Boolean.parseBoolean(setting), Boolean.parseBoolean(roster), Boolean.parseBoolean(cashUp), Boolean.parseBoolean(reports), updatedOn, userDetails.getUserName(), emailId, Long.parseLong(cellNo), postCode, staffid };
				jdbcTemplate.update(Queries.UPDATE_STAFF_DETAIL, param);

			}
			if (staffid > 0) {
				Object[] param1 = { userid, encryptPass, staffid };
				jdbcTemplate.update(Queries.UPDATE_ACCESSUSER_DETAIL, param1);
			} else {
				final int companyId = 301;
				Object[] param = { companyId, staffName, address, position, Integer.parseInt(level), Double.parseDouble(hourlyDailyRate), Double.parseDouble(saturdayRate), Double.parseDouble(sundayRate), Double.parseDouble(publicHolidaydayRate), Double.parseDouble(otherRate), employeeStatus, agency, userDetails.getUserName(), emailId, Long.parseLong(cellNo) };
				// jdbcTemplate.update(Queries.INSERT_NEW_STAFF, param);

				KeyHolder keyHolder = new GeneratedKeyHolder();
				jdbcTemplate.update(new PreparedStatementCreator() {
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						PreparedStatement pst = con.prepareStatement(Queries.INSERT_NEW_STAFF, new String[] { "staff_id" });
						pst.setInt(1, companyId);
						pst.setString(2, staffName);
						pst.setString(3, address);
						pst.setString(4, position);

						pst.setInt(5, Integer.parseInt(level));
						pst.setDouble(6, Double.parseDouble(hourlyDailyRate));

						pst.setDouble(7, Double.parseDouble(saturdayRate));
						pst.setDouble(8, Double.parseDouble(sundayRate));
						pst.setDouble(9, Double.parseDouble(publicHolidaydayRate));
						pst.setDouble(10, Double.parseDouble(otherRate));
						pst.setString(11, employeeStatus);
						pst.setString(12, agency);
						pst.setString(13, userDetails.getUserName());
						pst.setString(14, emailId);
						pst.setLong(15, Long.parseLong(cellNo));
						pst.setString(16, postCode);
						return pst;
					}
				}, keyHolder);
				long key = (Integer) keyHolder.getKey();

				logger.info("SettingDAOImpl.addNewStaff()" + key);
				Object[] param1 = { userid, encryptPass, key };// 24
				jdbcTemplate.update(Queries.INSERT_NEW_ACCESSUSER, param1);
			}

			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}

		return isAdded;
	}

	@Override
	public List<CashDrawers> getDrawerForIncomeCenter(Integer incomeCentreId) {
		Integer[] param = { incomeCentreId };
		List<CashDrawers> cashDrawerList = jdbcTemplate.query(Queries.GET_CASH_DRAWER_FOR_INCOME_CENTER, param, new CashDrawersRowMapper());
		if (cashDrawerList != null && cashDrawerList.size() > 0) {
			return cashDrawerList;
		} else {
			return null;
		}
	}

	@Override
	public List<Services> getServicesForIncomeCenter(Integer incomeCentreId) {
		Integer[] param = { incomeCentreId };
		List<Services> serviceList = jdbcTemplate.query(Queries.GET_SERVICES_BY_INCOME_CENTER, param, new ServicesRowMapper());
		if (serviceList != null && serviceList.size() > 0) {
			return serviceList;
		} else {
			return null;
		}
	}

	@Override
	public List<RosterEvent> getSettingAllEventsListResult() {
		List<RosterEvent> roster_event_List = jdbcTemplate.query(Queries.GET_ALL_EVENTS_LIST_RESULT, new RosterEventRowMapper());
		if (roster_event_List != null)
			return roster_event_List;
		return null;
	}

	@Override
	public List<Events> searchAllEventsByName(String eventName) {
		String[] param = { eventName + "%" };
		List<Events> eventList = jdbcTemplate.query(Queries.SEARCH_ALL_EVENT_BY_NAME, param, new EventsRowMapper());
		return eventList;
	}

	@Override
	public List<RosterEvent> searchAllEventsList(String eventid, Date from_Date, Date to_Date) {

		Object[] param = { from_Date, to_Date, Integer.parseInt(eventid) };
		List<RosterEvent> roster_event_List = jdbcTemplate.query(Queries.SEARCH_ALL_EVENTS_LIST_WITH_ID_AND_DURATION, param, new RosterEventRowMapper());
		return roster_event_List;
	}

	@Override
	public List<RosterEvent> searchAllEventsByDate(Date transactionEventDate) {
		Object[] param = { transactionEventDate };
		List<RosterEvent> roster_event_List = jdbcTemplate.query(Queries.SEARCH_ALL_EVENTS_LIST_BY_DATE, param, new RosterEventRowMapper());
		return roster_event_List;
	}

	@Override
	public void deleteRosterEvent(String rosteEventId) {
		String sql = "DELETE FROM roster_event WHERE roster_event_id = " + rosteEventId;
		jdbcTemplate.execute(sql);
	}

	@Override
	public List<RosterEvent> searchAllEventsListByName(String eventName) {
		String[] param = { eventName + "%" };
		List<RosterEvent> eventList = jdbcTemplate.query(Queries.SEARCH_ALL_EVENT_LIST_BY_NAME, param, new RosterEventRowMapper());
		return eventList;
	}

	@Override
	public List<RosterEvent> searchAllEventsList(Date from_Date, Date to_Date) {
		Object[] param = { from_Date, to_Date };
		List<RosterEvent> roster_event_List = jdbcTemplate.query(Queries.SEARCH_ALL_EVENTS_LIST_FOR_DURATION, param, new RosterEventRowMapper());
		return roster_event_List;
	}

	@Override
	public boolean updateIncomeCenterOther(int incomecenter_id, String restaurant, String cafe, String takeAway, String bar, String deli, String retail, String catering, String delivery, String event, String roomService, String custom1, String custom2, User userDetails, String slush, String fees) {
		
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			Object[] param = { Boolean.parseBoolean(restaurant), Boolean.parseBoolean(cafe), Boolean.parseBoolean(takeAway), Boolean.parseBoolean(bar), Boolean.parseBoolean(deli), Boolean.parseBoolean(retail), Boolean.parseBoolean(catering), Boolean.parseBoolean(delivery), Boolean.parseBoolean(event), Boolean.parseBoolean(roomService), Boolean.parseBoolean(custom1), Boolean.parseBoolean(custom2), updatedOn, userDetails.getUserName(), Double.parseDouble(slush), Double.parseDouble(fees), incomecenter_id };
			jdbcTemplate.update(Queries.UPDATE_INCOMECENTER_OTHER, param);
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public boolean updateIncomeCenterName(String incomecenterId, String incomeCenterName, User userDetails) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			Object[] param = {incomeCenterName, updatedOn, userDetails.getUserName(), Integer.parseInt(incomecenterId)}; 
			jdbcTemplate.update(Queries.UPDATE_INCOMECENTER_NAME, param);
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		
		return isAdded;
	}

	@Override
	public boolean updateCashDrawerName(String drawerId, String tillName, User userDetails) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			Object[] param = {tillName, updatedOn, userDetails.getUserName(), Integer.parseInt(drawerId)}; 
			jdbcTemplate.update(Queries.UPDATE_DRAWER_NAME, param);
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		
		return isAdded;
	}

	@Override
	public boolean updateCashDrawerDesc(String drawerId, String tillDesc, User userDetails) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			Object[] param = {tillDesc, updatedOn, userDetails.getUserName(), Integer.parseInt(drawerId)}; 
			jdbcTemplate.update(Queries.UPDATE_DRAWER_DESC, param);
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		
		return isAdded;
	}

	@Override
	public boolean updateServiceName(String serviceId, String serviceName, User userDetails) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			Object[] param = {serviceName, updatedOn, userDetails.getUserName(), Integer.parseInt(serviceId)}; 
			jdbcTemplate.update(Queries.UPDATE_SERVICE_NAME, param);
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		
		return isAdded;
	}

	@Override
	public boolean updateServiceTime(String serviceId, String startTime, String endTime, User userDetails) {
		
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		try {
			Object[] param = {sdf.parse(startTime), sdf.parse(endTime), updatedOn, userDetails.getUserName(), Integer.parseInt(serviceId)}; 
			jdbcTemplate.update(Queries.UPDATE_SERVICE_TIME, param);
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		
		return isAdded;
	}

	@Override
	public boolean updateBasicBudget(String incomeCenterBudgetId, String weeklyTurnOver, String foodTS, String beverageTS, String foodCost, String beverageCost) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			int typeId = 1;
			Object[] param = {typeId, Integer.parseInt(incomeCenterBudgetId), Double.parseDouble(weeklyTurnOver),
								Double.parseDouble(foodTS),	Double.parseDouble(beverageTS), Double.parseDouble(foodCost), Double.parseDouble(beverageCost)};
			Object[] delParam = {Integer.parseInt(incomeCenterBudgetId)};
			jdbcTemplate.update(Queries.DELETE_BUDGET,delParam);
			
			jdbcTemplate.update(Queries.UPDATE_BASIC_BUDGET, param);
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		
		return isAdded;
	}

	@Override
	public boolean updateServiceBudget(String incomeCenterId, String serviceBTO, String serviceBFoodTS, String serviceBBeverageTS, String serviceBFoodCost, String serviceBBeverageCost, String serviceLTO, String serviceLFoodTS, String serviceLBeverageTS, String serviceLFoodCost, String serviceLBeverageCost, String serviceDTO, String serviceDFoodTS, String serviceDBeverageTS, String serviceDFoodCost, String serviceDBeverageCost) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			int typeId = 2;
			int income_center_id = Integer.parseInt(incomeCenterId);
			List<Services> serviceList = getServicesForIncomeCenter(income_center_id);
			
			Object[] delParam = {Integer.parseInt(incomeCenterId)};
			jdbcTemplate.update(Queries.DELETE_BUDGET,delParam);
			
						Object[] bParam = {typeId, income_center_id, serviceList.get(0).getServiceId(), Double.parseDouble(serviceBTO), Double.parseDouble(serviceBFoodTS), Double.parseDouble(serviceBBeverageTS), Double.parseDouble(serviceBFoodCost), Double.parseDouble(serviceBBeverageCost)}; 
						jdbcTemplate.update(Queries.UPDATE_SERVICE_BUDGET, bParam);
																																				
						Object[] lParam = {typeId, income_center_id, serviceList.get(1).getServiceId(), Double.parseDouble(serviceLTO), Double.parseDouble(serviceLFoodTS), Double.parseDouble(serviceLBeverageTS), Double.parseDouble(serviceLFoodCost), Double.parseDouble(serviceLBeverageCost)}; 
						jdbcTemplate.update(Queries.UPDATE_SERVICE_BUDGET, lParam);
					
						Object[] dParam = {typeId, income_center_id, serviceList.get(2).getServiceId(), Double.parseDouble(serviceLTO), Double.parseDouble(serviceDFoodTS), Double.parseDouble(serviceDBeverageTS), Double.parseDouble(serviceDFoodCost), Double.parseDouble(serviceDBeverageCost)}; 
						jdbcTemplate.update(Queries.UPDATE_SERVICE_BUDGET, dParam);
						isAdded = true;
			
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		
		return isAdded;
	}

	@Override
	public List<BudgetSettings> getBudgetSetting(Integer incomeCenterId) {
		Object[] param = { incomeCenterId};
		List<BudgetSettings> budgetSettings = jdbcTemplate.query(Queries.GET_BUDGET, param,new BudgetSettingsRowMapper());
		List<Services> services =  getServicesForIncomeCenter(incomeCenterId);
		List<BudgetSettings> retBudgetSettings = new ArrayList<BudgetSettings>();
		if(budgetSettings != null && budgetSettings.size() > 0){
			int breakFastserviceid = 0;
			int lunchid = 0;
			int dinnerid = 0;
			
			if(budgetSettings.get(0).getBudgetType() == 2){
				if(services != null){
				for(Services service : services)
				{
					if(service.getServiceName().equalsIgnoreCase("Breakfast"))
						breakFastserviceid = service.getServiceId();
					
					if(service.getServiceName().equalsIgnoreCase("Lunch"))
						lunchid = service.getServiceId();
					
					if(service.getServiceName().equalsIgnoreCase("Dinner"))
						dinnerid = service.getServiceId();
					
				}
				}
				BudgetSettings  mergeSetting = new BudgetSettings();
				Double turnover = 0.0;
				Double breakFastVal = 0.0; 
				Double lunchVal = 0.0;
				Double dinnerVal = 0.0;
				for(BudgetSettings setting:budgetSettings){
					turnover = turnover+setting.getTurnover();
					if(setting.getServiceId() == breakFastserviceid)
						breakFastVal  = setting.getBevCostPct()+setting.getFoodCostPct();
					else if(setting.getServiceId() == lunchid)
						lunchVal = setting.getBevCostPct()+setting.getFoodCostPct();
					else if(setting.getServiceId() == dinnerid)
						dinnerVal = setting.getBevCostPct()+setting.getFoodCostPct();
										
				}
				
				mergeSetting.setBudgetType(budgetSettings.get(0).getBudgetType());
				mergeSetting.setTurnover(turnover);
				
				if(breakFastVal > 0.0)
					mergeSetting.setBreakFastCost(breakFastVal);
				if(lunchVal > 0.0)
					mergeSetting.setLunchCost(lunchVal);
				if(dinnerVal > 0.0)
					mergeSetting.setDinnerCost(dinnerVal);
				
				retBudgetSettings.add(mergeSetting);
					
					
					
			}else{
				retBudgetSettings.addAll(budgetSettings);
			}
			
			
		}
		
		return retBudgetSettings;
	}

	
	@Override
	public Budget getBudgetSettings(Integer incomeCenterId) {

		Budget budget = null;

		Object[] param = { incomeCenterId};
		List<BudgetSetting> budgetSettingList = jdbcTemplate.query(Queries.GET_BUDGET, param, new BudgetSettingRowMapper());
		List<Services> services = getServicesForIncomeCenter(incomeCenterId);
		
		if(budgetSettingList != null && budgetSettingList.size() > 0)
		{
			BudgetSetting setting =  budgetSettingList.get(0);
			budget = new Budget();
			budget.setBudget_type(setting.getBudget_type());
			budget.setIncome_center_id(setting.getIncome_center_id());
			budget.setSettings(budgetSettingList);
		}

		return budget;
	}

	@Override
	public boolean updateWeekDayBudget(List<BudgetSetting> budgetSettings) {
		if(budgetSettings != null && budgetSettings.size() > 0){
			Object[] delParam = {budgetSettings.get(0).getIncome_center_id()};
			jdbcTemplate.update(Queries.DELETE_BUDGET,delParam);
			
			for(BudgetSetting setting : budgetSettings){
				Object[] dParam = {setting.getBudget_type(), setting.getIncome_center_id(), setting.getDay_of_week(), 
						setting.getTurnover(), setting.getFood_cost_pct(), setting.getBev_cost_pct(), setting.getFood_income(), 
						setting.getBev_income()}; 
				jdbcTemplate.update(Queries.UPDATE_WEEKDAY_BUDGET, dParam);

			}
		}
		return true;
	}

	@Override
	public boolean updateWeekDayServiceBudget(List<BudgetSetting> settingList) {
		
		if(settingList != null && settingList.size() > 0){
			Object[] delParam = {settingList.get(0).getIncome_center_id()};
			jdbcTemplate.update(Queries.DELETE_BUDGET,delParam);
			
			for(BudgetSetting setting : settingList){
				Object[] dParam = {setting.getBudget_type(), setting.getIncome_center_id(), setting.getTurnover(), setting.getService_id(), setting.getDay_of_week(),
						 setting.getFood_cost_pct(), setting.getBev_cost_pct(), setting.getFood_income(), setting.getBev_income()}; 
				jdbcTemplate.update(Queries.UPDATE_WEEKDAY_SERVICE_BUDGET, dParam);
				//budget_type, income_ceneter_id, turnover, service_id, day_of_week, food_cost_pct, bev_cost_pct, food_income, bev_income

			}
		}
		return true;
	}

	@Override
	public boolean updateIncomeCenterEnable(String incomecenterId, String isEnable, User userDetails) {
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			Object[] param = {Boolean.parseBoolean(isEnable), updatedOn, userDetails.getUserName(), Integer.parseInt(incomecenterId)}; 
			jdbcTemplate.update(Queries.UPDATE_INCOMECENTER_ENABLE, param);
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		
		return isAdded;
	}

}
