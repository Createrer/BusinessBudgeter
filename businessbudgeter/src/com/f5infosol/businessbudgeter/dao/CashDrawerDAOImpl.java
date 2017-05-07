package com.f5infosol.businessbudgeter.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashDrawersRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashSalesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpCashRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpSalesDomainRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpVoidsRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpZReadRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.IncomeCentresRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.ServicesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRosterRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.StaffVoidRowMapper;
import com.f5infosol.businessbudgeter.domain.CashDrawers;
import com.f5infosol.businessbudgeter.domain.CashSales;
import com.f5infosol.businessbudgeter.domain.CashUpCash;
import com.f5infosol.businessbudgeter.domain.CashUpPurchases;
import com.f5infosol.businessbudgeter.domain.CashUpVoids;
import com.f5infosol.businessbudgeter.domain.CashUpZRead;
import com.f5infosol.businessbudgeter.domain.CashupSalesDomain;
import com.f5infosol.businessbudgeter.domain.IncomeCentres;
import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.StaffRosters;
import com.f5infosol.businessbudgeter.domain.StaffVoid;
import com.f5infosol.businessbudgeter.domain.User;
import com.f5infosol.businessbudgeter.util.BusinessBudgeterUtil;

@Repository
public class CashDrawerDAOImpl extends BaseDAOImpl implements CashDrawerDAO {

	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	public List<CashDrawers> getDrawerOneAmount(Date transactionDate, int serviceId, User userDetails, int income_center_id, List<CashDrawers> tillDetailsList) {
		List<CashUpCash> cashUpList = null;

		for (CashDrawers drawer : tillDetailsList) {
			Object[] param = { drawer.getCashDrawerId(), transactionDate, serviceId, income_center_id };

			cashUpList = jdbcTemplate.query(Queries.GET_CASHUP_ONE_BY_DATE, param, new CashUpCashRowMapper());

			if (cashUpList != null && cashUpList.size() > 0) {
				drawer.setCashUpCashsList(cashUpList);
			} else {
				try {

					int cashTypeId = 0;
					double floatAmt = 0.0;
					double drawerAmt = 0.0;
					int count = 0;

					String qryCashId = "select cash_type_id from cash_types";

					SqlRowSet rsCashId = selectResults(qryCashId);

					if (rsCashId.next()) {
						cashTypeId = rsCashId.getInt(1);
					}

					String noOfCash = "select count(*) from cash_types";

					SqlRowSet rsCashCount = selectResults(noOfCash);

					if (rsCashCount.next()) {
						count = rsCashCount.getInt(1);
					}

					for (int i = 0; i < count; i++) {

						Object[] param1 = { serviceId, drawer.getCashDrawerId(), cashTypeId, floatAmt, drawerAmt, transactionDate, userDetails.getUserName(), income_center_id };
						jdbcTemplate.update(Queries.INSERT_CASHUP_CASH, param1);
						cashTypeId = cashTypeId + 1;

					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				cashUpList = jdbcTemplate.query(Queries.GET_CASHUP_ONE_BY_DATE, param, new CashUpCashRowMapper());
				drawer.setCashUpCashsList(cashUpList);
			}
		}

		return tillDetailsList;
	}

	@Override
	public void updateCashUpCash(HttpServletRequest request, String transactionDate, int serviceId) {

		int imax = parseInt(request.getParameter("i"));
		int jmax = parseInt(request.getParameter("j"));
		imax--;
		jmax--;
		Date updatedOn = Calendar.getInstance().getTime();

		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");
		int income_center_id = (Integer) session.getAttribute("income-center");

		Date cashUpCashDate = BusinessBudgeterUtil.convertStringToDateForTran(transactionDate);
		final List<CashUpCash> cashUpCashList = new ArrayList<CashUpCash>();

		for (int i = 0; i <= imax; i++) {
			for (int j = 0; j <= jmax; j++) {
				if (request.getParameter("isDirty" + i + j) != null && request.getParameter("isDirty" + i + j).equals("1")) {

					String cashUpId = request.getParameter("cashUpCashId" + i + j);
					String floatAmt = request.getParameter("floatAmount" + i + j);
					String drawerAmt = request.getParameter("drawerAmount" + i + j);

					// Object[] param = { Double.parseDouble(floatAmt),
					// Double.parseDouble(drawerAmt), updatedOn,
					// userDetails.getUserName(), cashUpCashDate, serviceId,
					// parseInt(cashUpId), income_center_id };
					cashUpCashList.add(new CashUpCash(Double.parseDouble(floatAmt), Double.parseDouble(drawerAmt), updatedOn, userDetails.getUserName(), cashUpCashDate, serviceId, parseInt(cashUpId), income_center_id));

					// jdbcTemplate.update(Queries.UPDATE_CASHUP_ONE_BY_DATE,
					// param);
				}
			}
		}

		if (!cashUpCashList.isEmpty()) {
			jdbcTemplate.batchUpdate(Queries.UPDATE_CASHUP_ONE_BY_DATE, new BatchPreparedStatementSetter() {

				@Override
				public void setValues(PreparedStatement ps, int i) throws SQLException {
					CashUpCash cashUpCash = cashUpCashList.get(i);
					ps.setDouble(1, cashUpCash.getFloatAmount());
					ps.setDouble(2, cashUpCash.getDrawerAmount());
					ps.setDate(3, new java.sql.Date(cashUpCash.getUpdatedOn().getTime()));
					ps.setString(4, cashUpCash.getUpdatedBy());
					ps.setDate(5, new java.sql.Date(cashUpCash.getCashUpCashDate().getTime()));
					ps.setInt(6, cashUpCash.getServiceId());
					ps.setInt(7, cashUpCash.getCashUpCashId());
					ps.setInt(8, cashUpCash.getIncomeCentreId());
				}

				@Override
				public int getBatchSize() {
					return cashUpCashList.size();
				}
			});
		}

		try {
			String cashSalesId = request.getParameter("cashSalesId");
			String restaurantCovers = request.getParameter("restaurantCovers");
			String restaurantFoodSales = request.getParameter("restaurantFoodSalesAmt");
			String restaurantBeverageSales = request.getParameter("restaurantBevSalesAmt");
			String restaurantOtherSales = request.getParameter("restaurantOtherSalesAmt");
			String cafeCovers = request.getParameter("cafeCovers");
			String cafeFoodSales = request.getParameter("cafeFoodSalesAmt");
			String cafeBeverageSales = request.getParameter("cafeBevSalesAmt");
			String cafeOtherSales = request.getParameter("cafeOtherSalesAmt");
			String takeAwayCovers = request.getParameter("takeAwayCovers");
			String takeAwayFoodSales = request.getParameter("takeAwayFoodSalesAmt");
			String takeAwayBeverageSales = request.getParameter("takeAwayBevSalesAmt");
			String takeAwayOtherSales = request.getParameter("takeAwayOtherSalesAmt");
			String barCovers = request.getParameter("barCovers");
			String barFoodSales = request.getParameter("barFoodSalesAmt");
			String barBeverageSales = request.getParameter("barBevSalesAmt");
			String barOtherSales = request.getParameter("barOtherSalesAmt");
			String deliCovers = request.getParameter("deliCovers");
			String deliFoodSales = request.getParameter("deliFoodSalesAmt");
			String deliBeverageSales = request.getParameter("deliBevSalesAmt");
			String deliOtherSales = request.getParameter("deliOtherSalesAmt");
			String retailCovers = request.getParameter("retailCovers");
			String retailFoodSales = request.getParameter("retailFoodSalesAmt");
			String retailBeverageSales = request.getParameter("retailBevSalesAmt");
			String retailOtherSales = request.getParameter("retailOtherSalesAmt");
			String cateringCovers = request.getParameter("cateringCovers");
			String cateringFoodSales = request.getParameter("cateringFoodSalesAmt");
			String cateringBeverageSales = request.getParameter("cateringBevSalesAmt");
			String cateringOtherSales = request.getParameter("cateringOtherSalesAmt");
			String deliveryCovers = request.getParameter("deliveryCovers");
			String deliveryFoodSales = request.getParameter("deliveryFoodSalesAmt");
			String deliveryBeverageSales = request.getParameter("deliveryBevSalesAmt");
			String deliveryOtherSales = request.getParameter("deliveryOtherSalesAmt");
			String eventCovers = request.getParameter("eventsCovers");
			String eventFoodSales = request.getParameter("eventsFoodSalesAmt");
			String eventBeverageSales = request.getParameter("eventsBevSalesAmt");
			String eventOtherSales = request.getParameter("eventsOtherSalesAmt");
			String roomServiceCovers = request.getParameter("roomServiceCovers");
			String roomServiceFoodSales = request.getParameter("roomServiceFoodSalesAmt");
			String roomServiceBeverageSales = request.getParameter("roomServiceBevSalesAmt");
			String roomServiceOtherSales = request.getParameter("roomServiceOtherSalesAmt");
			String custom1Covers = request.getParameter("custom1Covers");
			String custom1FoodSales = request.getParameter("custom1FoodSalesAmt");
			String custom1BeverageSales = request.getParameter("custom1BevSalesAmt");
			String custom1OtherSales = request.getParameter("custom1OtherSalesAmt");
			String custom2Covers = request.getParameter("custom2Covers");
			String custom2FoodSales = request.getParameter("custom2FoodSalesAmt");
			String custom2BeverageSales = request.getParameter("custom2BevSalesAmt");
			String custom2OtherSales = request.getParameter("custom2OtherSalesAmt");

			Object[] param = { parseInt(restaurantCovers), Double.parseDouble(restaurantFoodSales), Double.parseDouble(restaurantBeverageSales), Double.parseDouble(restaurantOtherSales), parseInt(cafeCovers), Double.parseDouble(cafeFoodSales), Double.parseDouble(cafeBeverageSales), Double.parseDouble(cafeOtherSales), parseInt(takeAwayCovers), Double.parseDouble(takeAwayFoodSales), Double.parseDouble(takeAwayBeverageSales), Double.parseDouble(takeAwayOtherSales), parseInt(barCovers), Double.parseDouble(barFoodSales), Double.parseDouble(barBeverageSales), Double.parseDouble(barOtherSales), parseInt(deliCovers), Double.parseDouble(deliFoodSales), Double.parseDouble(deliBeverageSales), Double.parseDouble(deliOtherSales), parseInt(retailCovers), Double.parseDouble(retailFoodSales), Double.parseDouble(retailBeverageSales), Double.parseDouble(retailOtherSales), parseInt(cateringCovers), Double.parseDouble(cateringFoodSales),
					Double.parseDouble(cateringBeverageSales), Double.parseDouble(cateringOtherSales), parseInt(deliveryCovers), Double.parseDouble(deliveryFoodSales), Double.parseDouble(deliveryBeverageSales), Double.parseDouble(deliveryOtherSales), parseInt(eventCovers), Double.parseDouble(eventFoodSales), Double.parseDouble(eventBeverageSales), Double.parseDouble(eventOtherSales), parseInt(roomServiceCovers), Double.parseDouble(roomServiceFoodSales), Double.parseDouble(roomServiceBeverageSales), Double.parseDouble(roomServiceOtherSales), parseInt(custom1Covers), Double.parseDouble(custom1FoodSales), Double.parseDouble(custom1BeverageSales), Double.parseDouble(custom1OtherSales), parseInt(custom2Covers), Double.parseDouble(custom2FoodSales), Double.parseDouble(custom2BeverageSales), Double.parseDouble(custom2OtherSales), updatedOn, userDetails.getUserName(), parseInt(cashSalesId), cashUpCashDate, serviceId, income_center_id };

			jdbcTemplate.update(Queries.UPDATE_SALES_BY_DATE, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			String creditCardTypeId1 = request.getParameter("creditCardTypeId1");
			String visaccRead = request.getParameter("visaccRead");
			String visatillRead = request.getParameter("visatillRead");
			/*
			 * String visaFoodBevSales = request.getParameter("bev_visa_Sales");
			 * String visaEventFoodBevSales =
			 * request.getParameter("eve_visa_Sales");
			 */

			Object[] param = { Double.parseDouble(visaccRead), Double.parseDouble(visatillRead), updatedOn, userDetails.getUserName(), parseInt(creditCardTypeId1), cashUpCashDate, serviceId, income_center_id };
			jdbcTemplate.update(Queries.UPDATE_CREDIT_BY_DATE, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			String creditCardTypeId2 = request.getParameter("creditCardTypeId2");
			String amexccRead = request.getParameter("amexccRead");
			String amextillRead = request.getParameter("amextillRead");
			/*
			 * String amexFoodBevSales = request.getParameter("bev_amex_Sales");
			 * String amexEventFoodBevSales =
			 * request.getParameter("eve_amex_Sales");
			 */

			Object[] param = { Double.parseDouble(amexccRead), Double.parseDouble(amextillRead), updatedOn, userDetails.getUserName(), parseInt(creditCardTypeId2), cashUpCashDate, serviceId, income_center_id };
			jdbcTemplate.update(Queries.UPDATE_CREDIT_BY_DATE, param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			String creditCardTypeId3 = request.getParameter("creditCardTypeId3");
			String masterccRead = request.getParameter("masterccRead");
			String mastertillRead = request.getParameter("mastertillRead");
			/*
			 * String masterFoodBevSales =
			 * request.getParameter("bev_master_Sales"); String
			 * masterEventFoodBevSales =
			 * request.getParameter("eve_master_Sales");
			 */

			Object[] param = { Double.parseDouble(masterccRead), Double.parseDouble(mastertillRead), updatedOn, userDetails.getUserName(), parseInt(creditCardTypeId3), cashUpCashDate, serviceId, income_center_id };
			jdbcTemplate.update(Queries.UPDATE_CREDIT_BY_DATE, param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			String creditCardTypeId4 = request.getParameter("creditCardTypeId4");
			String debitccRead = request.getParameter("debitccRead");
			String debittillRead = request.getParameter("debittillRead");
			/*
			 * String debitFoodBevSales =
			 * request.getParameter("bev_debit_Sales"); String
			 * debitEventFoodBevSales = request.getParameter("eve_debit_Sales");
			 */

			Object[] param = { Double.parseDouble(debitccRead), Double.parseDouble(debittillRead), updatedOn, userDetails.getUserName(), parseInt(creditCardTypeId4), cashUpCashDate, serviceId, income_center_id };
			jdbcTemplate.update(Queries.UPDATE_CREDIT_BY_DATE, param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * try { String onAccountccRead = "0.0"; String onAccounttillRead =
		 * "0.0"; String creditCardTypeId4 =
		 * request.getParameter("creditCardTypeId4"); String
		 * onAccountFoodBevSales = request.getParameter("bev_onAccount_Sales");
		 * String onAccountEventFoodBevSales =
		 * request.getParameter("eve_onAccount_Sales");
		 * 
		 * Object[] param = { Double.parseDouble(onAccountccRead),
		 * Double.parseDouble(onAccounttillRead), updatedOn,
		 * userDetails.getUserName(), parseInt(creditCardTypeId4),
		 * cashUpCashDate, serviceId, income_center_id };
		 * jdbcTemplate.update(Queries.UPDATE_CREDIT_BY_DATE, param); } catch
		 * (Exception e) { e.printStackTrace(); }
		 */

		/*
		 * try { String compccRead = "0.0"; String comptillRead = "0.0"; String
		 * creditCardTypeId6 = request.getParameter("creditCardTypeId6"); String
		 * compFoodBevSales = request.getParameter("bev_comp_Sales"); String
		 * compEventFoodBevSales = request.getParameter("eve_comp_Sales");
		 * 
		 * Object[] param = { Double.parseDouble(compccRead),
		 * Double.parseDouble(comptillRead),
		 * Double.parseDouble(compFoodBevSales),
		 * Double.parseDouble(compEventFoodBevSales), updatedOn,
		 * userDetails.getUserName(), parseInt(creditCardTypeId6),
		 * cashUpCashDate, serviceId, income_center_id };
		 * jdbcTemplate.update(Queries.UPDATE_CREDIT_BY_DATE, param); } catch
		 * (Exception e) { e.printStackTrace(); }
		 */

		try {
			final List<CashUpPurchases> cashupPurchasesList = new ArrayList<CashUpPurchases>();
			String foodPurchaseSize = request.getParameter("purchaseFoodListSize");
			if (foodPurchaseSize != null) {
				int foodPurchase = parseInt(foodPurchaseSize);
				for (int i = 0; i < foodPurchase; i++) {
					if (request.getParameter("isDirtyFood" + i).equals("1")) {
						String purchaseFoodName = request.getParameter("purchaseFoodName" + i);
						double purchaseFoodvalue = Double.parseDouble(request.getParameter("purchaseFoodValue" + i));
						int purchaseId = parseInt(request.getParameter("purchaseId" + i));

						// Object[] param = { purchaseFoodName,
						// purchaseFoodvalue, updatedOn,
						// userDetails.getUserName(), purchaseId,
						// cashUpCashDate, serviceId, income_center_id };
						cashupPurchasesList.add(new CashUpPurchases(purchaseFoodName, purchaseFoodvalue, updatedOn, userDetails.getUserName(), purchaseId, cashUpCashDate, serviceId, income_center_id));
						// jdbcTemplate.update(Queries.PURCHASE_FOOD_UPDATE_QRY,
						// param);
					}
				}
			}

			if (!cashupPurchasesList.isEmpty()) {
				jdbcTemplate.batchUpdate(Queries.PURCHASE_FOOD_UPDATE_QRY, new BatchPreparedStatementSetter() {

					@Override
					public void setValues(PreparedStatement ps, int i) throws SQLException {
						CashUpPurchases cashUpPurchases = cashupPurchasesList.get(i);
						ps.setString(1, cashUpPurchases.getPurchaseName());
						ps.setDouble(2, cashUpPurchases.getPurchaseCost());
						ps.setDate(3, new java.sql.Date(cashUpPurchases.getUpdatedOn().getTime()));
						ps.setString(4, cashUpPurchases.getUpdatedBy());
						ps.setInt(5, cashUpPurchases.getPurchaseId());
						ps.setDate(6, new java.sql.Date(cashUpPurchases.getCashUpCashDate().getTime()));
						ps.setInt(7, cashUpPurchases.getServiceId());
						ps.setInt(8, cashUpPurchases.getIncomeCentreId());
					}

					@Override
					public int getBatchSize() {
						return cashupPurchasesList.size();
					}
				});
			}

			String bevPurchaseSize = request.getParameter("purchaseBeverageSize");
			final List<CashUpPurchases> cashUpPurchasesForBeverage = new ArrayList<CashUpPurchases>();
			if (bevPurchaseSize != null) {
				int bevPurchase = parseInt(bevPurchaseSize);
				for (int i = 0; i < bevPurchase; i++) {
					if (request.getParameter("isDirtyBev" + i).equals("1")) {
						String purchaseBeverageName = request.getParameter("purchaseBeverageName" + i);
						double purchaseBeverageValue = Double.parseDouble(request.getParameter("purchaseBeverageValue" + i));
						int purchaseId = parseInt(request.getParameter("purchaseBeverageId" + i));

						// Object[] param = { purchaseBeverageName,
						// purchaseBeverageValue, updatedOn,
						// userDetails.getUserName(), purchaseId,
						// cashUpCashDate, serviceId, income_center_id };
						// jdbcTemplate.update(Queries.PURCHASE_BEVERAGE_UPDATE_QRY,
						// param);
						cashUpPurchasesForBeverage.add(new CashUpPurchases(purchaseBeverageName, purchaseBeverageValue, updatedOn, userDetails.getUserName(), purchaseId, cashUpCashDate, serviceId, income_center_id));
					}
				}
			}

			if (!cashUpPurchasesForBeverage.isEmpty()) {
				jdbcTemplate.batchUpdate(Queries.PURCHASE_BEVERAGE_UPDATE_QRY, new BatchPreparedStatementSetter() {

					@Override
					public void setValues(PreparedStatement ps, int i) throws SQLException {
						CashUpPurchases cashUpPurchases = cashUpPurchasesForBeverage.get(i);
						ps.setString(1, cashUpPurchases.getPurchaseName());
						ps.setDouble(2, cashUpPurchases.getPurchaseCost());
						ps.setDate(3, new java.sql.Date(cashUpPurchases.getUpdatedOn().getTime()));
						ps.setString(4, cashUpPurchases.getUpdatedBy());
						ps.setInt(5, cashUpPurchases.getPurchaseId());
						ps.setDate(6, new java.sql.Date(cashUpPurchases.getCashUpCashDate().getTime()));
						ps.setInt(7, cashUpPurchases.getServiceId());
						ps.setInt(8, cashUpPurchases.getIncomeCentreId());
					}

					@Override
					public int getBatchSize() {
						return cashUpPurchasesForBeverage.size();
					}
				});
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			String voidMaxSize = request.getParameter("voidCount");
			if (voidMaxSize != null) {
				int voidMax = parseInt(voidMaxSize);
				for (int i = 0; i < voidMax; i++) {
					if (request.getParameter("isDirtyVoid" + i).equals("1")) {
						String staffId = request.getParameter("staffId" + i);
						String cashUpVoidsId = request.getParameter("cashUpVoidsId" + i);
						String value = request.getParameter("value" + i);
						String time = request.getParameter("time" + i);
						String why = request.getParameter("why" + i);

						Object[] param = { parseInt(staffId), Double.parseDouble(value), sdf.parse(time), why, updatedOn, userDetails.getUserName(), parseInt(cashUpVoidsId), cashUpCashDate, serviceId, income_center_id };
						jdbcTemplate.update(Queries.UPDATE_CASHUP_VOID_BY_DATE, param);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			String creditCardsTips = request.getParameter("creditCardsTips");
			String cashTips = request.getParameter("cashTips");

			Object[] param = { Double.parseDouble(cashTips), Double.parseDouble(creditCardsTips), updatedOn, userDetails.getUserName(), cashUpCashDate, serviceId, parseInt(request.getParameter("cashUpTipsId")), income_center_id };
			jdbcTemplate.update(Queries.UPDATE_CASHUP_TIPS_BY_DATE, param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			int zReadId = parseInt(request.getParameter("cashUpZReadId"));
			double zRead = Double.parseDouble(request.getParameter("zReadSummary"));
			Object[] param = { zRead, updatedOn, userDetails.getUserName(), zReadId, serviceId, cashUpCashDate, income_center_id };
			jdbcTemplate.update(Queries.UPDATE_Z_READ, param);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public CashSales getSalesDetail(Date transactionDate, int serviceId, User userDetails, int income_center_id) {

		Object[] param = { transactionDate, serviceId, income_center_id };
		List<CashSales> cashSales = jdbcTemplate.query(Queries.GET_SALES_BY_DATE, param, new CashSalesRowMapper());

		if (cashSales != null && cashSales.size() > 0) {
			return cashSales.get(0);
		} else {
			try {
				int cashSalesId = 0;
				String qrySalesId = "select max(cash_sales_id)+1 from cash_sales";

				SqlRowSet rsSalesId = selectResults(qrySalesId);

				if (rsSalesId.next()) {
					cashSalesId = rsSalesId.getInt(1);
				}

				int restCover = 0;
				double restFoodSales = 0.0;
				double restBevSales = 0.0;
				double restOtherSales = 0.0;
				int cafeCover = 0;
				double cafeFoodSales = 0.0;
				double cafeBevSales = 0.0;
				double cafeOtherSales = 0.0;
				int takeAwayCover = 0;
				double takeAwayFoodSales = 0.0;
				double takeAwayBevSales = 0.0;
				double takeAwayOtherSales = 0.0;
				int barCover = 0;
				double barFoodSales = 0.0;
				double barBevSales = 0.0;
				double barOtherSales = 0.0;
				int deliCover = 0;
				double deliFoodSales = 0.0;
				double deliBevSales = 0.0;
				double deliOtherSales = 0.0;
				int retailCover = 0;
				double retailFoodSales = 0.0;
				double retailBevSales = 0.0;
				double retailOtherSales = 0.0;
				int cateringCover = 0;
				double cateringFoodSales = 0.0;
				double cateringBevSales = 0.0;
				double cateringOtherSales = 0.0;
				int deliveryCover = 0;
				double deliveryFoodSales = 0.0;
				double deliveryBevSales = 0.0;
				double deliveryOtherSales = 0.0;
				int eventCover = 0;
				double eventFoodSales = 0.0;
				double eventBevSales = 0.0;
				double eventOtherSales = 0.0;
				int roomServiceCover = 0;
				double roomServiceFoodSales = 0.0;
				double roomServiceBevSales = 0.0;
				double roomServiceOtherSales = 0.0;
				int custom1Cover = 0;
				double custom1FoodSales = 0.0;
				double custom1BevSales = 0.0;
				double custom1OtherSales = 0.0;
				int custom2Cover = 0;
				double custom2FoodSales = 0.0;
				double custom2BevSales = 0.0;
				double custom2OtherSales = 0.0;

				Object[] param1 = { cashSalesId, serviceId, income_center_id, restCover, restFoodSales, restBevSales, restOtherSales, cafeCover, cafeFoodSales, cafeBevSales, cafeOtherSales, takeAwayCover, takeAwayFoodSales, takeAwayBevSales, takeAwayOtherSales, barCover, barFoodSales, barBevSales, barOtherSales, deliCover, deliFoodSales, deliBevSales, deliOtherSales, retailCover, retailFoodSales, retailBevSales, retailOtherSales, cateringCover, cateringFoodSales, cateringBevSales, cateringOtherSales, deliveryCover, deliveryFoodSales, deliveryBevSales, deliveryOtherSales, eventCover, eventFoodSales, eventBevSales, eventOtherSales, roomServiceCover, roomServiceFoodSales, roomServiceBevSales, roomServiceOtherSales, custom1Cover, custom1FoodSales, custom1BevSales, custom1OtherSales, custom2Cover, custom2FoodSales, custom2BevSales, custom2OtherSales, transactionDate, userDetails.getUserName() };
				jdbcTemplate.update(Queries.INSERT_CASHUP_SALES, param1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			cashSales = jdbcTemplate.query(Queries.GET_SALES_BY_DATE, param, new CashSalesRowMapper());
		}

		if (cashSales != null && cashSales.size() > 0)
			return cashSales.get(0);
		return null;
	}

	@Override
	public List<CashUpVoids> getCashUpVoids(Date transactionDate, int serviceId, int income_center_id, User userDetails) {

		Object[] param = { transactionDate, serviceId, income_center_id };
		List<CashUpVoids> cashUpVoid = jdbcTemplate.query(Queries.GET_CASHUP_VOID_BY_DATE, param, new CashUpVoidsRowMapper());
		/* if (cashUpVoid != null && cashUpVoid.size() > 0) { */
		return cashUpVoid;
		/*
		 * } else { try { SimpleDateFormat sdf = new
		 * SimpleDateFormat("HH:mm:ss"); String staffId = "1"; double amount =
		 * 0.0; String time = "10:00:00"; String reason = "";
		 * 
		 * Object[] param1 = { parseInt(staffId), serviceId, amount,
		 * sdf.parse(time), reason, userDetails.getUserName(), transactionDate,
		 * income_center_id }; jdbcTemplate.update(Queries.INSERT_CASHUP_VOID,
		 * param1); } catch (Exception e) { e.printStackTrace(); } cashUpVoid =
		 * jdbcTemplate.query(Queries.GET_CASHUP_VOID_BY_DATE, param, new
		 * CashUpVoidsRowMapper()); return null; } return cashUpVoid;
		 */

	}

	@Override
	public boolean addNewCashupVoid(Date transactionDate, int serviceId, User userDetails, int income_center_id, String staffId, String amount, String time, String reason) {

		boolean isAdded = false;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			Object[] param = { parseInt(staffId), serviceId, Double.parseDouble(amount), sdf.parse(time), reason, userDetails.getUserName(), transactionDate, income_center_id };
			jdbcTemplate.update(Queries.INSERT_CASHUP_VOID, param);

			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}

	@Override
	public List<Staff> searchStaffName(String staffName) {
		String[] s = { "%" + staffName + "%" };
		List<Staff> staff = jdbcTemplate.query(Queries.SEARCH_STAFF_BY_NAME, s, new StaffRowMapper());
		return staff;
	}

	@Override
	public List<CashDrawers> getTillDetails(long userId, int income_center_id) {

		Object[] param = { userId, income_center_id };
		List<CashDrawers> tillDetailsList = jdbcTemplate.query(Queries.GET_TILL_DETAILS, param, new CashDrawersRowMapper());

		if (tillDetailsList != null && tillDetailsList.size() > 0) {
			return tillDetailsList;

		} else {
			return new ArrayList<CashDrawers>();
		}
	}

	@Override
	public List<List<CashupSalesDomain>> getCashUpSales() {
		List<List<CashupSalesDomain>> cashUpSales = jdbcTemplate.query(Queries.GET_CASHUP_SALES_BY_DATE, new CashUpSalesDomainRowMapper());
		return cashUpSales;
	}

	@Override
	public IncomeCentres getIncomeCenterDetails(int incomeCenterId) {
		Object[] param = { incomeCenterId };
		List<IncomeCentres> incomeList = jdbcTemplate.query(Queries.GET_INCOME_CENTER, param, new IncomeCentresRowMapper());

		if (incomeList != null && incomeList.size() > 0) {
			return incomeList.get(0);

		} else {
			return null;
		}
	}

	@Override
	public List<IncomeCentres> getIncomeCenterList() {

		List<IncomeCentres> incomeList = jdbcTemplate.query(Queries.GET_INCOME_CENTER_LIST, new IncomeCentresRowMapper());

		if (incomeList != null && incomeList.size() > 0) {
			return incomeList;

		} else {
			return null;
		}
	}

	@Override
	public List<Services> getServiceList(int incomeCenterId) {

		Object[] param = { incomeCenterId };
		List<Services> serviceList = jdbcTemplate.query(Queries.GET_SERVICES_BY_INCOME_CENTER, param, new ServicesRowMapper());

		if (serviceList != null && serviceList.size() > 0) {
			return serviceList;

		} else {
			return new ArrayList<Services>();
		}
	}

	@Override
	public Services getServiceTime(Integer serviceId) {

		Object[] param = { serviceId };
		List<Services> service = jdbcTemplate.query(Queries.GET_SERVICES_TIME, param, new ServicesRowMapper());
		if (service != null && service.size() > 0) {
			return service.get(0);

		} else {
			return null;
		}
	}

	@Override
	public CashUpZRead getZReadDetail(Date transactionDate, Integer serviceId, User userDetails, Integer incomeCenterId) {
		Object[] param = { transactionDate, serviceId, incomeCenterId };
		List<CashUpZRead> cashUpZRead = jdbcTemplate.query(Queries.GET_Z_READ_BY_DATE, param, new CashUpZReadRowMapper());

		if (cashUpZRead != null && cashUpZRead.size() > 0) {
			return cashUpZRead.get(0);

		} else {
			try {

				double zRead = 0.0;

				Object[] param1 = { serviceId, zRead, userDetails.getUserName(), transactionDate, incomeCenterId };
				jdbcTemplate.update(Queries.INSERT_CASHUP_Z_READ, param1);

			} catch (Exception e) {
				e.printStackTrace();
			}
			cashUpZRead = jdbcTemplate.query(Queries.GET_Z_READ_BY_DATE, param, new CashUpZReadRowMapper());
		}

		if (cashUpZRead != null && cashUpZRead.size() > 0)
			return cashUpZRead.get(0);
		return null;
	}

	@Override
	public List<StaffVoid> getStaffList(String staffId) {
		String[] param = { staffId + "%" };
		List<StaffVoid> categoryList = jdbcTemplate.query(Queries.SEARCH_STAFF_NAME, param, new StaffVoidRowMapper());
		return categoryList;
	}

	@Override
	public Staff getStaffIdList(String staffName) {
		Integer[] param = { parseInt(staffName) };
		List<Staff> staffList = jdbcTemplate.query(Queries.SEARCH_STAFF_ID_BY_NAME, param, new StaffRowMapper());
		if (staffList != null && staffList.size() > 0) {
			return staffList.get(0);
		} else {
			return null;
		}
	}

	private Integer parseInt(String string) {
		Integer objInt = 0;
		if (string != null && !string.isEmpty()) {
			try {
				objInt = Integer.parseInt(string);
			} catch (Exception e) {
			}
		}
		return objInt;
	}

	@Override
	public List<StaffVoid> getStaff(String staffId, Date transactionRosterDate) {
		Object[] param = { staffId + "%", transactionRosterDate };
		List<StaffVoid> categoryList = jdbcTemplate.query(Queries.SEARCH_STAFF_FOR_SERVICE_NAME, param, new StaffVoidRowMapper());
		return categoryList;
	}

	@Override
	public List<StaffRosters> getStaffVoid(Date transactionDate, Integer incomeCenterId) {
		Object[] param = { incomeCenterId, transactionDate };
		List<StaffRosters> staffList = jdbcTemplate.query(Queries.GET_ALLOCATED_STAFF, param, new StaffRosterRowMapper());
		return staffList;
	}

}
