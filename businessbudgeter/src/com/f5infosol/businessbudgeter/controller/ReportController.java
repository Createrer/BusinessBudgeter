/**
 * 
 */
package com.f5infosol.businessbudgeter.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.f5infosol.businessbudgeter.domain.IncomeCentres;
import com.f5infosol.businessbudgeter.domain.ProfitAndLossReport;
import com.f5infosol.businessbudgeter.domain.ProfitLossReportAll;
import com.f5infosol.businessbudgeter.domain.TipsService;
import com.f5infosol.businessbudgeter.domain.TotalCashUpReport;
import com.f5infosol.businessbudgeter.domain.User;
import com.f5infosol.businessbudgeter.service.CashDrawerService;
import com.f5infosol.businessbudgeter.service.ReportService;
import com.f5infosol.businessbudgeter.util.BusinessBudgeterUtil;

@Controller
public class ReportController {
	protected final Log logger = LogFactory.getLog(getClass());
	@Resource
	ReportService reportService;
	@Resource
	CashDrawerService cashDrawerService;

	@RequestMapping(value = "/reports")
	public String getReports(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		User userDetails = (User) session.getAttribute("userDetails");
		model.put("userName", userDetails);
		return "/reports";
	}

	@RequestMapping(value = "/all-reports")
	public String getStaffSetting(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "/all-reports";
	}

	@RequestMapping(value = "/tipsreports")
	public String getTipsReports(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		List<IncomeCentres> incomeCenterListSession = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterListSession", incomeCenterListSession);

		String reportDate = (String) (session.getAttribute("reportDate") != null ? session.getAttribute("reportDate") : simpleDateFormat.format(new Date()));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center") != null ? session.getAttribute("income-center") : incomeCenterListSession.get(0).getIncomeCentreId());

		if (request.getParameter("incomeCenterId") != null) {
			try {
				incomeCenterId = Integer.parseInt(request.getParameter("incomeCenterId"));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		if (request.getParameter("reportDate") != null) {
			reportDate = request.getParameter("reportDate");
		}

		if (incomeCenterId != null && incomeCenterId > 0) {
			Date transDate = null;
			if (reportDate != null)
				transDate = BusinessBudgeterUtil.convertStringToDateForTran(reportDate);
			else
				transDate = new Date();

			List<TipsService> tips = reportService.getTips(incomeCenterId, transDate);

			model.put("tips", tips);
			model.put("tipsize", tips.size());
		}
		logger.info("CashDrawerController.getCashupContent() incomeCenterId = " + incomeCenterId);
		logger.info("CashDrawerController.getCashupContent() serviceDate = " + reportDate);

		session.setAttribute("reportDate", reportDate);
		session.setAttribute("income-center", incomeCenterId);

		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);

		return "/tip-calculator-report";
	}

	@RequestMapping(value = "/totalreport")
	public String getTotalReports(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		List<IncomeCentres> incomeCenterListSession = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterListSession", incomeCenterListSession);

		String totReportDate = (String) (session.getAttribute("totReportDate") != null ? session.getAttribute("totReportDate") : simpleDateFormat.format(new Date()));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center") != null ? session.getAttribute("income-center") : incomeCenterListSession.get(0).getIncomeCentreId());

		if (request.getParameter("incomeCenterId") != null) {
			try {
				incomeCenterId = Integer.parseInt(request.getParameter("incomeCenterId"));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		if (request.getParameter("totReportDate") != null) {
			totReportDate = request.getParameter("totReportDate");
		}

		if (incomeCenterId != null && incomeCenterId > 0) {
			Date transDate = null;
			if (totReportDate != null)
				transDate = BusinessBudgeterUtil.convertStringToDateForTran(totReportDate);
			else
				transDate = new Date();

			List<TotalCashUpReport> cashupData = reportService.getTotalReportData(incomeCenterId, transDate);

			model.put("cashupdata", cashupData);
			model.put("cashupdatasize", cashupData.size());
			for (int i = 0; i < cashupData.size(); i++) {
				model.addAttribute("cardsCount", cashupData.get(i).getCashUpCreditCards().size());
				/*
				 * logger.info("ReportController.getTotalReports() no of cards "+
				 * cashupData.get(i).getCashUpCreditCards().size());
				 * logger.info(
				 * "ReportController.getTotalReports() cards date "+cashupData
				 * .get(i).getCashupCreditCardDate());
				 */
			}

		}
		logger.info("CashDrawerController.getCashupContent() incomeCenterId = " + incomeCenterId);
		logger.info("CashDrawerController.getCashupContent() serviceDate = " + totReportDate);

		session.setAttribute("totReportDate", totReportDate);
		session.setAttribute("income-center", incomeCenterId);

		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);

		return "/total-report";
	}

	@RequestMapping(value = "/wagesreport")
	public String getWagesReports(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		List<IncomeCentres> incomeCenterListSession = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterListSession", incomeCenterListSession);

		String wagesReportDate = (String) (session.getAttribute("wagesReportDate") != null ? session.getAttribute("wagesReportDate") : simpleDateFormat.format(new Date()));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center") != null ? session.getAttribute("income-center") : incomeCenterListSession.get(0).getIncomeCentreId());

		if (request.getParameter("incomeCenterId") != null) {
			try {
				incomeCenterId = Integer.parseInt(request.getParameter("incomeCenterId"));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		if (request.getParameter("wagesReportDate") != null) {
			wagesReportDate = request.getParameter("wagesReportDate");
		}

		if (incomeCenterId != null && incomeCenterId > 0) {
			Date transDate = null;
			if (wagesReportDate != null)
				transDate = BusinessBudgeterUtil.convertStringToDateForTran(wagesReportDate);
			else
				transDate = new Date();

			List<ProfitAndLossReport> wagesData = reportService.getWagesReport(incomeCenterId, transDate);
			model.put("wagesData", wagesData);
			model.put("wagesDataSize", wagesData.size());

		}
		logger.info("ReportController.getWages() incomeCenterId = " + incomeCenterId);
		logger.info("ReportController.getWages() Date = " + wagesReportDate);

		session.setAttribute("wagesReportDate", wagesReportDate);
		session.setAttribute("income-center", incomeCenterId);

		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);

		return "/wages-report";
	}

	@RequestMapping(value = "/payslipreports")
	public String getPaySlipReports(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		List<IncomeCentres> incomeCenterListSession = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterListSession", incomeCenterListSession);

		String payslipReportDate = (String) (session.getAttribute("payslipReportDate") != null ? session.getAttribute("payslipReportDate") : simpleDateFormat.format(new Date()));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center") != null ? session.getAttribute("income-center") : incomeCenterListSession.get(0).getIncomeCentreId());

		if (request.getParameter("incomeCenterId") != null) {
			try {
				incomeCenterId = Integer.parseInt(request.getParameter("incomeCenterId"));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		if (request.getParameter("payslipReportDate") != null) {
			payslipReportDate = request.getParameter("payslipReportDate");
		}

		if (incomeCenterId != null && incomeCenterId > 0) {
			Date transDate = null;
			if (payslipReportDate != null)
				transDate = BusinessBudgeterUtil.convertStringToDateForTran(payslipReportDate);
			else
				transDate = new Date();

			List<ProfitAndLossReport> paySlipData = reportService.getWagesReport(incomeCenterId, transDate);
			model.put("paySlipData", paySlipData);
			model.put("paySlipDataSize", paySlipData.size());
			SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
			if (paySlipData != null && paySlipData.size() > 0) {
				Date weekDate = paySlipData.get(0).getWages().get(6).getRosterDate();

				String weekEnding = dateFormatter.format(weekDate);
				session.setAttribute("weekEnding", weekEnding);
			}
			Date payDate = new Date();
			String paymentDate = dateFormatter.format(payDate);
			session.setAttribute("paymentDate", paymentDate);

		}
		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);

		session.setAttribute("payslipReportDate", payslipReportDate);
		session.setAttribute("income-center", incomeCenterId);

		return "/payslip-report";
	}

	@RequestMapping(value = "/profitlossreports")
	public String getProfitLossReports(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		List<IncomeCentres> incomeCenterListSession = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterListSession", incomeCenterListSession);

		String profitLossReportDate = (String) (session.getAttribute("profitLossReportDate") != null ? session.getAttribute("profitLossReportDate") : simpleDateFormat.format(new Date()));
		Integer incomeCenterId = (Integer) (session.getAttribute("income-center") != null ? session.getAttribute("income-center") : incomeCenterListSession.get(0).getIncomeCentreId());

		if (request.getParameter("incomeCenterId") != null) {
			try {
				incomeCenterId = Integer.parseInt(request.getParameter("incomeCenterId"));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		if (request.getParameter("profitLossReportDate") != null) {
			profitLossReportDate = request.getParameter("profitLossReportDate");
		}

		if (incomeCenterId != null && incomeCenterId > 0) {
			Date transDate = null;
			if (profitLossReportDate != null)
				transDate = BusinessBudgeterUtil.convertStringToDateForTran(profitLossReportDate);
			else
				transDate = new Date();

			List<ProfitAndLossReport> wagesData = reportService.getWagesReport(incomeCenterId, transDate);
			model.put("wagesData", wagesData);

			List<ProfitLossReportAll> reportData = reportService.getReportData(incomeCenterId, transDate);
			model.put("reportData", reportData);

		}

		logger.info("ReportController.getProfitLossReports() incomeCenterId = " + incomeCenterId);
		logger.info("ReportController.getProfitLossReports() Date = " + profitLossReportDate);

		session.setAttribute("profitLossReportDate", profitLossReportDate);
		session.setAttribute("income-center", incomeCenterId);

		List<IncomeCentres> incomeCenterList = cashDrawerService.getIncomeCenterList();
		model.put("incomeCenterList", incomeCenterList);

		return "/profit-loss-report";
	}

}
