<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id=""> 
   <form method="post" id="change_password" name="change_password">
	<table>
		<tr>
			<td><input type="hidden" name="userid" id="userid" value="${user.userId }"></br>Current Password *:</td>
			<td></br>
				<input type="text" name="confirm_password" id="new_password" value="${user.password }">
			</td>
				 
		</tr>	
		
		<tr>
			<td></br>New Password *:</td>
			<td></br>
				<input type="text" name="new_password" id="new_password" > 
			</td>
				 
		</tr>		
		
		<tr>
			<td></br>Confirm Password *:</td>
			<td></br>
				<input type="text" name="confirm_password" id="confirm_password" > 
			</td>
				 
		</tr>		
	</table>
</form>
</div>
