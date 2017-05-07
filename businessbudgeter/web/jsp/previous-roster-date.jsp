
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"/>

<script type="text/javascript">
  $(function() {    
	  var prevRosterDate = $('#prevRosterDate').val();
	  
		$( "#prevRosterDate" ).datepicker();
		$( "#prevRosterDate" ).datepicker( "option", "dateFormat", "dd/mm/yy");
 		$('#prevRosterDate').datepicker("setDate",prevRosterDate);
  }); 
 
</script>

<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style>

<div id="template-popup">
<form method="post" id="add_previous_roster" name="add_previous_roster"> 
   <!-- <div class="modal fade" id="roster-event-popup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"> -->
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Use Previous Roster</h4>
      </div>
      <div class="modal-body">
        <div class="col-md-6">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Income Center* :</label>
            <select name="incomeCenterId" id="incomeCenterId" class="form-control">
				<!-- <option value=" "></option> -->
				<c:if test="${!empty incomeCenterList}">
		        <c:forEach items="${incomeCenterList}" var="incomeCenter">
					<option value="${incomeCenter.incomeCentreId}" ${incomeCenter.incomeCentreId == cashDrawer.incomeCentreId  ? 'selected' : ''} >${incomeCenter.icName}</option>
				</c:forEach>
				</c:if>	
			</select>
          </div>
		</div><!--- col-md-6 -->
		
		<div class="col-md-6">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Roster Date :</label>
            <input name="prevRosterDate" id="prevRosterDate" type="text" value="" size="9" class="form-control"/>
          </div>
		</div><!--- col-md-3 -->
		
      </div>
      <div class="modal-footer" style="overflow:hidden">
       <button type="button" class="btn btn-success" onclick="usePrevDateRoster()" >Add</button>
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
       </div>
    </div>
  </div>
</div>
<!-- </div> -->
</form>