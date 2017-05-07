package com.f5infosol.businessbudgeter.service;

import java.util.Date;
import java.util.List;

import com.f5infosol.businessbudgeter.domain.ProfitAndLossReport;
import com.f5infosol.businessbudgeter.domain.ProfitLossReportAll;
import com.f5infosol.businessbudgeter.domain.TipsService;
import com.f5infosol.businessbudgeter.domain.TotalCashUpReport;

public interface ReportService {
	public List<TipsService> getTips(int incomeCenterId, Date date);
	
	public List<TotalCashUpReport> getTotalReportData(int incomeCenterId, Date date);

	public List<ProfitAndLossReport> getWagesReport(Integer incomeCenterId, Date transDate);

	public List<ProfitLossReportAll> getReportData(Integer incomeCenterId, Date transDate);
	
}
