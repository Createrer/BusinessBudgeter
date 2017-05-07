package com.f5infosol.businessbudgeter.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.f5infosol.businessbudgeter.dao.CashUpCreditCardDAO;
import com.f5infosol.businessbudgeter.dao.SettingDAO;
import com.f5infosol.businessbudgeter.domain.CashUpCreditCard;
import com.f5infosol.businessbudgeter.domain.CashUpPurchases;
import com.f5infosol.businessbudgeter.domain.CashUpTips;
import com.f5infosol.businessbudgeter.domain.User;

@Service
public class CashUpCreditCardServiceImpl implements CashUpCreditCardService {

	protected final Log logger = LogFactory.getLog(getClass());
	@Resource
	private CashUpCreditCardDAO objDao;

	@Resource
	private SettingDAO settingDao;
	
	@Override
	public List<CashUpCreditCard> getcardValuesList(Date transactionDate, int serviceId, User userDetails, int income_center_id) {
		return objDao.getcardValuesList(transactionDate, serviceId, userDetails, income_center_id);
	}

	@Override
	public List<CashUpPurchases> getPurchaseList(Date transactionDate, int serviceId, User userDetails, int income_center_id) {
		return objDao.getPurchaseList(transactionDate, serviceId, userDetails, income_center_id);
	}

	@Override
	public List<CashUpPurchases> getPurchaseBeverageList(Date transactionDate, int serviceId, User userDetails, int income_center_id) {
		return objDao.getPurchaseBeverageList(transactionDate, serviceId, userDetails, income_center_id);
	}

	@Override
	public CashUpTips getTipsList(Date transactionDate, int serviceId, User userDetails, int income_center_id) {
		return objDao.getTipsList(transactionDate, serviceId, userDetails, income_center_id);
	}
	
	@Override
	public boolean addNewFoodPurchase(Date transactionDate, int serviceId, User userDetails, int income_center_id, String foodName, String foodPrice) {
		return objDao.addNewFoodPurchase(transactionDate, serviceId, userDetails, income_center_id, foodName, foodPrice);
	}

	@Override
	public boolean addNewBeveragePurchases(Date transactionDate, int serviceId, User userDetails, int income_center_id, String bevName, String bevPrice) {
		return objDao.addNewBeveragePurchase(transactionDate, serviceId, userDetails, income_center_id, bevName, bevPrice);
	}

}
