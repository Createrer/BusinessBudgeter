package com.f5infosol.businessbudgeter.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.f5infosol.businessbudgeter.common.Queries;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpCreditCardRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpPurchasesRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.CashUpTipsRowMapper;
import com.f5infosol.businessbudgeter.dao.rowmapper.IncomeCentresRowMapper;
import com.f5infosol.businessbudgeter.domain.CashUpCreditCard;
import com.f5infosol.businessbudgeter.domain.CashUpPurchases;
import com.f5infosol.businessbudgeter.domain.CashUpTips;
import com.f5infosol.businessbudgeter.domain.IncomeCentres;
import com.f5infosol.businessbudgeter.domain.User;

@Repository
public class CashUpCreditCardDAOImpl extends BaseDAOImpl implements CashUpCreditCardDAO {

	protected final Log logger = LogFactory.getLog(getClass());

	@Override
	public List<CashUpCreditCard> getcardValuesList(Date transactionDate, int serviceId, User userDetails, int income_center_id) {

		Object[] param = { transactionDate, serviceId, income_center_id };
		List<CashUpCreditCard> cashUpDebit = jdbcTemplate.query(Queries.CARD_QUERY, param, new CashUpCreditCardRowMapper());

		if (cashUpDebit != null && cashUpDebit.size() > 0) {
			return cashUpDebit;
		} else {

			try {

				int cardTypeId = 0;
				double ccReading = 0.0;
				double tillReading = 0.0;
				/*double food_beverage_sales = 0.0;
				double event_food_beverage_sales  = 0.0;*/
				int count = 0;

				String qryCardId = "select credit_card_type_id from credit_card_types";

				SqlRowSet rsCardId = selectResults(qryCardId);

				if (rsCardId.next()) {
					cardTypeId = rsCardId.getInt(1);
				}

				String noOfCards = "select count(*) from credit_card_types";

				SqlRowSet rsCardCount = selectResults(noOfCards);

				if (rsCardCount.next()) {
					count = rsCardCount.getInt(1);
				}

				for (int i = 0; i < count; i++) {
					Object[] param1 = { serviceId, cardTypeId, ccReading, tillReading, userDetails.getUserName(), transactionDate, income_center_id };
					jdbcTemplate.update(Queries.INSERT_CASHUP_CARD, param1);
					cardTypeId = cardTypeId + 1;

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			cashUpDebit = jdbcTemplate.query(Queries.CARD_QUERY, param, new CashUpCreditCardRowMapper());

		}
		return cashUpDebit;
	}

	@Override
	public List<CashUpPurchases> getPurchaseList(Date transactionDate, int serviceId, User userDetails, int income_center_id) {

		Object[] param = { serviceId, transactionDate, income_center_id };

		List<CashUpPurchases> puchaseList = jdbcTemplate.query(Queries.PURCHASE_LIST_QUERY, param, new CashUpPurchasesRowMapper());

		if (puchaseList != null && puchaseList.size() > 0) {
			return puchaseList;
		} else {

			/*
			 * try { String purchaseName = ""; double purchaseCost = 0.0; String
			 * purchaseType = "food"; Object[] param1 = { serviceId,
			 * purchaseName, purchaseType, userDetails.getUserName(),
			 * transactionDate, purchaseCost, income_center_id };
			 * jdbcTemplate.update(Queries.INSERT_CASHUP_PURCHASE, param1); }
			 * catch (Exception e) { e.printStackTrace(); } puchaseList =
			 * jdbcTemplate.query(Queries.PURCHASE_LIST_QUERY, param, new
			 * CashUpPurchasesRowMapper()); } return puchaseList;
			 */
			return null;
		}
	}

	@Override
	public List<CashUpPurchases> getPurchaseBeverageList(Date transactionDate, int serviceId, User userDetails, int income_center_id) {

		Object[] param = { serviceId, transactionDate, income_center_id };

		List<CashUpPurchases> puchaseBeverageList = jdbcTemplate.query(Queries.PURCHASE_BEVERAGE_LIST_QUERY, param, new CashUpPurchasesRowMapper());

		if (puchaseBeverageList != null && puchaseBeverageList.size() > 0) {
			return puchaseBeverageList;
		} else {
			/*
			 * try { String purchaseName = ""; double purchaseCost = 0.0; String
			 * purchaseType = "beverage"; Object[] param1 = { serviceId,
			 * purchaseName, purchaseType, userDetails.getUserName(),
			 * transactionDate, purchaseCost, income_center_id };
			 * jdbcTemplate.update(Queries.INSERT_CASHUP_PURCHASE, param1); }
			 * catch (Exception e) { e.printStackTrace(); } puchaseBeverageList
			 * = jdbcTemplate.query(Queries.PURCHASE_BEVERAGE_LIST_QUERY, param,
			 * new CashUpPurchasesRowMapper()); } return puchaseBeverageList;
			 */
			return null;
		}
	}

	@Override
	public CashUpTips getTipsList(Date transactionDate, int serviceId, User userDetails, int income_center_id) {

		Object[] param = { transactionDate, serviceId, income_center_id };

		List<CashUpTips> cashTipsList = jdbcTemplate.query(Queries.GET_TIPS_BY_DATE, param, new CashUpTipsRowMapper());

		if (cashTipsList != null && cashTipsList.size() > 0) {
			return cashTipsList.get(0);
		} else {

			try {
				
				Integer[] param2 = {income_center_id};
				Double feesPCT = 0.0;
				Double slushPCT = 0.0;
				List<IncomeCentres> incomeCentres = jdbcTemplate.query(Queries.GET_INCOME_CENTER_BY_ID, param2, new IncomeCentresRowMapper());
				if (incomeCentres != null && incomeCentres.size() > 0) {
					 feesPCT = incomeCentres.get(0).getFees();
					 slushPCT = incomeCentres.get(0).getSlush();
				}
				
				double cashTips = 0.0;
				double creditCardTips = 0.0;

				Object[] param1 = { serviceId, userDetails.getUserName(), cashTips, transactionDate, creditCardTips, income_center_id, feesPCT, slushPCT };
				jdbcTemplate.update(Queries.INSERT_CASHUP_TIPS, param1);

			} catch (Exception e) {
				e.printStackTrace();
			}
			cashTipsList = jdbcTemplate.query(Queries.GET_TIPS_BY_DATE, param, new CashUpTipsRowMapper());

		}
		if(cashTipsList != null && cashTipsList.size() > 0)
			return cashTipsList.get(0);
		return null;

	}


	@Override
	public boolean addNewFoodPurchase(Date transactionDate, int serviceId, User userDetails, int income_center_id, String purchaseName, String purchaseCost) {
		boolean isAdded = false;
		double purchase_cost = 0.0;
		if (purchaseCost != null && !purchaseCost.isEmpty() && Double.parseDouble(purchaseCost) > 0) {
			purchase_cost = Double.parseDouble(purchaseCost);
		}
		try {
			String purchaseType = "food";
			Object[] param = { serviceId, purchaseName, purchaseType, userDetails.getUserName(), transactionDate, purchase_cost, income_center_id };
			jdbcTemplate.update(Queries.INSERT_CASHUP_PURCHASE, param);

			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;

	}

	@Override
	public boolean addNewBeveragePurchase(Date transactionDate, int serviceId, User userDetails, int income_center_id, String purchaseName, String purchaseCost) {
		
		boolean isAdded = false;
		
		double purchase_cost = 0.0;
		if (purchaseCost != null && !purchaseCost.isEmpty() && Double.parseDouble(purchaseCost) > 0) {
			purchase_cost = Double.parseDouble(purchaseCost);
		}
		try {
			String purchaseType = "beverage";
			Object[] param = { serviceId, purchaseName, purchaseType, userDetails.getUserName(), transactionDate, purchase_cost, income_center_id };
			jdbcTemplate.update(Queries.INSERT_CASHUP_PURCHASE, param);

			isAdded = true;
		} catch (Exception e) {
			isAdded = false;
			e.printStackTrace();
		}
		return isAdded;
	}


}
