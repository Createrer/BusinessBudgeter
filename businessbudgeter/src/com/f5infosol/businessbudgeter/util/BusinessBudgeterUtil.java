package com.f5infosol.businessbudgeter.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class BusinessBudgeterUtil {
	protected final static Log logger = LogFactory.getLog(BusinessBudgeterUtil.class);

	public static Date convertStringToDate(String dateString) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date date = null;

		try {
			if (dateString != null && !dateString.equals("")) {
				logger.info(dateString);
				date = formatter.parse(dateString);
				logger.info(date);
			} else {
				date = null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return date;

	}

	public static Date convertStringToDateForTran(String dateString) {

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date date = null;

		try {
			if (dateString != null && !dateString.equals("")) {
				logger.info(dateString);
				date = formatter.parse(dateString);
				logger.info(date);
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return date;

	}

	public static String convertDateToString(Date dateString) {

		if (dateString != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			String date = null;
			try {

				date = formatter.format(dateString);
				return date;

			} catch (Exception e) {
				e.printStackTrace();
				return date;

			}
		}

		return null;

	}

}
