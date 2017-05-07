<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">
		$(document).ready(function(){
				$("#staffName").autocomplete({ 
					   source: 'search-staff-name-roster',
					    select: function( staff, ui ) {
					    $( "#staffId").val(ui.item.id);
					    }
				});
		});
</script>
	
<div id="add-staf-roster-popup"> 
	<form method="post" id="add_staf_rosters" name="add_staf_rosters">
		<table>
 			<tr>
 							 			 
				<td class="thclass"> Staff Name </td>				
				<td style="text-align: right;" > 
					<input type="hidden" name="staffId" id="staffId" value=""  style="text-align: right; width: 127px"/>
			     	<input type="text" name="staffName" id="staffName" value="" style="text-align: right; width: 127px"/>
			    </td>
			    <td style="width: 10px; "></td>
			    <td align="center">Start Time</td>
			    <td>                   
                   	<input type="text" class="input" style="text-align:left" id="startTime" value="" />
                </td>
                <td style="width: 10px; "></td>
                <td align="center">End Time</td> 
                <td align="center"><input type="text" class="input" style="text-align:left" id="finishTime" name="finishTime" value="" />
                </td>
                <td style="width: 10px; "></td>
                <td align="center">Total Hours</td> 
                <td align="center"><input type="text" class="input" style="text-align:left" id="totalHours" name="totalHours" value="" readonly="readonly"  tabindex="-1"/>
                </td>			     
 			</tr>
		</table>
	</form>
</div>