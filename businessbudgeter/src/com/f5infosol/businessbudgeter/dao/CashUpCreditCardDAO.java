package com.f5infosol.businessbudgeter.dao;

import java.util.Date;
import java.util.List;

import com.f5infosol.businessbudgeter.domain.CashUpCreditCard;
import com.f5infosol.businessbudgeter.domain.CashUpPurchases;
import com.f5infosol.businessbudgeter.domain.CashUpTips;
import com.f5infosol.businessbudgeter.domain.User;

public interface CashUpCreditCardDAO {

	List<CashUpCreditCard> getcardValuesList(Date transactionDate, int serviceId, User userDetails, int income_center_id);
	
	List<CashUpPurchases> getPurchaseList(Date transactionDate, int serviceId, User userDetails, int income_center_id);
	
	List<CashUpPurchases> getPurchaseBeverageList(Date transactionDate, int serviceId, User userDetails, int income_center_id);
	
	CashUpTips getTipsList(Date transactionDate, int serviceId, User userDetails, int income_center_id);
	
	boolean addNewFoodPurchase(Date transactionDate, int serviceId, User userDetails, int income_center_id, String foodName, String foodPrice);
	
	boolean addNewBeveragePurchase(Date transactionDate, int serviceId, User userDetails, int income_center_id, String bevName, String bevPrice);
	
}
