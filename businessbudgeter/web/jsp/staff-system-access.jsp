<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script
 src="js/jquery/jquery.validate.js" type="text/javascript"></script> 
 

   

<div id=""> 
   <form method="post" id="add_system_access" name="add_system_access">
	<table>
		
		<tr>
		<td></br>Setting*:</td>
			<td></br>
				<input type="checkbox" name="setting_access" id="setting_access" value="" >	
			</td>
			<td style="width: 20px; "> </td>	
			<td></br>Roster*:</td>
			<td></br>
				<input type="checkbox" name="roster_access" id="roster_access" value="" >	
			</td>
			
		</tr>
		<tr>
			<td></br>Cashup*:</td>
			<td></br>
				<input type="checkbox" name="cashup_access" id="cashup_access" value="" >	
			</td>			
			<td style="width: 38px; "> </td>	
			<td></br>Reports*:</td>
			<td></br>
				<input type="checkbox" name="reports_access" id="reports_access" value="" >	
			</td>
		</tr>
		<tr>
			<td></br>User ID*:</td>
			<td></br>
				<input type="text"  name="user_id" id="user_id" value="${user.userId}">
			</td>
			<td style="width: 38px; "> </td>	
			<td></br>Password*:</td>
			<td>
				<input type="text"  name="password" id="password" value="">
			</td>
		</tr>		
		<tr>
			<td></br>Confirm Password*:</td>
			<td></br>
				<input type="text"  name="confirm_password" id="confirm_password" value="">
			</td>
		</tr>
	</table>
	<div id="system_access_setting">
	</div>
</form>
</div>
