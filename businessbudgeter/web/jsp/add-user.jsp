<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id=""> 
   <form method="post" id="add_setting_user" name="add_setting_user">
	<table>
		<tr>
			<td><input type="hidden" name="userid" id="userid" value="${user.userId }"></br>
			Full Name*:</td>
			<td></br>
				<input type="text"  name="fullname" id="fullname" value="${user.fullName }">
			</td>
			 <td style="width: 20px; "> </td>
			 <td></br>
			User Name*:</td>
			<td></br>
				<input type="text"  name="username" id="username" value="${user.userName }">
			</td>
		</tr>
		
		<tr>
			 <td></br>
			Email ID*:</td>
			<td></br>
				<input type="text"  name="emailid" id="emailid" value="${user.emailID }">
			</td>
			<td style="width: 20px; "> </td>
			  <td></br>
			Cell No*:</td>
			<td></br>
				<input type="text"  name="cellno" id="cellno" value="${user.cellNo }">
			</td>
		</tr>
		
		<tr>
			<td></br>Password *:</td>
			<td></br>
				<input type="password" name="password" id="password" value="${user.password }"> 
			</td>
			<td style="width: 20px; "> </td>
			<td></br>Company Name *:</td>
			<td></br>
				<input type="text" name="companyname" id="companyname" value="${user.company_name }"> 
			</td>	 
		</tr>	
		
		<tr>
			
				 
		</tr>	
	</table>
</form>
</div>
