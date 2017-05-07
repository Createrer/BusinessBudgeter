<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(function(){
		$("#ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
		$("#ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
		$(".AddUserTable tr:nth-child(odd)").css("background", "#ffffff");
		$(".AddUserTable tr:nth-child(even)").css("background", "#f8f8f8");
		
	});
	
	$(document).ready(function(){
		$('#change-password-popup').hide();
	});
</script>
<script type="text/javascript">
		
</script>

<div id ="change-password-popup"></div>
<div id="user-list-details-result" > 
   <form method="post" id="userList" name="userList">	
	<div id="user_setting" class="percentDiv"> 
		   <table id="ServiceEevnt" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
		       <tbody>
                  <tr>
                  	<th class="thclass">	
						<input type="checkbox" name="selectallUser" id="selectallUser" value="" onclick="selectAllUser()">
					</th>
                  	<!-- <th class="thclass">Edit</th> -->
			        <!-- <th class="thclass">User Id </th> -->
			        <th class="thclass">Full Name</th>
			        <th class="thclass">User Name</th>
			        <th class="thclass">Email ID</th>
			        <th class="thclass">Cell No</th>
			        <th class="thclass">Change Password</th>
                  </tr>
		 		<c:forEach items="${user_List }" var="user" varStatus="loop">
			 		<tr>
			 			<td style="text-align: center;">
			 				<input type="checkbox" name="check${loop.index}" id="check${loop.index}" value="${user.userId }" onchange="makeDirty(document.userList.isDirty${loop.index})" />
			 			</td>
			 			<!-- <td style="text-align: center;">
			 				<a href= "javaScript:void(0);" onclick="editSettingUser(${user.userId})" >edit</a>
			 			</td> -->
			 			<!-- <td style="text-align: center;"><a href= "javaScript:void(0);" onclick="viewSettingUser(${user.userId})" >${user.userId }</a></td> -->
			 			<td style="text-align: center;"><a href= "javaScript:void(0);" onclick="editSettingUser(${user.userId})" >${user.fullName }</a></td>
			 			<td style="text-align: center;">${user.userName }</td>
			 			<td style="text-align: center;">${user.emailID }</td>			
			 			<td style="text-align: center;">${user.cellNo }</td>
			 			<td style="text-align: center;"><a href= "javaScript:void(0);" onclick="changePassword(${user.userId})" >change</a></td>
			 		</tr>
				</c:forEach>	
		</tbody> 		
	</table>
	</div>
</form>
</div>