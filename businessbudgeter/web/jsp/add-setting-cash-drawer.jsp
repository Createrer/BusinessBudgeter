<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id=""> 
   <form method="post" id="add_setting_cash_drawer" name="add_setting_cash_drawer">
	<table>
		<tr>
			<td><input type="hidden" name="drawerid" id="drawerid" value="${cashDrawer.cashDrawerId }">
			Till Name*:</td>
			<td>
				<input type="text"  name="drawername" id="drawername" value="${cashDrawer.tillName }">
			</td>
			<td style="width: 20px; "> </td>	
			<td>Income Center* : </td>
			<td>
				<select name="incomeCenterId" id="incomeCenterId">
						<option value=" "></option>
						<c:if test="${!empty incomeCenterList}">
				        <c:forEach items="${incomeCenterList}" var="incomeCenter">
							<option value="${incomeCenter.incomeCentreId}" ${incomeCenter.incomeCentreId == cashDrawer.incomeCentreId  ? 'selected' : ''} >${incomeCenter.icName}</option>
						</c:forEach>
						</c:if>	
					</select> 
			</td>	 
		</tr>
		<tr>
			<td>Description* : </td>
			<td colspan="4" ></br>
				<textarea rows="3" cols="20" name="description" id="description">${cashDrawer.description }</textarea>
			</td>
		</tr>
		
	</table>
</form>
</div>