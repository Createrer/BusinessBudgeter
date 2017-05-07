<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">
	$(':input').click(function() {
	        $(this).select();
	 });
	 
	 $(".cost").attr('maxlength','9');
	 
</script>
<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style>

<div id=""> 
<form method="post" id="add_setting_event" name="add_setting_event">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <c:choose>
        <c:when test="${event.eventId gt 0}">
        	<h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Edit Event</h4>
        </c:when>
        <c:otherwise>
	        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Add Event</h4>
        </c:otherwise>
        </c:choose>
      </div>
      <div class="modal-body">
        <div class="col-md-12">
        		<div class="form-group">
        			<label for="recipient-name" class="control-label label1">Event Name*:</label>
        			<input type="hidden" name="eventid" id="eventid" value="${event.eventId }">
        			<input type="text" class="form-control"  name="eventname" id="eventname" value="${event.eventName }" size="15">
        		</div>
        </div><!-- col-md-12 -->
        
        <div class="col-md-6">
        		<div class="form-group">
        			<label for="recipient-name" class="control-label label1">Food Budgeted Income*:</label>
        			<input type="text" class="cost input form-control" name="food_budgeted_income" id="food_budgeted_income" value="${event.foodBudgetedIncome }" size="8" onkeypress="javascript:return isNumber(event)" >
        		</div>
        		
        		<div class="form-group">
        			<label for="recipient-name" class="control-label label1">Beverage Actual*:</label>
        			<input type="text" class="cost input form-control" name="beverage_actual" id="beverage_actual" value="${event.beverageActual }" size="8" onkeypress="javascript:return isNumber(event)" >
        		</div>
        		
        		<div class="form-group">
        			<label for="recipient-name" class="control-label label1">Total Budgeted Income*:</label>
        			<input type="text" class="cost input form-control" name="total_budgeted_income" id="total_budgeted_income" value="${event.totalBudgetedIncome }" size="8" onkeypress="javascript:return isNumber(event)" ">
        		</div>
        		
        		<div class="form-group">
        			<label for="recipient-name" class="control-label label1">Other Actual*:</label>
        			<input type="text" class="cost input form-control" name="other_actual" id="other_actual" value="${event.otherActual }" size="8" onkeypress="javascript:return isNumber(event)" >	
        		</div>
        		
        		
        		
        		
        </div><!-- col-md-6 -->
        
        <div class="col-md-6">
        		<div class="form-group">
        			<label for="recipient-name" class="control-label label1">Food Actual*:</label>
        			<input type="text" class="cost  input form-control"  id="food_actual" name="food_actual" value="${event.foodActual}" onkeypress="javascript:return isNumber(event)">
        		</div>
        	
        		<div class="form-group">
        			<label for="recipient-name" class="control-label label1">Beverage Budgeted Income*:</label>
        			<input type="text" class="cost  input form-control" name="beverage_budgeted_income" id="beverage_budgeted_income" value="${event.beverageBudgetedIncome }" size="8" onkeypress="javascript:return isNumber(event)" >
        		</div>
        		
        		<div class="form-group">
        			<label for="recipient-name" class="control-label label1">Other Budgeted Income*:</label>
        			<input type="text" class="cost input form-control" name="other_budgeted_income" id="other_budgeted_income" value="${event.otherBudgetedIncome }" size="8" onkeypress="javascript:return isNumber(event)" >
        		</div>
        		
        		<div class="form-group">
        			<label for="recipient-name" class="control-label label1">Total Actual*:</label>
        			<input type="text" class="cost input form-control" name="total_actual" id="total_actual" value="${event.totalActual }" size="8" onkeypress="javascript:return isNumber(event)" >	
        		</div>
        		
        		
        </div><!-- col-md-6 -->
		<div class="col-md-12">
		 <div class="form-group">
      			<label for="recipient-name" class="control-label label1">Labour Cost*:</label>
      			<input type="text"  class="cost input form-control" name="labour_cost" id="labour_cost" value="${event.labourCostPct }" size="8" onkeypress="javascript:return isNumber(event)" > 	
        	</div>
		</div>
      </div>
      <div class="modal-footer" style="overflow:hidden">
        <c:choose>
        	<c:when test="${event.eventId gt 0}">
        		<button type="button" class="btn btn-success" onclick="saveEventDetails(1);">Update</button>
        	</c:when>
        	<c:otherwise>
        		<button type="button" class="btn btn-success" onclick="saveEventDetails(0);">Add</button>
        	</c:otherwise>
        </c:choose>
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
       </div>
    </div>
  </div>
	
	
</form>
</div>
