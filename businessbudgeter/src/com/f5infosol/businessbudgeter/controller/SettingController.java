package com.f5infosol.businessbudgeter.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.f5infosol.businessbudgeter.domain.Budget;
import com.f5infosol.businessbudgeter.domain.BudgetSetting;
import com.f5infosol.businessbudgeter.domain.CashDrawers;
import com.f5infosol.businessbudgeter.domain.Companies;
import com.f5infosol.businessbudgeter.domain.Events;
import com.f5infosol.businessbudgeter.domain.IncomeCentres;
import com.f5infosol.businessbudgeter.domain.RosterEvent;
import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.User;
import com.f5infosol.businessbudgeter.service.CashDrawerService;
import com.f5infosol.businessbudgeter.service.RosterService;
import com.f5infosol.businessbudgeter.service.SettingService;
import com.f5infosol.businessbudgeter.util.BusinessBudgeterUtil;

@Controller
public class SettingController {
	protected final Log logger = LogFactory.getLog(getClass());

	@Resource
	RosterService rosterService;

	@Resource
	SettingService settingService;

	@Resource
	CashDrawerService cashDrawerService;

	@RequestMapping(value = "/setting")
	public String getSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		User userDetails = (User) session.getAttribute("userDetails");
		model.put("userName", userDetails);
		return "/setting";
	}

	@RequestMapping(value = "/staff-list")
	public String getStaffSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "/staff-list";
	}

	@RequestMapping(value = "/staff-list-result")
	public String getStaffSettingList(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Staff> staff_List = settingService.getAllStaffList();
		model.addAttribute("staff_List", staff_List);
		return "/staff-list-result";
	}

	/* add-staff */
	@RequestMapping(value = "/add-staff")
	public String getStaffPopup(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String staffId = request.getParameter("staffid");
		if (staffId != null) {
			int staffid = Integer.parseInt(staffId);
			if (staffid > 0) {
				Staff staff = settingService.getStaffDetail(staffid);
				model.put("staff", staff);
			}
		}

		return "/add-staff";
	}

	@RequestMapping(value = "/add-new-staff")
	public String addNewStaff(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String staffId = request.getParameter("staffid");
		int staffid = 0;
		if (staffId != null && !staffId.isEmpty() && Integer.parseInt(staffId) > 0)
		{
			staffid = Integer.parseInt(staffId);
		}

		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");

		String staffName = request.getParameter("staffname");
		String address = request.getParameter("address");
		String emailId = request.getParameter("email_id");
		String cellNo = request.getParameter("cell_no");
		String postCode = request.getParameter("postcode");

		String level = request.getParameter("staff_level");
		String position = request.getParameter("position");
		String hourlyDailyRate = request.getParameter("hourly_daily_rate");
		String saturdayRate = request.getParameter("saturday_day_rate");
		String sundayRate = request.getParameter("sunday_day_rate");
		String publicHolidaydayRate = request.getParameter("public_holiday_rate");
		String otherRate = request.getParameter("other_rate");
		String employeeStatus = request.getParameter("employee_status");
		String agency = request.getParameter("agency");
		String setting = request.getParameter("setting_access");
		String roster = request.getParameter("roster_access");
		String cashUp = request.getParameter("cashup_access");
		String reports = request.getParameter("reports_access");
		String userIdStr = request.getParameter("userid");
	
		int userid = 0;
		try
		{
			if (userIdStr != null && !userIdStr.isEmpty())
				userid = Integer.parseInt(userIdStr);
		} 
		catch (Exception e) 
		{
			userid = 0;
		}
		
		String password = request.getParameter("password");

		boolean isAdded = settingService.addNewStaff(staffid, staffName, address, level, position, hourlyDailyRate, saturdayRate, sundayRate, publicHolidaydayRate, otherRate, employeeStatus, agency, userDetails, setting, roster, cashUp, reports, userid, password, emailId, cellNo, postCode);

		return "/staff-list-result";
	}

	@RequestMapping(value = "/delete-staff", method = RequestMethod.POST)
	public @ResponseBody String deleteStaff(@RequestParam("staffIdList") List<String> staffIdList, Model model, HttpServletRequest request, HttpServletResponse response) {
		for (String staffId : staffIdList) {
			settingService.deleteStaff(staffId);
		}
		return "true";
	}

	@RequestMapping(value = "/search-staff-by-name")
	public String searchStaffByName(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String staffName = request.getParameter("staffname");
		List<Staff> staff_List = settingService.searchStaffName(staffName);
		model.addAttribute("staff_List", staff_List);
		return "/staff-list-result";
	}

	@RequestMapping(value = "/setting-event-list")
	public String getEventSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "/setting-event-list";
	}

	@RequestMapping(value = "/setting-event-list-result")
	public String getEventSettingList(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Events> event_List = settingService.getAllEventList();
		model.addAttribute("event_List", event_List);
		return "/setting-event-list-result";
	}

	@RequestMapping(value = "/add-setting-event")
	public String getEventPopup(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String eventId = request.getParameter("eventid");
		if (eventId != null) {
			int eventid = Integer.parseInt(eventId);
			if (eventid > 0) {
				Events event = settingService.getEventDetail(eventid);
				model.put("event", event);
			}
		}

		return "/add-setting-event";
	}

	@RequestMapping(value = "/add-new-event")
	public String addNewEvent(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String eventId = request.getParameter("eventid");
		int eventid = 0;
		if (eventId != null && !eventId.isEmpty() && Integer.parseInt(eventId) > 0) {
			eventid = Integer.parseInt(eventId);
		}
		User userDetails = (User) session.getAttribute("userDetails");
		String eventName = request.getParameter("eventname");
		String foodBudgetedIncome = request.getParameter("food_budgeted_income");
		String foodActual = request.getParameter("food_actual");
		String beverageBudgetedIncome = request.getParameter("beverage_budgeted_income");
		String beverageActual = request.getParameter("beverage_actual");
		String otherBudgetedIncome = request.getParameter("other_budgeted_income");
		String otherActual = request.getParameter("other_actual");
		String totalBudgetedIncome = request.getParameter("total_budgeted_income");
		String totalActual = request.getParameter("total_actual");
		String labourCost = request.getParameter("labour_cost");

		boolean isAdded = settingService.addNewEvent(eventid, eventName, foodBudgetedIncome, foodActual, beverageBudgetedIncome, beverageActual, otherBudgetedIncome, otherActual, totalBudgetedIncome, totalActual, labourCost, userDetails);

		return "/setting-event-list-result";
	}

	@RequestMapping(value = "/delete-event", method = RequestMethod.POST)
	public @ResponseBody String deleteEvent(@RequestParam("eventIdList") List<String> eventIdList, Model model, HttpServletRequest request, HttpServletResponse response) {
		for (String eventId : eventIdList) {
			settingService.deleteEvent(eventId);
		}
		return "true";
	}

	@RequestMapping(value = "/search-event-by-name")
	public String searchEventByName(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String eventName = request.getParameter("eventname");
		List<Events> event_List = settingService.searchEventByName(eventName);
		model.addAttribute("event_List", event_List);
		return "/setting-event-list-result";
	}

	@RequestMapping(value = "/create-new-user")
	public String getCreateNewUser(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "/create-new-user";
	}

	@RequestMapping(value = "/user-list")
	public String getUserSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "/user-list";
	}

	/*
	 * @RequestMapping(value = "/search-staff-by-name") public String
	 * searchStaffByName(ModelMap model, HttpServletRequest request,
	 * HttpServletResponse response) throws IOException { String staffName =
	 * request.getParameter("staffname"); List<Staff> staff_List =
	 * settingService.searchStaffName(staffName);
	 * model.addAttribute("staff_List", staff_List); return
	 * "/staff-list-result"; }
	 */
	@RequestMapping(value = "/search-user-by-name")
	public String searchUserByName(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userName = request.getParameter("username");
		List<User> user_List = settingService.searchUserName(userName);
		model.addAttribute("user_List", user_List);
		return "/user-list-result";
	}

	@RequestMapping(value = "/add-user")
	public String getUserPopup(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String userId = request.getParameter("userid");
		if (userId != null) {
			int userid = Integer.parseInt(userId);
			if (userid > 0) {
				User user = settingService.getUserDetail(userid);
				model.put("user", user);
			}
		}

		return "/add-user";
	}

	@RequestMapping(value = "/add-new-user")
	public String addNewUser(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String userId = request.getParameter("userid");
		int userid = 0;
		if (userId != null && !userId.isEmpty() && Integer.parseInt(userId) > 0) {
			userid = Integer.parseInt(userId);
		}
		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");

		String fullName = request.getParameter("fullname");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String companyName = request.getParameter("companyname");

		boolean isAdded = settingService.addNewUser(userid, fullName, userName, password, companyName);

		return "/user-list-result";
	}

	@RequestMapping(value = "/delete-user", method = RequestMethod.POST)
	public @ResponseBody String deleteUser(@RequestParam("userIdList") List<String> userIdList, Model model, HttpServletRequest request, HttpServletResponse response) {
		for (String userId : userIdList) {
			settingService.deleteUser(userId);
		}
		return "true";
	}

	@RequestMapping(value = "/user-list-result")
	public String getUserSettingList(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<User> user_List = settingService.getAllUserList();
		model.addAttribute("user_List", user_List);
		return "/user-list-result";
	}

	@RequestMapping(value = "/password")
	public String getPassword(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userId = request.getParameter("userid");
		if (userId != null) {
			int userid = Integer.parseInt(userId);
			if (userid > 0) {
				User user = settingService.getUserDetail(userid);
				model.put("user", user);
			}
		}
		return "/password";
	}

	@RequestMapping(value = "/create-new-password")
	public String createNewPassword(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String userId = request.getParameter("userid");
		int userid = 0;
		if (userId != null && !userId.isEmpty() && Integer.parseInt(userId) > 0) {
			userid = Integer.parseInt(userId);
		}
		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");

		String password = request.getParameter("new_password");

		boolean isAdded = settingService.createNewPassword(userid, password);

		return "/user-list-result";
	}

	@RequestMapping(value = "/setting-cash-drawer-list")
	public String getCashDrawerSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "/setting-cash-drawer-list";
	}

	@RequestMapping(value = "/setting-cash-drawer-list-result")
	public String getCashDrawerSettingList(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<CashDrawers> cash_drawer_List = settingService.getAllCashDrawerList();
		model.addAttribute("cash_drawer_List", cash_drawer_List);
		return "/setting-cash-drawer-list-result";
	}

	@RequestMapping(value = "/setting-service-list")
	public String getServiceSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "/setting-service-list";
	}

	@RequestMapping(value = "/setting-service-list-result")
	public String getServiceSettingList(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String incomeCenterId = request.getParameter("incomeCentreId");
		List<Services> service_List = settingService.getAllServiceList();
		model.addAttribute("service_List", service_List);
		return "/setting-service-list-result";
	}

	@RequestMapping(value = "/add-setting-cash-drawer")
	public String getCashDrawerPopup(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String drawerId = request.getParameter("drawerid");
		if (drawerId != null) {
			int drawerid = Integer.parseInt(drawerId);
			if (drawerid > 0) {
				CashDrawers cashDrawer = settingService.getCashDrawerDetail(drawerid);
				model.put("cashDrawer", cashDrawer);
			}
		}

		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);
		return "/add-setting-cash-drawer";
	}

	@RequestMapping(value = "/add-new-cash-drawer")
	public String addNewCashDrawer(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String drawerId = request.getParameter("drawerid");
		int drawerid = 0;
		if (drawerId != null && !drawerId.isEmpty() && Integer.parseInt(drawerId) > 0) {
			drawerid = Integer.parseInt(drawerId);
		}
		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");

		String drawerName = request.getParameter("drawername");
		String incomeCenterId = request.getParameter("incomeCenterId");
		String description = request.getParameter("description");

		boolean isAdded = settingService.addNewCashDrawer(drawerid, drawerName, incomeCenterId, description, userDetails);

		return "/setting-cash-drawer-list-result";
	}

	/*
	 * @RequestMapping(value = "/delete-cash-drawer", method =
	 * RequestMethod.POST) public @ResponseBody String
	 * deleteCashDrawer(@RequestParam("cashDrawerIdList") List<String>
	 * cashDrawerIdList, Model model, HttpServletRequest request,
	 * HttpServletResponse response) { for (String drawerId : cashDrawerIdList)
	 * { settingService.deleteCashDrawer(drawerId); } return "true"; }
	 */

	@RequestMapping(value = "/delete-cash-drawer", method = RequestMethod.POST)
	@ResponseBody
	String deleteCashDrawer(Model model, HttpServletRequest request, HttpServletResponse response) {
		String drawerId = request.getParameter("drawerId");
		settingService.deleteCashDrawer(drawerId);
		return "true";
	}

	@RequestMapping(value = "/search-cash-drawer-by-name")
	public String searchDrawerByName(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String drawerName = request.getParameter("drawername");
		String incomeCenterId = request.getParameter("incomeCenterId");
		List<CashDrawers> cash_drawer_List = settingService.searchDrawerByName(drawerName, incomeCenterId);
		model.addAttribute("cash_drawer_List", cash_drawer_List);
		return "/setting-cash-drawer-list-result";
	}

	@RequestMapping(value = "/add-setting-service")
	public String getServicePopup(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String serviceId = request.getParameter("serviceid");
		if (serviceId != null) {
			int serviceid = Integer.parseInt(serviceId);
			if (serviceid > 0) {
				Services service = settingService.getServiceDetail(serviceid);
				model.put("service", service);
			}
		}
		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);
		return "/add-setting-service";
	}

	@RequestMapping(value = "/add-new-service")
	public String addNewService(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String serviceId = request.getParameter("serviceid");
		int serviceid = 0;
		if (serviceId != null && !serviceId.isEmpty() && Integer.parseInt(serviceId) > 0) {
			serviceid = Integer.parseInt(serviceId);
		}
		User userDetails = (User) session.getAttribute("userDetails");

		String serviceName = request.getParameter("servicename");
		String incomeCenterId = request.getParameter("incomeCenterId");
		String description = request.getParameter("description");
		String recurrence = request.getParameter("recurrence");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String startDate = request.getParameter("startDate");
		// String endDate = request.getParameter("endDate");
		String revenueProjection = request.getParameter("revenueProjection");
		String labourCost = request.getParameter("labourCost");

		boolean isAdded = settingService.addNewService(serviceid, serviceName, incomeCenterId, description, recurrence, startTime, endTime, startDate, revenueProjection, labourCost, userDetails);

		return "/setting-service-list-result";
	}

	/*
	 * @RequestMapping(value = "/delete-service", method = RequestMethod.POST)
	 * public @ResponseBody String deleteService(@RequestParam("ServiceIdList")
	 * List<String> ServiceIdList, Model model, HttpServletRequest request,
	 * HttpServletResponse response) { for (String serviceId : ServiceIdList) {
	 * settingService.deleteService(serviceId); } return "true"; }
	 */

	@RequestMapping(value = "/delete-service", method = RequestMethod.POST)
	public @ResponseBody String deleteService(@RequestParam("serviceId") String serviceId, Model model, HttpServletRequest request, HttpServletResponse response) {
		settingService.deleteService(serviceId);
		return "true";
	}

	@RequestMapping(value = "/search-service-by-name")
	public String searchServiceByName(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String serviceName = request.getParameter("servicename");
		String incomeCenterId = request.getParameter("incomeCenterId");
		List<Services> service_List = settingService.searchServiceByName(serviceName, incomeCenterId);
		model.addAttribute("service_List", service_List);
		return "/setting-service-list-result";
	}

	@RequestMapping(value = "/setting-income-center-list")
	public String getIncomeCenterSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "/setting-income-center-list";
	}

	@RequestMapping(value = "/setting-income-center-list-result")
	public String getIncomeCenterSettingList(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<IncomeCentres> income_center_List = settingService.getAllIncomeCenters();
		model.addAttribute("income_center_List", income_center_List);
		return "/setting-income-center-list-result";
	}

	@RequestMapping(value = "/delete-income-center", method = RequestMethod.POST)
	public @ResponseBody String deleteIncomeCenter(@RequestParam("incomeCenterIdList") List<String> incomeCenterIdList, Model model, HttpServletRequest request, HttpServletResponse response) {
		for (String incomeCenterId : incomeCenterIdList) {
			settingService.deleteIncomeCenter(incomeCenterId);
		}
		return "true";
	}

	@RequestMapping(value = "/search-income-center-by-name")
	public String searchIncomeCenterByName(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String incomeCenterName = request.getParameter("incomeCenterName");
		List<IncomeCentres> income_center_List = settingService.searchIncomeCenterByName(incomeCenterName);
		model.addAttribute("income_center_List", income_center_List);
		return "/setting-income-center-list-result";
	}

	@RequestMapping(value = "/add-setting-incomecenter")
	public String getIncomeCenterPopup(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// String incomecenterId = request.getParameter("incomecenterid");
		String incomeCenterId = request.getParameter("incomecenterid");
		if (incomeCenterId != null) {
			int incomecenterid = Integer.parseInt(incomeCenterId);
			if (incomecenterid > 0) {
				IncomeCentres incomeCenter = settingService.getIncomeCenterDetail(incomecenterid);
				model.put("incomeCenter", incomeCenter);
			}
		}
		List<Companies> companyList = settingService.getCompanies();
		model.addAttribute("companyList", companyList);
		return "/add-setting-incomecenter";
	}

	/*
	 * @RequestMapping(value = "/add-new-income-center") public String
	 * getAddIncomeCenterPopup(ModelMap model, HttpServletRequest request,
	 * HttpServletResponse response) throws IOException {
	 * 
	 * return "/add-new-income-center"; }
	 */

	/*
	 * @RequestMapping(value = "/add-new-incomecenter") public String
	 * addNewIncomeCenter(ModelMap model, HttpServletRequest request,
	 * HttpServletResponse response, HttpSession session) throws IOException {
	 * 
	 * String incomecenterId = request.getParameter("incomecenterid"); int
	 * incomecenter_id = 0; if (incomecenterId != null &&
	 * !incomecenterId.isEmpty() && Integer.parseInt(incomecenterId) > 0) {
	 * incomecenter_id = Integer.parseInt(incomecenterId); }
	 * 
	 * User userDetails = (User) session.getAttribute("userDetails");
	 * 
	 * String income_center_name = request.getParameter("income_center_name");
	 * String company_id = request.getParameter("company_id"); String location =
	 * request.getParameter("location"); String details =
	 * request.getParameter("details"); String restaurant =
	 * request.getParameter("restaurant"); String cafe =
	 * request.getParameter("cafe"); String takeAway =
	 * request.getParameter("takeAway"); String bar =
	 * request.getParameter("bar"); String deli = request.getParameter("deli");
	 * String retail = request.getParameter("retail"); String catering =
	 * request.getParameter("catering"); String delivery =
	 * request.getParameter("delivery"); String event =
	 * request.getParameter("event"); String roomService =
	 * request.getParameter("roomService"); String custom1 =
	 * request.getParameter("custom1"); String custom2 =
	 * request.getParameter("custom2"); String slush =
	 * request.getParameter("slush"); String fees =
	 * request.getParameter("fees"); String food_cost =
	 * request.getParameter("foodCost"); String beverage_cost =
	 * request.getParameter("beverageCost"); String food_income =
	 * request.getParameter("foodIncome"); String beverage_income =
	 * request.getParameter("beverageIncome");
	 * 
	 * boolean isAdded = settingService.addNewIncomeCenter(incomecenter_id,
	 * income_center_name, company_id, location, details, restaurant, cafe,
	 * takeAway, bar, deli, retail, catering, delivery, event, roomService,
	 * custom1,custom2,userDetails, slush, fees, food_cost, beverage_cost,
	 * food_income, beverage_income); return "/income-centers"; }
	 */
	// add-new-setting-incomecenter

	@RequestMapping(value = "/income-centers")
	public String getIncomeCentersSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		int companyId = 301;

		List<IncomeCentres> incomeCenterList = settingService.getAllIncomeCentersOfCompany(companyId);
		for (IncomeCentres incomeCenter : incomeCenterList) {

			List<CashDrawers> cashDrawer = settingService.getDrawerForIncomeCenter(incomeCenter.getIncomeCentreId());
			incomeCenter.setCashDrawersSettings(cashDrawer);

			List<Services> service = settingService.getServicesForIncomeCenter(incomeCenter.getIncomeCentreId());
			incomeCenter.setServicesSettings(service);

			// budgetSetting
			Budget budget = settingService.getBudgetSettings(incomeCenter.getIncomeCentreId());
			incomeCenter.setBudget(budget);
		}
		model.addAttribute("incomeCenterList", incomeCenterList);
		model.put("incomeCenterListSize", incomeCenterList.size());
		User userDetails = (User) session.getAttribute("userDetails");
		model.put("userName", userDetails);

		return "/income-centers";
	}

	@RequestMapping(value = "/staff")
	public String getStaff(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		User userDetails = (User) session.getAttribute("userDetails");
		model.put("userName", userDetails);
		return "/staff";
	}

	@RequestMapping(value = "/staff-system-access")
	public String getStaffSystemAccess(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "/staff-system-access";
	}

	@RequestMapping(value = "/setting-all-events-list")
	public String getAllEventsSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		String eventDate = (String) (session.getAttribute("eventDate") != null ? session.getAttribute("eventDate") : simpleDateFormat.format(new Date()));

		if (request.getParameter("eventDate") != null) {
			eventDate = request.getParameter("eventDate");
		}

		logger.info("SettingController.getAllEventsSetting() eventDate=" + eventDate);

		session.setAttribute("eventDate", eventDate);

		// model.addAttribute("eventDate", eventDate);
		// User userDetails = (User) session.getAttribute("userDetails");
		Date transactionEventDate = BusinessBudgeterUtil.convertStringToDateForTran(eventDate);
		// model.put("transactionEventDate", transactionEventDate);
		return "/setting-all-events-list";
	}

	@RequestMapping(value = "/setting-all-events-list-result")
	public String getSettingAllEventsListResult(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		List<RosterEvent> roster_event_List = settingService.getSettingAllEventsListResult();
		model.addAttribute("roster_event_List", roster_event_List);

		return "/setting-all-events-list-result";
	}

	@RequestMapping(value = "/search-all-events-by-name")
	public String searchAllEventsByName(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String eventName = request.getParameter("eventname");
		List<RosterEvent> roster_event_List = settingService.searchAllEventsListByName(eventName);
		model.addAttribute("roster_event_List", roster_event_List);
		return "/setting-all-events-list-result";
	}

	@RequestMapping(value = "/autocomplete-search-for-all-events-name")
	public @ResponseBody List<HashMap<String, String>> searchAllEventsNameList(Model model, HttpServletRequest request, HttpServletResponse response) {
		String eventname = request.getParameter("term");
		List<Events> event_List = settingService.searchAllEventsByName(eventname);
		List<HashMap<String, String>> li = new ArrayList<HashMap<String, String>>();
		if (event_List != null) {
			for (Events events : event_List) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id", String.valueOf(events.getEventId()));
				map.put("value", events.getEventName());
				li.add(map);
			}
		}
		return li;
	}

	@RequestMapping(value = "/all_events_searchlist_by_searchkey")
	public String searchAllEventsList(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String eventid = request.getParameter("eventid");
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		Date from_Date = BusinessBudgeterUtil.convertStringToDateForTran(fromDate);
		Date to_Date = BusinessBudgeterUtil.convertStringToDateForTran(toDate);
		if (eventid != null && eventid != "") {
			List<RosterEvent> roster_event_List = settingService.searchAllEventsList(eventid, from_Date, to_Date);
			model.addAttribute("roster_event_List", roster_event_List);
		} else {
			List<RosterEvent> roster_event_List = settingService.searchAllEventsList(from_Date, to_Date);
			model.addAttribute("roster_event_List", roster_event_List);
		}
		return "/setting-all-events-list-result";
	}

	@RequestMapping(value = "/search-all-events-by-eventdate")
	public String searchAllEventsListByDate(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		String eventDate = request.getParameter("eventDate");
		Date transactionEventDate = BusinessBudgeterUtil.convertStringToDateForTran(eventDate);
		if (transactionEventDate != null) {
			List<RosterEvent> roster_event_List = settingService.searchAllEventsByDate(transactionEventDate);
			model.addAttribute("roster_event_List", roster_event_List);
		}
		return "/setting-all-events-list-result";
	}

	@RequestMapping(value = "/events")
	public String getSettingContent(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		User userDetails = (User) session.getAttribute("userDetails");
		model.put("userName", userDetails);
		return "/events";
	}

	@RequestMapping(value = "/delete-roster-event", method = RequestMethod.POST)
	public @ResponseBody String deleteRosterEvent(@RequestParam("rostereventIdList") List<String> rostereventIdList, Model model, HttpServletRequest request, HttpServletResponse response) {
		for (String rosteEventId : rostereventIdList) {
			settingService.deleteRosterEvent(rosteEventId);
		}
		return "true";
	}

	@RequestMapping(value = "/setting_incomecenter_budget")
	public String getSettingIncomecenterBudget(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		return "/setting_incomecenter_budget";
	}

	@RequestMapping(value = "/add-new-incomecenter")
	public String addNewIncomeCenter(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String incomecenterId = request.getParameter("incomecenterid");
		int incomecenter_id = 0;
		if (incomecenterId != null && !incomecenterId.isEmpty() && Integer.parseInt(incomecenterId) > 0) {
			incomecenter_id = Integer.parseInt(incomecenterId);
		}

		User userDetails = (User) session.getAttribute("userDetails");

		String income_center_name = request.getParameter("income_center_name");

		String company_id = request.getParameter("company_id");
		String location = request.getParameter("location");
		String details = request.getParameter("details");
		String restaurant = request.getParameter("restaurant");
		String cafe = request.getParameter("cafe");
		String takeAway = request.getParameter("takeAway");
		String bar = request.getParameter("bar");
		String deli = request.getParameter("deli");
		String retail = request.getParameter("retail");
		String catering = request.getParameter("catering");
		String delivery = request.getParameter("delivery");
		String event = request.getParameter("event");
		String roomService = request.getParameter("roomService");
		String custom1 = request.getParameter("custom1");
		String custom2 = request.getParameter("custom2");
		String slush = request.getParameter("slush");
		String fees = request.getParameter("fees");
		String food_cost = request.getParameter("foodCost");
		String beverage_cost = request.getParameter("beverageCost");
		String food_income = request.getParameter("foodIncome");
		String beverage_income = request.getParameter("beverageIncome");
		String weekly_turnover = request.getParameter("weeklyTO");

		boolean isAdded = settingService.addNewIncomeCenter(incomecenter_id, income_center_name, company_id, location, details, restaurant, cafe, takeAway, bar, deli, retail, catering, delivery, event, roomService, custom1, custom2, userDetails, slush, fees, food_cost, beverage_cost, food_income, beverage_income, weekly_turnover);

		return "/income-centers";
	}

	// update-income-center

	@RequestMapping(value = "/update-income-center-other")
	public String updateIncomeCenterOther(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String incomecenterId = request.getParameter("income_center_id");
		int incomecenter_id = 0;
		if (incomecenterId != null && !incomecenterId.isEmpty() && Integer.parseInt(incomecenterId) > 0) {
			incomecenter_id = Integer.parseInt(incomecenterId);
		}

		User userDetails = (User) session.getAttribute("userDetails");

		String restaurant = request.getParameter("restaurant");
		String cafe = request.getParameter("cafe");
		String takeAway = request.getParameter("takeAway");
		String bar = request.getParameter("bar");
		String deli = request.getParameter("deli");
		String retail = request.getParameter("retail");
		String catering = request.getParameter("catering");
		String delivery = request.getParameter("delivery");
		String event = request.getParameter("event");
		String roomService = request.getParameter("roomService");
		String custom1 = request.getParameter("custom1");
		String custom2 = request.getParameter("custom2");
		String slush = request.getParameter("slush");
		String fees = request.getParameter("fees");

		boolean isAdded = settingService.updateIncomeCenterOther(incomecenter_id, restaurant, cafe, takeAway, bar, deli, retail, catering, delivery, event, roomService, custom1, custom2, userDetails, slush, fees);

		return "/income-centers";
	}

	@RequestMapping(value = "/update-income-center-enable")
	public String updateIncomeCenterEnable(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String incomecenterId = request.getParameter("income_center_id");
		User userDetails = (User) session.getAttribute("userDetails");
		String isEnable = request.getParameter("isEnable");

		boolean isAdded = settingService.updateIncomeCenterEnable(incomecenterId, isEnable, userDetails);

		return "/income-centers";
	}

	@RequestMapping(value = "/update-income-center-name")
	public String updateIncomeCenterName(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String incomecenterId = request.getParameter("income_center_id");
		User userDetails = (User) session.getAttribute("userDetails");
		String incomeCenterName = request.getParameter("incomeCenterName");

		boolean isAdded = settingService.updateIncomeCenterName(incomecenterId, incomeCenterName, userDetails);

		return "/income-centers";
	}

	@RequestMapping(value = "/update-cash-drawer-name")
	public String updateCashDrawerName(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String drawerId = request.getParameter("drawerid");
		User userDetails = (User) session.getAttribute("userDetails");
		String tillName = request.getParameter("tillName");

		boolean isAdded = settingService.updateCashDrawerName(drawerId, tillName, userDetails);

		return "/income-centers";
	}

	// update-cash-drawer-desc

	@RequestMapping(value = "/update-cash-drawer-desc")
	public String updateCashDrawerDesc(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String drawerId = request.getParameter("drawerid");
		User userDetails = (User) session.getAttribute("userDetails");
		String tillDesc = request.getParameter("tillDescription");

		boolean isAdded = settingService.updateCashDrawerDesc(drawerId, tillDesc, userDetails);

		return "/income-centers";
	}

	@RequestMapping(value = "/update-service-name")
	public String updateServiceName(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String serviceId = request.getParameter("serviceid");
		User userDetails = (User) session.getAttribute("userDetails");
		String serviceName = request.getParameter("serviceName");

		boolean isAdded = settingService.updateServiceName(serviceId, serviceName, userDetails);

		return "/income-centers";
	}

	@RequestMapping(value = "/update-service-time")
	public String updateServiceTime(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String serviceId = request.getParameter("serviceid");
		User userDetails = (User) session.getAttribute("userDetails");
		String startTime = request.getParameter("start_time");
		String endTime = request.getParameter("end_time");

		boolean isAdded = settingService.updateServiceTime(serviceId, startTime, endTime, userDetails);

		return "/income-centers";
	}

	@RequestMapping(value = "/update-basic-budget")
	public String updateBasicBudget(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String incomeCenterId = request.getParameter("incomeceneterid");
		String weeklyTurnOver = request.getParameter("weeklyTurnOver" + incomeCenterId);
		String foodTS = request.getParameter("foodTS" + incomeCenterId);
		String beverageTS = request.getParameter("beverageTS" + incomeCenterId);
		String foodCost = request.getParameter("foodCost" + incomeCenterId);
		String beverageCost = request.getParameter("beverageCost" + incomeCenterId);

		boolean isAdded = settingService.updateBasicBudget(incomeCenterId, weeklyTurnOver, foodTS, beverageTS, foodCost, beverageCost);

		return "/income-centers";
	}

	@RequestMapping(value = "/update-service-budget")
	public String updateServiceBudget(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String incomeCenterId = request.getParameter("incomeceneterid");
		String serviceBTO = request.getParameter("serviceBTO" + incomeCenterId);
		String serviceBFoodTS = request.getParameter("serviceBFoodTS" + incomeCenterId);
		String serviceBBeverageTS = request.getParameter("serviceBBeverageTS" + incomeCenterId);
		String serviceBFoodCost = request.getParameter("serviceBFoodCost" + incomeCenterId);
		String serviceBBeverageCost = request.getParameter("serviceBBeverageCost" + incomeCenterId);

		String serviceLTO = request.getParameter("serviceLTO" + incomeCenterId);
		String serviceLFoodTS = request.getParameter("serviceLFoodTS" + incomeCenterId);
		String serviceLBeverageTS = request.getParameter("serviceLBeverageTS" + incomeCenterId);
		String serviceLFoodCost = request.getParameter("serviceLFoodCost" + incomeCenterId);
		String serviceLBeverageCost = request.getParameter("serviceLBeverageCost" + incomeCenterId);

		String serviceDTO = request.getParameter("serviceDTO" + incomeCenterId);
		String serviceDFoodTS = request.getParameter("serviceDFoodTS" + incomeCenterId);
		String serviceDBeverageTS = request.getParameter("serviceDBeverageTS" + incomeCenterId);
		String serviceDFoodCost = request.getParameter("serviceDFoodCost" + incomeCenterId);
		String serviceDBeverageCost = request.getParameter("serviceDBeverageCost" + incomeCenterId);

		boolean isAdded = settingService.updateServiceBudget(incomeCenterId, serviceBTO, serviceBFoodTS, serviceBBeverageTS, serviceBFoodCost, serviceBBeverageCost, serviceLTO, serviceLFoodTS, serviceLBeverageTS, serviceLFoodCost, serviceLBeverageCost, serviceDTO, serviceDFoodTS, serviceDBeverageTS, serviceDFoodCost, serviceDBeverageCost);

		return "/income-centers";
	}

	private String getDay(int index) {
		String day = "sun";
		switch (index) {
		case 1:
			day = "mon";
			break;
		case 2:
			day = "tue";
			break;
		case 3:
			day = "wed";
			break;
		case 4:
			day = "thur";
			break;
		case 5:
			day = "fri";
			break;
		case 6:
			day = "sat";
			break;
		case 7:
			day = "sun";
			break;

		}

		return day;

	}

	private String getService(int index) {

		String service = "B";
		switch (index) {
		case 1:
			service = "B";
			break;
		case 2:
			service = "L";
			break;
		case 3:
			service = "D";
			break;
		}

		return service;

	}

	@RequestMapping(value = "/update-WeekdayBudget")
	public String updateWeekDayBudget(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String incomeCenterId = request.getParameter("incomeceneterid");
		/*
		 * String monTO = request.getParameter("monTO"); String tueTO =
		 * request.getParameter("tueTO"); String wedTO =
		 * request.getParameter("wedTO"); String thurTO =
		 * request.getParameter("thurTO"); String friTO =
		 * request.getParameter("friTO"); String satTO =
		 * request.getParameter("satTO"); String sunTO =
		 * request.getParameter("sunTO");
		 */

		List<BudgetSetting> setting = new ArrayList<BudgetSetting>();
		String day = "sun";
		for (int i = 1; i <= 7; i++) {
			BudgetSetting budgetSetting = new BudgetSetting();
			day = getDay(i);
			String turnover = request.getParameter(day + "TO");
			budgetSetting.setBudget_type(3);
			budgetSetting.setDay_of_week(i);
			budgetSetting.setIncome_center_id(Integer.parseInt(incomeCenterId));
			budgetSetting.setTurnover(Double.parseDouble(turnover));
			String foodTS = request.getParameter(day + "FoodTS");
			String bevTS = request.getParameter(day + "BeverageTS");
			String foodCost = request.getParameter(day + "FoodCost");
			String bevCost = request.getParameter(day + "BeverageCost");

			if (foodTS != null && !foodTS.isEmpty())
				budgetSetting.setFood_income(Double.parseDouble(foodTS));

			if (bevTS != null && !bevTS.isEmpty())
				budgetSetting.setBev_income(Double.parseDouble(bevTS));

			if (foodCost != null && !foodCost.isEmpty())
				budgetSetting.setFood_cost_pct(Double.parseDouble(foodCost));

			if (bevCost != null && !bevCost.isEmpty())
				budgetSetting.setBev_cost_pct(Double.parseDouble(bevCost));

			setting.add(budgetSetting);

		}

		settingService.updateWeekDayBudget(setting);

		return "/income-centers";
	}

	@RequestMapping(value = "/update-weekday-and-service")
	public String updateWeekDayServiceBudget(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String incomeCenterId = request.getParameter("incomeceneterid");
		List<Services> serviceList = settingService.getServicesForIncomeCenter(Integer.parseInt(incomeCenterId));
		List<BudgetSetting> setting = new ArrayList<BudgetSetting>();
		String day = "sun";
		String service = "B";
		for (int j = 1; j <= 3; j++) {
			for (int i = 1; i <= 7; i++) {
				BudgetSetting budgetSetting = new BudgetSetting();
				service = getService(j);
				day = getDay(i);
				String turnover = request.getParameter(day + service + "TO");
				budgetSetting.setBudget_type(4);
				budgetSetting.setDay_of_week(i);
				budgetSetting.setService_id(serviceList.get(j - 1).getServiceId());
				budgetSetting.setIncome_center_id(Integer.parseInt(incomeCenterId));
				budgetSetting.setTurnover(Double.parseDouble(turnover));
				String foodTS = request.getParameter(day + service + "FoodTS");
				String bevTS = request.getParameter(day + service + "BeverageTS");
				String foodCost = request.getParameter(day + service + "FoodCost");
				String bevCost = request.getParameter(day + service + "BeverageCost");

				if (foodTS != null && !foodTS.isEmpty())
					budgetSetting.setFood_income(Double.parseDouble(foodTS));

				if (bevTS != null && !bevTS.isEmpty())
					budgetSetting.setBev_income(Double.parseDouble(bevTS));

				if (foodCost != null && !foodCost.isEmpty())
					budgetSetting.setFood_cost_pct(Double.parseDouble(foodCost));

				if (bevCost != null && !bevCost.isEmpty())
					budgetSetting.setBev_cost_pct(Double.parseDouble(bevCost));

				setting.add(budgetSetting);
			}
		}
		
		settingService.updateWeekDayServiceBudget(setting);

		return "/income-centers";
	}

}
