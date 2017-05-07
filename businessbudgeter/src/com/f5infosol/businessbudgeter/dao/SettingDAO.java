package com.f5infosol.businessbudgeter.dao;

import java.util.Date;
import java.util.List;

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

public interface SettingDAO {

	Staff getStaffDetail(int staffid);

	// boolean addNewStaff(int staffid, String staffName, String address, String
	// level, String position, String hourlyDailyRate, String saturdayRate,
	// String sundayRate, String publicHolidaydayRate, String otherRate, String
	// employeeStatus, String agency, User userDetails);

	void deleteStaff(String staffId);

	List<Staff> searchStaffName(String staffName);

	List<Staff> getAllStaffList();

	List<Events> getAllEventList();

	List<Events> searchEventByName(String eventName);

	Events getEventDetail(int eventid);

	boolean addNewEvent(int eventid, String eventName, String foodBudgetedIncome, String foodActual, String beverageBudgetedIncome, String beverageActual, String otherBudgetedIncome, String otherActual, String totalBudgetedIncome, String totalActual, String labourCost, User userDetails);

	void deleteEvent(String eventId);

	List<User> searchUserName(String userName);

	User getUserDetail(int userid);

	// boolean addNewUser(int userid, String userName, String password);

	void deleteUser(String userId);

	List<User> getAllUserList();

	boolean addNewUser(int userid, String fullName, String userName, String password, String companyName);

	boolean createNewPassword(int userid, String password);

	List<CashDrawers> getAllCashDrawerList();

	List<Services> getAllServiceList();

	CashDrawers getCashDrawerDetail(int drawerid);

	boolean addNewCashDrawer(int drawerid, String drawerName, String incomeCenterId, String description, User userDetails);

	void deleteCashDrawer(String drawerId);

	List<CashDrawers> searchDrawerByName(String drawerName, String incomeCenterId);

	Services getServiceDetail(int serviceid);

	boolean addNewService(int serviceid, String serviceName, String incomeCenterId, String description, String recurrence, String startTime, String endTime, String startDate, String revenueProjection, String labourCost, User userDetails);

	void deleteService(String serviceId);

	List<Services> searchServiceByName(String serviceName, String incomeCenterId);

	List<IncomeCentres> getAllIncomeCenters();

	void deleteIncomeCenter(String incomeCenterId);

	List<IncomeCentres> searchIncomeCenterByName(String incomeCenterName);

	IncomeCentres getIncomeCenterDetail(int incomecenterid);

	boolean addNewIncomeCenter(int incomecenter_id, String income_center_name, String company_id, String location, String details, String restaurant, String cafe, String takeAway, String bar, String deli, String retail, String catering, String delivery, String event, String roomService, String custom1, String custom2, User userDetails, String slush, String fees, String food_cost, String beverage_cost, String food_income, String beverage_income, String weekly_turnover);

	List<Companies> getCompanies();

	List<IncomeCentres> getAllIncomeCentersOfCompany(int companyId);

	boolean addNewStaff(int staffid, String staffName, String address, String level, String position, String hourlyDailyRate, String saturdayRate, String sundayRate, String publicHolidaydayRate, String otherRate, String employeeStatus, String agency, User userDetails, String setting, String roster, String cashUp, String reports, int userid, String password, String emailId, String cellNo,String postCode);

	List<CashDrawers> getDrawerForIncomeCenter(Integer incomeCentreId);

	List<Services> getServicesForIncomeCenter(Integer incomeCentreId);

	List<RosterEvent> getSettingAllEventsListResult();

	List<Events> searchAllEventsByName(String eventName);

	List<RosterEvent> searchAllEventsList(String eventid, Date from_Date, Date to_Date);

	List<RosterEvent> searchAllEventsByDate(Date transactionEventDate);

	void deleteRosterEvent(String rosteEventId);

	List<RosterEvent> searchAllEventsListByName(String eventName);

	List<RosterEvent> searchAllEventsList(Date from_Date, Date to_Date);

	boolean updateIncomeCenterOther(int incomecenter_id, String restaurant, String cafe, String takeAway, String bar, String deli, String retail, String catering, String delivery, String event, String roomService, String custom1, String custom2, User userDetails, String slush, String fees);

	boolean updateIncomeCenterName(String incomecenterId, String incomeCenterName, User userDetails);

	boolean updateCashDrawerName(String drawerId, String tillName, User userDetails);

	boolean updateCashDrawerDesc(String drawerId, String tillDesc, User userDetails);

	boolean updateServiceName(String serviceId, String serviceName, User userDetails);

	boolean updateServiceTime(String serviceId, String startTime, String endTime, User userDetails);

	boolean updateBasicBudget(String incomeCenterBudgetId, String weeklyTurnOver, String foodTS, String beverageTS, String foodCost, String beverageCost);

	boolean updateServiceBudget(String incomeCenterId, String serviceBTO, String serviceBFoodTS, String serviceBBeverageTS, String serviceBFoodCost, String serviceBBeverageCost, String serviceLTO, String serviceLFoodTS, String serviceLBeverageTS, String serviceLFoodCost, String serviceLBeverageCost, String serviceDTO, String serviceDFoodTS, String serviceDBeverageTS, String serviceDFoodCost, String serviceDBeverageCost);
	Budget getBudgetSettings(Integer incomeCenterId);
	public boolean updateWeekDayBudget(List<BudgetSetting> budgetSettings);

		List<BudgetSettings> getBudgetSetting(Integer incomeCenterId);

		boolean updateWeekDayServiceBudget(List<BudgetSetting> setting);

		boolean updateIncomeCenterEnable(String incomecenterId, String isEnable, User userDetails);


}
