package com.f5infosol.businessbudgeter.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.f5infosol.businessbudgeter.domain.BudgetSettings;
import com.f5infosol.businessbudgeter.domain.Events;
import com.f5infosol.businessbudgeter.domain.IncomeCentres;
import com.f5infosol.businessbudgeter.domain.PublicHoliday;
import com.f5infosol.businessbudgeter.domain.Roster;
import com.f5infosol.businessbudgeter.domain.RosterEvent;
import com.f5infosol.businessbudgeter.domain.RosterTemplate;
import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.StaffRosters;
import com.f5infosol.businessbudgeter.domain.StaffRostersEvents;
import com.f5infosol.businessbudgeter.domain.StaffRostersServices;
import com.f5infosol.businessbudgeter.domain.StaffVoid;
import com.f5infosol.businessbudgeter.domain.TemplateMaster;
import com.f5infosol.businessbudgeter.domain.User;
import com.f5infosol.businessbudgeter.service.CashDrawerService;
import com.f5infosol.businessbudgeter.service.RosterService;
import com.f5infosol.businessbudgeter.service.SettingService;
import com.f5infosol.businessbudgeter.service.StaffEmailNotification;
import com.f5infosol.businessbudgeter.util.BusinessBudgeterUtil;

@Controller
public class RosterController {
	protected final Log logger = LogFactory.getLog(getClass());
	@Resource
	CashDrawerService cashDrawerService;

	@Resource
	RosterService rosterService;
	
	@Resource
	SettingService settingService; 
	
	@Resource
	private StaffEmailNotification staffEmailNotification;

	@RequestMapping(value = "/roster-update-services", method = RequestMethod.POST)
	public void rosterUpdateServices(@RequestBody List<LinkedHashMap<String, String>> staffRosters) throws IOException {

		for (LinkedHashMap<String, String> staffRoster : staffRosters) {
			try {
				Integer staffRosterServiceId = Integer.parseInt(staffRoster.get("staffRosterServiceId"));
				Double value = Double.parseDouble(staffRoster.get("value"));

				logger.info("RosterController.rosterUpdateServices()");

				rosterService.rosterUpdateServices(staffRosterServiceId, value);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/roster-update-events", method = RequestMethod.POST)
	public void rosterUpdateEvents(@RequestBody List<LinkedHashMap<String, String>> staffRosters) throws IOException {

		for (LinkedHashMap<String, String> staffRoster : staffRosters) {
			try {
				Integer satffRosterEventId = Integer.parseInt(staffRoster.get("staffRosterEventId"));
				Double value = Double.parseDouble(staffRoster.get("value"));

				rosterService.rosterUpdateEvents(satffRosterEventId, value);

				logger.info("RosterController.rosterUpdateServices()");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/roster", method = RequestMethod.POST)
	public String callUpdateRosters(@RequestBody List<LinkedHashMap<String, String>> staffRosters, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		String rosterDate = (String) (session.getAttribute("rosterDate") != null ? session.getAttribute("rosterDate") : simpleDateFormat.format(new Date()));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center") != null ? session.getAttribute("income-center") : 2);

		User userDetails = (User) session.getAttribute("userDetails");

		session.setAttribute("rosterDate", rosterDate);
		session.setAttribute("income-center", incomeCenterId);

		Date transactionRosterDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterDate);

		Integer size = Integer.parseInt(request.getParameter("size"));

		for (LinkedHashMap<String, String> staffRoster : staffRosters) {
			Integer satffRosterId = Integer.parseInt(staffRoster.get("satffRosterId"));
			String startTime = staffRoster.get("startTime");
			String finishTime = staffRoster.get("finishTime");
			String totalHours = staffRoster.get("totalHours");

			rosterService.updateStaffRosters(satffRosterId, startTime, finishTime, totalHours);
		}

		return "redirect:/roster";
	}

	@RequestMapping(value = "/roster")
	public String callRosters(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		List<IncomeCentres> incomeCenterListSession = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterListSession", incomeCenterListSession);
		
		String rosterDate = (String) (session.getAttribute("rosterDate") != null ? session.getAttribute("rosterDate") : simpleDateFormat.format(new Date()));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center") != null ? session.getAttribute("income-center") : incomeCenterListSession.get(0).getIncomeCentreId());
		String workofhouse = (String) (session.getAttribute("workofhouse") != null ? session.getAttribute("workofhouse") : "All");
		Boolean isPublicHoliday = (Boolean) (session.getAttribute("isPublicHoliday") != null ? session.getAttribute("isPublicHoliday") : false);

		
		if (request.getParameter("incomeCenterId") != null) {
			try {
				incomeCenterId = Integer.parseInt(request.getParameter("incomeCenterId"));
			} catch (Exception e) {
			}
		}

		if (request.getParameter("rosterDate") != null) {
			rosterDate = request.getParameter("rosterDate");
		}

		if (request.getParameter("workofhouse") != null) {
			workofhouse = request.getParameter("workofhouse");
		}

		if (request.getParameter("isPublicHoliday") != null) {
			isPublicHoliday = Boolean.parseBoolean(request.getParameter("isPublicHoliday"));
			logger.info("isPublicHoliday" + isPublicHoliday);
		}

		User userDetails = (User) session.getAttribute("userDetails");
		model.put("userName", userDetails);

		session.setAttribute("rosterDate", rosterDate);
		session.setAttribute("income-center", incomeCenterId);
		session.setAttribute("workofhouse", workofhouse);
		session.setAttribute("isPublicHoliday", isPublicHoliday);

		Date transactionRosterDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterDate);

		List<TemplateMaster> templateList = rosterService.getTemplateList();
		model.put("templateList", templateList);
		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);
		
		PublicHoliday publicHoliday = rosterService.getPublicHoliday(transactionRosterDate);
		model.put("publicHoliday", publicHoliday);

		Map<Integer, Services> serviceIdServiceMap = new HashMap<Integer, Services>();
		List<Services> seviceList = cashDrawerService.getServiceList(incomeCenterId);
		for (Services services : seviceList) {
			serviceIdServiceMap.put(services.getServiceId(), services);
		}

		List<RosterEvent> rosterEventList = null;
		Map<Integer, RosterEvent> eventIdEventMap = new HashMap<Integer, RosterEvent>();
		try {
			rosterEventList = rosterService.getRosterEventList(transactionRosterDate, incomeCenterId);
			for (RosterEvent rosterEvent : rosterEventList) {
				eventIdEventMap.put(rosterEvent.getEventId(), rosterEvent);
			}
		} catch (Exception e) {
			logger.info("RosterController.callRosters() rosterService.getRosterEventList() " + e.getMessage());
		}

		Map<Integer, Staff> staffIdStaffMap = new HashMap<Integer, Staff>();
		List<Staff> staffList = cashDrawerService.searchStaffName("");
		for (Staff staff : staffList) {
			staffIdStaffMap.put(staff.getStaffId(), staff);
		}

		Map<Integer, List<StaffRostersEvents>> staffEventsMap = new HashMap<Integer, List<StaffRostersEvents>>();
		List<StaffRostersEvents> staffRostersEvents = rosterService.getStaffRostersEvents(transactionRosterDate, incomeCenterId, userDetails);
		logger.info("RosterController.callRosters() staffRostersEvents = " + staffRostersEvents);
		for (StaffRostersEvents staffRostersService : staffRostersEvents) {
			if (eventIdEventMap.containsKey(staffRostersService.getEventId()))
				staffRostersService.setEvents(eventIdEventMap.get(staffRostersService.getEventId()));

			if (!staffEventsMap.containsKey(staffRostersService.getStaffId())) {
				staffEventsMap.put(staffRostersService.getStaffId(), new ArrayList<StaffRostersEvents>());
			}

			staffEventsMap.get(staffRostersService.getStaffId()).add(staffRostersService);
		}

		Map<Integer, List<StaffRostersServices>> staffServicesMap = new HashMap<Integer, List<StaffRostersServices>>();
		List<StaffRostersServices> staffRostersServices = rosterService.getStaffRostersServices(transactionRosterDate, incomeCenterId, userDetails);
		logger.info("RosterController.callRosters() staffRostersServices = " + staffRostersServices);
		for (StaffRostersServices staffRostersService : staffRostersServices) {
			if (serviceIdServiceMap.containsKey(staffRostersService.getServiceId()))
				staffRostersService.setServices(serviceIdServiceMap.get(staffRostersService.getServiceId()));

			if (!staffServicesMap.containsKey(staffRostersService.getStaffId())) {
				staffServicesMap.put(staffRostersService.getStaffId(), new ArrayList<StaffRostersServices>());
			}

			staffServicesMap.get(staffRostersService.getStaffId()).add(staffRostersService);
		}

		Map<Integer, List<StaffRosters>> staffRosterMap = new HashMap<Integer, List<StaffRosters>>();
		List<StaffRosters> staffRosters = rosterService.getStaffRosters(transactionRosterDate, incomeCenterId, userDetails, workofhouse);
		for (StaffRosters staffRoster : staffRosters) {
			if (!staffRosterMap.containsKey(staffRoster.getStaffId())) {
				staffRosterMap.put(staffRoster.getStaffId(), new ArrayList<StaffRosters>());
			}

			if (staffIdStaffMap.containsKey(staffRoster.getStaffId()))
				staffRoster.setStaff(staffIdStaffMap.get(staffRoster.getStaffId()));

			if (staffServicesMap.containsKey(staffRoster.getStaffId()))
				staffRoster.setStaffRostersServices(staffServicesMap.get(staffRoster.getStaffId()));

			if (staffEventsMap.containsKey(staffRoster.getStaffId()))
				staffRoster.setStaffRostersEvents(staffEventsMap.get(staffRoster.getStaffId()));

			staffRosterMap.get(staffRoster.getStaffId()).add(staffRoster);
		}

		logger.info("RosterController.callRosters() staffRosterMap = " + staffRosterMap.toString());

		List<BudgetSettings> budgetSettings = settingService.getBudgetSetting(incomeCenterId);
		
		logger.info("RosterController.callRosters() budgetSettings = "+budgetSettings.toString());
		
		model.put("budgetSettings", budgetSettings);
		model.put("staffRosterMap", staffRosterMap);
		model.put("seviceList", seviceList);
		model.put("rosterEventList", rosterEventList);
		model.put("staffRosterMap", staffRosterMap);
		model.put("transactionRosterDate",rosterDate);
		model.put("selctedIncomeCenterId",incomeCenterId);
		SimpleDateFormat dateFormatter = new SimpleDateFormat("EEE, d MMMM");
		if(transactionRosterDate != null){
		String roster_Date = dateFormatter.format(transactionRosterDate);
		session.setAttribute("roster_Date", roster_Date);
		}
		return "/roster";
	}

	@RequestMapping(value = "/add-roster-event")
	public String getRosterEventDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		List<Events> eventList = rosterService.getEventList();
		model.addAttribute("eventList", eventList);
		return "/add-roster-event";
	}

	@RequestMapping(value = "/add-new-roster-event")
	public String addRosterEventDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");
		String rosterTransactionDate = (String) session.getAttribute("rosterDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		String eventId = request.getParameter("eventId");

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterTransactionDate);
		boolean isAdded = rosterService.addNewRosterEvent(eventId, income_center_id, transactionDate, userDetails);

		return "/roster";
	}

	@RequestMapping(value = "/add-roster-shift")
	public String getRosterShiftDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		/*
		 * List<RosterShift> shiftList = rosterService.getShiftDetails();
		 * model.addAttribute("shiftList", shiftList);
		 * 
		 * String shiftId = request.getParameter("shiftId"); RosterShift
		 * rosterShift = rosterService.getShiftTimes(shiftId);
		 * model.put("rosterShift", rosterShift); model.put("selectedShiftId",
		 * shiftId);
		 */
		
		String staff_roster_id = request.getParameter("staff_roster_id");
		if (staff_roster_id != null) {
			int staffRosterId = Integer.parseInt(staff_roster_id);
			if (staffRosterId > 0) {
				StaffRosters staffRoster = rosterService.getStaffRoster(staffRosterId);
				model.put("staffRoster", staffRoster);
				Staff staffPos = rosterService.getStaffPosition(staffRoster.getStaffId());
				model.put("staffPos", staffPos);
			}
		}	

		return "/add-roster-shift";
	}

	@RequestMapping(value = "/update-roster-shift-timeline", method = RequestMethod.POST)
	public void updateRosterShiftTimeline(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		
		String staff_roster_id = request.getParameter("staffRosterId");
		String startTime = request.getParameter("startTime");
		String finishTime = request.getParameter("endTime");
		String totalHours = request.getParameter("totalHours");
		User userDetails = (User) session.getAttribute("userDetails");
		
		rosterService.updateShiftRoster(Integer.parseInt(staff_roster_id), startTime, finishTime, totalHours,userDetails);
	}

	
	@RequestMapping(value = "/add-new-roster-shift")
	public String addRosterShiftDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		String staff_roster_id = request.getParameter("staffRosterId");
		int staffRosterId = 0;
		if (staff_roster_id != null && !staff_roster_id.isEmpty() && Integer.parseInt(staff_roster_id) > 0) {
			staffRosterId = Integer.parseInt(staff_roster_id);
		}
		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");
		String rosterTransactionDate = (String) session.getAttribute("rosterDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		boolean isPublicHoliday = (Boolean) session.getAttribute("isPublicHoliday");

		String staffId = request.getParameter("staffId");
		String startTime = request.getParameter("startTime");
		String finishTime = request.getParameter("endTime");
		String totalHours = request.getParameter("totalHours");
		String foh_boh = request.getParameter("workofhouse");
		String role = request.getParameter("role");

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterTransactionDate);
		boolean isAdded = rosterService.addNewRosterShift(staffRosterId, staffId, startTime, income_center_id, finishTime, transactionDate, userDetails, totalHours, foh_boh, role, isPublicHoliday);

		return "/roster";
	}

	@RequestMapping(value = "/add_staff_roster")
	public String getStaffForAllocation(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		List<Staff> staff_List = rosterService.getRosterShiftDetails();
		model.addAttribute("staff_List", staff_List);

		Date transactionRosterDate = BusinessBudgeterUtil.convertStringToDateForTran((String) session.getAttribute("rosterDate"));
		List<Roster> shiftList = rosterService.getShiftDetails((Integer) session.getAttribute("income-center"), transactionRosterDate);
		model.addAttribute("shiftList", shiftList);

		return "/add_staff_roster";
	}

	@RequestMapping(value = "/add_service_roster")
	public String getServiceForAllocation(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		int incomeCenterId = (Integer) session.getAttribute("income-center");
		Date transactionRosterDate = BusinessBudgeterUtil.convertStringToDateForTran((String) session.getAttribute("rosterDate"));
		String staff_roster_id = request.getParameter("staff_roster_id");
		List<Roster> shiftList = rosterService.getShiftDetails(incomeCenterId, transactionRosterDate);
		model.addAttribute("shiftList", shiftList);
		List<Services> seviceList = cashDrawerService.getServiceList(incomeCenterId);
		model.put("seviceList", seviceList);

		StaffRosters serviceStaff = rosterService.getServiceStaffName(staff_roster_id);
		model.put("serviceStaff", serviceStaff);

		return "/add_service_roster";
	}

	@RequestMapping(value = "/add_event_roster")
	public String getEventForAllocation(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String rosterTransactionDate = (String) session.getAttribute("rosterDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		Date transactionRosterDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterTransactionDate);
		String staff_roster_id = request.getParameter("staff_roster_id");
		List<Roster> shiftList = rosterService.getShiftDetails(income_center_id, transactionRosterDate);
		model.addAttribute("shiftList", shiftList);

		List<RosterEvent> rosterEventList = rosterService.getRosterEventList(transactionRosterDate, income_center_id);
		model.addAttribute("rosterEventList", rosterEventList);

		StaffRosters eventStaff = rosterService.getServiceStaffName(staff_roster_id);
		model.put("eventStaff", eventStaff);

		return "/add_event_roster";
	}

	@RequestMapping(value = "/allocate-service-to-roster")
	public String allocateServiceForRoster(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");
		String rosterTransactionDate = (String) session.getAttribute("rosterDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		int staffRosterId = Integer.parseInt(request.getParameter("staffRosterId"));
		String staffId = request.getParameter("staffId");
		String serviceId = request.getParameter("serviceId");
		String totalHours = request.getParameter("totalHours");
		String eligible = request.getParameter("isTipEligible");
		boolean isEligible = Boolean.parseBoolean(eligible);

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterTransactionDate);
		boolean isAdded = rosterService.allocateService(staffRosterId, serviceId, staffId, transactionDate, totalHours, userDetails, income_center_id, isEligible);

		return "/roster";
	}

	@RequestMapping(value = "/allocate-event-to-roster")
	public String allocateEventForRoster(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");
		String rosterTransactionDate = (String) session.getAttribute("rosterDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		String eventId = request.getParameter("eventId");
		String staffId = request.getParameter("staffId");
		String totalHours = request.getParameter("totalHours");
		boolean isEligible = Boolean.parseBoolean(request.getParameter("isTipEligible"));

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterTransactionDate);
		boolean isAdded = rosterService.allocateEvent(eventId, staffId, totalHours, income_center_id, transactionDate, userDetails, isEligible);

		return "/roster";
	}

	@RequestMapping(value = "/search-staff-name-roster")
	public @ResponseBody
	List<HashMap<String, String>> staffNameList(Model model, HttpServletRequest request, HttpServletResponse response) {
		String staffId = request.getParameter("term");
		List<StaffVoid> staffList = cashDrawerService.getStaffList(staffId);
		List<HashMap<String, String>> li = new ArrayList<HashMap<String, String>>();
		if (staffList != null && staffList.size() > 0) {
			for (StaffVoid staff : staffList) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id", staff.getStaffId());
				map.put("value", staff.getSatffName());
				map.put("position", staff.getPosition());
				li.add(map);
			}
		}else{
			HashMap staffNotFoundMap  = new HashMap<String, String>();
			staffNotFoundMap .put("value", "Data Not Found");
			li.add(staffNotFoundMap );
		}
		return li;
	}

	@RequestMapping(value = "/allocate-staff-to-roster")
	public String allocatetaffForShift(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		String shiftId = request.getParameter("shiftId");
		String staffId = request.getParameter("staffId");
		Date transactionRosterDate = BusinessBudgeterUtil.convertStringToDateForTran((String) session.getAttribute("rosterDate"));
		boolean flag = rosterService.isAlreadyAllocated(shiftId, staffId, transactionRosterDate, (Integer) session.getAttribute("income-center"));

		if (!flag) {
			if (rosterService.allocateStaff(shiftId, staffId, transactionRosterDate, (Integer) session.getAttribute("income-center"), (User) session.getAttribute("userDetails"))) {
				logger.info("Staff allocated successed!");
			} else {
				logger.info("Staff allocated failed!");
			}
		} else {
			logger.info("Staff is already allocated ");

		}

		return "/add_staff_roster";
	}

	@RequestMapping(value = "/remove_staff_roster")
	public String removeStaff(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		String incomeCenterId = request.getParameter("incomeCenterId");
		String operation = request.getParameter("operation");
		String staffId = request.getParameter("staffId");
		String satffRosterId = request.getParameter("satffRosterId");

		Date transactionRosterDate = BusinessBudgeterUtil.convertStringToDateForTran((String) session.getAttribute("rosterDate"));
		rosterService.removeStaffOrShift(staffId, transactionRosterDate, satffRosterId, operation, incomeCenterId);
		return "/roster";
	}

	@RequestMapping(value = "/search-staff-name-roster_service_event")
	public @ResponseBody
	List<HashMap<String, String>> getStaff(Model model, HttpServletRequest request, HttpServletResponse response) {
		String staffId = request.getParameter("term");
		HttpSession session = request.getSession(true);
		Date transactionRosterDate = BusinessBudgeterUtil.convertStringToDateForTran((String) session.getAttribute("rosterDate"));
		List<StaffVoid> staffList = cashDrawerService.getStaff(staffId, transactionRosterDate);
		List<HashMap<String, String>> li = new ArrayList<HashMap<String, String>>();
		if (staffList != null) {
			for (StaffVoid staff : staffList) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id", staff.getStaffId());
				map.put("value", staff.getSatffName());
				li.add(map);
			}
		}
		return li;
	}

	@RequestMapping(value = "/allocate-roster-shift")
	public String getRosterShift(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String staff_roster_id = request.getParameter("staff_roster_id");
		StaffRosters shiftStaff = rosterService.getServiceStaffName(staff_roster_id);
		model.put("shiftStaff", shiftStaff);

		return "/allocate-roster-shift";
	}

	@RequestMapping(value = "/allocate-new-roster-shift")
	public String allocateRosterShift(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		int staffRosterId = 0;
		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");
		String rosterTransactionDate = (String) session.getAttribute("rosterDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		boolean isPublicHoliday = (Boolean) session.getAttribute("isPublicHoliday");
		
		String staffId = request.getParameter("staffId");
		String startTime = request.getParameter("startTime");
		String finishTime = request.getParameter("endTime");
		String totalHours = request.getParameter("totalHours");
		String workofhouse = request.getParameter("workofhouse");
		String role = request.getParameter("role");

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterTransactionDate);
		boolean isAdded = rosterService.addNewRosterShift(staffRosterId, staffId, startTime, income_center_id, finishTime, transactionDate, userDetails, totalHours, workofhouse, role, isPublicHoliday);

		return "/roster";
	}
	
	@RequestMapping(value = "/set-public-holiday")
	public String setPublicHoliday(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");
		String rosterTransactionDate = (String) session.getAttribute("rosterDate");
		

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterTransactionDate);
		boolean isAdded = rosterService.setPublicHoliday(transactionDate, userDetails);

		return "/roster";
	}
	@RequestMapping(value = "/reset-public-holiday")
	public String resetPublicHoliday(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		String rosterTransactionDate = (String) session.getAttribute("rosterDate");
		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterTransactionDate);
		boolean isAdded = rosterService.resetPublicHoliday(transactionDate);

		return "/roster";
	}
	
	
	/*@RequestMapping(value = "/search-start-time")
	public String getShiftStartTime(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String startTime = request.getParameter("startTime");
		StaffRosters shiftStartTime = rosterService.getShiftStartTime(startTime);
		model.put("shiftStartTime", shiftStartTime);

		return "/allocate-roster-shift";
	}*/
	
	
	@RequestMapping(value = "/add-template")
	public String newTemplate(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return "/add-template";
	}
	
	@RequestMapping(value = "/send-staff-notifincation-template")
	public String sendStaffNotifincationTemplate(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return "/send-staff-notifincation-template";
	}
	
	@RequestMapping(value = "/send-staff-notifincation")
	public String sendStaffNotifincation(@RequestParam("startDate") Date startDate, @RequestParam("endDate")  Date endDate, HttpSession session) {
		int incomeCenterId = (Integer) session.getAttribute("income-center");
		User userDetails = (User) session.getAttribute("userDetails");
		String workofhouse = "All";
		
		Calendar start = Calendar.getInstance();
		start.setTime(startDate);
		
		Calendar end = Calendar.getInstance();
		end.setTime(endDate);
		
		int income_Center_Id = 2;
		
		end.setTime(endDate);
		List<String> list = new ArrayList<String>();
		for (Date transactionRosterDate = start.getTime(); !start.after(end); start.add(Calendar.DATE, 1), transactionRosterDate = start.getTime()) {

			Map<Integer, Services> serviceIdServiceMap = new HashMap<Integer, Services>();
			List<Services> seviceList = cashDrawerService.getServiceList(income_Center_Id);
			for (Services services : seviceList) {
				serviceIdServiceMap.put(services.getServiceId(), services);
			}

			List<RosterEvent> rosterEventList = null;
			Map<Integer, RosterEvent> eventIdEventMap = new HashMap<Integer, RosterEvent>();
			try {
				rosterEventList = rosterService.getRosterEventList(transactionRosterDate, income_Center_Id);
				for (RosterEvent rosterEvent : rosterEventList) {
					eventIdEventMap.put(rosterEvent.getEventId(), rosterEvent);
				}
			} catch (Exception e) {
				//logger.info("RosterController.callRosters() rosterService.getRosterEventList() " + e.getMessage());
			}

			Map<Integer, Staff> staffIdStaffMap = new HashMap<Integer, Staff>();
			List<Staff> staffList = cashDrawerService.searchStaffName("");
			for (Staff staff : staffList) {
				staffIdStaffMap.put(staff.getStaffId(), staff);
			}

			Map<Integer, List<StaffRostersEvents>> staffEventsMap = new HashMap<Integer, List<StaffRostersEvents>>();
			List<StaffRostersEvents> staffRostersEvents = rosterService.getStaffRostersEvents(transactionRosterDate, income_Center_Id, userDetails);
			for (StaffRostersEvents staffRostersService : staffRostersEvents) {
				if (eventIdEventMap.containsKey(staffRostersService.getEventId()))
					staffRostersService.setEvents(eventIdEventMap.get(staffRostersService.getEventId()));

				if (!staffEventsMap.containsKey(staffRostersService.getStaffId())) {
					staffEventsMap.put(staffRostersService.getStaffId(), new ArrayList<StaffRostersEvents>());
				}

				staffEventsMap.get(staffRostersService.getStaffId()).add(staffRostersService);
			}

			Map<Integer, List<StaffRostersServices>> staffServicesMap = new HashMap<Integer, List<StaffRostersServices>>();
			List<StaffRostersServices> staffRostersServices = rosterService.getStaffRostersServices(transactionRosterDate, income_Center_Id, userDetails);
			for (StaffRostersServices staffRostersService : staffRostersServices) {
				if (serviceIdServiceMap.containsKey(staffRostersService.getServiceId()))
					staffRostersService.setServices(serviceIdServiceMap.get(staffRostersService.getServiceId()));

				if (!staffServicesMap.containsKey(staffRostersService.getStaffId())) {
					staffServicesMap.put(staffRostersService.getStaffId(), new ArrayList<StaffRostersServices>());
				}

				staffServicesMap.get(staffRostersService.getStaffId()).add(staffRostersService);
			}

			Map<Integer, List<StaffRosters>> staffRosterMap = new HashMap<Integer, List<StaffRosters>>();
			List<StaffRosters> staffRosters = rosterService.getStaffRosters(transactionRosterDate, income_Center_Id, userDetails, workofhouse);
			for (StaffRosters staffRoster : staffRosters) {
				if (!staffRosterMap.containsKey(staffRoster.getStaffId())) {
					staffRosterMap.put(staffRoster.getStaffId(), new ArrayList<StaffRosters>());
				}

				if (staffIdStaffMap.containsKey(staffRoster.getStaffId()))
					staffRoster.setStaff(staffIdStaffMap.get(staffRoster.getStaffId()));

				if (staffServicesMap.containsKey(staffRoster.getStaffId()))
					staffRoster.setStaffRostersServices(staffServicesMap.get(staffRoster.getStaffId()));

				if (staffEventsMap.containsKey(staffRoster.getStaffId()))
					staffRoster.setStaffRostersEvents(staffEventsMap.get(staffRoster.getStaffId()));

				staffRosterMap.get(staffRoster.getStaffId()).add(staffRoster);
			}
			
			for (Map.Entry<Integer, List<StaffRosters>> entry : staffRosterMap.entrySet()) {
				Staff staff = staffIdStaffMap.get(entry.getKey());
				for (StaffRosters staffRoster : entry.getValue()) {
					staffEmailNotification.send(staffRoster, staff);
				}
			}
		}
				
			
		return "/send-staff-notifincation-template";
	}
	
	
	@RequestMapping(value = "/save-roster-as-template")
	public String saveRosterAsTemplate(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		User userDetails = (User) session.getAttribute("userDetails");
		String rosterDate = (String) session.getAttribute("rosterDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		
		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterDate);
		String templateName = request.getParameter("templateName");
		
		boolean isAdded = rosterService.addNewTemplate(transactionDate, income_center_id, userDetails, templateName);

		return "/roster";
	}
	
	@RequestMapping(value = "/use-template")
	public String useTemplateRoster(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		User userDetails = (User) session.getAttribute("userDetails");
		String rosterDate = (String) session.getAttribute("rosterDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		
		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterDate);
		String templateId = request.getParameter("templateId");
		int templateid = 0;
		if (templateId != null && !templateId.isEmpty() && Integer.parseInt(templateId) > 0) {
			templateid = Integer.parseInt(templateId);
		}
		
		List<RosterTemplate> rosterTemplateList = rosterService.useTemplate(transactionDate, income_center_id, userDetails, templateid);

		return "/roster";
	}
	
	@RequestMapping(value = "/previous-roster-date")
	public String previousRoster(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);
		return "/previous-roster-date";
	}
	
	@RequestMapping(value = "/use-previous-roster")
	public String usePreviousRoster(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		User userDetails = (User) session.getAttribute("userDetails");
		String rosterDate = (String) session.getAttribute("rosterDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		
		String previousRosterDate = request.getParameter("prevRosterDate");
		String incomeCenterId = request.getParameter("incomeCenterId");
		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(rosterDate);
		Date prevRosterDate = BusinessBudgeterUtil.convertStringToDateForTran(previousRosterDate);
		
		List<StaffRosters> staffRosterList = rosterService.usePreviousRoster(transactionDate, income_center_id, userDetails, prevRosterDate,incomeCenterId);

		return "/roster";
	}
	
	@RequestMapping(value = "/roster-date-selector")
	public String rosterDateSelector(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);
		return "/roster-date-selector";
	}
	
	@RequestMapping(value = "/print-roster")
	public String printRoster(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String ic_id = request.getParameter("income_Center_Id");
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		String workofhouse = "All";

		List<Map<Integer, List<StaffRosters>>> rostersList = new ArrayList<Map<Integer,List<StaffRosters>>>();
		List transactionDateList  = new ArrayList<String>();
		int income_Center_Id = 2;
		/*if (ic_id != null && !ic_id.isEmpty() && Integer.parseInt(ic_id) > 0) {
			income_Center_Id = Integer.parseInt(ic_id);
		}*/
		
		User userDetails = (User) session.getAttribute("userDetails");
		model.put("userName", userDetails);
		Date startDate = BusinessBudgeterUtil.convertStringToDateForTran(fromDate);
		Date endDate = BusinessBudgeterUtil.convertStringToDateForTran(toDate);

		Calendar start = Calendar.getInstance();
		start.setTime(startDate);
		Calendar end = Calendar.getInstance();
		end.setTime(endDate);
		List<String> list = new ArrayList<String>();
		for (Date transactionRosterDate = start.getTime(); !start.after(end); start.add(Calendar.DATE, 1), transactionRosterDate = start.getTime()) {

			Map<Integer, Services> serviceIdServiceMap = new HashMap<Integer, Services>();
			List<Services> seviceList = cashDrawerService.getServiceList(income_Center_Id);
			for (Services services : seviceList) {
				serviceIdServiceMap.put(services.getServiceId(), services);
			}

			List<RosterEvent> rosterEventList = null;
			Map<Integer, RosterEvent> eventIdEventMap = new HashMap<Integer, RosterEvent>();
			try {
				rosterEventList = rosterService.getRosterEventList(transactionRosterDate, income_Center_Id);
				for (RosterEvent rosterEvent : rosterEventList) {
					eventIdEventMap.put(rosterEvent.getEventId(), rosterEvent);
				}
			} catch (Exception e) {
				//logger.info("RosterController.callRosters() rosterService.getRosterEventList() " + e.getMessage());
			}

			Map<Integer, Staff> staffIdStaffMap = new HashMap<Integer, Staff>();
			List<Staff> staffList = cashDrawerService.searchStaffName("");
			for (Staff staff : staffList) {
				staffIdStaffMap.put(staff.getStaffId(), staff);
			}

			Map<Integer, List<StaffRostersEvents>> staffEventsMap = new HashMap<Integer, List<StaffRostersEvents>>();
			List<StaffRostersEvents> staffRostersEvents = rosterService.getStaffRostersEvents(transactionRosterDate, income_Center_Id, userDetails);
			for (StaffRostersEvents staffRostersService : staffRostersEvents) {
				if (eventIdEventMap.containsKey(staffRostersService.getEventId()))
					staffRostersService.setEvents(eventIdEventMap.get(staffRostersService.getEventId()));

				if (!staffEventsMap.containsKey(staffRostersService.getStaffId())) {
					staffEventsMap.put(staffRostersService.getStaffId(), new ArrayList<StaffRostersEvents>());
				}

				staffEventsMap.get(staffRostersService.getStaffId()).add(staffRostersService);
			}

			Map<Integer, List<StaffRostersServices>> staffServicesMap = new HashMap<Integer, List<StaffRostersServices>>();
			List<StaffRostersServices> staffRostersServices = rosterService.getStaffRostersServices(transactionRosterDate, income_Center_Id, userDetails);
			for (StaffRostersServices staffRostersService : staffRostersServices) {
				if (serviceIdServiceMap.containsKey(staffRostersService.getServiceId()))
					staffRostersService.setServices(serviceIdServiceMap.get(staffRostersService.getServiceId()));

				if (!staffServicesMap.containsKey(staffRostersService.getStaffId())) {
					staffServicesMap.put(staffRostersService.getStaffId(), new ArrayList<StaffRostersServices>());
				}

				staffServicesMap.get(staffRostersService.getStaffId()).add(staffRostersService);
			}

			Map<Integer, List<StaffRosters>> staffRosterMap = new HashMap<Integer, List<StaffRosters>>();
			List<StaffRosters> staffRosters = rosterService.getStaffRosters(transactionRosterDate, income_Center_Id, userDetails, workofhouse);
			for (StaffRosters staffRoster : staffRosters) {
				if (!staffRosterMap.containsKey(staffRoster.getStaffId())) {
					staffRosterMap.put(staffRoster.getStaffId(), new ArrayList<StaffRosters>());
				}

				if (staffIdStaffMap.containsKey(staffRoster.getStaffId()))
					staffRoster.setStaff(staffIdStaffMap.get(staffRoster.getStaffId()));

				if (staffServicesMap.containsKey(staffRoster.getStaffId()))
					staffRoster.setStaffRostersServices(staffServicesMap.get(staffRoster.getStaffId()));

				if (staffEventsMap.containsKey(staffRoster.getStaffId()))
					staffRoster.setStaffRostersEvents(staffEventsMap.get(staffRoster.getStaffId()));

				staffRosterMap.get(staffRoster.getStaffId()).add(staffRoster);
			}
			if(staffRosterMap.size() > 0){
				rostersList.add(staffRosterMap);
				
				SimpleDateFormat dateFormatter = new SimpleDateFormat("EEE, d MMMM ");
				String roster_Date_print = dateFormatter.format(transactionRosterDate);
				transactionDateList.add(roster_Date_print);
			}
		}
		model.addAttribute("transactionDateList", transactionDateList);
		model.addAttribute("staffRosterMapList", rostersList);
		return "/print-roster";
	}
}
