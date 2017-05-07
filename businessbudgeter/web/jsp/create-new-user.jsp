<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id=""> 
   <form method="post" id="create_new_user" name="create_new_user">
	<table>
		
		
		<tr>
			<td> </br>First Name:</td>
			<td></br>
				<input type="text" name="first_name" id="first_name" value="">
			</td>
			 	
		 	
		</tr>
		<tr>
			<td> </br>Last Name*:</td>
			<td></br>
				<input type="text" name="last_name" id="last_name" value="">
			</td>
					 	
		 	
		</tr>
		<tr>
			<td> </br>Email*:</td>
			<td></br>
				<input type="text" name="email" id="email" value="">
			</td>
				 	
		</tr>
		<tr>
			<td> </br>Password*:</td>
			<td></br>
				<input type="password" name="new_user_password" id="new_user_password" value="">
			</td>
				 	
		 	
		</tr>
		
	</table>
</form>
</div>
