
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">
      var availableTags = [];
      var obj;
     <c:forEach items="${eventList}" var="event">
     	obj = {value:${event.eventId}, label: '${event.eventName}'};
     	availableTags.push(obj);
	</c:forEach>
</script>
						
<script type="text/javascript">
		$(document).ready(function(){
			/* $( "#eventId").val($("#eventName").val());
			$("#eventName").change(function(){ 
		    	$( "#eventId").val($("#eventName").val());
			}); */
			$( "#eventName" ).autocomplete({
		      source: availableTags,
		      focus: function(event, ui) {
					// prevent autocomplete from updating the textbox
					event.preventDefault();
					// manually update the textbox
					$(this).val(ui.item.label);
					$("#eventId").val(ui.item.value);
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

<div id="add-roster-event-popup"> 
   
   <form method="post" id="add_roster_events" name="add_roster_events">
	<table>
		<tr>
			<td>Event ID : <input type="text" name="eventId" id="eventId" value="" readonly style="width: 115px;">
			</td>
			<td style="width: 20px; "> </td>
			<td style="width: 102px; ">Event Name*:  </td>
			<td>
				<input style="width: 159px;" class="input-serch" name="eventName" id="eventName" placeholder="e.g. Birthday Party"/> 
				<%-- <select style="width: 159px;" class="input-serch" name="eventName" id="eventName">
						<c:if test="${!empty eventList}">
				        <c:forEach items="${eventList}" var="event">
							<option value="${event.eventId}" >${event.eventName}</option>
						</c:forEach>
						</c:if>	
				</select> --%>
			</td>
		</tr>
	</table>
	</form>
</div>
