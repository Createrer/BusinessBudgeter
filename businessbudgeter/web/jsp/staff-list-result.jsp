<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"/>
<link type="text/css" href="bootstrap/Fonts/glyphicons/css/glyphicons.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/Fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/css/Fonts/themify-icons/themify-icons.css" rel="stylesheet"><!-- Themify Icons -->
<!-- <script src="bootstrap/js/bootstrap.min.js"></script> -->
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

<div id="staff-list-details-result" > 
   <form method="post" id="staffList" name="staffList">	
	<div id="staff_setting" class="percentDiv" style="margin-top:10px">
	<div class="table-responsive">
		   <table id="ServiceEevnt" class="table table-bordered" width="100%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
		       <tbody>
                  <tr>
                  	<th class="thclass">
						<input type="checkbox" name="selectallStaff" id="selectallStaff" value="" onclick="selectAllStaff()">
					</th>
                  	<!-- <th class="thclass">Edit</th> -->
			        <!-- <th class="thclass">Staff Id </th> -->
			        <th class="thclass">Staff Name</th>
			        <th class="thclass">Position</th>
			        <th class="thclass">Agency</th>
			        <th class="thclass">Level</th>
			        <th class="thclass">Email ID</th>
			        <th class="thclass">Cell No</th>
                  </tr>
		 		<c:forEach items="${staff_List}" var="staff" varStatus="loop">
			 		<tr>
			 			<td style="text-align: center;">
			 				<input type="checkbox" name="check" id="check${loop.index}" value="${staff.staffId }" onchange="makeDirty(document.staffList.isDirty${loop.index})" />
			 			</td>
			 			<!-- <td style="text-align: center;">
			 				<a href= "javaScript:void(0);" onclick="editSettingStaff(${staff.staffId})" >edit</a>
			 			</td> -->
			 			<!-- <td style="text-align: center;"><a href= "javaScript:void(0);" onclick="viewSettingStaff(${staff.staffId})" >${staff.staffId }</a></td> -->
			 			<td style="text-align: center;" ><a href= "javaScript:void(0); " title="Click to edit"  onclick="editSettingStaff(${staff.staffId})" data-target="#setting-add-popup" data-toggle="modal">${staff.satffName } </a></td>			
			 			<td style="text-align: center;">${staff.position }</td>
			 			<td style="text-align: center;">${staff.agency }</td>
			 			<td style="text-align: center;">${staff.level }</td>
			 			<td style="text-align: center;">${staff.emailID }</td>
			 			<td style="text-align: center;">${staff.cellNo }</td>
			 		</tr>
				</c:forEach>	
		</tbody> 		
	</table>
	</div> 
	</div>
</form>
</div>