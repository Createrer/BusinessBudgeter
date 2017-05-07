<style>
.label1{font-weight:normal !important; font-size:16px !important}
</style>

<div id="send-staff-notification-template-popup"> 
   <form method="post" id="add_template" name="add_template">
		<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Staff Notification</h4>
      </div>
      <div class="modal-body">
        <div class="col-md-6">
			<form>
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Start Date :</label>
           <input type="text" size="10" class="myDate form-control" name=rosterStartDate id="rosterStartDate"/>
          </div>
        </form>
		</div><!--- col-md-6 -->
		
		<div class="col-md-6">
			<form>
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">End Date :</label>
            <input type="text" size="10" class="myDate form-control" name=rosterEndDate id="rosterEndDate" />
          </div>
        </form>
		</div><!--- col-md-6 -->
		
		
		
		
		
		
      </div>
      <div class="modal-footer" style="overflow:hidden">
       <button type="button" class="btn btn-success" onclick="sendNotification()">Send Notification</button>
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
       </div>
    </div>
  </div>
	</form>
</div>

<script type="text/javascript">
	$(function(){
		var currentDate = "${rosterDate}";
		
		$("#rosterStartDate").datepicker({ dateFormat: 'dd/mm/yy' });
		$("#rosterStartDate").datepicker().datepicker("setDate", currentDate);
		$('#rosterStartDate').datepicker("option", "onSelect", function(){ });
		$('#rosterEndDate').datepicker("option", "onSelect", function(){ });
		
		$("#rosterEndDate").datepicker({ dateFormat: 'dd/mm/yy' });
		$('#rosterEndDate').datepicker("option", "onSelect", function(){ });
		$('#rosterEndDate').datepicker("option", "onSelect", function(){ });
	});
</script>