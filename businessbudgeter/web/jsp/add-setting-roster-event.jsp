<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id=""> 
   <form method="post" id="add_setting_roster_event" name="add_setting_rosterevent">
	<table>
		<tr>
			<td><input type="hidden" name="eventid" id="eventid" value="${event.eventId }">
			Event Name*:</td>
			<td>
				<input type="text"  name="eventname" id="eventname" value="${event.eventName }">
			</td>
			<td style="width: 20px; "> </td>	
			<td></td>
			<td>
					
			</td>	 
		</tr>
		
		<tr>
			<td> </br>Food Budgeted Income*:</td>
			<td></br>
				<input type="text" name="food_budgeted_income" id="food_budgeted_income" value="${event.foodBudgetedIncome }">
			</td>
			<td style="width: 20px; "> </td>
			<td></br>Food Actual*:</td>
			<td></br>
				<input type="text" name="food_actual" id="food_actual" value="${event.foodActual }">	
			</td>		 	
		 	
		</tr>
		<tr>
			<td> </br>Beverage Budgeted Income*:</td>
			<td></br>
				<input type="text" name="beverage_budgeted_income" id="beverage_budgeted_income" value="${event.beverageBudgetedIncome }">
			</td>
			<td style="width: 20px; "> </td>
			<td></br>Beverage Actual*:</td>
			<td></br>
				<input type="text" name="beverage_actual" id="beverage_actual" value="${event.beverageActual }">	
			</td>		 	
		 	
		</tr>
		<tr>
			<td> </br>Other Budgeted Income*:</td>
			<td></br>
				<input type="text" name="other_budgeted_income" id="other_budgeted_income" value="${event.otherBudgetedIncome }">
			</td>
			<td style="width: 20px; "> </td>
			<td></br>Other Actual*:</td>
			<td></br>
				<input type="text" name="other_actual" id="other_actual" value="${event.otherActual }">	
			</td>		 	
		 	
		</tr>
		<tr>
			<td> </br>Total Budgeted Income*:</td>
			<td></br>
				<input type="text" name="total_budgeted_income" id="total_budgeted_income" value="${event.totalBudgetedIncome }">
			</td>
			<td style="width: 20px; "> </td>
			<td></br>Total Actual*:</td>
			<td></br>
				<input type="text" name="total_actual" id="total_actual" value="${event.totalActual }">	
			</td>		 	
		 	
		</tr>
		<tr>
			<td></br>Labour Cost*:</td>
			<td></br>
				<input type="text" name="labour_cost" id="labour_cost" value="${event.labourCostPct }"> 
			</td>	
		</tr> 
	</table>
</form>
</div>
