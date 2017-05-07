<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"/>
 <script type="text/javascript" src="timepicker/jquery.timepicker.js"></script>
 <script type="text/javascript" src="timepicker/jquery.timepicker.min.js"></script>
 <link rel="stylesheet" type="text/css" href="timepicker/jquery.timepicker.css" />

<script type="text/javascript">

$(function() {
	$('#startTime,#endTime').change(function() {
		var Start_Time = $('#startTime').val();
		var End_Time = $('#endTime').val();
	
		rosterAlert(Start_Time, End_Time);
	});
	
	$("#staffName").autocomplete({ source : 'search-staff-name-roster', select : function(staff, ui) {
		$("#staffId").val(ui.item.id);
		$("#position").val(ui.item.position);
		if (ui.item.value == 'Data Not Found') {
			ui.item.value = "";
		}
	} });
	
	$('#startTime,#endTime').change(function() {
		var start_time = $('#startTime').val();
		var end_time = $('#endTime').val();
		if (start_time.length > 0 && end_time.length > 0) {
			var start = start_time.split(':');
			var finish = end_time.split(':');
			var minsdiff = parseInt(finish[0], 10) * 60 + parseInt(finish[1], 10) - parseInt(start[0], 10) * 60 - parseInt(start[1], 10);
			var result = String(100 + Math.floor(minsdiff / 60)).substr(1) + ':' + String(100 + minsdiff % 60).substr(1);
			$('#totalHours').val(result);
		}
	});
	
	$('#endTime').timepicker({ timeFormat : 'H:i' }); //timeFormat: 'hh:mm:ss tt z'
	$('#startTime').timepicker({ timeFormat : 'H:i' });
	
	$('#startTime,#endTime').change(function() {
		var startTime = $('#startTime').val();
		var endTime = $('#endTime').val();
	
		if (startTime != "" && endTime != "") {
			if (startTime > endTime) {
				alert("Start Time should be less than end time");
				$("#startTime").css("border-color", "red");
				$("#endTime").css("border-color", "red");
			} else if (startTime < endTime) {
				$("#startTime").css("border-color", "");
				$("#endTime").css("border-color", "");
			}
		}
	
	});
});
</script>
<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style>
	<!-- modal-popup -->
  <form method="post" id="add_roster_shifts" name="add_roster_shifts">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <c:choose>
        	<c:when test="${staffRoster.satffRosterId gt 0}">
        		<h4 class="modal-title" id="exampleModalLabel" style="text-align:left;">Edit Shift</h4>
        	</c:when>
        	<c:otherwise>
        		<h4 class="modal-title" id="exampleModalLabel" style="text-align:left;">Add New Shift</h4>
        	</c:otherwise>
        </c:choose>
      </div>
      <div class="modal-body">
        <div class="col-md-4">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1"> Staff Name </label>
            <input type="hidden" class="form-control" name="staffRosterId" id="staffRosterId" value="${staffRoster.satffRosterId }" />
				<input type="hidden" class="form-control" name="staffId" id="staffId" value="${staffRoster.staffId }"  />
		     	<input type="text" class="form-control" name="staffName" id="staffName" value="${staffRoster.staffName }" />
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label label1">Start Time </label>
            <input type="text" class="form-control" name="startTime" id="startTime" value="${staffRoster.startTime }" size="7" style="left:20;" size="8" onkeypress="javascript:return isTimeNumber(event)" />
          </div>
		</div><!--- col-md-3 -->
		
		<div class="col-md-4">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1"> Position </label>
            <input type="text" name="position" id="position" value="${staffPos.position}" tabindex="-1" class="form-control" readonly/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label label1">End Time</label>
            <input type="text" class="form-control" name="endTime" id="endTime" value="${staffRoster.finishTime }" size="7" style=" left:20;" size="8" onkeypress="javascript:return isTimeNumber(event)">
          </div>
		</div><!--- col-md-3 -->
		
		<div class="col-md-4">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Role</label>
            <input type="text" name="role" id="role" value="${staffRoster.role }" class="form-control" />
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label label1">Total Hours </label>
            <input type="text" class="form-control" name="totalHours" id="totalHours" value="${staffRoster.totalHours }" size="7"  style=" left:20;" size="8" onkeypress="javascript:return isNumber(event)" readonly="readonly" tabindex="-1">
          </div>
		</div><!--- col-md-3 -->
		
		<div class="col-md-12">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Work of House:</label>
			 <div class="form-group">
			 <c:choose>
 				<c:when test="${staffRoster.workofhouse == 'foh'}">
 			    <input type="radio" name="workofhouse" checked="checked" value="foh" /> FOH
 			    <input type="radio" name="workofhouse"  value="boh" style="margin-left:20px" />BOH  
 			    </c:when>
 			   	<c:when test="${staffRoster.workofhouse == 'boh'}">
 			   		<input type="radio" name="workofhouse"  value="foh" /> FOH  
 			   		<input type="radio" name="workofhouse"  checked="checked"  value="boh" style="margin-left:20px"/>BOH  	
 			   	</c:when>
 			    <c:otherwise>
 			     <input type="radio" name="workofhouse" checked="checked" value="foh" /> FOH  
 			    <input type="radio" name="workofhouse"  value="boh" style="margin-left:20px"/>BOH   
 			    </c:otherwise>
 				
 			 </c:choose>
			 
           
			</div>
          </div>
		</div><!--- col-md-4 -->
      </div>
      <div class="modal-footer" style="overflow:hidden">
      <c:choose>
        	<c:when test="${staffRoster.satffRosterId gt 0}">
        		<button type="button" class="btn btn-success" onclick="saveRosterShift(1)">Update</button>
        	</c:when>
        	<c:otherwise>
        		<button type="button" class="btn btn-success" onclick="saveRosterShift(0)">Add</button>
        	</c:otherwise>
        </c:choose>
        
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
  </form>

