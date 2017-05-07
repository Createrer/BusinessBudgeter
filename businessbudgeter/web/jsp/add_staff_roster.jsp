<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 

<script type="text/javascript" src="timepicker/jquery.timepicker.js"></script>
<script type="text/javascript" src="timepicker/jquery.timepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="timepicker/jquery.timepicker.css" />
<script type="text/javascript" src="timepicker/moment.js"></script>
<script type="text/javascript" src="timepicker/moment.min.js"></script>

<script type="text/javascript">
		$(document).ready(function(){
				$("#staffNameAllocateService").autocomplete({ 
					   source: 'search-staff-name-roster',
					    select: function( staff, ui ) {
					    $( "#staffIdAllocateService").val(ui.item.id);
					    }
				});
		});
		
		$(function ()
        {    
		  $('#endTime').timepicker({timeFormat:  'H:i:s'}); //timeFormat: 'hh:mm:ss tt z'
		  $('#startTime').timepicker({timeFormat: 'H:i:s'});
	  	}); 
	  	
$(function ()
{
    $('#startTime,#endTime').change(function ()
    {
    	  var start_time = $('#startTime').val();
		  var end_time = $('#endTime').val(); 
		  if(start_time.lenght > 0 && end_time.length > 0){
			  mints = moment.duration(end_time, 'HH:mm:ss').asMinutes()- moment.duration(start_time, 'HH:mm:ss').asMinutes(); 
			  hours = moment.duration(mints, 'HH:mm:ss').asHours();
			  	  
			  /* var minsdiff=parseInt(finish[0],10)*60+parseInt(finish[1],10)-parseInt(start[0],10)*60-parseInt(start[1],10); */
			  //var result = String(100+Math.floor(minsdiff/60)).substr(1)+':'+String(100+minsdiff%60).substr(1); 
			  $('#totalHours').val(Math.abs(mints/60));
		  }
    });
});
 
</script>
	
<div id="add-staf-roster-popup"> 
	<form method="post" id="add_staf_rosters" name="add_staf_rosters">
		<table>
 			<tr>
				 		 
				<td>Staff Name</td>
				
				<td style="text-align: right;"> 
					<input type="hidden" name="staffIdAllocateService" id="staffIdAllocateService" value="" style="text-align: right; width: 127px"/>
			     	<input type="text" name="staffNameAllocateService" id="staffNameAllocateService" value="" style="text-align: right; width: 127px"/>
			    </td><td style="width: 10px; "> </td>			 
				<td>Start Time </td>
				
				<td style="text-align: right;"> 
			     	<input type="text" name="startTime" id="startTime" value="${rosterShift.startTime}" size="7" style="text-align: right;"/>
			    </td><td style="width: 10px; ">  </td>		
				<td>End Time </td>	
					
				<td style="text-align: right;">
	 				<input type="text" name="endTime" id="endTime" value="${rosterShift.finishTime}" size="7" style=" left:20;"/>
	 			</td> 
	 			<td style="width: 10px; "/>
	               <td align="center">Total Hours</td> 
	               <td align="center"><input type="text" class="input" style="text-align:left" id="totalHours" size="7" name="totalHours" value="" readonly="readonly"  tabindex="-1"/>
	            </td>
 			</tr>
 				
 			
		</table>
	</form>
</div>