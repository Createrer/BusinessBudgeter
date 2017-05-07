<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"/>

<%@include file="common/resources.jsp" %>
</head>
<body>
	 <div id="shift" class="accordion-manual-content" style="display:block">
							
						 <c:forEach var="staffRosterMap" items="${staffRosterMapList}" varStatus="staffRosterMapListloop">
							
								   <%-- Value is ${staffRoster.value} --%>
									   <div class="percentDiv">
										<div class="Addstaff">
										
										<SPAN STYLE="font-size: 10pt;font-weight: bold;"> Date : ${transactionDateList[staffRosterMapListloop.index] }</SPAN>
										<table class="" width="100%" border="0" cellspacing="0" cellpadding="5">
											<thead>
											 <tr>
												<th class="thclass"> Staff Name</th>
												<th class="thclass">Start Time</th>
												<th class="thclass">Finish Time </th>
												<th class="thclass">Total Hours</th>
												<th class="thclass">Service/Event</th>
												 
											 </tr>
										  </thead>
										  <c:forEach var="staffRoster" items="${staffRosterMap}" varStatus="loopOne">
												<input type="hidden" name="indexOne" value="${loopOne.index}" />
											<c:forEach items="${staffRoster.value}" var="shift" varStatus="loopTwo">
												<%-- <c:if test="${loopTwo.index == 0}">
													
												</c:if> --%>
											  <tr>
												<td align="center" width="15%">
													<input type="hidden" name="indexTwo" value="${loopTwo.index}" />
													<c:if test="${loopTwo.index == 0}">
														<div style="">
															<b> ${shift.staff.satffName} </b>
														</div>
														
													</c:if>
													<input type="hidden" class="satffRosterId" staffId="${shift.staff.staffId}" name="rosterId${loopOne.index}" id="rosterId${loopOne.index}" value="${shift.satffRosterId}"/>
												</td>
												<td align="center" width="20%">
													 ${shift.startTime}
												</td>
												<td align="center" width="20%">
													 ${shift.finishTime}
												</td>
												<td align="center" width="20%">
													${shift.totalHours}
												</td>
												
												<td valign="top" align="center" width="30%" rowspan="${fn:length(staffRoster.value)}">
												 <c:if test="${loopTwo.index == 0}">
													 <table>
														<c:choose>	
															<c:when test="${empty shift.staffRostersServices}">
																<!-- No services allocated -->
															</c:when>
															<c:otherwise>
																<c:forEach items="${shift.staffRostersServices}" var="staffRostersService">
																	<tr>
																		<td>${staffRostersService.services.serviceName} : </td>
																		<td> ${staffRostersService.noOfHours} </td>
																	</tr>
																</c:forEach>	
															</c:otherwise>
														</c:choose>
														
														<c:choose>	
															<c:when test="${empty shift.staffRostersEvents}">
																<!-- No events allocated -->
															</c:when>
															<c:otherwise>
																<c:forEach items="${shift.staffRostersEvents}" var="staffRostersEvent">
																	<tr>
																		<td>  ${staffRostersEvent.events.eventName} :  </td>
																		<td>   ${staffRostersEvent.noOfHours} </td>
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
														</table>
													</c:if>
												</td>
											  </tr>
											</c:forEach>
									</c:forEach>
										 </table> 
									</div> 
								</div> 
								</c:forEach>
							</div>
</body>
</html>