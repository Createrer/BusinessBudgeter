<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <script type="text/javascript" src="timepicker/jquery.timepicker.js"></script>
 <script type="text/javascript" src="timepicker/jquery.timepicker.min.js"></script>
 <link rel="stylesheet" type="text/css" href="timepicker/jquery.timepicker.css" />
<script type="text/javascript">
$(function ()
{
    $('#startTime,#endTime').change(function ()
    {
    	var Start_Time = $('#startTime').val();
		var End_Time = $('#endTime').val();
		
    	  
    	  rosterAlert(Start_Time,End_Time);
    });
});

 $(function ()
  {    
  	$('#endTime').blur(function(){
	var startTime =  $('#startTime').val(); 
	var endTime = $('#endTime').val(); 
	if(startTime > endTime)
	{
		alert("Start Time should be less than end time");
		$("#startTime").css("border-color","red");
		$("#endTime").css("border-color","red");
	}
	else if(startTime < endTime)
	{
		$("#startTime").css("border-color","");
		$("#endTime").css("border-color","");
	}
	 });
  }); 
 
</script>
<script type="text/javascript">
  $(function ()
  {    
	  $('#endTime').timepicker({timeFormat:  'H:i'}); //timeFormat: 'hh:mm:ss tt z'
	  $('#startTime').timepicker({timeFormat: 'H:i'});
  }); 
 
</script>
<script type="text/javascript">
$(function ()
{
    $('#startTime,#endTime').change(function ()
    {
    	  var start_time = $('#startTime').val();
		  var end_time = $('#endTime').val();
		  if(start_time.length > 0 && end_time.length > 0){
			  var start=start_time.split(':');
			  var finish=end_time.split(':');
			  var minsdiff=parseInt(finish[0],10)*60+parseInt(finish[1],10)-parseInt(start[0],10)*60-parseInt(start[1],10);
			  var result = String(100+Math.floor(minsdiff/60)).substr(1)+':'+String(100+minsdiff%60).substr(1);
			  $('#totalHours').val(result);
		  }
    });
});
</script>
<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style>
<div id="add-roster-shift-popup"> 
   <form method="post" id="allocate_roster_shifts" name="allocate_roster_shifts">
	<div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left;">Add New Shift</h4>
	      </div>
	      <div class="modal-body">
	        <div class="col-md-3">
	          <div class="form-group">
	            <label for="recipient-name" class="control-label label1"> Staff Name </label>
	            <input type="hidden" name="staffId" id="staffId" value="${shiftStaff.staffId}" class="form-control"/>
			    <input type="text" name="staffName" id="staffName" value="${shiftStaff.staffName}" class="form-control" readonly="readonly"  tabindex="-1"/>
	          </div>
			</div><!--- col-md-3 -->
			
			<div class="col-md-3">
	          <div class="form-group">
	            <label for="recipient-name" class="control-label label1">Start Time </label>
	            <input type="text" name="startTime" id="startTime" value="" class="form-control" onblur="selectShift()" autofocus="autofocus"/>
	          </div>
			</div><!-- col-md-3 -->
			
			
			
			<div class="col-md-3">
	          <div class="form-group">
	            <label for="recipient-name" class="control-label label1">End Time </label>
	            <input type="text" name="endTime" id="endTime" value="" size="7" class="form-control">
	          </div>
			</div><!-- col-md-3 -->
			
			<div class="col-md-3">
	          <div class="form-group">
	            <label for="recipient-name" class="control-label label1">Total Hours </label>
	            <input type="text" name="totalHours" id="totalHours" value="" size="7" class="form-control" readonly="readonly" tabindex="-1">
	          </div>
			</div><!-- col-md-3 -->
			
			
			
			<div class="col-md-12">
	          <div class="form-group">
	            <label for="recipient-name" class="control-label label1">Work of House:</label>
				 <div class="form-group">
				 <input type="radio" name="workofhouse"  value="foh" checked="checked" />   FOH  
	 			 <input type="radio" name="workofhouse"  value="boh" style="margin-left:20px"/>   BOH
				</div>
	          </div>
			</div><!--- col-md-12 -->
	      </div>
	      <div class="modal-footer" style="overflow:hidden">
	        <button type="button" class="btn btn-success" onclick="saveAllocatedShift();">Add</button>
	        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
	      </div>
	    </div>
 	</div>
	</form>
</div>