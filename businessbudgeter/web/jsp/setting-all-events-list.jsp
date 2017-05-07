<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.date-panel{width:100%;}

.date-panel .left{width:5%; float:left; font-size:35px; position:absolute; left:10px}

.date-panel .center{float:left; position:absolute; left:50px }

.date-panel .right{width:5%; float:left; font-size:35px; position:absolute; left:230px}

.date-panel .search{width:5%; float:left; font-size:25px;  position:absolute; left:270px; top:5px;}
</style>
<script type="text/javascript">
 $(document).ready(function(){
 $("#all-events-list-details").load("setting-all-events-list-result");
 $("#eventname").autocomplete({ 
	   source: 'autocomplete-search-for-all-events-name',
	   select: function( staff, ui ) {
	    	$( "#eventname").val(ui.item.eventname);
	    	$( "#eventid").val(ui.item.id);
    	}
 }); 
	
	$(function() {
		$('#eventname').keypress(function(e) {
		if(e.which != 13) { 
			all_events_search_by_name();
		}
		}); 
 	});
 	
 	/*$(function() {
		$('#eventDate').keypress(function(e) {
		if(e.which != 13) { 
			all_events_search_by_eventdate();
		}
		}); 
 	}); 
 	*/
	
	var currentDate = "${eventDate}";
		$( ".myDate" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$('.myDate').datepicker().datepicker("setDate", currentDate);
		$('#eventDate').datepicker("option", "onSelect", function(){ handleChangeInputsEventDate(); });
		$('#fromDate').datepicker("option", "onSelect", function(){ handleChangeInputsFromDate(); });
		$('#toDate').datepicker("option", "onSelect", function(){ handleChangeInputsToDate(); });
		
		$("#nextEventDate").click(function(){
		   var date = $('#eventDate').datepicker('getDate');
		    date.setTime(date.getTime()+(24*60*60*1000));
		    $('#eventDate').datepicker("setDate", date);
		    handleChangeInputsEventDate();
		  });
		  
		  $("#prevEventDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime() -(24*60*60*1000));
		    $('#eventDate').datepicker("setDate", date);
		    
		    handleChangeInputsEventDate();
		  }); 
		  
		  $("#nextFromDate").click(function(){
		   var date = $('#fromDate').datepicker('getDate');
		    date.setTime(date.getTime()+(24*60*60*1000));
		    $('#fromDate').datepicker("setDate", date);
		    handleChangeInputsFromDate();
		  });
		  
		  $("#prevFromDate").click(function(){
		   var date = $('#fromDate').datepicker('getDate');
		    date.setTime(date.getTime() -(24*60*60*1000));
		    $('#fromDate').datepicker("setDate", date);
		    
		    handleChangeInputsToDate();
		  }); 
		  
		   $("#nextToDate").click(function(){
		   var date = $('#toDate').datepicker('getDate');
		    date.setTime(date.getTime()+(24*60*60*1000));
		    $('#toDate').datepicker("setDate", date);
		    handleChangeInputsFromDate();
		  });
		  
		  $("#prevToDate").click(function(){
		   var date = $('#toDate').datepicker('getDate');
		    date.setTime(date.getTime() -(24*60*60*1000));
		    $('#toDate').datepicker("setDate", date);
		    
		    handleChangeInputsToDate();
		  }); 
		      
			   
	});//document.ready

	function handleChangeInputsEventDate(){
				window.location = "events?eventDate="+$("#eventDate").val(currentDate);
   }
   
   function handleChangeInputsFromDate(){
   		window.location = "events?eventDate="+$("#eventDate").val(currentDate);
   }
   
    function handleChangeInputsToDate(){
   		window.location = "events?eventDate="+$("#eventDate").val(currentDate);
   }
 
 </script> 
<BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">

<div id ="settings_staff_popup">
</div>
<div class="table-responsive">
		<table class="table" style="width:45%">
			<tbody>
				<tr>
				  <td><a href="javascript:void(0)" class="btn btn-danger" onClick="deleteSettingsRosterEvent()" title="Delete"><i class="fa fa-minus" style="padding-right:5px"></i>Delete</a></td>
				  <td><label style="font-size:10pt; margin:10px 10px 0 0; font-weight: bold; color: #769513; float:left">Date</label></td>
				  <td><a href="javascript:void(0)"><img style="margin:10px 0px 0 0px" width="17" height="18" src="images/prev.png" class="prevDate" id="prevEventDate"></a></td>
				  <td><a href="javascript:void(0)"><input type="text" class="myDate form-control" name= "eventDate" id="eventDate" value = ${ transactionEventDate }></a></td>
				  <td><a href="javascript:void(0)"><img style="margin:10px 0px 0 0px" width="17" height="18" src="images/next.png" class="nextDate" id="nextEventDate"></a></td>
				  <td> <a href="javascript:void(0)" onclick="all_events_search_by_eventdate();"><i class="fa fa-search" style="margin:10px 0px 0 0px"></i></a></td>
				</tr>
			</tbody>
		</table>
	</div>
	 
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="col-md-2">
				<div class="form-group">
					<label style="font-size:10pt; margin-right:10px; font-weight: bold; color: #769513;">Event Name</label>
					<div class="input-group">
						<input type="text" class="form-control" id="eventname" name="eventname" value="" size="15" style="width: 105px; " />
					</div>
				</div>
			</div><!-- col-md-3 -->
			
			<div class="col-md-3">
				<div class="form-group">
					<label style="font-size:10pt; margin-right:10px; font-weight: bold; color: #769513;">From Date</label>
					<div class="input-group">
						<span style="float:left; padding:5px 10px 0 0"><a href="javascript:void(0)"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevFromDate"></a></span>
						<span style="float:left"><a href="javascript:void(0)"><input type="text" class="myDate form-control" name="fromDate" id="fromDate" value = ${ transactionEventDate }></a> </span>
						<span style="float:left; padding:5px 0 0 10px"><a href="javascript:void(0)"><img width="17" height="18" src="images/next.png" class="nextDate" id="nextFromDate"></a></span>
					</div>
				</div>
			</div><!-- col-md-3 -->
			
			<div class="col-md-4">
				<div class="form-group">
					<label style="font-size:10pt; margin-right:10px; font-weight: bold; color: #769513;">To Date</label>
					<div class="input-group">
						<span style="float:left; padding:5px 10px 0 0"><a href="javascript:void(0)"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevToDate"></a></span>
						<span style="float:left"><a href="javascript:void(0)"><input type="text" class="myDate form-control" name="toDate" id="toDate" value = ${ transactionEventDate }></a> </span>
						<span style="float:left; padding:5px 0 0 10px"><a href="javascript:void(0)"><img width="17" height="18" src="images/next.png" class="nextDate" id="nexttoDate"></a></span>
						<span style="float:left; padding:5px 0 0 10px"><a href="javascript:void(0)" onclick="all_events_search_List()"><i class="fa fa-search"></i></a> </span>
					</div>
				</div>
			</div><!-- col-md-3 -->
		</div>
	</div>    
	


<div id="all-events-list-details" > 
  
</div>
</BODY>