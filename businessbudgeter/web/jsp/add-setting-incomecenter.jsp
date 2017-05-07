
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link type="text/css" href="bootstrap/Fonts/glyphicons/css/glyphicons.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/Fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/css/Fonts/themify-icons/themify-icons.css" rel="stylesheet"><!-- Themify Icons -->
 
<style type="text/css">
.label1{font-weight:normal !important; font-size:14px !important}
.incomecenterDiv {   height: auto; overflow: hidden;	 width: 86%; margin-left: 25px;	}
.box{  padding: 20px; display: block;  margin-top: 20px; border: 1px solid #000; }
	
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
 	$(":checkbox").change(function(e){
		$(this).val( $(":checked").length > 0 ? "true" : "false");
	});
	
	$("#basic_incomecenter_setting").show();
    $("#advanced_incomecenter_setting").hide();
    
		$('input[type="radio"]').click(function(){

			if($(this).attr("value")=="basic"){

				$("#basic_incomecenter_setting").show();
				$("#advanced_incomecenter_setting").hide();

			}

			if($(this).attr("value")=="advanced"){


				$("#advanced_incomecenter_setting").show();
				$("#basic_incomecenter_setting").hide();

			}
		});	
});
</script>



<div id=""> 
 <form method="post" id="add_setting_income_center" name="add_setting_income_center">
   <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel" style="text-align:left">Add New Income Center</h4>
      </div>
      <div class="modal-body">
     
      	<div class="radio">
            <label style="font-size: 16px">
                <input  type="radio" name="budgetType" value="basic" checked="checked">
                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                Basic setup (Automatic setup 1 cash drawer; use default sales breakdown and F&B splits)
            </label>
        </div>
     <div id="basic_incomecenter_setting">
        <div class="col-md-6">
			<form>
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Name</label>
            <input type="hidden" class="form-control" name="incomecenterid" id="incomecenterid" value="${incomeCenter.incomeCentreId }">	
			<input type="text" class="form-control" name="income_center_name" id="income_center_name" value="" >
          </div>
        </form>
		</div><!--- col-md-6 -->
		
		<div class="col-md-6">
			<form>
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Weekly Turnover $</label>
            <input type="text" class="cost form-control" name="weeklyTO" id="weeklyTO" value="">	
          </div>
        </form>
		</div><!--- col-md-6 -->
		</div>
		<div class="radio">
            <label style="font-size: 16px">
                <input type="radio" name="budgetType" value="advanced">
                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
                Advanced setup( including additional cash drawers, detailed costing models)
            </label>
        </div>
      <div id="advanced_incomecenter_setting" style="display:none">
      <div class="col-md-12">
      
      		<label for="recipient-name" class="control-label" style="font-size:13px">General Information</label>
      	
      </div><!-- col-md-12 -->
		
	   
	 <div class="col-md-4">
		<form>
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Income Center</label>
           	 <select class="form-control" name="company_id" id="company_id">
				<!-- <option value=""></option> -->
				<c:if test="${!empty companyList}">
					<c:forEach items="${companyList}" var="company">
						<option value="${company.companyId}" ${company.companyId == incomeCenter.companyId ? 'selected' : ''} >${company.companyName}</option>
					</c:forEach>
				</c:if>	
			</select>
          </div>
        </form>
	  </div><!--- col-md-4 -->
	  
	  <div class="col-md-4">
		<form>
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Location</label>
           	 <input type="text" name="location" id="location" class="form-control" value="Pune">
          </div>
        </form>
	  </div><!--- col-md-4 -->
	  
	  <div class="col-md-4">
		<form>
          <div class="form-group">
            <label for="recipient-name" class="control-label label1">Details</label>
           	<textarea class="form-control" name="details" id="details" style="height:36px">Location details</textarea>
          </div>
        </form>
	  </div><!--- col-md-4 -->
	  
	  <div class="col-md-12">
      	
      		<label for="recipient-name" class="control-label" style="font-size:13px">Sales</label>
      	
      </div><!-- col-md-12 -->
		
		<div class="row">
		<div class="col-md-3">
			<div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	             <c:choose>
				<c:when test="${incomeCenter.restaurant  == 'true'}">
					<input type="checkbox" name="restaurant" id="restaurant" checked="checked" value="${incomeCenter.restaurant }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="restaurant" id="restaurant" value="${incomeCenter.restaurant }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Restaurant
	          </label>
	        </div>
	        
	        <div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	            <c:choose>
					<c:when test="${incomeCenter.cafe == 'true'}">
						<input type="checkbox" name="cafe" id="cafe" checked="checked" value="${incomeCenter.cafe }">	
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="cafe" id="cafe" value="${incomeCenter.cafe }">	
					</c:otherwise>
				</c:choose>
	            </span>
	            Cafe
	          </label>
	        </div>
	        
	        <div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	            <c:choose>
				<c:when test="${incomeCenter.takeAway  == 'true'}">
					<input type="checkbox" name="takeAway" id="takeAway" checked="checked" value="${incomeCenter.takeAway }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="takeAway" id="takeAway" value="${incomeCenter.takeAway }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Takeaway
	          </label>
	        </div>
		</div><!-- col-md-3 -->
		
		
		<div class="col-md-3">
			<div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	             <c:choose>
				<c:when test="${incomeCenter.bar  == 'true'}">
					<input type="checkbox" name="bar" id="bar" checked="checked" value="${incomeCenter.bar}">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="bar" id="bar" value="${incomeCenter.bar}">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Bar
	          </label>
	        </div>
	        
	        <div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	            <c:choose>
				<c:when test="${incomeCenter.deli  == 'true'}">
					<input type="checkbox" name="deli" id="deli" checked="checked" value="${incomeCenter.deli }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="deli" id="deli" value="${incomeCenter.deli }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Deli
	          </label>
	        </div>
	        
	        <div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	            <c:choose>
				<c:when test="${incomeCenter.retail  == 'true'}">
					<input type="checkbox" name="retail" id="retail" checked="checked" value="${incomeCenter.retail }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="retail" id="retail" value="${incomeCenter.retail }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Retail
	          </label>
	        </div>
		</div><!-- col-md-3 -->
		
		<div class="col-md-3">
			<div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	             <c:choose>
				<c:when test="${incomeCenter.catering  == 'true'}">
					<input type="checkbox" name="catering" id="catering" checked="checked" value="${incomeCenter.catering }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="catering" id="catering" value="${incomeCenter.catering }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Catering
	          </label>
	        </div>
	        
	        <div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	            <c:choose>
				<c:when test="${incomeCenter.delivery  == 'true'}">
					<input type="checkbox" name="delivery" id="delivery" checked="checked" value="${incomeCenter.delivery }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="delivery" id="delivery" value="${incomeCenter.delivery }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Delivery
	          </label>
	        </div>
	        
	        <div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	            <c:choose>
				<c:when test="${incomeCenter.event  == 'true'}">
					<input type="checkbox" name="event" id="event" checked="checked" value="${incomeCenter.event }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="event" id="event" value="${incomeCenter.event }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Events
	          </label>
	        </div>
		</div><!-- col-md-3 -->
		
		<div class="col-md-3">
			<div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	            <c:choose>
				<c:when test="${incomeCenter.roomService  == 'true'}">
					<input type="checkbox" name="roomService" id="roomService" checked="checked" value="${incomeCenter.roomService }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="roomService" id="roomService" value="${incomeCenter.roomService }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Room Service
	          </label>
	        </div>
	        
	        <div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	            <c:choose>
				<c:when test="${incomeCenter.custom1  == 'true'}">
					<input type="checkbox" name="custom1" id="custom1" checked="checked" value="${incomeCenter.custom1 }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="custom1" id="custom1" value="${incomeCenter.custom1 }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Custom 1
	          </label>
	        </div>
	        
	        <div class="checkbox">
	          <label style="font-size:14px">
	            <input type="checkbox" value="">
	            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
	            <c:choose>
				<c:when test="${incomeCenter.custom2  == 'true'}">
					<input type="checkbox" name="custom2" id="custom2" checked="checked" value="${incomeCenter.custom2 }">	
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="custom2" id="custom2" value="${incomeCenter.custom2 }">	
				</c:otherwise>
				</c:choose>
	            </span>
	            Custom 2
	          </label>
	        </div>
		</div><!-- col-md-3 -->			
			
		</div><!-- row -->
		
		<div class="col-md-3">

			 	
      				<label for="recipient-name" class="control-label" style="font-size:13px">Tips</label>
      			
				<div class="row">
      			<div class="col-md-6">
      				<div class="form-group">
      				<label for="recipient-name" class="control-label label1">Fees : </label>
      				<input type="text" class="cost form-control" name="fees" value="10 %" id="fees" size="6">
      			</div>
      			</div><!-- col-md-6 -->
      			
      			<div class="col-md-6">
      				<div class="form-group">
      				<label for="recipient-name" class="control-label label1">Slush :</label>
      				<input type="text" class="cost form-control" name="slush" value="5.5 %"  id="slush" size="6">
      			</div>
      			</div><!-- col-md-6 -->
</div>
		</div><!-- col-md-4 -->
		
		<div class="col-md-9">
			<div class="col-md-12">
			 	
      				<label for="recipient-name" class="control-label" style="font-size:13px">Cost/Income</label>
      			
      		</div><!-- col-md-12 -->
      			
      		<div class="col-md-3">
      			<div class="form-group">
      				<label for="recipient-name" class="control-label label1">Food Cost :</label>
      				<input type="text" class="cost form-control" name="foodCost" value="50 %"  id="foodCost" size="6">
      			</div>
      		</div><!-- col-md-3 -->	
      		
      		<div class="col-md-3">
      			<div class="form-group">
      				<label for="recipient-name" class="control-label label1">Beverage Cost  :</label>
      				<input type="text" class="cost form-control" name="beverageCost" value="30 %" id="beverageCost" size="6">
      			</div>
      		</div><!-- col-md-3 -->
      		
      		<div class="col-md-3">
      			<div class="form-group">
      				<label for="recipient-name" class="control-label label1">Food Income  :</label>
      				<input type="text" class="cost form-control"  name="foodIncome" value="70 %"  id="foodIncome" size="6">
      			</div>
      		</div><!-- col-md-3 -->
      		
      		<div class="col-md-3">
      			<div class="form-group">
      				<label for="recipient-name" class="control-label label1">Beverage Income</label>
      				<input type="text" class="cost form-control" name="beverageIncome" value="60 %" id="beverageIncome" size="6">
      			</div>
      		</div><!-- col-md-3 -->			
</div>
		</div><!-- col-md-8 -->
		
      </div>
      <div class="modal-footer" style="overflow:hidden">
       <button type="button" class="btn btn-success">Add</button>
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
       </div>
    </div>
  </div>
</form>
</div>
