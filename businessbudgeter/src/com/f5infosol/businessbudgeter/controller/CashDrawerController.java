package com.f5infosol.businessbudgeter.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.f5infosol.businessbudgeter.beans.MasterData;
import com.f5infosol.businessbudgeter.domain.CashDrawers;
import com.f5infosol.businessbudgeter.domain.CashSales;
import com.f5infosol.businessbudgeter.domain.CashUpCreditCard;
import com.f5infosol.businessbudgeter.domain.CashUpPurchases;
import com.f5infosol.businessbudgeter.domain.CashUpTips;
import com.f5infosol.businessbudgeter.domain.CashUpVoids;
import com.f5infosol.businessbudgeter.domain.CashUpZRead;
import com.f5infosol.businessbudgeter.domain.IncomeCentres;
import com.f5infosol.businessbudgeter.domain.Services;
import com.f5infosol.businessbudgeter.domain.Staff;
import com.f5infosol.businessbudgeter.domain.StaffRosters;
import com.f5infosol.businessbudgeter.domain.StaffVoid;
import com.f5infosol.businessbudgeter.domain.User;
import com.f5infosol.businessbudgeter.exception.UserNotLoginException;
import com.f5infosol.businessbudgeter.service.CashDrawerService;
import com.f5infosol.businessbudgeter.service.CashUpCreditCardService;
import com.f5infosol.businessbudgeter.util.BusinessBudgeterUtil;
import com.f5infosol.businessbudgeter.util.UserUtil;

@Controller
public class CashDrawerController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource
	CashDrawerService cashDrawerService;
	@Resource
	CashUpCreditCardService cashUpCreditCardService;

	@RequestMapping(value = "/cashup-cash")
	public String getCashupContent(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		Date date1 = new Date();
		logger.info("START " + date1);
		User userObject = null;
		try {
			userObject = UserUtil.getUser();
			request.getSession().setAttribute("userDetails", userObject);
		} catch (UserNotLoginException e) {
			// e.printStackTrace();
		}

		if (userObject == null) {

			return "redirect:/login";
		}

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		List<IncomeCentres> incomeCenterListSession = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterListSession", incomeCenterListSession);

		List<Services> seviceListSession = cashDrawerService.getServiceList(incomeCenterListSession.get(0).getIncomeCentreId());
		model.put("seviceListSession", seviceListSession);

		String serviceDate = (String) (session.getAttribute("serviceDate") != null ? session.getAttribute("serviceDate") : simpleDateFormat.format(new Date()));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center") != null ? session.getAttribute("income-center") : incomeCenterListSession.get(0).getIncomeCentreId());
		Integer serviceId = (Integer) (session.getAttribute("service-id") != null ? session.getAttribute("service-id") : seviceListSession.get(0).getServiceId());

		if (request.getParameter("incomeCenterId") != null) {
			try {
				incomeCenterId = Integer.parseInt(request.getParameter("incomeCenterId"));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if (request.getParameter("serviceId") != null) {
			try {
				serviceId = Integer.parseInt(request.getParameter("serviceId"));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if (request.getParameter("serviceDate") != null) {
			serviceDate = request.getParameter("serviceDate");
		}

		logger.info("CashDrawerController.getCashupContent() incomeCenterId = " + incomeCenterId);
		logger.info("CashDrawerController.getCashupContent() serviceId = " + serviceId);
		logger.info("CashDrawerController.getCashupContent() serviceDate = " + serviceDate);

		session.setAttribute("serviceDate", serviceDate);
		session.setAttribute("income-center", incomeCenterId);
		session.setAttribute("service-id", serviceId);

		List<IncomeCentres> incomeCenterList;
		if (MasterData.incomeCenterList.isEmpty()) {
			incomeCenterList = cashDrawerService.getIncomeCenterList();
			MasterData.incomeCenterList = incomeCenterList;
		} else
			incomeCenterList = MasterData.incomeCenterList;

		model.put("incomeCenterList", incomeCenterList);

		List<Services> seviceList;
		if (MasterData.getService(incomeCenterId) == null) {
			seviceList = cashDrawerService.getServiceList(incomeCenterId);
			MasterData.putService(incomeCenterId, seviceList);
		}
		seviceList = MasterData.getService(incomeCenterId);

		model.put("seviceList", seviceList);

		User userDetails = (User) session.getAttribute("userDetails");
		model.put("userName", userDetails);

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(serviceDate);
		List<CashDrawers> tillDetailsList = cashDrawerService.getTillDetails(userDetails.getUserId(), incomeCenterId);
		model.addAttribute("tillDetailsList", tillDetailsList);
		model.addAttribute("tillDetailsListCount", tillDetailsList.size());

		tillDetailsList = cashDrawerService.getDrawerOneAmount(transactionDate, serviceId, userDetails, incomeCenterId, tillDetailsList);
		// model.addAttribute("cashUpCashCount", tillDetailsList.size());
		if (tillDetailsList != null && tillDetailsList.isEmpty() == false && tillDetailsList.size() > 0 && tillDetailsList.get(0).getCashUpCashsList() != null) {
			model.put("cashUpCashsSize", tillDetailsList.get(0).getCashUpCashsList().size());
		} else {
			model.put("cashUpCashsSize", tillDetailsList.get(0).getCashUpCashsList().size());
		}
		logger.info("Counters : " + tillDetailsList.size());

		CashSales cashSale = cashDrawerService.getSalesDetail(transactionDate, serviceId, userDetails, incomeCenterId);

		List<CashUpCreditCard> cardValuesList = cashUpCreditCardService.getcardValuesList(transactionDate, serviceId, userDetails, incomeCenterId);

		model.put("cashSale", cashSale);
		model.addAttribute("cardValuesList", cardValuesList);

		CashUpTips cashUpTips = cashUpCreditCardService.getTipsList(transactionDate, serviceId, userDetails, incomeCenterId);
		model.put("cashUpTips", cashUpTips);

		/*
		 * List<List<CashupSalesDomain>> cashUpSalesList =
		 * cashDrawerService.getCashUpSales();
		 * model.addAttribute("cashUpSalesList",cashUpSalesList);
		 */

		IncomeCentres incomeCenter = getIncomeCenter(incomeCenterList, incomeCenterId);
		model.put("incomeCenter", incomeCenter);

		Services service;
		if (MasterData.getServiceByServiceId(serviceId) == null) {
			service = cashDrawerService.getServiceTime(serviceId);
			MasterData.serviceList.add(service);
		} else {
			service = MasterData.getServiceByServiceId(serviceId);
		}
		model.put("service", service);

		CashUpZRead cashUpZRead = cashDrawerService.getZReadDetail(transactionDate, serviceId, userDetails, incomeCenterId);
		model.put("cashUpZRead", cashUpZRead);

		if (transactionDate != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEE, d");
			String service_Date = dateFormatter.format(transactionDate);
			session.setAttribute("service_Date", service_Date);
		}

		Date date2 = new Date();
		logger.info("END " + getDateDiff(date1, date2, TimeUnit.SECONDS));

		return "/cashup-cash";
	}

	public static long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
		long diffInMillies = date2.getTime() - date1.getTime();
		return timeUnit.convert(diffInMillies, TimeUnit.MILLISECONDS);
	}

	private IncomeCentres getIncomeCenter(List<IncomeCentres> incomeCenterList, Integer incomeCenterId) {
		for (IncomeCentres incomeCentres : incomeCenterList) {
			if (incomeCentres.getIncomeCentreId().intValue() == incomeCenterId.intValue())
				return incomeCentres;
		}
		return new IncomeCentres();
	}

	@RequestMapping(value = "/update-cashUp")
	public @ResponseBody String updateCashUpCash(Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		String transactionDate = (String) session.getAttribute("serviceDate");
		Integer serviceId = (Integer) session.getAttribute("service-id");

		cashDrawerService.updateCashUpCash(request, transactionDate, serviceId);
		return "true";
	}

	@RequestMapping(value = "/cashup-purchase")
	public String getCashupPurchaseFood(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String serviceDate = (String) (session.getAttribute("serviceDate"));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center"));
		Integer serviceId = (Integer) (session.getAttribute("service-id"));

		User userDetails = (User) session.getAttribute("userDetails");

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(serviceDate);

		List<CashUpPurchases> purchaseFoodList = cashUpCreditCardService.getPurchaseList(transactionDate, serviceId, userDetails, incomeCenterId);

		if (purchaseFoodList != null) {
			model.addAttribute("purchaseFoodList", purchaseFoodList);

			model.addAttribute("purchaseFoodListSize", purchaseFoodList.size());
		} else {
			model.addAttribute("purchaseFoodList", null);

			model.addAttribute("purchaseFoodListSize", 0);
		}
		return "/cashup-purchase";
	}

	@RequestMapping(value = "/cashup-purchase-beverage")
	public String getCashupPurchaseBeverage(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String serviceDate = (String) (session.getAttribute("serviceDate"));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center"));
		Integer serviceId = (Integer) (session.getAttribute("service-id"));

		User userDetails = (User) session.getAttribute("userDetails");

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(serviceDate);

		List<CashUpPurchases> purchaseBeverageList = cashUpCreditCardService.getPurchaseBeverageList(transactionDate, serviceId, userDetails, incomeCenterId);

		if (purchaseBeverageList != null) {
			model.addAttribute("purchaseBeverageList", purchaseBeverageList);
			model.addAttribute("purchaseBeverageSize", purchaseBeverageList.size());
		} else {
			model.addAttribute("purchaseBeverageList", null);
			model.addAttribute("purchaseBeverageSize", 0);
		}
		return "/cashup-purchase-beverage";
	}

	@RequestMapping(value = "/add-new-food-purchase")
	public String addNewFoodPurchase(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");

		String cashUpCashDate = (String) session.getAttribute("serviceDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		int serviceId = (Integer) session.getAttribute("service-id");

		String foodName = request.getParameter("purchaseFoodName");
		String foodPrice = request.getParameter("purchaseFoodValue");

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(cashUpCashDate);
		boolean isAdded = cashUpCreditCardService.addNewFoodPurchase(transactionDate, serviceId, userDetails, income_center_id, foodName, foodPrice);
		return "/cashup-purchase";
	}

	@RequestMapping(value = "/add-new-beverage-purchase")
	public String addNewBeveragePurchase(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");

		String cashUpCashDate = (String) session.getAttribute("serviceDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		int serviceId = (Integer) session.getAttribute("service-id");
		String bevName = request.getParameter("purchaseBeverageName");
		String bevPrice = request.getParameter("purchaseBeverageValue");
		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(cashUpCashDate);

		boolean isAdded = cashUpCreditCardService.addNewBeveragePurchases(transactionDate, serviceId, userDetails, income_center_id, bevName, bevPrice);

		return "/cashup-purchase-beverage";
	}

	@RequestMapping(value = "/add-new-cashup-void")
	public String addNewCashupVoid(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		User userDetails = (User) session.getAttribute("userDetails");

		String cashUpCashDate = (String) session.getAttribute("serviceDate");
		int income_center_id = (Integer) session.getAttribute("income-center");
		int serviceId = (Integer) session.getAttribute("service-id");
		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(cashUpCashDate);

		String staffId = request.getParameter("staffId");
		String amount = request.getParameter("value");
		String time = request.getParameter("timepopup");
		String reason = request.getParameter("why");

		boolean isAdded = cashDrawerService.addNewCashupVoid(transactionDate, serviceId, userDetails, income_center_id, staffId, amount, time, reason);

		return "/cashup-cash";
	}

	@RequestMapping(value = "/search-staff-name")
	public @ResponseBody List<HashMap<String, String>> staffNameList(Model model, HttpServletRequest request, HttpServletResponse response) {
		String staffId = request.getParameter("term");
		List<StaffVoid> staffList = cashDrawerService.getStaffList(staffId);
		List<HashMap<String, String>> li = new ArrayList<HashMap<String, String>>();
		if (staffList != null) {
			for (StaffVoid staff : staffList) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id", staff.getStaffId());
				map.put("value", staff.getSatffName());
				li.add(map);
			}
		}
		return li;
	}

	@RequestMapping(value = "/get-staff-id-by-name")
	public String searchMealByCategory(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		String staffId = request.getParameter("staffId");
		Staff staffDtls = cashDrawerService.getStaffIdList(staffId);
		logger.info("Staff ID  : " + staffDtls.getStaffId());
		model.put("staffDtls", staffDtls);
		return "/cashup-cash";

	}

	@RequestMapping(value = "/cashup-void")
	public String getCashupVoid(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String serviceDate = (String) (session.getAttribute("serviceDate"));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center"));
		Integer serviceId = (Integer) (session.getAttribute("service-id"));

		User userDetails = (User) session.getAttribute("userDetails");

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(serviceDate);
		List<StaffRosters> staffVoid = cashDrawerService.getStaffVoid(transactionDate, incomeCenterId);
		if (staffVoid != null && staffVoid.size() > 0) {
			model.addAttribute("staffVoid", staffVoid);
		} else {
			model.addAttribute("staffVoid", null);
		}
		List<CashUpVoids> cashUpVoids = cashDrawerService.getCashUpVoids(transactionDate, serviceId, incomeCenterId, userDetails);
		if (cashUpVoids != null && cashUpVoids.size() > 0) {
			model.addAttribute("cashUpVoids", cashUpVoids);
		} else {
			model.addAttribute("cashUpVoids", null);
		}
		model.addAttribute("cashUpVoidsCount", cashUpVoids.size());

		return "/cashup-void";
	}

	@RequestMapping(value = "/add-cashup-food-purchase")
	public String getCashupFoodPopup(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		return "/add-cashup-food-purchase";
	}

	@RequestMapping(value = "/add-cashup-beverage-purchase")
	public String getCashupBevPopup(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		return "/add-cashup-beverage-purchase";
	}

	@RequestMapping(value = "/add-cashup-voids")
	public String getCashupVoidPopup(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		String serviceDate = (String) (session.getAttribute("serviceDate"));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center"));
		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(serviceDate);

		List<StaffRosters> staffVoid = cashDrawerService.getStaffVoid(transactionDate, incomeCenterId);
		if (staffVoid != null && staffVoid.size() > 0) {
			model.addAttribute("addStaffVoid", staffVoid);
		} else {
			model.addAttribute("addStaffVoid", new ArrayList<StaffRosters>());
		}
		return "/add-cashup-voids";
	}
	
	/*@RequestMapping(value = "/cashup-add-new-cash-drawer")
	public String addNewCashDrawer(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		String serviceDate = (String) (session.getAttribute("serviceDate"));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center"));
		Integer serviceId = (Integer) (session.getAttribute("service-id"));

		User userDetails = (User) session.getAttribute("userDetails");

		Date transactionDate = BusinessBudgeterUtil.convertStringToDateForTran(serviceDate);

		List<CashUpPurchases> purchaseBeverageList = cashUpCreditCardService.getPurchaseBeverageList(transactionDate, serviceId, userDetails, incomeCenterId);

		if (purchaseBeverageList != null) {
			model.addAttribute("purchaseBeverageList", purchaseBeverageList);
			model.addAttribute("purchaseBeverageSize", purchaseBeverageList.size());
		} else {
			model.addAttribute("purchaseBeverageList", null);
			model.addAttribute("purchaseBeverageSize", 0);
		}
		return "/cashup-add-new-cash-drawer";
	}
	
	@RequestMapping(value = "/add-new-cashup-drawer")
	public String getNewCashupDrawer(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		return "/add-new-cashup-drawer";
	}
	
	*/

}
