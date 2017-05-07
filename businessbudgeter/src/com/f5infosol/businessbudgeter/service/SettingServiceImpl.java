package com.f5infosol.businessbudgeter.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.f5infosol.businessbudgeter.dao.CashDrawerDAO;
import com.f5infosol.businessbudgeter.dao.SettingDAO;
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

@Service
public class SettingServiceImpl implements SettingService {

	protected final Log logger = LogFactory.getLog(getClass());
	@Resource
	private SettingDAO objDao;

	/*
	 * @Override public List<RosterEvent> getSettingEventList(Date
	 * transactionDate) { return objDao.getSettingEventList(transactionDate); }
	 * 
	 * @Override public boolean addNewEventList(int eventid, String eventname) {
	 * return objDao.getSettingEventList(eventid,eventname); }
	 */
	@Override
	public Staff getStaffDetail(int staffid) {
		return objDao.getStaffDetail(staffid);
	}

	/*
	 * @Override public boolean addNewStaff(int staffid, String staffName,
	 * String address, String level, String position, String hourlyDailyRate,
	 * String saturdayRate, String sundayRate, String publicHolidaydayRate,
	 * String otherRate, String employeeStatus, String agency, User userDetails
	 * ) { return
	 * objDao.addNewStaff(staffid,staffName,address,level,position,hourlyDailyRate
	 * ,
	 * saturdayRate,sundayRate,publicHolidaydayRate,otherRate,employeeStatus,agency
	 * ,userDetails); }
	 */
	@Override
	public void deleteStaff(String staffId) {
		objDao.deleteStaff(staffId);
	}

	@Override
	public List<Staff> searchStaffName(String staffName) {
		return objDao.searchStaffName(staffName);
	}

	@Override
	public List<Staff> getAllStaffList() {
		return objDao.getAllStaffList();
	}

	@Override
	public List<Events> getAllEventList() {
		return objDao.getAllEventList();
	}

	@Override
	public List<Events> searchEventByName(String eventName) {
		return objDao.searchEventByName(eventName);
	}

	@Override
	public Events getEventDetail(int eventid) {
		return objDao.getEventDetail(eventid);
	}

	@Override
	public boolean addNewEvent(int eventid, String eventName, String foodBudgetedIncome, String foodActual, String beverageBudgetedIncome, String beverageActual, String otherBudgetedIncome, String otherActual, String totalBudgetedIncome, String totalActual, String labourCost, User userDetails) {
		return objDao.addNewEvent(eventid, eventName, foodBudgetedIncome, foodActual, beverageBudgetedIncome, beverageActual, otherBudgetedIncome, otherActual, totalBudgetedIncome, totalActual, labourCost, userDetails);
	}

	@Override
	public void deleteEvent(String eventId) {
		objDao.deleteEvent(eventId);

	}

	@Override
	public List<User> searchUserName(String userName) {
		return objDao.searchUserName(userName);
	}

	@Override
	public User getUserDetail(int userid) {
		return objDao.getUserDetail(userid);
	}

	/*
	 * @Override public boolean addNewUser(int userid, String userName, String
	 * password ) { return objDao.addNewUser(userid, userName, password); }
	 */
	@Override
	public void deleteUser(String userId) {
		objDao.deleteUser(userId);

	}

	@Override
	public List<User> getAllUserList() {
		return objDao.getAllUserList();
	}

	@Override
	public boolean addNewUser(int userid, String fullName, String userName, String password, String companyName) {
		return objDao.addNewUser(userid, fullName, userName, password, companyName);
	}

	@Override
	public boolean createNewPassword(int userid, String password) {
		return objDao.createNewPassword(userid, password);
	}

	@Override
	public List<CashDrawers> getAllCashDrawerList() {
		return objDao.getAllCashDrawerList();
	}

	@Override
	public List<Services> getAllServiceList() {
		return objDao.getAllServiceList();
	}

	@Override
	public CashDrawers getCashDrawerDetail(int drawerid) {
		return objDao.getCashDrawerDetail(drawerid);
	}

	@Override
	public boolean addNewCashDrawer(int drawerid, String drawerName, String incomeCenterId, String description, User userDetails) {
		return objDao.addNewCashDrawer(drawerid, drawerName, incomeCenterId, description, userDetails);
	}

	@Override
	public void deleteCashDrawer(String drawerId) {
		objDao.deleteCashDrawer(drawerId);

	}

	@Override
	public List<CashDrawers> searchDrawerByName(String drawerName, String incomeCenterId) {
		return objDao.searchDrawerByName(drawerName, incomeCenterId);
	}

	@Override
	public Services getServiceDetail(int serviceid) {
		return objDao.getServiceDetail(serviceid);
	}

	@Override
	public boolean addNewService(int serviceid, String serviceName, String incomeCenterId, String description, String recurrence, String startTime, String endTime, String startDate, String revenueProjection, String labourCost, User userDetails) {

		return objDao.addNewService(serviceid, serviceName, incomeCenterId, description, recurrence, startTime, endTime, startDate, revenueProjection, labourCost, userDetails);
	}

	@Override
	public void deleteService(String serviceId) {
		objDao.deleteService(serviceId);
	}

	@Override
	public List<Services> searchServiceByName(String serviceName, String incomeCenterId) {
		return objDao.searchServiceByName(serviceName, incomeCenterId);
	}

	@Override
	public List<IncomeCentres> getAllIncomeCenters() {
		return objDao.getAllIncomeCenters();
	}

	@Override
	public void deleteIncomeCenter(String incomeCenterId) {
		objDao.deleteIncomeCenter(incomeCenterId);
	}

	@Override
	public List<IncomeCentres> searchIncomeCenterByName(String incomeCenterName) {
		return objDao.searchIncomeCenterByName(incomeCenterName);
	}

	@Override
	public IncomeCentres getIncomeCenterDetail(int incomecenterid) {
		return objDao.getIncomeCenterDetail(incomecenterid);
	}

	@Override
	public boolean addNewIncomeCenter(int incomecenter_id, String income_center_name, String company_id, String location, String details, String restaurant, String cafe, String takeAway, String bar, String deli, String retail, String catering, String delivery, String event, String roomService, String custom1, String custom2, User userDetails, String slush, String fees, String food_cost, String beverage_cost, String food_income, String beverage_income, String weekly_turnover) {
		boolean isAdded =  objDao.addNewIncomeCenter(incomecenter_id, income_center_name, company_id, location, details, restaurant, cafe, takeAway, bar, deli, retail, catering, delivery, event, roomService, custom1, custom2, userDetails, slush, fees, food_cost, beverage_cost, food_income, beverage_income, weekly_turnover);
		return isAdded;
	}

	@Override
	public List<Companies> getCompanies() {
		return objDao.getCompanies();
	}

	@Override
	public List<IncomeCentres> getAllIncomeCentersOfCompany(int companyId) {
		return objDao.getAllIncomeCentersOfCompany(companyId);
	}

	@Override
	public boolean addNewStaff(int staffid, String staffName, String address, String level, String position, String hourlyDailyRate, String saturdayRate, String sundayRate, String publicHolidaydayRate, String otherRate, String employeeStatus, String agency, User userDetails, String setting, String roster, String cashUp, String reports, int userid, String password, String emailId, String cellNo,String postCode) {
		return objDao.addNewStaff(staffid, staffName, address, level, position, hourlyDailyRate, saturdayRate, sundayRate, publicHolidaydayRate, otherRate, employeeStatus, agency, userDetails, setting, roster, cashUp, reports, userid, password, emailId, cellNo,postCode);
	}

	@Override
	public List<CashDrawers> getDrawerForIncomeCenter(Integer incomeCentreId) {
		return objDao.getDrawerForIncomeCenter(incomeCentreId);
	}

	@Override
	public List<Services> getServicesForIncomeCenter(Integer incomeCentreId) {
		return objDao.getServicesForIncomeCenter(incomeCentreId);
	}

	@Override
	public List<RosterEvent> getSettingAllEventsListResult() {
		return objDao.getSettingAllEventsListResult();
	}

	@Override
	public List<Events> searchAllEventsByName(String eventName) {
		return objDao.searchAllEventsByName(eventName);
	}

	@Override
	public List<RosterEvent> searchAllEventsList(String eventid, Date from_Date, Date to_Date) {
		return objDao.searchAllEventsList(eventid, from_Date, to_Date);
	}

	@Override
	public List<RosterEvent> searchAllEventsByDate(Date transactionEventDate) {
		return objDao.searchAllEventsByDate(transactionEventDate);
	}

	@Override
	public void deleteRosterEvent(String rosteEventId) {
		objDao.deleteRosterEvent(rosteEventId);
	}

	@Override
	public RosterEvent getRosterEventDetail(int roster_eventid) {
		return null;
	}

	@Override
	public List<RosterEvent> searchAllEventsListByName(String eventName) {
		return objDao.searchAllEventsListByName(eventName);
	}

	@Override
	public List<RosterEvent> searchAllEventsList(Date from_Date, Date to_Date) {
		return objDao.searchAllEventsList(from_Date, to_Date);
	}

	@Override
	public boolean updateIncomeCenterOther(int incomecenter_id, String restaurant, String cafe, String takeAway, String bar, String deli, String retail, String catering, String delivery, String event, String roomService, String custom1, String custom2, User userDetails, String slush, String fees) {
		return objDao.updateIncomeCenterOther(incomecenter_id,restaurant, cafe, takeAway, bar, deli, retail, catering, delivery, event, roomService, custom1,custom2,userDetails, slush, fees);	
	}

	@Override
	public boolean updateIncomeCenterName(String incomecenterId, String incomeCenterName, User userDetails) {
		return objDao.updateIncomeCenterName(incomecenterId,incomeCenterName, userDetails);
	}

	@Override
	public boolean updateCashDrawerName(String drawerId, String tillName, User userDetails) {
		return objDao.updateCashDrawerName(drawerId, tillName, userDetails);
	}

	@Override
	public boolean updateCashDrawerDesc(String drawerId, String tillDesc, User userDetails) {
		return objDao.updateCashDrawerDesc(drawerId, tillDesc, userDetails);
	}

	@Override
	public boolean updateServiceName(String serviceId, String serviceName, User userDetails) {
		return objDao.updateServiceName(serviceId, serviceName, userDetails);
	}

	@Override
	public boolean updateServiceTime(String serviceId, String startTime, String endTime, User userDetails) {
		return objDao.updateServiceTime(serviceId, startTime, endTime, userDetails);
	}

	@Override
	public boolean updateBasicBudget(String incomeCenterBudgetId,String weeklyTurnOver, String foodTS, String beverageTS, String foodCost, String beverageCost) {
		return objDao.updateBasicBudget(incomeCenterBudgetId,weeklyTurnOver, foodTS, beverageTS, foodCost, beverageCost);
	}

	@Override
	public boolean updateServiceBudget(String incomeCenterId, String serviceBTO, String serviceBFoodTS, String serviceBBeverageTS, String serviceBFoodCost, String serviceBBeverageCost, String serviceLTO, String serviceLFoodTS, String serviceLBeverageTS, String serviceLFoodCost, String serviceLBeverageCost, String serviceDTO, String serviceDFoodTS, String serviceDBeverageTS, String serviceDFoodCost, String serviceDBeverageCost) {
		return objDao.updateServiceBudget(incomeCenterId, serviceBTO, serviceBFoodTS, serviceBBeverageTS, serviceBFoodCost, serviceBBeverageCost, 
												serviceLTO, serviceLFoodTS, serviceLBeverageTS, serviceLFoodCost, serviceLBeverageCost,	
												serviceDTO, serviceDFoodTS, serviceDBeverageTS, serviceDFoodCost, serviceDBeverageCost);
	}

	@Override
	public Budget getBudgetSettings(Integer incomeCenterId) {
		// TODO Auto-generated method stub
		return objDao.getBudgetSettings(incomeCenterId);
	}

	@Override
	public boolean updateWeekDayBudget(List<BudgetSetting> budgetSettings) {
		// TODO Auto-generated method stub
		return objDao.updateWeekDayBudget(budgetSettings);
	}

	@Override
	public List<BudgetSettings> getBudgetSetting(Integer incomeCenterId) {
		return objDao.getBudgetSetting(incomeCenterId);
	}

	@Override
	public boolean updateWeekDayServiceBudget(List<BudgetSetting> setting) {
		return objDao.updateWeekDayServiceBudget(setting);
	}

	@Override
	public boolean updateIncomeCenterEnable(String incomecenterId, String isEnable, User userDetails) {
		return objDao.updateIncomeCenterEnable(incomecenterId, isEnable, userDetails);
	}

}
