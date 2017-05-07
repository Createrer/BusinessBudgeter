package com.f5infosol.businessbudgeter.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashDrawersRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashSalesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpCashRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpCreditCardRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpPurchasesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpTipsRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpZReadRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.PublicHolidayRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.ServicesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRosterRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRostersServicesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRowMapper;
import com.f5infosol.businessbudgeter.domain.CashDrawers;
import com.f5infosol.businessbudgeter.domain.CashSales;
import com.f5infosol.businessbudgeter.domain.CashUpCash;
import com.f5infosol.businessbudgeter.domain.CashUpCreditCard;
import com.f5infosol.businessbudgeter.domain.CashUpPurchases;
import com.f5infosol.businessbudgeter.domain.CashUpTips;
import com.f5infosol.businessbudgeter.domain.CashUpZRead;
import com.f5infosol.businessbudgeter.domain.ProfitAndLossReport;
import com.f5infosol.businessbudgeter.domain.ProfitLossReport;
import com.f5infosol.businessbudgeter.domain.ProfitLossReportAll;
import com.f5infosol.businessbudgeter.domain.PublicHoliday;
import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.StaffRosters;
import com.f5infosol.businessbudgeter.domain.StaffRostersServices;
import com.f5infosol.businessbudgeter.domain.TipsService;
import com.f5infosol.businessbudgeter.domain.TotalCashUpReport;
import com.f5infosol.businessbudgeter.domain.WagesReport;

@Repository
public class ReportDAOImpl extends BaseDAOImpl implements ReportDAO {

	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	public List<TipsService> getTips(int income_center_id, Date transactionDate) {

		List<TipsService> tipsServices = new ArrayList<TipsService>();
		List<Services> serviceList = jdbcTemplate.query(Queries.GET_ALL_SERVICES, new ServicesRowMapper());
		if (serviceList != null && serviceList.size() > 0) {

			for (Services service : serviceList) {
				Object[] param = { transactionDate, service.getServiceId(), income_center_id };
				List<CashUpTips> cashTipsList = jdbcTemplate.query(Queries.GET_TIPS_BY_DATE, param, new CashUpTipsRowMapper());
				List<StaffRostersServices> staffServiceList = jdbcTemplate.query(Queries.GET_STAFF_FOR_TIPS, param, new StaffRostersServicesRowMapper());

				if (cashTipsList != null && cashTipsList.size() > 0) {
					TipsService tipService = new TipsService();
					Double cashtips = 0.0;
					Double crdcardtips = 0.0;
					Double crdCardFees = 0.0;
					Double slushFees = 0.0;
					Double shares = 0.0;
					Double toatal = 0.0;
					Double slushPct = cashTipsList.get(0).getSlushPct();
					Integer noOfStaff = staffServiceList.size();
					for (CashUpTips tips : cashTipsList) {
						cashtips = cashtips + tips.getCashTips();
						crdcardtips = crdcardtips + tips.getCerditCardTips();

						Double tempCrdCardFees = 0.0;
						if (tips.getCerditCardTips() > 0) {
							tempCrdCardFees = ((crdcardtips * tips.getFeesPct()) / 100);
							crdCardFees = crdCardFees + tempCrdCardFees;

						}
						toatal = cashtips + crdcardtips + tempCrdCardFees;

						Double slushAmt = 0.0;
						if (toatal > 0) {
							slushAmt = ((toatal * tips.getSlushPct()) / 100);
							slushFees = slushFees + slushAmt;
						}
					}
					Double totalDistributable = toatal - slushFees;
					shares = totalDistributable / noOfStaff;

					tipService.setServiceId(service.getServiceId());
					tipService.setServiceName(service.getServiceName());
					tipService.setTotalCash(cashtips);
					tipService.setToatalCrdCardPay(crdcardtips);
					tipService.setCrdCardFees(crdCardFees);
					tipService.setSlushAmount(slushFees);
					tipsServices.add(tipService);
					tipService.setStaffRosterService(staffServiceList);
					tipService.setShares(shares);
					tipService.setSlushPct(slushPct);
				}
			}
		}
		return tipsServices;
	}

	@Override
	public List<TotalCashUpReport> getTotalReportData(int income_center_id, Date transactionDate) {

		List<TotalCashUpReport> cashupData = new ArrayList<TotalCashUpReport>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEEE");

		Integer[] paramIC = { income_center_id };
		List<Services> serviceList = jdbcTemplate.query(Queries.GET_SERVICES_BY_INCOME_CENTER, paramIC, new ServicesRowMapper());
		// week days
		// for()

		Integer totalCovers = 0;
		Double totalFoodIncome = 0.0;
		Double totalBeverageIncome = 0.0;

		Calendar caldate = Calendar.getInstance();
		caldate.setTime(transactionDate);
		int dayOfWeek = caldate.get(Calendar.DAY_OF_WEEK) - caldate.getFirstDayOfWeek();
		caldate.add(Calendar.DAY_OF_MONTH, -dayOfWeek);

		for (int i = 0; i <= 6; i++) {

			caldate.add(Calendar.DAY_OF_MONTH, 1);

			Date weekStart = caldate.getTime();

			List<TipsService> tips = getTips(income_center_id, weekStart);

			Double totaldailyZReadTake = 0.0;
			if (serviceList != null && serviceList.size() > 0) {
				for (Services service : serviceList) {
					TotalCashUpReport totalReport = new TotalCashUpReport();
					totalReport.setCashupCreditCardDate(simpleDateFormat.format(weekStart));
					totalReport.setServiceId(service.getServiceId());
					totalReport.setServiceName(service.getServiceName());
					Object[] param = { weekStart, service.getServiceId(), income_center_id };
					List<CashUpCreditCard> cashUpDebit = jdbcTemplate.query(Queries.CARD_QUERY, param, new CashUpCreditCardRowMapper());
					totalReport.setCashUpCreditCards(cashUpDebit);

					Object[] paramSell = { weekStart, service.getServiceId(), income_center_id };
					List<CashSales> cashSales = jdbcTemplate.query(Queries.GET_SALES_BY_DATE, paramSell, new CashSalesRowMapper());

					if (cashSales != null && cashSales.size() > 0) {

						
						  totalCovers =      cashSales.get(0).getRestaurantCovers() + cashSales.get(0).getCafeCovers()
								  				+cashSales.get(0).getTakeAwayCovers() + cashSales.get(0).getBarCovers()
								  				+cashSales.get(0).getDeliCovers() + cashSales.get(0).getRetailCovers()
								  				+cashSales.get(0).getCateringCovers() + cashSales.get(0).getDeliveryCovers()
								  				+cashSales.get(0).getEventCovers() + cashSales.get(0).getRoomServiceCovers()
								  				+cashSales.get(0).getCustom1Covers() + cashSales.get(0).getCustom2Covers();
						 
						  totalFoodIncome = (double) cashSales.get(0).getRestaurantFoodSales() + cashSales.get(0).getCafeFoodSales() 
								  					+ cashSales.get(0).getTakeAwayFoodSales() + cashSales.get(0).getBarFoodSales() 
								  					+ cashSales.get(0).getDeliFoodSales() + cashSales.get(0).getRetailFoodSales() 
								  					+ cashSales.get(0).getCateringFoodSales() + cashSales.get(0).getDeliveryFoodSales() 
								  					+ cashSales.get(0).getEventFoodSales() + cashSales.get(0).getRoomServiceFoodSales() 
								  					+ cashSales.get(0).getCustom1FoodSales() + cashSales.get(0).getCustom2FoodSales();
						  
						  totalBeverageIncome = (double) cashSales.get(0).getRestaurantBeverageSales() + cashSales.get(0).getCafeBeverageSales() 
								  						+ cashSales.get(0).getTakeAwayBeverageSales() + cashSales.get(0).getBarBeverageSales() 
								  						+ cashSales.get(0).getDeliBeverageSales() + cashSales.get(0).getRetailBeverageSales() 
								  						+ cashSales.get(0).getCateringBeverageSales() + cashSales.get(0).getDeliveryBeverageSales() 
								  						+ cashSales.get(0).getEventBeverageSales() + cashSales.get(0).getRoomServiceBeverageSales() 
								  						+ cashSales.get(0).getCustom1BeverageSales() + cashSales.get(0).getCustom2BeverageSales();
						 
					}

					Double dailyZRead = 0.0;
					Object[] paramZRead = { weekStart, service.getServiceId(), income_center_id };
					List<CashUpZRead> cashUpZRead = jdbcTemplate.query(Queries.GET_Z_READ_BY_DATE, paramZRead, new CashUpZReadRowMapper());

					if (cashUpZRead != null && cashUpZRead.size() > 0) {
						dailyZRead = cashUpZRead.get(0).getzRead();
					}
					Double tipsLessFees = 0.0;

					if (tips != null && tips.size() > 0) {
						for (TipsService tipsService : tips) {
							if (service.getServiceId() == tipsService.getServiceId()) {
								tipsLessFees = (tipsService.getToatalCrdCardPay() + tipsService.getCrdCardFees() + tipsService.getTotalCash()) - tipsService.getSlushAmount();
							}
						}
					}
					totaldailyZReadTake = totaldailyZReadTake + dailyZRead;

					totalReport.setTotalCovers(totalCovers);
					totalReport.setTotalFoodIncome(totalFoodIncome);
					totalReport.setTotalBeverageIncome(totalBeverageIncome);
					totalReport.setDailyZRead(dailyZRead);
					totalReport.setTipsLessFees(tipsLessFees);

					cashupData.add(totalReport);

				}

				if (cashupData.size() > 0) {
					TotalCashUpReport tcashupReport = cashupData.get(cashupData.size() - 1);
					tcashupReport.setDailyTake(totaldailyZReadTake);
				}
			}
		}
		return cashupData;
	}

	@Override
	public List<ProfitAndLossReport> getWagesReport(Integer incomeCenterId, Date transDate) {

		List<ProfitAndLossReport> list = new ArrayList<ProfitAndLossReport>();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEEE");
		String totHours = "";

		Calendar caldate = Calendar.getInstance();
		caldate.setTime(transDate);
		int dayOfWeek = caldate.get(Calendar.DAY_OF_WEEK) - caldate.getFirstDayOfWeek();
		caldate.add(Calendar.DAY_OF_MONTH, -dayOfWeek);

		Map<Integer, ProfitAndLossReport> wagesData = new HashMap<Integer, ProfitAndLossReport>();

		for (int i = 0; i <= 6; i++) {

			Map<Integer, WagesReport> wagesMap = new HashMap<Integer, WagesReport>();
			caldate.add(Calendar.DAY_OF_MONTH, 1);

			Date weekStart = caldate.getTime();

			Object[] param = { incomeCenterId, weekStart };
			List<StaffRosters> staffRosterList = jdbcTemplate.query(Queries.GET_STAFF_ROSTERS, param, new StaffRosterRowMapper());

			Double rate = 0.0;
			Double totalIncome = 0.0;
			Double totalHours = 0.0;
			Double holidayHours = 0.0;

			if (staffRosterList != null && staffRosterList.size() > 0) {
				for (StaffRosters staffRoster : staffRosterList) {

					WagesReport wages = wagesMap.get(staffRoster.getStaffId());

					if (wages == null) {
						wages = new WagesReport();
						wages.setRosterDate(weekStart);
						wages.setSatffRosterId(staffRoster.getStaffId());
						wages.setStaffName(staffRoster.getStaffName());
						/*
						 * staffWages.setStaffId(staffRoster.getStaffId());
						 * staffWages.setStaffName(staffRoster.getStaffName());
						 */
					}

					totalHours = staffRoster.getTotalHours();

					// String weekDay=simpleDateFormat.format(transDate);

					Object[] paramStaff = { staffRoster.getStaffId() };
					List<Staff> staff = jdbcTemplate.query(Queries.GET_STAFF_NAME, paramStaff, new StaffRowMapper());

					SimpleDateFormat df = new SimpleDateFormat("dd/MM/yy");
					df.applyPattern("EEE");
					String day = df.format(weekStart);
					if (day.compareTo("Sat") == 0) {
						rate = staff.get(0).getSaturdayDayRate();
					} else if (day.compareTo("Sun") == 0) {
						rate = staff.get(0).getSundayDayRate();
					} else {
						Object[] paramHoliday = { weekStart };
						List<PublicHoliday> holiday = jdbcTemplate.query(Queries.CHECK_HOLIDAY, paramHoliday, new PublicHolidayRowMapper());
						if (holiday != null && holiday.size() > 0) {
							rate = staff.get(0).getPublicHolidayDayRate();
							holidayHours = staffRoster.getTotalHours();
						} else {
							rate = staff.get(0).getWeekDayRate();
						}
					}
					
					totalIncome = (double) Math.round(rate * totalHours);
					// staffWages.setRosterDate(weekDay);

					if (wages.getWorkHour() != null){
						wages.setWorkHour((double) Math.round(wages.getWorkHour() + totalHours));
					}
					else{
						wages.setWorkHour(totalHours);
					}
					
					if(wages.getHolidayWorkHour() != null){
						wages.setHolidayWorkHour((double) Math.round(wages.getHolidayWorkHour() + holidayHours));
					}
					else {
						wages.setHolidayWorkHour(holidayHours);
					}
					if (wages.getStaffIncome() != null) {
						wages.setStaffIncome(wages.getStaffIncome() + totalIncome);
					} else {
						wages.setStaffIncome(totalIncome);
					}
					wagesMap.put(staffRoster.getStaffId(), wages);

				}

				Set<Integer> keySet = wagesMap.keySet();
				for (Integer staffId : keySet) {
					WagesReport WR = wagesMap.get(staffId);
					ProfitAndLossReport staffWageR = wagesData.get(staffId);
					if (staffWageR == null) {
						Object[] paramStaff = {staffId};
						List<Staff> staff = jdbcTemplate.query(Queries.GET_STAFF_NAME, paramStaff, new StaffRowMapper());
						
						/*Object[] paramHoliday = { weekStart };
						List<PublicHoliday> holiday = jdbcTemplate.query(Queries.CHECK_HOLIDAY, paramHoliday, new PublicHolidayRowMapper());
						*/
						staffWageR = new ProfitAndLossReport();

						staffWageR.setStaffId(staffId);
						staffWageR.setStaffName(WR.getStaffName());
						staffWageR.setWeeklyRate(staff.get(0).getWeekDayRate());
						staffWageR.setPublicHolidayRate(staff.get(0).getPublicHolidayDayRate());
						staffWageR.setWages(new ArrayList<WagesReport>());

						wagesData.put(staffId, staffWageR);
					}
					
					
					if (staffWageR.getTotalHours() != null){
						staffWageR.setTotalHours((double) Math.round(staffWageR.getTotalHours() + WR.getWorkHour()));
					}
					else{
						staffWageR.setTotalHours(WR.getWorkHour());
					}
					
					if(staffWageR.getHolidayHours() != null){
						staffWageR.setHolidayHours((double) Math.round(staffWageR.getHolidayHours() + WR.getHolidayWorkHour()));
					}
					else {
						staffWageR.setHolidayHours(WR.getHolidayWorkHour());
					}
					if (staffWageR.getTotalIncome() != null) {
						staffWageR.setTotalIncome(staffWageR.getTotalIncome() + WR.getStaffIncome());
						staffWageR.setGrossEFTWages(staffWageR.getTotalIncome());
						staffWageR.setCashWages(staffWageR.getTotalIncome());
					} else {
						staffWageR.setTotalIncome(WR.getStaffIncome());
						staffWageR.setGrossEFTWages(staffWageR.getTotalIncome());
						staffWageR.setCashWages(staffWageR.getTotalIncome());
					}
					
					staffWageR.getWages().add(WR);

				}

			}
		}

		fillUpDummyObject(wagesData, transDate);
		list.addAll(wagesData.values());

		return list;
	}

	private void fillUpDummyObject(Map<Integer, ProfitAndLossReport> wagesData, Date transDate) {
		Set<Entry<Integer, ProfitAndLossReport>> wagesDataEntrySet = wagesData.entrySet();

		for (Entry<Integer, ProfitAndLossReport> entry : wagesDataEntrySet) {
			ProfitAndLossReport staffWagesReport = entry.getValue();

			List<WagesReport> wages = staffWagesReport.getWages();

			Calendar caldate = Calendar.getInstance();
			caldate.setTime(transDate);
			int dayOfWeek = caldate.get(Calendar.DAY_OF_WEEK) - caldate.getFirstDayOfWeek();
			caldate.add(Calendar.DAY_OF_MONTH, -dayOfWeek);
			for (int i = 0; i <= 6; i++) {
				caldate.add(Calendar.DAY_OF_MONTH, 1);
				boolean found = false;
				// if not exist in list then add dummy obj
				for (WagesReport wagesR : wages) {
					if (wagesR.getRosterDate().equals(caldate.getTime())) {
						found = true;
					}
				}
				if (!found) {
					WagesReport dummy = new WagesReport();
					dummy.setRosterDate(caldate.getTime());
					dummy.setSatffRosterId(staffWagesReport.getStaffId());
					dummy.setStaffName(staffWagesReport.getStaffName());

					wages.add(i, dummy);
				}
			}
		}
	}

	@Override
	public List<ProfitLossReportAll> getReportData(Integer incomeCenterId, Date transDate) {

		List<ProfitLossReportAll> pnlWeeklyList = new ArrayList<ProfitLossReportAll>();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEEE");
		String totHours = "";

		Calendar caldate = Calendar.getInstance();
		caldate.setTime(transDate);
		int dayOfWeek = caldate.get(Calendar.DAY_OF_WEEK) - caldate.getFirstDayOfWeek();
		caldate.add(Calendar.DAY_OF_MONTH, -dayOfWeek);

		for (int i = 0; i <= 6; i++) {

			Double actualFoodSpendTotal = 0.0;
			Double actualBeverageSpendTotal = 0.0;
			Double actualDailyRevenue = 0.0;

			caldate.add(Calendar.DAY_OF_MONTH, 1);
			Date weekStart = caldate.getTime();
			Object[] paramIC = { incomeCenterId };
			List<Services> serviceList = jdbcTemplate.query(Queries.GET_SERVICES_BY_INCOME_CENTER, paramIC, new ServicesRowMapper());

			ProfitLossReportAll reportAll = new ProfitLossReportAll();

			if (serviceList != null && serviceList.size() > 0) {

				List<ProfitLossReport> pnldayList = new ArrayList<ProfitLossReport>();

				for (Services service : serviceList) {

					Double actualFoodSpend = 0.0;
					Double actualBeverageSpend = 0.0;
					Double totalFoodIncome = 0.0;
					Double totalBeverageIncome = 0.0;
					Double cashInTill = 0.0;
					Double creditTotal = 0.0;
					Double debitTotal = 0.0;

					ProfitLossReport report = new ProfitLossReport();

					Object[] paramSell = { weekStart, service.getServiceId(), incomeCenterId };
					List<CashSales> cashSales = jdbcTemplate.query(Queries.GET_SALES_BY_DATE, paramSell, new CashSalesRowMapper());
					if (cashSales != null && cashSales.size() > 0) {

						totalFoodIncome = (double) cashSales.get(0).getRestaurantFoodSales() + cashSales.get(0).getCafeFoodSales() + cashSales.get(0).getTakeAwayFoodSales() + cashSales.get(0).getBarFoodSales() + cashSales.get(0).getDeliFoodSales() + cashSales.get(0).getRetailFoodSales() + cashSales.get(0).getCateringFoodSales() + cashSales.get(0).getDeliveryFoodSales() + cashSales.get(0).getEventFoodSales() + cashSales.get(0).getRoomServiceFoodSales() + cashSales.get(0).getCustom1FoodSales() + cashSales.get(0).getCustom2FoodSales();

						totalBeverageIncome = (double) cashSales.get(0).getRestaurantBeverageSales() + cashSales.get(0).getCafeBeverageSales() + cashSales.get(0).getTakeAwayBeverageSales() + cashSales.get(0).getBarBeverageSales() + cashSales.get(0).getDeliBeverageSales() + cashSales.get(0).getRetailBeverageSales() + cashSales.get(0).getCateringBeverageSales() + cashSales.get(0).getDeliveryBeverageSales() + cashSales.get(0).getEventBeverageSales() + cashSales.get(0).getRoomServiceBeverageSales() + cashSales.get(0).getCustom1BeverageSales() + cashSales.get(0).getCustom2BeverageSales();

					}
					Object[] paramPurchase = { service.getServiceId(), weekStart, incomeCenterId };
					List<CashUpPurchases> foodPurchase = jdbcTemplate.query(Queries.PURCHASE_LIST_QUERY, paramPurchase, new CashUpPurchasesRowMapper());
					List<CashUpPurchases> beveragePuchase = jdbcTemplate.query(Queries.PURCHASE_BEVERAGE_LIST_QUERY, paramPurchase, new CashUpPurchasesRowMapper());

					if (foodPurchase != null && foodPurchase.size() > 0) {
						for (int f = 0; f < foodPurchase.size(); f++) {
							actualFoodSpend = actualFoodSpend + foodPurchase.get(f).getPurchaseCost();
						}
					}

					if (beveragePuchase != null && beveragePuchase.size() > 0) {
						for (int b = 0; b < beveragePuchase.size(); b++) {
							actualBeverageSpend = actualBeverageSpend + beveragePuchase.get(b).getPurchaseCost();
						}
					}

					Object[] drawerParam = { incomeCenterId };
					List<CashDrawers> tillDetailsList = jdbcTemplate.query(Queries.GET_DRAWERS, drawerParam, new CashDrawersRowMapper());
					if (tillDetailsList != null && tillDetailsList.size() > 0) {
						for (CashDrawers drawer : tillDetailsList) {
							Object[] param = { drawer.getCashDrawerId(), weekStart, service.getServiceId(), incomeCenterId };
							List<CashUpCash> cashUpList = jdbcTemplate.query(Queries.GET_CASHUP_ONE_BY_DATE, param, new CashUpCashRowMapper());
							if (cashUpList != null && cashUpList.size() > 0) {
								for (int cash = 0; cash < cashUpList.size(); cash++) {
									cashInTill = cashInTill + ((cashUpList.get(cash).getDrawerAmount()) - (cashUpList.get(cash).getFloatAmount()));
								}
							}
						}
					}

					Object[] cardParam = { weekStart, incomeCenterId, service.getServiceId() };
					List<CashUpCreditCard> creditList = jdbcTemplate.query(Queries.GET_CREDIT_FOR_TOTAL, cardParam, new CashUpCreditCardRowMapper());
					if(creditList != null && creditList.size() > 0){
						for(int c=0;c<creditList.size();c++){
							creditTotal = creditTotal + creditList.get(c).getCcReading();
						}
					}
					
					List<CashUpCreditCard> debitList = jdbcTemplate.query(Queries.GET_DEBIT_FOR_TOTAL, cardParam, new CashUpCreditCardRowMapper());
					if(debitList != null && debitList.size() > 0){
						for(int d=0;d<debitList.size();d++){
							debitTotal = debitTotal + debitList.get(d).getCcReading();
						}
					}

					actualDailyRevenue = actualDailyRevenue + (cashInTill + creditTotal + debitTotal);

					actualFoodSpendTotal = actualFoodSpendTotal + actualFoodSpend;
					actualBeverageSpendTotal = actualBeverageSpendTotal + actualBeverageSpend;

					report.setActualDailyRevenue(actualDailyRevenue);
					report.setTotalFoodIncome(totalFoodIncome);
					report.setTotalBeverageIncome(totalBeverageIncome);
					report.setActualFoodSpend(actualFoodSpend);
					report.setActualBeverageSpend(actualBeverageSpend);
					pnldayList.add(report);

				}

				reportAll.setActualFoodSpendTotal(actualFoodSpendTotal);
				reportAll.setActualBeverageSpendTotal(actualBeverageSpendTotal);
				reportAll.setActualDailyRevenue(actualDailyRevenue);
				reportAll.setProfitLoss(pnldayList);
			}

			pnlWeeklyList.add(reportAll);

		}
		return pnlWeeklyList;
	}

}
