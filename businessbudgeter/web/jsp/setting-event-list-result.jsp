
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(function(){
		$("#ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
		$("#ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
		$(".AddStaffTable tr:nth-child(odd)").css("background", "#ffffff");
		$(".AddStaffTable tr:nth-child(even)").css("background", "#f8f8f8");
		
	});
</script>
<script type="text/javascript">
		
</script>

<div id="event-list-details-result" > 
   <form method="post" id="eventList" name="eventList">	
	<div id="event_setting" class="percentDiv">
	<div class="table-responsive">
		   <table id="ServiceEevnt" class="table table-bordered" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
		       <tbody>
                  <tr>
                  	<th class="thclass">
						<input type="checkbox" name="selectallEvent" id="selectallEvent" value="" onclick="selectAllEvent()">
					</th>
                  	<!-- <th class="thclass">Edit</th>
			        <th class="thclass">Event Id </th> -->
			        <th class="thclass">Event Name</th>
			        <th class="thclass">Labour Cost Percent</th>
                  </tr>
		 		<c:forEach items="${event_List}" var="event" varStatus="loop">
			 		<tr>
			 			<td style="text-align: center;">
			 				<input type="checkbox" name="check${loop.index}" id="check${loop.index}" value="${event.eventId }" onchange="makeDirty(document.eventList.isDirty${loop.index})" />
			 			</td>
			 			<!-- <td style="text-align: center;">
			 				<a href= "javaScript:void(0);" onclick="editSettingEvent(${event.eventId })" >edit</a>
			 			</td>  
			 			<td style="text-align: center;"><a href= "javaScript:void(0);" onclick="viewSettingEvent(${event.eventId})" >${event.eventId }</a></td> -->
			 			<td style="text-align: center;"><a href= "javaScript:void(0);" onclick="editSettingEvent(${event.eventId })" data-toggle="modal" data-target="#event-add-popup" >${event.eventName }</a></td>			
			 			<td style="text-align: center;">${event.labourCostPct }</td>
			 		</tr>
				</c:forEach>	
		</tbody> 		
	</table>
	</div> 
	</div>
</form>
</div>