package com.f5infosol.businessbudgeter.beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.f5infosol.businessbudgeter.domain.IncomeCentres;
import com.f5infosol.businessbudgeter.domain.Services;

public class MasterData {

	public static List<IncomeCentres> incomeCenterList = new ArrayList<IncomeCentres>();
	public static Map<Integer, List<Services>> incomeCenterSeviceListMap = new HashMap<Integer, List<Services>>();
	public static List<Services> serviceList = new ArrayList<Services>();

	public static List<Services> getService(Integer incomeCenterId) {
		if (incomeCenterSeviceListMap.containsKey(incomeCenterId))
			return incomeCenterSeviceListMap.get(incomeCenterId);
		else
			return null;
	}

	public static void putService(Integer incomeCenterId, List<Services> seviceList) {
		incomeCenterSeviceListMap.put(incomeCenterId, serviceList);
	}

	public static Services getServiceByServiceId(Integer serviceId) {
		for (Services services : serviceList) {
			if (services.getServiceId().intValue() == serviceId.intValue())
				return services;
		}
		return null;
	}

}
