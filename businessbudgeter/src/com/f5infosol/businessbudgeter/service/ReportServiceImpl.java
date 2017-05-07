package com.f5infosol.businessbudgeter.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.f5infosol.businessbudgeter.dao.ReportDAO;
import com.f5infosol.businessbudgeter.dao.SettingDAO;
import com.f5infosol.businessbudgeter.domain.ProfitAndLossReport;
import com.f5infosol.businessbudgeter.domain.ProfitLossReportAll;
import com.f5infosol.businessbudgeter.domain.TipsService;
import com.f5infosol.businessbudgeter.domain.TotalCashUpReport;

@Service
public class ReportServiceImpl implements ReportService {

	protected final Log logger = LogFactory.getLog(getClass());
	@Resource
	private SettingDAO objDao;
	
	@Resource
	private ReportDAO repotDao;
	
	@Override
	public List<TipsService> getTips(int incomeCenterId, Date transactionDate) {
		return repotDao.getTips(incomeCenterId, transactionDate);
	}

	@Override
	public List<TotalCashUpReport> getTotalReportData(int incomeCenterId, Date transactionDate) {
		return repotDao.getTotalReportData(incomeCenterId, transactionDate);
	}

	@Override
	public List<ProfitAndLossReport> getWagesReport(Integer incomeCenterId, Date transDate) {
		return repotDao.getWagesReport(incomeCenterId, transDate);
	}

	@Override
	public List<ProfitLossReportAll> getReportData(Integer incomeCenterId, Date transDate) {
		return repotDao.getReportData(incomeCenterId, transDate);
	}
	
}
