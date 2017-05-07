
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">
  $(function() {    
	  var formRosterDate = $('#formRosterDate').val();
	  var toRosterDate = $('#toRosterDate').val();
	  
		$( "#formRosterDate" ).datepicker();
		$( "#formRosterDate" ).datepicker( "option", "dateFormat", "dd/mm/yy");
 		$('#formRosterDate').datepicker("setDate",formRosterDate);
 		
 		$( "#toRosterDate" ).datepicker();
		$( "#toRosterDate" ).datepicker( "option", "dateFormat", "dd/mm/yy");
 		$('#toRosterDate').datepicker("setDate",toRosterDate);
  }); 
 
  
  
  $(function ()
		  {    
		  	$('#formRosterDate,#toRosterDate').change(function (){
			var startTime =  $('#formRosterDate').val(); 
			var endTime = $('#toRosterDate').val(); 
			
			if(startTime != "" && endTime != ""){
				if(startTime > endTime)
				{
					alert("From Date should be less than end time");
					$("#formRosterDate").css("border-color","red");
					$("#toRosterDate").css("border-color","red");
				}
				else if(startTime < endTime)
				{
					$("#formRosterDate").css("border-color","");
					$("#toRosterDate").css("border-color","");
				}
			  }
			 });
		  });
  
  
</script>
<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style>
<div id=""> 
   <form method="post" id="roster_date_range" name="roster_date_range">
	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Print Roster</h4>
      </div>
      <div class="modal-body">
        <div class="col-md-4">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Income Center* :</label>
            <select name="income_Center_Id" id="income_Center_Id" class="form-control">
				<option value=""></option> 
				<c:if test="${!empty incomeCenterList}">
		        <c:forEach items="${incomeCenterList}" var="incomeCenter">
					<option value="${incomeCenter.incomeCentreId}" ${incomeCenter.incomeCentreId == cashDrawer.incomeCentreId  ? 'selected' : ''} >${incomeCenter.icName}</option>
				</c:forEach>
				</c:if>	
			</select> 
          </div>
		</div><!--- col-md-4 -->
		
		<div class="col-md-4">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">From Date :</label>
            <input name="formRosterDate" id="formRosterDate" type="text" value="" size="9"  class="form-control"/>
          </div>
		</div><!--- col-md-4 -->
		
		<div class="col-md-4">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">To Date :</label>
            <input name="toRosterDate" id="toRosterDate" type="text" value="" size="9"  class="form-control"/>
          </div>
		</div><!--- col-md-4 -->
		
		
		
		
		
		
      </div>
      <div class="modal-footer" style="overflow:hidden">
         <button type="button" class="btn btn-success" onclick="printRosterData()">Print</button>
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
	</div>
    </div>
  </div>
</div>
	</form>
</div>