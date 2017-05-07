package com.f5infosol.businessbudgeter.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.EventsRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.PublicHolidayRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.RosterEventRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.RosterRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.RosterRowMapperForTrans;
import com.f5infosol.businessbudgeter.dao.rowmapper.RosterShiftRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.RosterTemplateRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.ServicesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRosterRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRostersServicesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffVoidRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.TemplateMasterRowMapper;
import com.f5infosol.businessbudgeter.domain.Events;
import com.f5infosol.businessbudgeter.domain.PublicHoliday;
import com.f5infosol.businessbudgeter.domain.Roster;
import com.f5infosol.businessbudgeter.domain.RosterDetails;
import com.f5infosol.businessbudgeter.domain.RosterEvent;
import com.f5infosol.businessbudgeter.domain.RosterShift;
import com.f5infosol.businessbudgeter.domain.RosterTemplate;
import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.StaffRosters;
import com.f5infosol.businessbudgeter.domain.StaffRostersServices;
import com.f5infosol.businessbudgeter.domain.StaffVoid;
import com.f5infosol.businessbudgeter.domain.TemplateMaster;
import com.f5infosol.businessbudgeter.domain.User;

@Repository
public class RosterDAOImpl extends BaseDAOImpl implements RosterDAO {

	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	public List<Events> getEventList() {
		List<Events> eventList = jdbcTemplate.query(Queries.GET_EVENTS, new EventsRowMapper());
		if (eventList != null && eventList.size() > 0) {
			return eventList;
		} else {
			return null;
		}
	}

	@Override
	public boolean addNewRosterEvent(String eventId, int income_center_id, Date transactionDate, User userDetails) {

		boolean isAdded = false;
		try {
			Object[] param = { Integer.parseInt(eventId), income_center_id, transactionDate, userDetails.getUserName() };
			jdbcTemplate.update(Queries.INSERT_ROSTER_EVENT, param);

			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public List<RosterEvent> getRosterEventList(Date transactionRosterDate, Integer incomeCenterId) {

		Object[] param = { transactionRosterDate, incomeCenterId };
		List<RosterEvent> rosterEventList = jdbcTemplate.query(Queries.GET_ROSTER_EVENTS, param, new RosterEventRowMapper());
		if (rosterEventList != null && rosterEventList.size() > 0) {
			return rosterEventList;
		} else {
			return null;
		}
	}

	@Override
	public List<Staff> getRosterShiftDetails() {

		List<Staff> staffList = jdbcTemplate.query(Queries.GET_STAFF, new StaffRowMapper());
		if (staffList != null && staffList.size() > 0) {
			return staffList;
		} else {
			return null;
		}
	}

	@Override
	public List<RosterShift> getShiftDetails() {

		List<RosterShift> shiftList = jdbcTemplate.query(Queries.GET_SHIFT, new RosterShiftRowMapper());
		if (shiftList != null && shiftList.size() > 0) {
			return shiftList;
		} else {
			return null;
		}

	}

	@Override
	public boolean addNewRosterShift(int staffRosterId, String staffId, String startTime, int income_center_id, String finishTime, Date transactionDate, User userDetails, String totalHours, String workofhouse, String role,  boolean isPublicHoliday) {

		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			String total_hours = totalHours.replace(":", ".");
				if(staffRosterId > 0){
					
					Object[] param = {staffRosterId};
					jdbcTemplate.update(Queries.REMOVE_STAFF_ROSTERS_FOR_UPDATE, param);
					
					Object[] paramInsert = { Integer.parseInt(staffId), transactionDate, sdf.parse(startTime), sdf.parse(finishTime), Double.parseDouble(total_hours), userDetails.getUserName(), income_center_id, workofhouse, role,  isPublicHoliday };
					jdbcTemplate.update(Queries.INSERT_ROSTER_SHIFT_STAFF, paramInsert);
					
					/*Object[] param = { Integer.parseInt(staffId), transactionDate, sdf.parse(startTime), sdf.parse(finishTime), Double.parseDouble(total_hours), updatedOn, userDetails.getUserName(), income_center_id, workofhouse, role, staffRosterId};
					jdbcTemplate.update(Queries.UPDATE_ROSTER_SHIFT_STAFF, param);*/
					
				}else{
					Object[] param = { Integer.parseInt(staffId), transactionDate, sdf.parse(startTime), sdf.parse(finishTime), Double.parseDouble(total_hours), userDetails.getUserName(), income_center_id, workofhouse, role,  isPublicHoliday };
					jdbcTemplate.update(Queries.INSERT_ROSTER_SHIFT_STAFF, param);
			}
			isAdded = true;
			
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public List<Roster> getStaffRosterDetails(Date transactionRosterDate, Integer incomeCenterId, User userDetails) {
		Object[] param = { transactionRosterDate, incomeCenterId };
		List<Roster> staffShiftRoster = jdbcTemplate.query(Queries.GET_STAFF_SHIFT_ROSTER, param, new RosterRowMapper());
		if (staffShiftRoster != null && staffShiftRoster.size() > 0) {
			return staffShiftRoster;
		} else {

			try {

				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
				int shiftId = 1;
				String startTime = "08:00:00";
				String finishTime = "12:00:00";

				Object[] param1 = { shiftId, incomeCenterId, transactionRosterDate, sdf.parse(startTime), sdf.parse(finishTime), userDetails.getUserName() };
				jdbcTemplate.update(Queries.INSERT_ROSTER_SHIFT_DEFAULT, param1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			staffShiftRoster = jdbcTemplate.query(Queries.GET_STAFF_SHIFT_ROSTER, param, new RosterRowMapper());
		}
		return staffShiftRoster;
	}

	@Override
	public boolean allocateService(Integer staffRosterId , String serviceId, String staffId, Date transactionDate, String totalHrs, User userDetails, int income_center_id, boolean isEligible) {
		
		boolean isAdded = false;
		Date updatedOn = Calendar.getInstance().getTime();
		try {
			/*Object[] param = {staffRosterId};
			List<StaffRostersServices> staffRosterService = jdbcTemplate.query(Queries.GET_SERVICES_STAFF_ROSTER, param, new StaffRostersServicesRowMapper());
			
			if(staffRosterService != null && staffRosterService.size() > 0){
					Object[] paramUpdate = { Integer.parseInt(serviceId), Double.parseDouble(totalHrs), updatedOn, userDetails.getUserName(), staffRosterId };
					jdbcTemplate.update(Queries.UPDATE_ROSTER_SERVICE_TO_STAFF, paramUpdate);
			}else{*/
				
					Object[] paramInsert = { Integer.parseInt(serviceId), staffRosterId, Integer.parseInt(staffId), transactionDate, Double.parseDouble(totalHrs), userDetails.getUserName(), income_center_id, isEligible };
					jdbcTemplate.update(Queries.ALLOCATE_ROSTER_SERVICE_TO_STAFF, paramInsert);
		/*	}*/
			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public boolean allocateEvent(String eventId, String staffId, String totalHours, int income_center_id, Date transactionDate, User userDetails, boolean isEligible ) {
		boolean isAdded = false;
		try {
			Object[] param = { Integer.parseInt(eventId), Integer.parseInt(staffId), Double.parseDouble(totalHours), transactionDate, userDetails.getUserName(), income_center_id, isEligible };
			jdbcTemplate.update(Queries.ALLOCATE_ROSTER_EVENT_TO_STAFF, param);

			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public List<Roster> getRosterShiftDetails(Integer incomeCenterId, Date tosterDate) {

		Object[] param1 = { incomeCenterId, tosterDate };
		List<Roster> siftList = jdbcTemplate.query(Queries.GET_SHIFT_FOR_ROSTER, param1, new RosterRowMapperForTrans());

		if (siftList != null && siftList.size() > 0) {
			return siftList;
		} else {
			return null;
		}
	}

	@Override
	public boolean isAlreadyAllocated(String shiftId, String staffId, Date transactionRosterDate, Integer incomecenterId) {

		Object[] param = { Integer.parseInt(shiftId), Integer.parseInt(staffId), transactionRosterDate, incomecenterId };
		int count = jdbcTemplate.queryForInt(Queries.IS_STAFF_ALREADYALLOCATEQUERY, param);

		if (count > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public RosterShift getShiftTimes(String shiftId) {
		Object[] param = { Integer.parseInt(shiftId) };
		List<RosterShift> shiftList = jdbcTemplate.query(Queries.GET_SHIFT_TIME, param, new RosterShiftRowMapper());
		if (shiftList != null && shiftList.size() > 0) {
			return shiftList.get(0);
		} else {
			return null;
		}

	}

	@Override
	public boolean allocateStaff(String shiftId, String staffId, Date transactionRosterDate, Integer incomeCenterId, User userDetails) {

		Object[] param = { Integer.parseInt(shiftId), transactionRosterDate, incomeCenterId };

		try {
			int count = jdbcTemplate.queryForInt(Queries.IS_SHIFT_ALLOCATED, param);

			if (count > 0) {
				logger.info("Insert new shift");
				Object[] param1 = { Integer.parseInt(shiftId) };
				List<RosterShift> shiftStartEndTimeList = jdbcTemplate.query(Queries.GET_SHIFT_START_END_TIME, param1, new RosterShiftRowMapper());

				String startTime = "";
				String finishTime = "";

				if (shiftStartEndTimeList != null && shiftStartEndTimeList.size() > 0) {
					for (RosterShift shift : shiftStartEndTimeList) {
						startTime = shift.getStartTime();
						finishTime = shift.getFinishTime();
					}
				}
				return addNewRosterShiftForNewStaff(shiftId, staffId, startTime, finishTime, transactionRosterDate, incomeCenterId, userDetails.getUserName());
			} else {
				logger.info("update new shift");
				Date updatedOn = Calendar.getInstance().getTime();
				Object[] param2 = { Integer.parseInt(staffId), updatedOn, userDetails.getUserName(), Integer.parseInt(shiftId), incomeCenterId, transactionRosterDate };
				int count1 = jdbcTemplate.update(Queries.UPDATE_STAFF_SHIFT_ROSTER, param2);

				if (count1 > 0) {
					logger.info("staff reallocated");
					return true;
				} else {
					logger.info("staff not reallocated");
					return false;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}

	public boolean addNewRosterShiftForNewStaff(String shiftId, String staffId, String startTime, String finishTime, Date transactionRosterDate, Integer incomeCenterId, String userName) {

		boolean isAdded = false;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

			Object[] param = { Integer.parseInt(shiftId), Integer.parseInt(staffId), incomeCenterId, transactionRosterDate, sdf.parse(startTime), sdf.parse(finishTime), userName };
			int count = jdbcTemplate.update(Queries.INSERT_NEW_ROSTER_SHIFT, param);
			if (count > 0) {
				isAdded = true;
			} else {
				isAdded = false;
			}
		//	allocateService(serviceId, staffId, transactionDate, totalHrs, userDetails, income_center_id, isEligible);
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public List<RosterDetails> getRosterDetails(Date transactionRosterDate, Integer incomeCenterId, User userDetails) {

		try {
			Object[] param = { incomeCenterId, transactionRosterDate };
			List<Roster> rosterList = jdbcTemplate.query(Queries.ROSTER_DETAILS_QRY, param, new RosterRowMapper());

			if (rosterList != null && rosterList.size() > 0) {

				int tempStaffId = 999999999;
				int rosterID = 1;
				RosterDetails rosterDetails = null;
				List<Roster> temprosterList = null;
				List<RosterDetails> rosterDetailsList = new ArrayList<RosterDetails>();

				for (Roster r : rosterList) {

					r = getCompleteRosterDetails(r);

					if (rosterList.size() == 1) {
						temprosterList = new ArrayList<Roster>();
						temprosterList.add(r);
						rosterDetails = new RosterDetails();
						rosterDetails.setRosterId(rosterID);
						rosterDetails.setRosterDetails(temprosterList);
						rosterDetailsList.add(rosterDetails);
						return rosterDetailsList;
					}

					if (r.getStaffId() == tempStaffId) {
						temprosterList.add(r);
					} else {
						if (temprosterList != null && temprosterList.size() > 0) {
							rosterDetails = new RosterDetails();
							rosterDetails.setRosterId(rosterID);
							rosterDetails.setRosterDetails(temprosterList);
							rosterDetailsList.add(rosterDetails);
							rosterID++;
						}

						temprosterList = new ArrayList<Roster>();
						temprosterList.add(r);
						tempStaffId = r.getStaffId();
					}

				}

				if (temprosterList != null && temprosterList.size() > 0) {
					rosterDetails = new RosterDetails();
					rosterDetails.setRosterId(rosterID);
					rosterDetails.setRosterDetails(temprosterList);
					rosterDetailsList.add(rosterDetails);
				}

				return rosterDetailsList;
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public String getStaffName(int staffId) {

		try {
			Object[] param = { staffId };
			List<Staff> staffList = jdbcTemplate.query(Queries.GET_STAFF_NAME, param, new StaffRowMapper());
			if (staffList != null && staffList.size() > 0) {
				return staffList.get(0).getSatffName();
			} else {
				return "";
			}
		} catch (Exception e) {
			return "";
		}
	}

	public String getEventName(int eventId) {

		try {
			Object[] param = { eventId };
			List<Events> eventList = jdbcTemplate.query(Queries.GET_EVENT_NAME, param, new EventsRowMapper());
			if (eventList != null && eventList.size() > 0) {
				return eventList.get(0).getEventName();
			} else {
				return "";
			}
		} catch (Exception e) {
			return "";
		}
	}

	public String getServiceName(int serviceId) {

		try {
			Object[] param = { serviceId };
			List<Services> serviceList = jdbcTemplate.query(Queries.GET_SERVICE_NAME, param, new ServicesRowMapper());
			if (serviceList != null && serviceList.size() > 0) {
				return serviceList.get(0).getServiceName();
			} else {
				return "";
			}
		} catch (Exception e) {
			return "";
		}
	}

	public Roster getCompleteRosterDetails(Roster r) {
		String staffName = "";
		String eventName = "";
		String serviceName = "";

		try {

			if (r.getStaffId() != 0) {
				staffName = getStaffName(r.getStaffId());
			}

			if (r.getEventId() != 0) {
				eventName = getEventName(r.getEventId());
			}

			if (r.getServiceId() != 0) {
				serviceName = getServiceName(r.getServiceId());
			}

			r.setStaffName(staffName);
			if (!eventName.equals("")) {
				r.setEventName("Event - " + eventName);
			} else {
				r.setEventName(eventName);
			}

			if (!serviceName.equals("")) {
				r.setServiceName("Service - " + serviceName);
			} else {
				r.setServiceName(serviceName);
			}

		} catch (Exception e) {
			return r;
		}
		return r;
	}

	@Override
	public boolean removeShiftService(String satffRosterId) {
		
		boolean status =false;
		Object[] param = { Integer.parseInt(satffRosterId) };
		jdbcTemplate.update(Queries.REMOVE_SERVICES_STAFF_ROSTER, param);
		return status;
	}
	
	
	@Override
	public boolean removeStaffOrShift(String staffId, Date transactionRosterDate, String satffRosterId, String operation, String incomeCenterId) {
		logger.info("remove new staff");
		int count = 0;
		if (operation.equalsIgnoreCase("removeStaff")) {
			Object[] param = { Integer.parseInt(staffId), transactionRosterDate, Integer.parseInt(incomeCenterId) };
			// int count = jdbcTemplate.update(Queries.REMOVE_STAFF, param);
			count = jdbcTemplate.update(Queries.REMOVE_STAFF_ROSTERS, param);
			jdbcTemplate.update(Queries.REMOVE_STAFF_EVENT, param);
			jdbcTemplate.update(Queries.REMOVE_STAFF_SERVICES, param);
			logger.info("staff removed");
		} else if (operation.equalsIgnoreCase("removeShift")) {
			Object[] param = { Integer.parseInt(satffRosterId), Integer.parseInt(incomeCenterId) };
			// int count = jdbcTemplate.update(Queries.REMOVE_STAFF, param);
			count = jdbcTemplate.update(Queries.REMOVE_SATFF_ROSTER, param);
			removeShiftService(satffRosterId);
			logger.info("removeShift");
		} else {
			logger.info("RosterDAOImpl.removeStaffOrShift() INVALID OPERATION");
		}

		if (count > 0) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public Object updateStaffRosters(Integer indexOneStaffId, String startTime, String finishTime, String totalHours) {
		boolean isAdded = false;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			String total_hours = totalHours.replace(":", ".");
			Object[] param = { sdf.parse(startTime), sdf.parse(finishTime), Double.parseDouble(total_hours), indexOneStaffId };
			jdbcTemplate.update(Queries.UPDATE_ROSTER_SHIFT_STAFF, param);

			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public void rosterUpdateServices(Integer staffRosterServiceId, Double value) {
		Object[] param = { value, staffRosterServiceId };
		jdbcTemplate.update(Queries.UPDATE_STAFF_ROSTERS_SERVICES, param);
	}

	@Override
	public void rosterUpdateEvents(Integer satffRosterEventId, Double value) {
		Object[] param = { value, satffRosterEventId };
		jdbcTemplate.update(Queries.UPDATE_STAFF_ROSTERS_EVENTS, param);
	}

	@Override
	public StaffRosters getServiceStaffName(String staff_roster_id) {
		Object[] param = { Integer.parseInt(staff_roster_id) };
		List<StaffRosters> serviceStaff = jdbcTemplate.query(Queries.GET_SERVICE_STAFF_NAME, param, new StaffRosterRowMapper());
		if (serviceStaff != null && serviceStaff.size() > 0)
			return serviceStaff.get(0);
		else
			return null;

	}

	@Override
	public boolean setPublicHoliday(Date transactionDate, User userDetails) {
		boolean isAdded = false;
		try {
			Object[] param = { transactionDate, userDetails.getUserName() };
			jdbcTemplate.update(Queries.INSERT_PUBLIC_HOLIDAY, param);

			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public PublicHoliday getPublicHoliday(Date transactionRosterDate) {
		Object[] param = {transactionRosterDate};
		List<PublicHoliday> holiday = jdbcTemplate.query(Queries.GET_PUBLIC_HOLIDAY, param, new PublicHolidayRowMapper());
		if(holiday != null && holiday.size()>0)
			return holiday.get(0);
		else
		return null;
	}

	@Override
	public boolean resetPublicHoliday(Date transactionDate) {
			boolean isAdded = false;
			try {
				Object[] param = { transactionDate};
				jdbcTemplate.update(Queries.REMOVE_PUBLIC_HOLIDAY, param);

				isAdded = true;
			} catch (Exception e) {
				isAdded = false;
				e.printStackTrace();
			}
			return isAdded;
		}

	@Override
	public StaffRosters getStaffRoster(int staffRosterId) {
		Object[] param = {staffRosterId};
		List<StaffRosters> staffRoster = jdbcTemplate.query(Queries.GET_STAFF_ROSTER, param, new StaffRosterRowMapper());
		if(staffRoster != null && staffRoster.size() > 0)
			return staffRoster.get(0);
		else
		return null;
	}

	@Override
	public Staff getStaffPosition(Integer staffId) {
		
			Object[] param = { staffId };
			List<Staff> staffList = jdbcTemplate.query(Queries.GET_STAFF_NAME, param, new StaffRowMapper());
			if (staffList != null && staffList.size() > 0) {
				return staffList.get(0);
			} else {
				return null;
			}
		
	}

	@Override
	public List<StaffRosters> getStaffRosterForService(String staffId, int income_center_id, Date transactionDate) {
		
		Object[] param = {income_center_id, transactionDate, Integer.parseInt(staffId)};
		List<StaffRosters> staffRosterList = jdbcTemplate.query(Queries.GET_STAFF_ROSTER_FOR_SERVICE, param, new StaffRosterRowMapper());
		return staffRosterList;
	}

	
	@Override
	public boolean saveRosterAsTemplate(Date transactionDate, int income_center_id, User userDetails) {
		boolean isAdded = false;
		int templateId = 0;
		String qryTemplateId = "select max(template_id) from template_master";
		SqlRowSet rsTemplateId = selectResults(qryTemplateId);

		if (rsTemplateId.next()) {
			templateId = rsTemplateId.getInt(1);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		Object[] param = {transactionDate,income_center_id};
		
		List<StaffRosters> staffRosterList = jdbcTemplate.query(Queries.GET_STAFF_ROSTER_FOR_TEMPLATE, param, new StaffRosterRowMapper());
		for (StaffRosters staffRoster : staffRosterList ){
			try {
				String startTime = 	staffRoster.getStartTime();
				String finishTime = staffRoster.getFinishTime();
				
				Object[] templateData = {templateId, staffRoster.getStaffId(),sdf.parse(startTime), sdf.parse(finishTime), staffRoster.getTotalHours(),
										staffRoster.getPublicHoliday(), userDetails.getUserName(), staffRoster.getWorkofhouse(), staffRoster.getRole()};
				jdbcTemplate.update(Queries.INSERT_ROSTER_TEMPLATE, templateData);
				isAdded = true;
			} catch (Exception e) {
				isAdded = false;
				e.printStackTrace();
			}
		}
			return isAdded;
	}

	@Override
	public boolean addNewTemplate(Date transactionDate, int income_center_id, User userDetails, String templateName) {
		boolean isAdded = false;
		
			try {
				
				Object[] param = {templateName, transactionDate, userDetails.getUserName()};
				jdbcTemplate.update(Queries.INSERT_TEMPLATE, param);
				isAdded = true;
			} catch (Exception e) {
				isAdded = false;
				e.printStackTrace();
			}
			return isAdded;
	}

	@Override
	public List<TemplateMaster> getTemplateList() {
		List<TemplateMaster> templateList = jdbcTemplate.query(Queries.GET_TEMPLATE_LIST, new TemplateMasterRowMapper());
		return templateList;
	}

	@Override
	public List<RosterTemplate> useTemplate(Date transactionDate, int income_center_id, User userDetails, int templateid) {
		Object[] param = {templateid};
 		List<RosterTemplate> RosterTemplateList = jdbcTemplate.query(Queries.GET_ROSTER_FORM_TEMPLATE, param, new RosterTemplateRowMapper());
		return RosterTemplateList;
	}

	@Override
	public List<StaffRosters> usePreviousRoster(Date transactionDate, int income_center_id, User userDetails, Date prevRosterDate, String incomeCenterId) {
		Object[] param = {prevRosterDate,Integer.parseInt(incomeCenterId)};
		List<StaffRosters> staffRosterList = jdbcTemplate.query(Queries.GET_ROSTER_FORM_PREVEOUS_DATE, param, new StaffRosterRowMapper());
		return staffRosterList;
		
	}

	


	/*@Override
	public StaffRosters getShiftStartTime(String startTime) {
		boolean isAdded = false;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

			Object[] param = { sdf.parse(startTime) };
			List<StaffRosters> startShiftStaff = jdbcTemplate.query(Queries.CHECK_START_TIME, param, new StaffRosterRowMapper());
			if(startShiftStaff != null && startShiftStaff.size() > 0)
			{
				return startShiftStaff.get(0);
				//isAdded = true;
			} else {
				isAdded = false;
			}
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return null;
	
		Object[] param = { };
		List<StaffRosters> startShiftStaff = jdbcTemplate.query(Queries.CHECK_START_TIME, param, new StaffRosterRowMapper());
			if(startShiftStaff != null && startShiftStaff.size() > 0)
				return startShiftStaff.get(0);
			else
				return null;
	}*/
}
