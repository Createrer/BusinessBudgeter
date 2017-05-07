<!DOCTYPE html>
<html>
<head> 
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/resources.jsp" %>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"/>
<link rel="stylesheet" type="text/css" href="timepicker/jquery.timepicker.css" />
<link rel="stylesheet" id="themeCSS" href="js/jqrangeslider/css/classic.css"> 
<link type="text/css" href="bootstrap/Fonts/glyphicons/css/glyphicons.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/Fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/css/Fonts/themify-icons/themify-icons.css" rel="stylesheet"><!-- Themify Icons -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="timepicker/jquery.timepicker.js"></script>
<script type="text/javascript" src="timepicker/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="timepicker/moment.js"></script>
<script type="text/javascript" src="timepicker/moment.min.js"></script>

<script type="text/javascript" src="js/jqrangeslider/jQAllRangeSliders-min.js"></script>

<script type="text/javascript" src="js/shortcut.js"></script>
<script type="text/javascript" src="js/roster.js"></script>

<script src="js/autoNumeric.js"></script>


<script>
shortcut.add("ctrl+alt+n", function() {
	addRosterShiftOnShortCutKey();
});
</script>


<script type="text/javascript">

	 $(document).ready(function() {
	 	$(':input').click(function() {
	        $(this).select();
	    });
	    
	    $(".staffRosterServiceId,.input").autoNumeric();
	    
		$('#incomeCenterId').val("${selctedIncomeCenterId}");
		$('#workofhouse').val("${workofhouse}");
	});
	
	$(function(){
        $(".staffRosterServiceId,.input").on('blur', function(){
            if(this.value != null && this.value.match(/^\d{1,3}(,?\d{3})*?(.\d*)?$/)){
                 this.value=this.value.replace(/,/g, "");
               }
        });
    });
</script> 

</head>

<body  onpageshow="if (event.persisted) noBack();" onunload="">
 
 	<%@include file="leftNavigation.jsp" %>
	<%@include file="common/header.jsp" %>
	
 
	
	
	
	<!-- <div id="roster-event-popup"></div> -->
	<div id="send-staff-nofifiction-popup"></div>
		
		<div class="wrapper" style="width:93%;">
		<div class="mainwrapper">
			<div class="container">
			<div class="col-md-12">
			<div class="AddIcon" style="float:left">
	                    	 <div class="Listoptions">
	                    	 <ul class="btn-menu-hover">
	                    	 <li><button class="btn btn-success" style="width:40px; height:40px; font-size:24px; padding:3px 0 0 1px "><i class="fa fa-th-list"></i></button>
	                    	<!-- <img  src="images/popup-icon.png"> -->
									<ul id="nav" class="btn-menu">
										<li><a href="javascript:void(0)" onclick="saveAsTemplate()" data-target="#exampleModal" data-toggle="modal" ><label class=" " >Save As Template</label></a></li>
										<li class="sub-menu-nav"><a href="javascript:void(0)"><label class=" ">Use Template</label></a>
											<ul>
												<c:forEach items="${templateList}" var="template">
													<li><a href="javascript:void(0)" onclick="useTemplate(${template.templateId})"><label class=" ">${template.templateName} ${template.rosterDate}</label> </a></li>
												</c:forEach>
											</ul>
										</li>
										<li><a href="javascript:void(0)" onclick="usePreviousRoster()" data-target="#exampleModal" data-toggle="modal"><label class=" ">Use Previous Roster</label></a></li>
										<li><a href="javascript:void(0) " onclick="printRoster()" data-target="#exampleModal" data-toggle="modal"><label class=" ">Print</label></a></li>
										<li><a href="javascript:void(0)" onclick="sendStaffNotification();" data-target="#exampleModal" data-toggle="modal"><label class=" ">Staff Notification</label></a></li>
									</ul>
								</li>
								</ul>
                    		 </div>
	                    	 </div>
			</div><!-- col-md-12 -->
				<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-3">
							<div class="form-group">
								<label style="font-size:10pt; margin-right:10px; font-weight: bold; color: #769513; float:left">Income Centers:</label>
								<div class="input-group">							
									<select class="form-control" style="width: 159px; margin:-3px 0 0 0" class="input-serch" name="incomeCenterId" id="incomeCenterId" onchange="handleChangeInputsRoster()">
								<c:if test="${!empty incomeCenterList}">
									<c:forEach items="${incomeCenterList}" var="income">
										<option value="${income.incomeCentreId}" >${income.icName}</option>
									</c:forEach>
								</c:if>	
								</select>
								</div>
								</div>
						</div><!-- col-md-3 -->
						
						<div class="col-md-3">
						<div class="form-group">
	                    			<label style="font-size:10pt; margin-right:10px; font-weight: bold; color: #769513;"> ${roster_Date}: </label>
	                    		<div class="input-group">	    
								<span style="float:left; padding:5px 10px 0 0"><a href="javascript:void(0)"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevDate"></a></span>
								<span style="float:left"><input type="text" size="10" class="myDate form-control" name= rosterDate id="rosterDate" value = ${ transactionRosterDate }  onchange="handleChangeInputsRoster()" ></span>
								<span style="float:left; padding:5px 0 0 10px"><a href="javascript:void(0)"><img width="17" height="18" src="images/next.png" class="nextDate" id="nextDate"></a></span>
								</div>
							</div>		 
	                    </div><!-- col-md-3 -->
	                    
	                    <div class="col-md-2">
						<div class="form-group">
	                    		<label style="font-size:10pt; margin-right:10px; font-weight: bold; color: #769513;"> Work Of House: </label>
	                    		<div class="input-group">	    
								<select  class="input-serch form-control" name="workofhouse" class="work_of_house" id="workofhouse" onchange="handleChangeInputsRoster()" onchange="isSelect(this.val)">
									<option value="All" >All</option>
									<option value="foh" >FOH</option>
									<option value="boh" >BOH</option>
								</select>
								</div>
							</div>		 
	                    </div><!-- col-md-3 -->
	                    
	                    <div class="col-md-2">
						<div class="form-group">
	                    		<label style="font-size:10pt; margin-right:10px; font-weight: bold; color: #769513;"> Public holiday :</label>
	                    		<div class="input-group">	    
								<c:choose>
										<c:when test="${publicHoliday.holidayDate !=  transactionRosterDate}">
											<input type="checkbox" name="isPublicHoliday" id="isPublicHoliday" onclick="setHoliday()" checked="checked"> 	
										</c:when>
										<c:otherwise>
											<input type="checkbox" name="isPublicHoliday" id="isPublicHoliday" onclick="setHoliday()"> 
										</c:otherwise>
								</c:choose>
								</div>
							</div>		 
	                    </div><!-- col-md-2 -->
	                    
	                    <div class="col-md-2" style="float:left">
	                    	<button class="button"  title="New Roster Shift (Ctrl+Alt+N)" data-toggle="modal" onclick="addRosterShift()" data-target="#exampleModal" >Add Staff</button>
	                    </div><!-- col-md-2 -->
	                    
	                    
						
					</div>
				</div>
				</div><!-- col-md-12 -->
				
				
				<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body table-responsive">
	                    <table width="100%" class="table" bgcolor="#98bf21">
								<tr>
									<c:forEach items="${budgetSettings}" var="budgetSetting">
										<c:choose>
											<c:when test="${budgetSetting.budgetType eq 1}">
												<c:set var="dailyCost"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${budgetSetting.turnover/7}" /></c:set>
												<td align="center">Weekly Cost  <input type="text" readonly size="6" value="${budgetSetting.turnover}" /> </td>
												<td align="center">Daily Cost   <input type="text" readonly size="6" value="${dailyCost}" /></td>
												<td colspan="2"></td>
											</c:when>
											<c:when test="${budgetSetting.budgetType eq 2}">
												<c:set var="dailyCost"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${budgetSetting.turnover/7}" /></c:set>
												<td align="left"><div class="form-group"><label style="font-size:10pt; font-weight: bold; color: #769513;">Weekly Cost</label>  <div class="input-group"><input type="text" class="form-control" readonly size="6" value="${budgetSetting.turnover}" /></div></div> </td>
												<td align="left"><div class="form-group"><label style="font-size:10pt; font-weight: bold; color: #769513;">Daily Cost</label>   <div class="input-group"><input type="text" readonly size="6" class="form-control" value="${dailyCost}" /></div></div></td>
												<td align="left"><div class="form-group"><label style="font-size:10pt; font-weight: bold; color: #769513;">Breakfast Cost %</label> <div class="input-group"><input type="text" readonly size="6" class="form-control" value="${budgetSetting.breakFastCost}"></div></div> </td>
												<td align="left"><div class="form-group"><label style="font-size:10pt; font-weight: bold; color: #769513;">Lunch Cost %</label> <div class="input-group"><input type="text" readonly size="6" class="form-control" value="${budgetSetting.lunchCost}"></div></div> </td>
												<td align="left"><div class="form-group"><label style="font-size:10pt; font-weight: bold; color: #769513;">Dinner Cost %</label> <div class="input-group"><input type="text" readonly size="6" class="form-control" value="${budgetSetting.dinnerCost}" ></div></div> </td>
											</c:when>	
											<c:otherwise>
												<td align="left"><div class="form-group"><label style="font-size:10pt; margin-right:10px; font-weight: bold; color: #769513;">Weekly Cost</label><div class="input-group"><input type="text" readonly size="6" class="form-control"></div></div></td>
												<td align="center"><div class="form-group"><label style="font-size:10pt; font-weight: bold; color: #769513;">Daily Cost</label> <div class="input-group"><input type="text" class="form-control" readonly size="6"></div></div></td>
												<td align="center"><div class="form-group"><label style="font-size:10pt; font-weight: bold; color: #769513;">Breakfast Cost % </label> <div class="input-group"><input type="text" readonly size="6"></div></div> </td>
												<td align="center"><div class="form-group"><label style="font-size:10pt; font-weight: bold; color: #769513;">Lunch Cost %</label> <div class="input-group"><input type="text" readonly size="6" class="form-control"></div></div> </td>
												<td align="center"><div class="form-group"><label style="font-size:10pt; font-weight: bold; color: #769513;">Lunch Cost %</label><div class="input-group"></div>Dinner Cost % <input type="text" readonly size="6" class="form-control"></div></div> </td>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</tr>
							</table>
	                    </div>
				</div>
				</div>
				
	                    		
								
			</div><!--- container -->
		   
		   <div class="container">
		   <div class="col-md-12">
		   <div id="tabs">
			  <ul>
			    <li><a href="#tabs-1" id="timelineTab" >TimeLine</a></li>
			    <li><a href="#tabs-2" id="shiftTab">Shift</a></li>
			    
			  </ul>
			  <div id="tabs-1">
			    <div class="img_box" style="width:100%; height:auto;">
	        	<div class="img_box_strip" style=" height:28px; width:100%;">
	            </div>
	            
	            <div>
	            	<table style="width: 100%">
	            	<c:forEach var="staffRoster" items="${staffRosterMap}" varStatus="loopOne">
		            	<c:forEach items="${staffRoster.value}" var="shift" varStatus="loopTwo">
						  <tr>
							<td>
								<input type="hidden" name="indexTwo" value="${loopTwo.index}" />
								<c:if test="${loopTwo.index == 0}">
									<div style="float: left; margin-left: 5px; margin-top: 5px; margin-right: 6px;">
										<a href="javascript:void(0)" onclick="editShift(${shift.satffRosterId})" data-toggle="modal" data-target="#exampleModal" > <b style="cursor: pointer;" title="edit shift"> ${shift.staff.satffName} </b> </a>
									</div>
								</c:if>
							</td>
						  </tr>
						  
						  <tr>
						  	<td width="97%">
						  		<div style="margin-left: 15px;">
						  			 Shift ${loopTwo.index+1} : &nbsp;&nbsp;  <span id="timelineStart${shift.satffRosterId}">${shift.startTime}</span> - <span id="timelineEnd${shift.satffRosterId}">${shift.finishTime}</span><br><br> 
						  		</div>
						  		<div id='slider${shift.satffRosterId}'>
							  		<div class="AddIcon" >
										 <div class="Listoptions">
											<ul class="dropdown dropdown-horizontal" style="margin: -3px 30px;" >
												<li class="dropdown-vertical-rtl dir"> <!-- <img  src="images/popup-icon.png"> --><button class="btn btn-success" style="width:28px; height:28px; font-size:14px; padding:0px; margin-top:-6px "><i class="fa fa-th-list"></i></button>
													<ul style="margin-right: -60px;">
														<li><a onclick=" allocateRosterShift(${shift.satffRosterId},${shift.staff.staffId}, '${shift.staff.satffName}');" href="javascript:void(0)" data-target="#exampleModal" data-toggle="modal"><label class=" ">Add Shift</label></a></li>
														<li><a onclick=" allocateService(${shift.satffRosterId},${shift.staff.staffId}, '${shift.staff.satffName}');" href="javascript:void(0)" data-target="#exampleModal" data-toggle="modal"><label class=" ">Add Service</label></a></li>
													</ul>
												</li>
											</ul> 
										 </div>
									</div>
						  		</div>
						  		<script type="text/javascript">
							  		var startTimeString = "${shift.startTime}";
					  				var endTimeString = "${shift.finishTime}";
					  				var satffRosterId = "${shift.satffRosterId}";
					  				
						  			createTimeLineForStaff(startTimeString, endTimeString, satffRosterId);
						  		</script>
						  	</td>
						  	<td width="3%"></td>
						  </tr>
						</c:forEach>
					</c:forEach>
					</table>
	            </div>
	          </div> 
			  </div>
			  
			  <div id="tabs-2">
			    	<div style=" height:28px; width:100%;" class="img_box_strip"></div>
						       <div id="shift" class="accordion-manual-content" >
							<c:forEach var="staffRoster" items="${staffRosterMap}" varStatus="loopOne">
								<input type="hidden" name="indexOne" value="${loopOne.index}" />
								   <%-- Value is ${staffRoster.value} --%>
									   <div class="percentDiv">
										<div class="Addstaff">
										<table class="table table-bordered">
											<c:forEach items="${staffRoster.value}" var="shift" varStatus="loopTwo">
												<c:if test="${loopTwo.index == 0}">
													<thead>
													 <tr>
														<th class="thclass"></th>
														<th class="thclass">Start Time</th>
														<th class="thclass">Finish Time </th>
														<th class="thclass">Total Hours</th>
														 <th class="thclass"></th>
														<th class="thclass">Service/Event</th>
														 <th colspan="5" valign="middle" class="thclassShift" style="padding:2px 5px 0 5px">

														 <div class="AddIcon">
														 <div class="Listoptions">
														<ul id="nav" class="dropdown dropdown-horizontal">
															<li class="dropdown-vertical-rtl dir"> <!-- <img  src="images/popup-icon.png"> --><button class="btn btn-success" style="width:28px; height:28px; font-size:14px; padding:0px;"><i class="fa fa-th-list"></i></button>
																<ul>
																	<li><a onclick=" allocateRosterShift(${shift.satffRosterId},${shift.staff.staffId}, '${shift.staff.satffName}'); " href="javascript:void(0)" data-target="#exampleModal" data-toggle="modal"><label class=" ">Add Shift</label></a></li>
																	<li><a onclick=" allocateService(${shift.satffRosterId},${shift.staff.staffId}, '${shift.staff.satffName}');" href="javascript:void(0)" data-target="#exampleModal" data-toggle="modal"><label class=" ">Add Service</label></a></li>
																	<%-- <li><a onclick=" allocateEvent(${shift.satffRosterId},${shift.staff.staffId}, '${shift.staff.satffName}');" href="javascript:void(0)"><label class=" ">Add Event</label></a></li> --%>
																</ul>
															</li>
														</ul> 
															<%-- <input type="hidden" id="i" name="i" value="${rosterShift}"/>      
															<input type="hidden" id="j" name="j" value="${rosterDetailsSize}"/>  --%>          			
														 </div>
														 </div>
														 </th>
													 </tr>
												  </thead>
												</c:if>
											  <tr>
												<td align="left" width="10%">
													<input type="hidden" name="indexTwo" value="${loopTwo.index}" />
													<c:if test="${loopTwo.index == 0}">
														<div style="float: left; margin-left: 5px; margin-right: 6px;">
															<a href="javascript:void(0)" onclick="editShift(${shift.satffRosterId})" data-toggle="modal" data-target="#exampleModal"> <b style="cursor: pointer;" title="edit shift"> ${shift.staff.satffName} </b> </a>
														</div>
														<div>
															<img src="images/delete.png"  value="image"  id="deleteStaff" title="remove staff" onclick="removeStaffOrShift('removeStaff',${shift.satffRosterId}, ${shift.staff.staffId}, ${shift.incomeCenterId})" style="cursor:pointer;" /> 
														</div>
													</c:if>
													<input type="hidden" class="satffRosterId" staffId="${shift.staff.staffId}" name="rosterId${loopOne.index}" id="rosterId${loopOne.index}" value="${shift.satffRosterId}"/>
												</td>
												<td align="center" width="20%">
													<input type="text"  satffRosterId="${shift.satffRosterId}" indexOne="${loopOne.index}" indexTwo="${loopTwo.index}" class="startTime form-control" size="7" style="left:60;" id="startTime${shift.satffRosterId}" name="startTime${shift.satffRosterId}" value="${shift.startTime}" onchange="validateStartFinishTime(${shift.satffRosterId})" onkeypress="javascript:return isTimeNumber(event)" />
													<%-- <a href="javascript:void(0);" title="remove shift" onclick="removeStaffOrShift('removeShift', ${shift.satffRosterId},  ${shift.staff.staffId},  ${shift.incomeCenterId})" > Remove Shift </a> --%>
												</td>
												<td align="center" width="20%">
													<input type="text" satffRosterId="${shift.satffRosterId}" indexOne="${loopOne.index}" indexTwo="${loopTwo.index}" class="finishTime form-control" size="7" style="left:60;"  id="finishTime${shift.satffRosterId}" name="finishTime${shift.satffRosterId}" value="${shift.finishTime}" onchange="validateStartFinishTime(${shift.satffRosterId})" onkeypress="javascript:return isTimeNumber(event)" />
												</td>
												<td align="center" width="20%">
													<input type="text" indexOne="${loopOne.index}" indexTwo="${loopTwo.index}" class="input form-control totalHours" size="9" style="left:20;"   readonly="readonly"  tabindex="-1" id="totalHours${shift.satffRosterId}" name="totalHours${shift.satffRosterId}" value="${shift.totalHours}" />
												</td>
												<td align="left" width="10%">
													<div>
														<img id="deleteShift" style="cursor:pointer; padding: 0 0 0 45px" onclick="removeStaffOrShift('removeShift', ${shift.satffRosterId},  ${shift.staff.staffId},  ${shift.incomeCenterId})" title="remove shift" href="javascript:void(0);" value="image" src="images/remove.png">
													</div>
												</td>
												<td valign="top" align="left" width="30%" rowspan="${fn:length(staffRoster.value)}">
												 <c:if test="${loopTwo.index == 0}">
													 <table>
														<c:choose>	
															<c:when test="${empty shift.staffRostersServices}">
																<!-- No services allocated -->
															</c:when>
															<c:otherwise>
																<c:forEach items="${shift.staffRostersServices}" var="staffRostersService">
																	<tr>
																		<td>${staffRostersService.services.serviceName}</td>
																		<td> <input class="staffRosterServiceId" staffRosterServiceId="${staffRostersService.staffRosterServiceId}" name="serviceToUpdate-${staffRostersService.staffRosterServiceId}" type="text" value="${staffRostersService.noOfHours}" size="7" style="left:20;"  onkeypress="javascript:return isNumber (event)" data-v-max="23.59" data-m-dec="2"/> </td>
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
																		<td> ${staffRostersEvent.events.eventName} </td>
																		<td> <input class="staffRosterEventId" satffRosterEventId="${staffRostersEvent.satffRosterEventId}" name="eventToUpdate-${staffRostersEvent.satffRosterEventId}" type="text" value="${staffRostersEvent.noOfHours}" /> </td>
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
														</table>
													</c:if>
												</td>
											  </tr>
											</c:forEach>
										 </table> 
									</div> 
								</div> 
								</c:forEach>
							</div>
			  </div>
			  
			</div>
			</div><!-- col-md-12 -->
	        </div><!-- container -->
			
			<div class="container" style="margin-top:30px">
			<div class="col-md-12">
			<div id="timeline" class="accordion-manual-content" style="display:block">

	       
		        <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon_service.png" width="24" height="24" /></td>
						      <td width="83%">Services/Events</td>
					        </tr>
					      </table>
						</div>
				        <div id="services" class="accordion-manual-content" style="display:block">
				        	<div class="percentDiv"> 
					                <div class="ServiceEventContainer table-responsive">
					                	    <table class="table table-bordered">
					                    		<thead>
					                      <tr>
					                        <th class="thclass">Services</th>
									        <th class="thclass">Revenue Projection </th>
									        <th class="thclass">Labour cost %</th>
					                      </tr>
										  </thead>
					                      <c:forEach items="${seviceList}" var="service" varStatus="loop">
									      <tbody>
										  <tr>
					                        <td><input type="hidden" value="${service.serviceId }" class="input form-control"  style="width:80%; font-weight:normal">${service.serviceName }</td>
					                        <td align="center"><input type="text" class="input form-control" style="width:80%; font-weight:normal" value="${service.revenueProjection }" onkeypress="javascript:return isNumber(event)" data-v-max="9999999.99" data-m-dec="2" /></td>
					                        <td align="center"><input type="text" class="input form-control" style="width:80%; font-weight:normal" value="${service.labourCostPct }" onkeypress="javascript:return isNumber(event)" data-v-max="9999999.99" data-m-dec="2"/></td>
					                      </tr>
									     </c:forEach>
					                      </tbody>
					                    	</table>
					                    <div style="clear: both;"></div>
					                    
					                    <table id="ServiceEevnt" width="100%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
					                    <tbody>
					                      <c:forEach items="${rosterEventList}" var="roster" varStatus="loop">
									      <tr>
					                        <td><input type="hidden" value="${roster.rosterEventId }" class="input">${roster.eventName }</td>
					                        <td align="center"><input type="text" class="input" value="${roster.totalActual }" /></td>
					                        <td align="center"><input type="text" class="input" value="${roster.labourCostPct }" /></td>
					                      </tr>
									     </c:forEach>
					                     </tbody>
					                    </table> 
					                    <div style="clear: both;"></div>
					                 </div>
						              <!--   <div class="AddIcon" style="vertical-align: bottom;"><img title="Add Events" src="images/plus.png" onClick="addRosterEvent();" style="cursor:pointer"/></div> -->
						        </div> 
				       		</div>
				       </div>
	                	<input type="hidden" name="mapListSize" id="mapListSize" value="${staffRosterMapSize}" />
		        	
		        	</div>
		        	</div><!-- col-md-12 -->
		        	</div><!-- container -->
			</div>
			<!-- <div class="clear"></div> -->
			<footer class="footer">
				<!-- <div class="wrapper" style="background:none">
				</div> -->
			</footer>
	</div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"></div>
	
	
</body>
</html>

 