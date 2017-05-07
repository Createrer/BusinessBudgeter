<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript" src="timepicker/jquery.timepicker.js"></script>
<script type="text/javascript" src="timepicker/jquery.timepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="timepicker/jquery.timepicker.css" />

<script type="text/javascript">

	 function chooseStaff(index) {
		$( "#who"+index ).autocomplete({ 
	  		source: 'search-staff-name',
	   	 	select: function( staff, ui ) {
	    	$( "#staffId"+index).val(ui.item.id);
	 	 	}
		});
 	}
 
 $(function(){
			$(".ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
			$(".ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
		});
	$(function(){
		$('#cashUpCash input:text').keypress(function(e) {
			if(e.which == 13) { 
				updateCashup();
			}
		});
	});	 
	
	$(document).ready(function() {
	var no = '${fn:length(cashUpVoids)}';
   	var i;
   	for (i = 0; i < no; i++) {
   		$("#time"+i).timepicker({ 'timeFormat': 'H:i' });   	 	 
   		}
	});
	
</script>
	
<div>
	<input type="hidden" name="voidCount" value="${cashUpVoidsCount}">
		<table width="60%" border="0" cellspacing="1" cellpadding="5" bgcolor="#c0e057" id="ServiceEevnt">
		  <tr>
		  		<th width="6%"  align="center" class="thclass" >Who</th>
				<th width="6%" align="center" class=" thclass ">$ Value </th>
				<th width="6%" align="center" class=" thclass">Time</th>
				<th width="20%" align="center" class=" thclass" >Why</th>
		  </tr>
		  
		  <c:forEach items="${cashUpVoids}" var="cashUpVoids" varStatus="loop">
		  <tr id="ServiceEevnt">
			    <td>
			    	<input type="hidden" name="isDirtyVoid${loop.index}" value="0" />
		    		<input type="hidden"  class="input" id="cashUpVoidsId${loop.index}" name="cashUpVoidsId${loop.index}" value="${cashUpVoids.cashUpVoidsId }"/>
		    		 <%-- <input type="hidden"  class="input" id="staffId${loop.index}" name="staffId${loop.index}" value="${cashUpVoids.staffId }" onchange="makeDirty(document.cashUpCash.isDirtyVoid${loop.index})" />
		    		<input type="text"  class="input-text" id="who${loop.index}" name="who${loop.index}" value="${cashUpVoids.staffName }" onkeyup="chooseStaff(${loop.index})"/>  --%>
		    			<c:forEach items="${staffVoid}" var="staff">
		    				<input type="text" disabled="disabled" class="input-serch" value="${staff.staffName}" >
		    			</c:forEach>	
		    			<%--<select disabled="disabled" style="width: 159px;" class="input-serch" name="staffId${loop.index}" id="staffId${loop.index}" onchange="makeDirty(document.cashUpCash.isDirtyVoid${loop.index})">
					      	 <option value=" "></option>
					      	  <c:if test="${!empty staffVoid}">
						        <c:forEach items="${staffVoid}" var="staff">
									<option value="${staff.staffId}" ${staff.staffId == cashUpVoids.staffId  ? 'selected' : ''} >${ staff.staffName}</option>
								</c:forEach>
							  </c:if>	
					    	</select> --%>
		    			
		    		<div style="clear: both;"></div>
			    </td>
			    <td><input type="text" disabled="disabled" class="input" id="value${loop.index}" name="value${loop.index}" value="${cashUpVoids.amount }" onchange="makeDirty(document.cashUpCash.isDirtyVoid${loop.index})" onkeypress="javascript:return isNumber (event)"/></td>
			    <td style="text-align: left; padding-left:55px;">
			    	<input disabled="disabled" class="time ui-timepicker-input" type="text" style="text-align: center;" size="10" id="time${loop.index}" name="time${loop.index}" value="${cashUpVoids.time }" onchange="makeDirty(document.cashUpCash.isDirtyVoid${loop.index})">
			    </td>
			    <td align="center">
			    	<textarea disabled="disabled" rows="" cols="" id="why${loop.index}" name="why${loop.index}" style="width: 275px; height: 34px;"   onchange="makeDirty(document.cashUpCash.isDirtyVoid${loop.index})">${cashUpVoids.reason }</textarea>
			   		 <%-- <input type="text"  class="input-text" id="why${loop.index}" name="why${loop.index}" value="${cashUpVoids.reason }" onchange="makeDirty(document.cashUpCash.isDirtyVoid${loop.index})"/> --%>
			   </td>
		   </tr>
		   </c:forEach>
		  <!-- <tr style="background:">
				<td><a href="javaScript:void(0)" class="add-button" onclick="addNewCashupVoid()">Add New Void</a></td>
		  </tr> -->
	 </table> 
</div>