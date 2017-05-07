package com.f5infosol.businessbudgeter.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.f5infosol.businessbudgeter.dao.CashDrawerDAO;
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

@Service
public class CashDrawerServiceImpl implements CashDrawerService {

	protected final Log logger = LogFactory.getLog(getClass());
	@Resource
	private CashDrawerDAO objDao;

	@Override
	public List<CashDrawers> getDrawerOneAmount(Date transactionDate, int serviceId, User userDetails, int income_center_id, List<CashDrawers> tillDetailsList) {

		return objDao.getDrawerOneAmount(transactionDate, serviceId, userDetails, income_center_id, tillDetailsList);
	}

	@Override
	public void updateCashUpCash(HttpServletRequest request, String transactionDate, int serviceId) {
		objDao.updateCashUpCash(request, transactionDate, serviceId);

	}

	@Override
	public CashSales getSalesDetail(Date transactionDate, int serviceId, User userDetails, int income_center_id) {
		return objDao.getSalesDetail(transactionDate, serviceId, userDetails, income_center_id);
	}

	@Override
	public List<CashUpVoids> getCashUpVoids(Date transactionDate, int serviceId, int income_center_id, User userDetails) {
		return objDao.getCashUpVoids(transactionDate, serviceId, income_center_id, userDetails);
	}

	@Override
	public boolean addNewCashupVoid(Date transactionDate, int serviceId, User userDetails, int income_center_id, String staffId, String amount, String time, String reason ) {
		return objDao.addNewCashupVoid(transactionDate, serviceId, userDetails, income_center_id, staffId, amount, time, reason );
	}

	@Override
	public List<Staff> searchStaffName(String staffName) {
		return objDao.searchStaffName(staffName);
	}

	public List<CashDrawers> getTillDetails(long userId, int income_center_id) {
		return objDao.getTillDetails(userId, income_center_id);
	}

	@Override
	public List<List<CashupSalesDomain>> getCashUpSales() {
		return objDao.getCashUpSales();
	}

	@Override
	public IncomeCentres getIncomeCenterDetails(int incomeCenterId) {
		return objDao.getIncomeCenterDetails(incomeCenterId);
	}

	@Override
	public List<IncomeCentres> getIncomeCenterList() {
		return objDao.getIncomeCenterList();
	}

	@Override
	public List<Services> getServiceList(int incomeCenterId) {
		return objDao.getServiceList(incomeCenterId);
	}

	@Override
	public Services getServiceTime(Integer serviceId) {
		return objDao.getServiceTime(serviceId);
	}

	@Override
	public CashUpZRead getZReadDetail(Date transactionDate, Integer serviceId, User userDetails, Integer incomeCenterId) {
		return objDao.getZReadDetail(transactionDate, serviceId, userDetails, incomeCenterId);
	}

	@Override
	public List<StaffVoid> getStaffList(String staffId) {
		return objDao.getStaffList(staffId);
	}

	@Override
	public Staff getStaffIdList(String staffName) {
		return objDao.getStaffIdList(staffName);
	}

	@Override
	public List<StaffVoid> getStaff(String staffId, Date transactionRosterDate) {
		return objDao.getStaff(staffId, transactionRosterDate);
	}

	@Override
	public List<StaffRosters> getStaffVoid(Date transactionDate, Integer incomeCenterId) {
		return objDao.getStaffVoid(transactionDate, incomeCenterId);
	}

}
