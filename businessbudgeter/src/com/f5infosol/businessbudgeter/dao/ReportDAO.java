package com.f5infosol.businessbudgeter.dao;

import java.util.Date;
import java.util.List;

import com.f5infosol.businessbudgeter.domain.ProfitAndLossReport;
import com.f5infosol.businessbudgeter.domain.ProfitLossReportAll;
import com.f5infosol.businessbudgeter.domain.TipsService;
import com.f5infosol.businessbudgeter.domain.TotalCashUpReport;

public interface ReportDAO {

	public List<TipsService> getTips(int income_center_id, Date transactionDate);
	public List<TotalCashUpReport> getTotalReportData(int income_center_id, Date transactionDate);
	public List<ProfitAndLossReport> getWagesReport(Integer incomeCenterId, Date transDate);
	public List<ProfitLossReportAll> getReportData(Integer incomeCenterId, Date transDate);
	
}
