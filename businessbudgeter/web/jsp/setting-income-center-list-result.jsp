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

<div id="income-center-list-details-result" > 
   <form method="post" id="incomeCenterList" name="incomeCenterList">	
	<div id="income_center_setting" class="percentDiv"> 
		   <table id="ServiceEevnt" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
		       <tbody>
                  <tr>
                  	<th class="thclass">
						<input type="checkbox" name="selectallIncomeCenter" id="selectallIncomeCenter" value="" onclick="selectAllIncomeCenter()">
					</th>
                  
			        <th class="thclass">Income Center</th>
			        <th class="thclass">Company</th>
			        <th class="thclass">Location</th>
                  </tr>
		 		<c:forEach items="${income_center_List}" var="incomeCenter" varStatus="loop">
			 		<tr>
			 			<td style="text-align: center;">
			 				<input type="checkbox" name="check${loop.index}" id="check${loop.index}" value="${incomeCenter.incomeCentreId }" onchange="makeDirty(document.incomeCenterList.isDirty${loop.index})" />
			 			</td>
			 			
			 			<td style="text-align: center;">
			 			<a href= "javaScript:void(0);" onclick="editSettingIncomeCenter(${incomeCenter.incomeCentreId })" >${incomeCenter.icName }</a></td>			
			 			<td style="text-align: center;">${incomeCenter.companyName }</td>
			 			<td style="text-align: center;">${incomeCenter.location }</td>
			 		</tr>
				</c:forEach>	
		</tbody> 		
	</table>
	</div>
</form>
</div>