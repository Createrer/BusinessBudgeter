<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<script type="text/javascript">
		/* $(document).ready(function(){
				$("#staffName").autocomplete({ 
					   source: 'search-staff-name-roster_service_event',
					    select: function( staff, ui ) {
					    $( "#staffId").val(ui.item.id);
					    }
				});
		}); */
		/* $(document).ready(function(){
			var val = $("#shift_staff_name").val();
			$("#staffName").val(val);
			
		}); */
		$(document).ready(function(){
			 $(":checkbox").change(function(e){
			  $(this).val( $(":checked").length > 0 ? "true" : "false");
			});
		});
</script>
<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style>
<div id="add-service-roster-popup"> 
	<form method="post" id="add_service_rosters" name="add_service_rosters">
	  	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left;">Allocate Service</h4>
      </div>
      <div class="modal-body">
        <div class="col-md-3">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Services :</label>
            <select  class="input-serch form-control" name="serviceId" id="serviceId">
	            <c:if test="${!empty seviceList}">
	            <c:forEach items="${seviceList}" var="service">
	                <option value="${service.serviceId}" >${service.serviceName}</option>
	            </c:forEach>
	            </c:if>   
            </select>
          </div>
		</div>
		<div class="col-md-3">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Total Hours</label>
              <input type="hidden" name="staffRosterId" id="staffRosterId" value="${serviceStaff.satffRosterId}" class="form-control"/>
            <input type="text" class="input form-control"  id="totalHours" name="totalHours" value="" />
          </div>
		</div><!-- col-md-3 -->
		
		
		
		<div class="col-md-3">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Staff Name </label>
            <input type="hidden" name="staffId" id="staffId" value="${serviceStaff.staffId}" class="form-control"/>
			<input type="text" name="staffName" id="staffName" value="${serviceStaff.staffName}" class="form-control" readonly="readonly"  tabindex="-1"/>
          </div>
		</div><!-- col-md-3 -->
		
		<div class="col-md-3">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Tips</label>
            <div style="width:100%"><input type="checkbox" name="isTipEligible" id="isTipEligible" value="" /></div>
          </div>
		</div><!-- col-md-3 -->
		
      </div>
      <div class="clearfix"></div>
      <div class="modal-footer" style="overflow:hidden;">
        <button type="button" class="btn btn-success" onclick="saveAllocatedServices();">Add</button>
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
	</form>
</div>