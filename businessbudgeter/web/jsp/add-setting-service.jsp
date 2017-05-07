<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@include file="common/resources.jsp" %> --%>

<script type="text/javascript" src="timepicker/jquery.timepicker.js"></script>
 <script type="text/javascript" src="timepicker/jquery.timepicker.min.js"></script>
 <link rel="stylesheet" type="text/css" href="timepicker/jquery.timepicker.css" />
 <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />

<script src="js/jquery/jquery-ui.min1.8.js" type="text/javascript"></script>
 
<script type="text/javascript">
  $(function() {    

	  $('#endTime').timepicker({timeFormat:  'H:i'}); //timeFormat: 'hh:mm:ss tt z'
	  $('#startTime').timepicker({timeFormat: 'H:i'});
	  
	  var startDate = $('#startDate').val();
	 	var endDate = $('#endDate').val();
		
		$( "#startDate" ).datepicker();
		$( "#startDate" ).datepicker( "option", "dateFormat", "dd/mm/yy");
 		$('#startDate').datepicker("setDate",startDate);
 		$( "#endDate" ).datepicker();
		$( "#endDate" ).datepicker( "option", "dateFormat", "dd/mm/yy");
 		$('#endDate').datepicker("setDate",endDate);
	  
  }); 
 
</script>
 <script type="text/javascript">
$(document).ready(function(){
			 $(":checkbox").change(function(e){
			  $(this).val( $(":checked").length > 0 ? "true" : "false");
			});
		});
</script> 
<div id=""> 
   <form method="post" id="add_setting_service" name="add_setting_service">
	<table>
		<tr>
			<td><input type="hidden" name="serviceid" id="serviceid" value="${service.serviceId }">
			Service Name*:</td>
			<td>
				<input type="text"  name="servicename" id="servicename" value="${service.serviceName }">
			</td>
			<td style="width: 20px; "> </td>	
			<td>
				Income Center* :
			</td>
			<td>
					<select name="incomeCenterId" id="incomeCenterId">
						<option value=" "></option>
						<c:if test="${!empty incomeCenterList}">
				        <c:forEach items="${incomeCenterList}" var="incomeCenter">
							<option value="${incomeCenter.incomeCentreId}" ${incomeCenter.incomeCentreId == service.incomeCentreId  ? 'selected' : ''} >${incomeCenter.icName}</option>
						</c:forEach>
						</c:if>	
					</select> 
			</td>	 
		</tr>
		
		<tr>
			<td> </br>Description* :</td>
			<td> </br>
				<textarea rows="3" cols="20" name="description" id="description">${service.description }</textarea>
			</td>
			<td style="width: 20px; "> </td>
			<td></br>Recurrence*:</td>
			<td></br>
			
			<c:choose>
						<c:when test="${service.recurrence  == 'true'}">
							<input type="checkbox" name="recurrence" id="recurrence" checked="checked" value="${service.recurrence }">	
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="recurrence" id="recurrence" value="${service.recurrence }">	
						</c:otherwise>
					</c:choose>
				
			</td>		 	
		 	
		</tr>
		<tr>
			<td> </br>Start Time*:</td>
			<td></br>
				<input type="text" name="startTime" id="startTime" size="7" value="${service.startTime }">
			</td>
			<td style="width: 20px; "> </td>
			<td> </br>End Time*:</td>
			<td></br>
				<input type="text" name="endTime" id="endTime" size="7" value="${service.endTime }">
			</td>	 	
		 	
		</tr>
		<tr>
			<td> </br>Start Date*:</td>
			<td></br>
				<input type="text" name="startDate" id="startDate" size="9"  value="${service.startDate	 }">
			</td>
			<td style="width: 20px; "> </td>
			<td></br>Labour Cost*:</td>
			<td></br>
				<input type="text" name="labourCost" id="labourCost" size="7" value="${service.labourCostPct }"> 
			</td>
			<%-- <td style="width: 20px; "> </td>
			<td> </br>End Date*:</td>
			<td></br>
				<input type="text" name="endDate" id="endDate" size="9" value="${service.endDate }">
			</td> --%>	 	
		 	
		</tr>
		<tr>
			<td> </br>Revenue Projection*:</td>
			<td></br>
				<input type="text" name="revenueProjection" id="revenueProjection" value="${service.revenueProjection }">
			</td>
				
		</tr> 
	</table>
</form>
</div>
