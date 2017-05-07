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

<div id="service-list-details-result" > 
   <form method="post" id="serviceList" name="serviceList">	
	<div id="service_setting" class="percentDiv"> 
		   <table id="ServiceEevnt" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
		       <tbody>
                  <tr>
                  	<th class="thclass">
						<input type="checkbox" name="selectallServices" id="selectallServices" value="" onclick="selectAllServices()">
					</th>
                  	<!-- <th class="thclass">Edit</th>
			        <th class="thclass">Service Id </th> -->
			        <th class="thclass">Service Name</th>
			        <th class="thclass">Description</th>
                  </tr>
		 		<c:forEach items="${service_List}" var="service" varStatus="loop">
			 		<tr>
			 			<td style="text-align: center;">
			 				<input type="checkbox" name="check${loop.index}" id="check${loop.index}" value="${service.serviceId}" onchange="makeDirty(document.serviceList.isDirty${loop.index})" />
			 			</td>
			 			<!-- <td style="text-align: center;">
			 				<a href= "javaScript:void(0);" onclick="editSettingService(${service.serviceId})" >edit</a>
			 			</td> -->
			 			<!-- <td style="text-align: center;"><a href= "javaScript:void(0);" onclick="viewSettingService(${service.serviceId})" >${service.serviceId}</a></td> -->
			 			<td style="text-align: center;"><a href= "javaScript:void(0);" onclick="editSettingService(${service.serviceId})" >${service.serviceName}</a></td>			
			 			<td style="text-align: center;">${service.description}</td>
			 		</tr>
				</c:forEach>	
		</tbody> 		
	</table>
	</div>
</form>
</div>