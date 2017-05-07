<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<script type="text/javascript">
		 $(document).ready(function(){
				/* $("#staffName").autocomplete({ 
					   source: 'search-staff-name-roster_service_event',
					    select: function( staff, ui ) {
					    $( "#staffId").val(ui.item.id);
					    }
				}); */
				
			 $(":checkbox").change(function(e){
			  $(this).val( $(":checked").length > 0 ? "true" : "false");
			});
		}); 
</script>


<script type="text/javascript">
      var availableTags = [];
      var obj;
     <c:forEach items="${rosterEventList}" var="event">
     	obj = {value:${event.eventId}, label: '${event.eventName}'};
     	availableTags.push(obj);
	</c:forEach>
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$( "#eventName" ).autocomplete({
	      source: availableTags,
	      focus: function(event, ui) {
				// prevent autocomplete from updating the textbox
				event.preventDefault();
				// manually update the textbox
				$(this).val(ui.item.label);
			},
			select: function(event, ui) {
				// prevent autocomplete from updating the textbox
				event.preventDefault();
				// manually update the textbox and hidden field
				$(this).val(ui.item.label);
				$("#eventId").val(ui.item.value);
			}
	    });
	});
</script>			
			
<div id="add-event-roster-popup"> 
	<form method="post" id="add_event_rosters" name="add_event_rosters">
		<table>
			<tr>
				<td style=" text-align: center;" >Event Name :</td>
	  			<td style="text-align: right;" >
	  				<input type="hidden"  style="width: 159px;" class="input-serch" name="eventId" id="eventId"/> 
	  				<input style="width: 159px;height: 22px" class="input-serch" name="eventName" id="eventName"/>
					<%-- <select style="width: 156px;" class="input-serch" name="eventId" id="eventId">
			            <c:if test="${!empty rosterEventList}">
			            <c:forEach items="${rosterEventList}" var="event">
			                <option value="${event.eventId}" >${event.eventName}</option>
			            </c:forEach>
			            </c:if>   
		            </select> --%>
		 		</td>	
		 		<td style="width: 10px; "></td>
				<td align="center">Total Hours</td> 
                <td align="center"><input type="text" class="input" style="text-align:left; width: 83px" id="totalHours" name="totalHours" value="" />
                </td>
                <td style="width: 10px; "></td>
				<td align="center">Staff Name 
				</td> 			
				<td style="text-align: right;" > 
					<input type="hidden" name="staffId" id="staffId" value="${eventStaff.staffId}" style="text-align: right; width: 127px"/>
			     	<input type="text" name="staffName" id="staffName" value="${eventStaff.staffName}" style="text-align: right; width: 127px" readonly="readonly" tabindex="-1"/>
		   		</td> 
		   		<td style="width: 10px; "></td> 
                	<td align="center">Tips </td> 			
					<td style="" > 
				     	<input type="checkbox" name="isTipEligible" id="isTipEligible" value="" />
			   		</td> 
			</tr>
		</table>
	</form>
</div>