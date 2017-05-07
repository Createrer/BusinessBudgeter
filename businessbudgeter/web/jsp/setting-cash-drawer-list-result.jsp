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

<div id="cash-drawer-list-details-result" > 
   <form method="post" id="cashDrawerList" name="cashDrawerList">	
	<div id="cashDrawer_setting" class="percentDiv"> 
		   <table id="ServiceEevnt" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
		       <tbody>
                  <tr>
                  	<th class="thclass">
						<input type="checkbox" name="selectallCashDrawers" id="selectallCashDrawers" value="" onclick="selectAllCashDrawers()">
					</th>
                  	<!-- <th class="thclass">Edit</th> -->
			        <!-- <th class="thclass">Cash Drawer Id </th> -->
			        <th class="thclass">Cash Drawer Name</th>
			        <th class="thclass">Description</th>
                  </tr>
		 		<c:forEach items="${cash_drawer_List}" var="cashDrawer" varStatus="loop">
			 		<tr>
			 			<td style="text-align: center;">
			 				<input type="checkbox" name="check${loop.index}" id="check${loop.index}" value="${cashDrawer.cashDrawerId}" onchange="makeDirty(document.cashDrawerList.isDirty${loop.index})" />
			 			</td>
			 			<!-- <td style="text-align: center;">
			 				<a href= "javaScript:void(0);" onclick="editSettingCashDrawer(${cashDrawer.cashDrawerId})" >edit</a>
			 			</td> -->
			 			<!-- <td style="text-align: center;"><a href= "javaScript:void(0);" onclick="viewSettingCashDrawer(${cashDrawer.cashDrawerId})" >${cashDrawer.cashDrawerId}</a></td> -->
			 			<td style="text-align: center;"><a href= "javaScript:void(0);" onclick="editSettingCashDrawer(${cashDrawer.cashDrawerId})" >${cashDrawer.tillName}</a></td>			
			 			<td style="text-align: center;">${cashDrawer.description}</td>
			 		</tr>
				</c:forEach>	
		</tbody> 		
	</table>
	</div>
</form>
</div>