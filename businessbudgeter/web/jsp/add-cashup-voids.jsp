<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript" src="timepicker/jquery.timepicker.js"></script>
<script type="text/javascript" src="timepicker/jquery.timepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="timepicker/jquery.timepicker.css" />

<script type="text/javascript">
function adaptiveheight(a) {
    $(a).height(0);
    var scrollval = $(a)[0].scrollHeight;
    $(a).height(scrollval);
}
$(document).ready(function() {
	var staffList = ${fn:length(addStaffVoid)};
	if(staffList == 0){
		$("#cashup-voids-popup").hide();
		$("#noStaffMessage").show();
	}else{
		$("#cashup-voids-popup").show();
		$("#noStaffMessage").hide();
	}
      $("#why").keyup(function (e) {
      adaptiveheight(this);
});
  });
	$(function(){
		/* $( "#whoPopup").autocomplete({ 
	  		source: 'search-staff-name',
	   	 	select: function( staff, ui ) {
	    	$( "#staffId").val(ui.item.id);
	 	 	}
		});*/
	});	 
 
	/* $(function(){
		$('#cashUpCash input:text').keypress(function(e) {
			if(e.which == 13) { 
				updateCashup();
			}
		});
	});	  */
	
	$(document).ready(function() {
   		$("#timepopup").timepicker({ 'timeFormat': 'H:i' });   	 	 
	});
	
</script>
<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style>

<div id="noStaffMessage" class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Add void</h4>
      </div>
      <div class="modal-body">
 		<span style="color: red;" >No staff is allocated on this date & service, Kindly allocate the staff first</span>
      </div>
     </div>
 </div>
<div id="cashup-voids-popup"> 
    <form method="post" id="add_cashup_voids_popup" name="add_cashup_voids_popup">
		<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Add void</h4>
      </div>
      <div class="modal-body">
        <div class="col-md-3">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Who :</label>
            <select  class="input-serch form-control" name="staffId" id="staffIdForCashUpVoid" onchange="makeDirty(document.cashUpCash.isDirtyVoid${loop.index})">
	      	 <option value=" "></option>
	      	  <c:if test="${!empty addStaffVoid}">
		        <c:forEach items="${addStaffVoid}" var="staff">
					<option value="${staff.staffId}">${staff.staffName}</option>
				</c:forEach>
			  </c:if>	
	    	</select>
          </div>
		</div><!--- col-md-3 -->
		
		<div class="col-md-3">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">$ Value :</label>
            <input type="text"  class="input form-control" id="value" name="value"  size="7" style="text-align: right;"  onkeypress="javascript:return isNumber (event)"/>
          </div>
		</div><!--- col-md-3 -->
		
		<div class="col-md-3">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Time :</label>
            <input class="time ui-timepicker-input form-control" type="text" size="7" style="text-align: right;" id="timepopup" name="timepopup" value=""  >
          </div>
		</div><!--- col-md-3 -->
		
		<div class="col-md-3">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Why :</label>
            <textarea id="why" class="form-control" name="why"> </textarea></td>
          </div>
		</div><!--- col-md-3 -->
		</div>
      	<div class="modal-footer" style="overflow:hidden">
       		<button type="button" class="btn btn-success" onclick="saveCashupVoid();">Add</button>
        	<button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
       </div>
    </div>
  </div>
	</form>
</div>
