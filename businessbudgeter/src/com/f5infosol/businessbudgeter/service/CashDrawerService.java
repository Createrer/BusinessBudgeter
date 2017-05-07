package com.f5infosol.businessbudgeter.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.f5infosol.businessbudgeter.domain.CashDrawers;
import com.f5infosol.businessbudgeter.domain.CashSales;
import com.f5infosol.businessbudgeter.domain.CashUpVoids;
import com.f5infosol.businessbudgeter.domain.CashUpZRead;
import com.f5infosol.businessbudgeter.domain.CashupSalesDomain;
import com.f5infosol.businessbudgeter.domain.IncomeCentres;
import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.StaffRosters;
import com.f5infosol.businessbudgeter.domain.StaffVoid;
import com.f5infosol.businessbudgeter.domain.User;

public interface CashDrawerService {

	void updateCashUpCash(HttpServletRequest request, String transactionDate, int serviceId);

	CashSales getSalesDetail(Date transactionDate, int serviceId, User userDetails, int income_center_id);

	List<CashUpVoids> getCashUpVoids(Date transactionDate, int serviceId, int income_center_id, User userDetails);

	boolean addNewCashupVoid(Date transactionDate, int serviceId, User userDetails, int income_center_id, String staffId, String amount, String time, String reason);

	List<Staff> searchStaffName(String staffName);

	List<List<CashupSalesDomain>> getCashUpSales();

	List<CashDrawers> getDrawerOneAmount(Date transactionDate, int serviceId, User userDetails, int income_center_id, List<CashDrawers> tillDetailsList);

	List<CashDrawers> getTillDetails(long userId, int income_center_id);

	IncomeCentres getIncomeCenterDetails(int incomeCenterId);

	List<IncomeCentres> getIncomeCenterList();

	List<Services> getServiceList(int incomeCenterId);

	Services getServiceTime(Integer serviceId);

	CashUpZRead getZReadDetail(Date transactionDate, Integer serviceId, User userDetails, Integer incomeCenterId);

	List<StaffVoid> getStaffList(String staffId);

	Staff getStaffIdList(String staffName);

	List<StaffVoid> getStaff(String staffId, Date transactionRosterDate);

	List<StaffRosters> getStaffVoid(Date transactionDate, Integer incomeCenterId);

}
