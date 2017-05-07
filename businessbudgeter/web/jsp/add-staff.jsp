<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script
 src="js/jquery/jquery.validate.js" type="text/javascript"></script>
 <script src="js/autoNumeric.js"></script>
  	
  	<script type="text/javascript">
        $(function() {
            $("#staffname").focus();
        });    
 	</script>
 	
    <script type="text/javascript">
    $(document).ready(function() {
	 	$(':input').click(function() {
	        $(this).select();
	    });
	    
	    $(".cost,.input").autoNumeric();
	});
    

	$(function(){
        $(".cost,.input").on('blur', function(){
            if(this.value != null && this.value.match(/^\d{1,3}(,?\d{3})*?(.\d*)?$/)){
                 this.value=this.value.replace(/,/g, "");
               }
        });
    });
	
        $(document).ready(function(){
			$("#system_Access").hide();
            $('#system_access').click(function(){
				
                if($(this).prop("checked") == true){
					 $("#system_Access").show();
                }

                else if($('#system_access').prop("checked") == false){
					 $("#system_access_setting").hide();
					 $("#system_Access").hide();
					 $("#userid").val('');
					 $("#password").val('');
					 $("#confirm_password").val('');
                }

            });
            
            if("${staff.settingAccess}" == 'true')
            	$("#setting_access").prop('checked', true);
            	
            if("${staff.rosterAccess}" == 'true')
            	$("#roster_access").prop('checked', true);
            
            if("${staff.cashupAccess}"== 'true')
            	$("#cashup_access").prop('checked', true);
            
            if("${staff.reportAccess}" == 'true' )
            	$("#reports_access").prop('checked', true);
            
            if("${staff.systemEnable}" == 'true'){
            	$("#system_access").prop('checked', true);
            	$("#system_Access").show();
            }
            	
            $(':input').click(function() {
                    $(this).select();
             });
             
             $(".cost").attr('maxlength','9');
             
        });

		$(document).ready(function(){
			 $(":checkbox").change(function(e){
			  $(this).val( $(":checked").length > 0 ? "true" : "false");
			});
		});
		
		$(document).ready(function(){
			$("#confirm_password").blur(function(e){
				if($("#confirm_password").val()== null || $("#confirm_password").val() == 0)
				{
					$("#confirm_password").css("border-color","red");
				}
			 
			  var password = $("#password").val();
			  var confirmPassword = $("#confirm_password").val();
			  if(password==confirmPassword){
			  	//	alert("Right");
			  		
			  }
			  else{
			  		$("#password").css("border-color","red");
			  		$("#confirm_password").css("border-color","red");
			  		//alert("Wrong Password ");
			  }
			});
		});
		
		
		function isNumber(evt) {
	        evt = (evt) ? evt : window.event;
	        var charCode = (evt.which) ? evt.which : evt.keyCode;
	        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	            alert("Please enter only Numbers.");
	            return false;
	        }

	        return true;
	    }
    </script>
 <style>
 .label1{font-weight:normal !important; font-size:16px !important;}
 
 .checkbox label:after, 
.radio label:after {
    content: '';
    display: table;
    clear: both;
}

.checkbox .cr,
.radio .cr {
    position: relative;
    display: inline-block;
    border: 1px solid #a9a9a9;
    border-radius: .25em;
    width: 1.3em;
    height: 1.3em;
    float: left;
    margin-right: .5em;
}

.radio .cr {
    border-radius: 50%;
}

.checkbox .cr .cr-icon,
.radio .cr .cr-icon {
    position: absolute;
    font-size: .7em;
    line-height: 0;
    top: 54%;
    left: 24%;
    color:#a8c355;
}

.radio .cr .cr-icon {
    margin-left: 0.04em;
}

.checkbox label input[type="checkbox"],
.radio label input[type="radio"] {
    display: none;
}

.checkbox label input[type="checkbox"] + .cr > .cr-icon,
.radio label input[type="radio"] + .cr > .cr-icon {
    transform: scale(3) rotateZ(-20deg);
    opacity: 0;
    transition: all .3s ease-in;
}

.checkbox label input[type="checkbox"]:checked + .cr > .cr-icon,
.radio label input[type="radio"]:checked + .cr > .cr-icon {
    transform: scale(1) rotateZ(0deg);
    opacity: 1;
}

.checkbox label input[type="checkbox"]:disabled + .cr,
.radio label input[type="radio"]:disabled + .cr {
    opacity: .5;
}

.chk-pad{top:42% !important; left:19% !important}
 </style>

<div id=""> 
   <form method="post" id="add_setting_staff" name="add_setting_staff">
	
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <c:choose>
        <c:when test="${staff.staffId gt 0}">
        	<h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Edit Staff</h4>
        </c:when>
        <c:otherwise>
	        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Add New Staff</h4>
        </c:otherwise>
        </c:choose>
        
      </div>
      <div class="modal-body">
        <div class="col-md-4">
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">First Name*:</label>
            <input type="hidden" name="staffid" id="staffid" value="${staff.staffId }" class="form-control">
            <input type="text"  tabindex="-1" name="staffname" id="staffname" value="${staff.satffName }" class="form-control">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">State*:</label>
            <textarea tabindex="4" name="address" id="address" class="form-control" style="height:36px">${staff.address } </textarea>
          </div>
          <div class="form-group">
            <label  class="control-label label1">Level*:</label>
            <select name="staff_level" id="staff_level" class="form-control">
					<option tabindex="1" value="${staff.level }">${staff.level }</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>
          </div>
          <div class="form-group">
            <label  class="control-label label1">Saturday Rate $*:</label>
            <input tabindex="2" class="cost form-control" type="text" name="saturday_day_rate" id="saturday_day_rate" value="${staff.saturdayDayRate }" size="4"> 
          </div>
          
          <div class="form-group">
            <label  class="control-label label1">Other Rate $*:</label>
            <input tabindex="3" class="cost form-control" type="text"   name="other_rate" id="other_rate" value="${staff.otherRate }" size="4">	 
          </div>
           <div class="form-group">
            <label for="message-text" class="control-label label1">Employee Status*:</label>
	           <select name="employee_status" id="employee_status"  tabindex="8" class="form-control">
					<option value="${staff.employeeStatus }">${staff.employeeStatus }</option>
					<option value="Part Time">Permanent full-time</option>
					<option value="Full Time">Permanent part-time</option>
					<option value="Casual">Casual (direct)</option>
					<option value="Casual">Casual (agency)</option>
					<option value="Casual">Resigned</option>
				</select> 
          </div>
		</div>
		<div class="col-md-4">
		  <div class="form-group">
            <label for="recipient-name" class="control-label label1">Last Name*:</label>
            <textarea tabindex="4" name="address" id="address" class="form-control" style="height:36px">${staff.address } </textarea>
          </div>
           <div class="form-group">
            <label for="recipient-name" class="control-label label1">Email ID*:</label>
            <input type="text" tabindex="9" class="form-control" name="email_id" id="email_id" value="${staff.emailID }">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label label1" style="margin-top:-2px">Suburb*:</label>
            <input type="text"  name="suburb" id="suburb" tabindex="5" value="" class="form-control">
          </div>
          
          <div class="form-group">
            <label for="message-text" class="control-label label1">Position*:</label>
            <input type="text" name="position"  tabindex="6"  id="position" value="${staff.position }" class="form-control"> 
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label label1">Sunday Rate $ *:</label>
           <input class="cost form-control"  type="text" name="sunday_day_rate"  tabindex="7" id="sunday_day_rate" value="${staff.sundayDayRate }" size="4"> 
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label label1">Agency*:</label>
            <input type="text" class="form-control" name="agency" id="agency"  tabindex="13"  value="${staff.agency }">  
          </div>
		</div><!--- col-md-4 -->
		
		<div class="col-md-4">
			<div class="form-group">
            <label for="recipient-name" class="control-label label1">Address*:</label>
            <textarea tabindex="4" name="address" id="address" class="form-control" style="height:36px">${staff.address } </textarea>
          </div>
           <div class="form-group">
            <label  class="control-label label1">Cell No*:</label>
            <input type="text" tabindex="0" class="form-control"  name="cell_no" id="cell_no" value="${staff.cellNo}" onkeypress="return isNumber(event)">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label label1">Post Code*:</label>
            <input type="text" tabindex="10" class="form-control" name="postcode" id="postcode"  onkeypress="return isNumber(event)" value="${staff.postalCode}">
          </div>
          
          <div class="form-group">
            <label for="message-text" class="control-label label1">M-F Hourly Daily Rate $*:</label>
            <input class="cost form-control" type="text" name="hourly_daily_rate"  tabindex="11" id="hourly_daily_rate" value="${staff.weekDayRate }" size="4"> 
          </div>
          
          <div class="form-group">
            <label for="message-text" class="control-label label1">Public Holiday Rate $*:</label>
            <input class="cost form-control" type="text" name="public_holiday_rate" id="public_holiday_rate"  tabindex="12"  value="${staff.publicHolidayDayRate }" size="4"> 
          </div>
		</div><!--- col-md-4 -->
		<div class="col-md-12">
			<div class="row">
			<div class="checkbox">
		          <label style="font-size:14px">
		            <input type="checkbox" name="system_access" id="system_access" tabindex="14" value="false">
		            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i></span>System Access*:</label>
	          </div>
			</div><!--- row-->
			</div>
		<div id="system_Access">
		
		<div class="row">
		<div class="col-md-3">
			<div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" name="setting_access"  tabindex="15" id="setting_access" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i></span>Setting*:</label>
          </div>
		</div>
		
		<div class="col-md-3">
			<div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" name="roster_access" id="roster_access" tabindex="16" value="" >
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i></span>Roster*:</label>
          </div>
		</div>
		
		<div class="col-md-3">
			<div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" name="cashup_access" id="cashup_access" value="" tabindex="17">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i></span>Cashup*:</label>
          </div>
		</div>
		
		<div class="col-md-3">
			<div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" name="reports_access" id="reports_access" value="" tabindex="18">	
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i></span>Reports*:</label>
          </div>
		</div>
		
		
		</div><!-- row -->
		<div class="col-md-4">
			<div class="form-group">
            <label for="recipient-name" class="control-label label1">User ID*:</label>
            <input  type="text"  class="form-control" name="userid" id="userid" tabindex="19" value="${staff.user.userId}">
          </div>
		</div>
		
		
		<div class="col-md-4">
			<div class="form-group">
            <label for="recipient-name" class="control-label label1">Password*:</label>
            <input type="password" class="form-control" name="password" id="password" tabindex="20" value="${staff.user.password}">
          </div>
		</div>
		
		<div class="col-md-4">
			<div class="form-group">
            <label for="recipient-name" class="control-label label1">Confirm Password*:</label>
            <input type="password" class="form-control"  name="confirm_password" tabindex="21" id="confirm_password" value="${staff.user.password}">
          </div>
		</div><!--- col-md-4 -->
      </div>
      </div>
      <div class="modal-footer" style="overflow:hidden">
       <c:choose>
        	<c:when test="${staff.staffId gt 0}">
        		<button type="button" class="btn btn-success" tabindex="22" onclick="saveStaffDetails(1);">Update</button>
        	</c:when>
        	<c:otherwise>
        		<button type="button" class="btn btn-success" tabindex="22" onclick="saveStaffDetails(0);">Add</button>
        	</c:otherwise>
        </c:choose>
        <button type="button" class="btn btn-success" tabindex="23" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>

	<%-- <div id="system_Access"> 
   
	<table>
		
		
		<tr>
			<td></br></td>
			<td></br>
				<input  type="text"  name="userid" id="userid" value="${staff.user.userId}">
			</td>
			<td style="width: 20px; "> </td>	
			<td></br></td>
			<td></br>
				
			</td>
			
			<td style="width: 20px; "> </td>
			<td style="width: 20px;"></br></td>
			<td></br>
				
			</td>
			
		</tr>
	</table>
	
</div> --%>
	<div id="system_access_setting">
	</div>
</form>
</div>
