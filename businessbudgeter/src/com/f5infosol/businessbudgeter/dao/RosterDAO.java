package com.f5infosol.businessbudgeter.dao;

import java.util.Date;
import java.util.List;

import com.f5infosol.businessbudgeter.domain.Events;
import com.f5infosol.businessbudgeter.domain.PublicHoliday;
import com.f5infosol.businessbudgeter.domain.Roster;
import com.f5infosol.businessbudgeter.domain.RosterDetails;
import com.f5infosol.businessbudgeter.domain.RosterEvent;
import com.f5infosol.businessbudgeter.domain.RosterShift;
import com.f5infosol.businessbudgeter.domain.RosterTemplate;
import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.StaffRosters;
import com.f5infosol.businessbudgeter.domain.StaffRostersServices;
import com.f5infosol.businessbudgeter.domain.StaffVoid;
import com.f5infosol.businessbudgeter.domain.TemplateMaster;
import com.f5infosol.businessbudgeter.domain.User;

public interface RosterDAO {

	List<Events> getEventList();

	boolean addNewRosterEvent(String eventId, int income_center_id, Date transactionDate, User userDetails);

	List<RosterEvent> getRosterEventList(Date transactionRosterDate, Integer incomeCenterId);

	List<Staff> getRosterShiftDetails();

	List<RosterShift> getShiftDetails();

	List<Roster> getStaffRosterDetails(Date transactionRosterDate, Integer incomeCenterId, User userDetails);

	boolean allocateService(Integer staffRosterId, String serviceId, String staffId, Date transactionDate, String totalHrs, User userDetails, int income_center_id, boolean isEligible);

	boolean allocateEvent(String eventId, String staffId, String totalHours, int income_center_id, Date transactionDate, User userDetails, boolean isEligible);

	List<Roster> getRosterShiftDetails(Integer incomeCenterId, Date tosterDate);

	boolean isAlreadyAllocated(String shiftId, String staffId, Date transactionRosterDate, Integer incomecenterId);

	RosterShift getShiftTimes(String shiftId);

	boolean allocateStaff(String shiftId, String staffId, Date transactionRosterDate, Integer incomeCenterId, User userDetails);

	List<RosterDetails> getRosterDetails(Date transactionRosterDate, Integer incomeCenterId, User userDetails);

	boolean addNewRosterShift(int staffRosterId, String staffId, String startTime, int income_center_id, String finishTime, Date transactionDate, User userDetails, String totalHours, String workofhouse, String role,  boolean isPublicHoliday);

	boolean removeStaffOrShift(String staffId, Date transactionRosterDate, String satffRosterId, String operation, String incomeCenterId);

	Object updateStaffRosters(Integer indexOneStaffId, String startTime, String finishTime, String totalHours);

	void rosterUpdateServices(Integer staffRosterServiceId, Double value);

	void rosterUpdateEvents(Integer satffRosterEventId, Double value);

	StaffRosters getServiceStaffName(String staff_roster_id);

	boolean setPublicHoliday(Date transactionDate, User userDetails);

	PublicHoliday getPublicHoliday(Date transactionRosterDate);

	boolean resetPublicHoliday(Date transactionDate);

	StaffRosters getStaffRoster(int staffRosterId);

	Staff getStaffPosition(Integer staffId);

	List<StaffRosters> getStaffRosterForService(String staffId, int income_center_id, Date transactionDate);

	boolean saveRosterAsTemplate(Date transactionDate, int income_center_id, User userDetails);

	boolean addNewTemplate(Date transactionDate, int income_center_id, User userDetails, String templateName);

	List<TemplateMaster> getTemplateList();

	List<RosterTemplate> useTemplate(Date transactionDate, int income_center_id, User userDetails, int templateid);

	List<StaffRosters> usePreviousRoster(Date transactionDate, int income_center_id, User userDetails, Date prevRosterDate, String incomeCenterId);

	public boolean removeShiftService(String rosterId);

	/*StaffRosters getShiftStartTime(String startTime);*/

}
