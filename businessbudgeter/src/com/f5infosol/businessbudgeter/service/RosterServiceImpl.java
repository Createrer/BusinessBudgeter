package com.f5infosol.businessbudgeter.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.f5infosol.businessbudgeter.dao.CashDrawerDAO;
import com.f5infosol.businessbudgeter.dao.RosterDAO;
import com.f5infosol.businessbudgeter.dao.StaffRostersDAO;
import com.f5infosol.businessbudgeter.dao.StaffRostersEventsDAO;
import com.f5infosol.businessbudgeter.dao.StaffRostersServicesDAO;
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
import com.f5infosol.businessbudgeter.domain.StaffRostersEvents;
import com.f5infosol.businessbudgeter.domain.StaffRostersServices;
import com.f5infosol.businessbudgeter.domain.TemplateMaster;
import com.f5infosol.businessbudgeter.domain.User;

@Service
public class RosterServiceImpl implements RosterService {

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource
	RosterDAO objDao;

	@Resource
	StaffRostersDAO staffRostersDAO;

	@Resource
	StaffRostersServicesDAO staffRostersServicesDAO;

	@Resource
	StaffRostersEventsDAO staffRostersEventsDAO;

	@Resource
	CashDrawerDAO cashDrawerDao;

	@Override
	public List<Events> getEventList() {
		return objDao.getEventList();
	}

	@Override
	public boolean addNewRosterEvent(String eventId, int income_center_id, Date transactionDate, User userDetails) {
		return objDao.addNewRosterEvent(eventId, income_center_id, transactionDate, userDetails);
	}

	@Override
	public List<RosterEvent> getRosterEventList(Date transactionRosterDate, Integer incomeCenterId) {
		return objDao.getRosterEventList(transactionRosterDate, incomeCenterId);
	}

	@Override
	public List<Staff> getRosterShiftDetails() {
		return objDao.getRosterShiftDetails();
	}

	@Override
	public List<RosterShift> getShiftDetails() {
		return objDao.getShiftDetails();
	}

	@Override
	public List<Roster> getStaffRosterDetails(Date transactionRosterDate, Integer incomeCenterId, User userDetails) {
		return objDao.getStaffRosterDetails(transactionRosterDate, incomeCenterId, userDetails);
	}

	@Override
	public boolean allocateService(Integer staffRosterId, String serviceId, String staffId, Date transactionDate, String totalHrs, User userDetails, int income_center_id, boolean isEligible) {
		return objDao.allocateService(staffRosterId, serviceId, staffId, transactionDate, totalHrs, userDetails, income_center_id, isEligible);
	}

	@Override
	public boolean allocateEvent(String eventId, String staffId, String totalHours, int income_center_id, Date transactionDate, User userDetails, boolean isEligible) {
		return objDao.allocateEvent(eventId, staffId, totalHours, income_center_id, transactionDate, userDetails, isEligible);
	}

	@Override
	public List<Roster> getShiftDetails(Integer incomeCenterId, Date tosterDate) {
		return objDao.getRosterShiftDetails(incomeCenterId, tosterDate);
	}

	@Override
	public boolean isAlreadyAllocated(String shiftId, String staffId, Date transactionRosterDate, Integer incomeCneterId) {
		return objDao.isAlreadyAllocated(shiftId, staffId, transactionRosterDate, incomeCneterId);
	}

	@Override
	public RosterShift getShiftTimes(String shiftId) {
		return objDao.getShiftTimes(shiftId);
	}

	@Override
	public boolean allocateStaff(String shiftId, String staffId, Date transactionRosterDate, Integer incomeCenterId, User userDetails) {
		return objDao.allocateStaff(shiftId, staffId, transactionRosterDate, incomeCenterId, userDetails);
	}

	@Override
	public List<RosterDetails> getRosterDetails(Date transactionRosterDate, Integer incomeCenterId, User userDetails) {
		return objDao.getRosterDetails(transactionRosterDate, incomeCenterId, userDetails);
	}

	private double getShiftAllocatedTimeForService(String startTime, String finishTime, String startServiceTime, String endserviceTime) {

		double hourDiffrence = 0.0;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			Date shiftStartDate = sdf.parse(startTime);
			Date shiftFinishDate = sdf.parse(finishTime);

			Date startServiceDate = sdf.parse(startServiceTime);
			Date endServiceDate = sdf.parse(endserviceTime);

			long t1;
			long t2;
			if (shiftStartDate.getTime() <= endServiceDate.getTime() && shiftFinishDate.getTime() >= startServiceDate.getTime()) {
				// is in service time

				if (shiftStartDate.getTime() < startServiceDate.getTime())
					t1 = startServiceDate.getTime();
				else
					t1 = shiftStartDate.getTime();

				if (shiftFinishDate.getTime() < endServiceDate.getTime())
					t2 = shiftFinishDate.getTime();
				else
					t2 = endServiceDate.getTime();

				// get diffrence
				long diff = t2 - t1;

				long diffMinutes = diff / (60 * 1000) % 60;
				long diffHours = diff / (60 * 60 * 1000);
				logger.info("Time in hours: " + diffHours + " hours." + diffMinutes);

				hourDiffrence = Double.parseDouble(String.valueOf(diffHours) + "." + String.valueOf(diffMinutes));
			}
		} catch (ParseException ex) {
			// TODO handle ex
		}
		return hourDiffrence;
	}

	
	@Override
	public boolean addNewRosterShift(int staffRosterId, String staffId, String startTime, int income_center_id, String finishTime, Date transactionDate, User userDetails, String totalHours, String workofhouse, String role, boolean isPublicHoliday) {
		boolean isAddedRostrShift = objDao.addNewRosterShift(staffRosterId, staffId, startTime, income_center_id, finishTime, transactionDate, userDetails, totalHours, workofhouse, role, isPublicHoliday);
		// get all services for given income center
		// iterate each service and match time.

		// List<StaffRoster> staffRosterServiceList =
		// objDao.getStaffRosterServices(staffId, income_center_id,
		// transactionDate);
		List<StaffRosters> staffRosterList = objDao.getStaffRosterForService(staffId, income_center_id, transactionDate);
		for (StaffRosters staffRosters : staffRosterList) {
			if (isAddedRostrShift) {
				List<Services> servicesList = cashDrawerDao.getServiceList(income_center_id);
				for (Services service : servicesList) {
					String serviceStartTime = service.getStartTime();
					String serviceEndTime = service.getEndTime();
					double allocatedHourForService = getShiftAllocatedTimeForService(startTime, finishTime, serviceStartTime, serviceEndTime);
					if (allocatedHourForService > 0)
						allocateService(staffRosters.getSatffRosterId(), service.getServiceId() + "", staffId, transactionDate, String.valueOf(allocatedHourForService), userDetails, income_center_id, false);
				}
			}
		}
		return isAddedRostrShift;
	}

	@Override
	public boolean removeStaffOrShift(String staffId, Date transactionRosterDate, String satffRosterId, String operation, String incomeCenterId) {
		return objDao.removeStaffOrShift(staffId, transactionRosterDate, satffRosterId, operation, incomeCenterId);
	}

	@Override
	public List<StaffRosters> getStaffRosters(Date transactionRosterDate, Integer incomeCenterId, User userDetails, String workofhouse) {
		return staffRostersDAO.getStaffRosters(transactionRosterDate, incomeCenterId, userDetails, workofhouse);
	}

	@Override
	public List<StaffRostersServices> getStaffRostersServices(Date transactionRosterDate, Integer incomeCenterId, User userDetails) {
		return staffRostersServicesDAO.getStaffRostersServices(transactionRosterDate, incomeCenterId, userDetails);
	}

	@Override
	public List<StaffRostersEvents> getStaffRostersEvents(Date transactionRosterDate, Integer incomeCenterId, User userDetails) {
		return staffRostersEventsDAO.getStaffRostersEvents(transactionRosterDate, incomeCenterId, userDetails);
	}

	@Override
	public void updateStaffRosters(Integer indexOneStaffId, String startTime, String finishTime, String totalHours) {
		objDao.updateStaffRosters(indexOneStaffId, startTime, finishTime, totalHours);
	}

	@Override
	public void rosterUpdateServices(Integer staffRosterServiceId, Double value) {
		objDao.rosterUpdateServices(staffRosterServiceId, value);

	}

	@Override
	public void rosterUpdateEvents(Integer satffRosterEventId, Double value) {
		objDao.rosterUpdateEvents(satffRosterEventId, value);
	}

	@Override
	public StaffRosters getServiceStaffName(String staff_roster_id) {
		return objDao.getServiceStaffName(staff_roster_id);
	}

	@Override
	public boolean setPublicHoliday(Date transactionDate, User userDetails) {
		return objDao.setPublicHoliday(transactionDate, userDetails);
	}

	@Override
	public PublicHoliday getPublicHoliday(Date transactionRosterDate) {
		return objDao.getPublicHoliday(transactionRosterDate);
	}

	@Override
	public boolean resetPublicHoliday(Date transactionDate) {
		return objDao.resetPublicHoliday(transactionDate);
	}

	@Override
	public StaffRosters getStaffRoster(int staffRosterId) {
		return objDao.getStaffRoster(staffRosterId);
	}

	@Override
	public Staff getStaffPosition(Integer staffId) {
		return objDao.getStaffPosition(staffId);
	}

	@Override
	public boolean saveRosterAsTemplate(Date transactionDate, int income_center_id, User userDetails) {
		return objDao.saveRosterAsTemplate(transactionDate, income_center_id, userDetails);
	}

	@Override
	public boolean addNewTemplate(Date transactionDate, int income_center_id, User userDetails, String templateName) {
		boolean isTemplateAdded = objDao.addNewTemplate(transactionDate, income_center_id, userDetails, templateName);
		if (isTemplateAdded) {
			saveRosterAsTemplate(transactionDate, income_center_id, userDetails);
		}
		return isTemplateAdded;
	}

	@Override
	public List<TemplateMaster> getTemplateList() {
		return objDao.getTemplateList();
	}

	@Override
	public List<RosterTemplate> useTemplate(Date transactionDate, int income_center_id, User userDetails, int templateid) {
		List<RosterTemplate> rosterTemplateList = objDao.useTemplate(transactionDate, income_center_id, userDetails, templateid);

		if (rosterTemplateList != null && rosterTemplateList.size() > 0) {
			for (RosterTemplate rosterTemplate : rosterTemplateList) {
				int staffRosterId = 0;
				String staffId = rosterTemplate.getStaffId().toString();
				String totalHours = rosterTemplate.getTotalHours().toString();
				addNewRosterShift(staffRosterId, staffId, rosterTemplate.getStartTime(), income_center_id, rosterTemplate.getFinishTime(), transactionDate, userDetails, totalHours, rosterTemplate.getWorkofhouse(), rosterTemplate.getRole(), rosterTemplate.getPublicHoliday());
			}
		}

		return rosterTemplateList;
	}

	@Override
	public List<StaffRosters> usePreviousRoster(Date transactionDate, int income_center_id, User userDetails, Date prevRosterDate, String incomeCenterId) {
		List<StaffRosters> staffRosterList = objDao.usePreviousRoster(transactionDate, income_center_id, userDetails, prevRosterDate, incomeCenterId);
		if (staffRosterList != null && staffRosterList.size() > 0) {
			for (StaffRosters staffRoster : staffRosterList) {

				int staffRosterId = 0;
				String staffId = staffRoster.getStaffId().toString();
				String totalHours = staffRoster.getTotalHours().toString();
				addNewRosterShift(staffRosterId, staffId, staffRoster.getStartTime(), income_center_id, staffRoster.getFinishTime(), transactionDate, userDetails, totalHours, staffRoster.getWorkofhouse(), staffRoster.getRole(), staffRoster.getPublicHoliday());
				List<Services> servicesList = cashDrawerDao.getServiceList(income_center_id);
				for (Services service : servicesList) {
					String serviceStartTime = service.getStartTime();
					String serviceEndTime = service.getEndTime();
					double allocatedHourForService = getShiftAllocatedTimeForService(staffRoster.getStartTime(), staffRoster.getFinishTime(), serviceStartTime, serviceEndTime);
					if (allocatedHourForService > 0)
						allocateService(staffRoster.getSatffRosterId(), service.getServiceId() + "", staffId, transactionDate, String.valueOf(allocatedHourForService), userDetails, income_center_id, false);
				}
			}
		}
		return staffRosterList;
	}

	@Override
	public void updateShiftRoster(int satff_roster_id, String start_time, String finish_time, String total_hours,User userDetails) {
		staffRostersDAO.updateShiftRoster(satff_roster_id, start_time, finish_time, total_hours);
		
		
		StaffRosters staffRoster = getStaffRoster(satff_roster_id);
		updateRosterShiftServices(satff_roster_id, staffRoster.getStaffId()+"", start_time, staffRoster.getIncomeCenterId(), finish_time, staffRoster.getRosterDate(), userDetails);
	}

	public boolean updateRosterShiftServices(int staffRosterId, String staffId, String startTime, int income_center_id, String finishTime, 
			Date transactionDate, User userDetails  ) {

		boolean status =false;
		//delete staff service
		objDao.removeShiftService(staffRosterId+"");
		
		//create New
		List<StaffRosters> staffRosterList = objDao.getStaffRosterForService(staffId, income_center_id, transactionDate);
		for (StaffRosters staffRosters : staffRosterList) {
				List<Services> servicesList = cashDrawerDao.getServiceList(income_center_id);
				for (Services service : servicesList) {
					String serviceStartTime = service.getStartTime();
					String serviceEndTime = service.getEndTime();
					double allocatedHourForService = getShiftAllocatedTimeForService(startTime, finishTime, serviceStartTime, serviceEndTime);
					if (allocatedHourForService > 0)
						allocateService(staffRosters.getSatffRosterId(), service.getServiceId() + "", staffId, transactionDate, String.valueOf(allocatedHourForService), userDetails, income_center_id, false);
				}
		}
		return status;
	}

	
	/*
	 * @Override public StaffRosters getShiftStartTime(String startTime) {
	 * return objDao.getShiftStartTime(startTime); }
	 */

}
