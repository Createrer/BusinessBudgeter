<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(function(){
		$("#all_event_setting tr:nth-child(odd)").css("background", "#ffffff");
		$("#all_event_setting tr:nth-child(even)").css("background", "#f8f8f8");
		$(".AddStaffTable tr:nth-child(odd)").css("background", "#ffffff");
		$(".AddStaffTable tr:nth-child(even)").css("background", "#f8f8f8");		
	});
</script>
<script type="text/javascript">
		
</script>

<div id="all-events-list-details-result" > 
   <form method="post" id="all_events_List" name="all_events_List">	
	<div id="all_event_setting" class="percentDiv">
	<div class="table-responsive"> 
		   <table id="ServiceEevnt" class="table table-bordered" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
		       <tbody>
                  <tr>
                  	<th class="thclass">
						<input type="checkbox" name="selectallEventList" id="selectallEventList" value="" onclick="selectAllEvent()">
					</th>
                    <th class="thclass">Event Name</th>
			        <th class="thclass">Event Date</th>
			        <th class="thclass">Toatal Actual</th>
			        <th class="thclass">Labour Cost</th>
			        <th class="thclass">Event Hours</th>
                  </tr>
		 		<c:forEach items="${roster_event_List}" var="roster_event" varStatus="loop">
			 		<tr>
			 			<td style="text-align: center;">
			 				<input type="hidden" id="roster_event_id" name="roster_event_id" value="${roster_event.rosterEventId }">
		 			   		<input type="checkbox" name="check${loop.index}" id="check${loop.index}" value ="${roster_event.rosterEventId}" onchange="makeDirty(document.all_events_List.isDirty${loop.index})" >
			 			</td>			 			 
			 			<td style="text-align: center;">
			 				<input type="hidden" name="event_id" id="event_id" value="${roster_event.eventId}">
			 				<a href="javaScript:void(0);" onclick="editSettingEvent(${roster_event.eventId})" data-toggle="modal" data-target="#event-add-popup" >${roster_event.eventName}</a></td>			
			 			<td style="text-align: center;">${roster_event.rosterEventDate}</td>
			 			<td style="text-align: center;">${roster_event.totalActual}</td>
			 			<td style="text-align: center;">${roster_event.labourCostPct}</td>
			 			<td style="text-align: center;">${roster_event.noOfHours}</td>
			 		</tr>
				</c:forEach> 	
		</tbody> 		
	</table>
	</div>
	</div>
</form>
</div>