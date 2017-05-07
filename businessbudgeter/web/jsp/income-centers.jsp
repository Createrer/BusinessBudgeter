<!DOCTYPE html>
<html>
<head> 
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="common/resources.jsp" %>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"/>
<link type="text/css" href="bootstrap/Fonts/glyphicons/css/glyphicons.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/Fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/css/Fonts/themify-icons/themify-icons.css" rel="stylesheet"><!-- Themify Icons -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="timepicker/jquery.timepicker.js"></script>
<script type="text/javascript" src="timepicker/jquery.timepicker.min.js"></script>
<script src="js/autoNumeric.js"></script>
<script type="text/javascript" src="js/shortcut.js"></script>
<link rel="stylesheet" type="text/css" href="timepicker/jquery.timepicker.css" />

<style type="text/css">
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

	.budgetDiv {   height: auto; overflow: hidden;	 width: 95%;	}
    .box{  padding: 20px; display: block;  margin-top: 20px; border: 1px solid #000; }
    .budgetLabel{ display: inline-block; font-size: 13px; font-weight: bold; margin-bottom: 5px;  }
    /* .ui-budget-slider-handle { cursor: default; height: 1.2em  position: absolute; width: 14.2em; z-index: 2;} */
    .padding-bottom{padding-bottom:38px;}
    .divScroll { overflow-x: scroll; /*  height:200px;  width:100px; */  }
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



$(function(){
		$(".ServiceBudgate tr:nth-child(odd)").css("background", "#ffffff");
		$(".ServiceBudgate tr:nth-child(even)").css("background", "#f8f8f8");
	});
	
	$(document).ready(function(){

		
    		$(".basic_budget_setting").show();
    		$(".service_budget_setting").hide();
    		$(".weekday_budget_setting").hide();
    		$(".weekdayandservice_budget_setting").hide();
    		
			$('input[type="radio"]').click(function(){

				if($(this).attr("value")=="basic"){

					$(".box").not(".basic_budget_setting").hide();

					$(".basic_budget_setting").show();

				}

				if($(this).attr("value")=="byService"){

					$(".box").not(".service_budget_setting").hide();

					$(".service_budget_setting").show();

				}

				if($(this).attr("value")=="byDayOfWeek"){

					$(".box").not(".weekday_budget_setting").hide();

					$(".weekday_budget_setting").show();

				}
				
				if($(this).attr("value")=="byDayAndService"){

					 $(".box").not(".weekdayandservice_budget_setting").hide();
                     
                     $(".weekdayandservice_budget_setting").show();
				}
			 });
		  
    });
	
	
 	function funcCheck(incomecenterid){
 		var type = $("#budgetType"+incomecenterid).val();
 		$(".basic_budget_setting").hide();
		$(".service_budget_setting").hide();
		$(".weekday_budget_setting").hide();
		$(".weekdayandservice_budget_setting").hide();
		if(type == 1)
		{
			$(".basic_budget_setting").show();
		}
		if(type == 2){
			$(".service_budget_setting").show();
		}
		if(type == 3){
			$(".weekday_budget_setting").show();
		}
		if(type == 4){
			$(".weekdayandservice_budget_setting").show();	
		}
	}
 	
    // Variable to hold scroll type
    var slideDrag,
    // Width of .scroll-content ul
    slideWidth = 330,
    // Speed of animation in ms
    slideSpeed = 400;
     
    // Initialize sliders
    $(".scroll-slider").slider({
      animate: slideSpeed,
      start: checkType,
      slide: doSlide,
      max: slideWidth
    });
     
     
    function checkType(e){
      slideDrag = $(e.originalEvent.target).hasClass("ui-slider-handle");
    }
     
    function doSlide(e, ui){
      var target = $(e.target).prev(".box"),
      // If sliders were above the content instead of below, we'd use:
      // target = $(e.target).next(".scroll-content")
      maxScroll = target.attr("scrollWidth") - target.width();
       // Was it a click or drag?
      if (slideDrag == true){
        // User dragged slider head, match position
        target.attr({scrollLeft: ui.value * (maxScroll / slideWidth) });
      }
      else{
        // User clicked on slider itself, animate to position
        target.stop().animate({
            scrollLeft: ui.value * (maxScroll / slideWidth)
        }, slideSpeed);
      }
     }
</script>

<script type="text/javascript">
	$(document).ready(function(){	
	//$("#budget-content").load("setting_incomecenter_budget");
		$('.accordion-manual-header').next().slideToggle();
				if($('.accordion-manual-header').hasClass('active')){
					$('.accordion-manual-header').removeClass('active');
				} else {
					$('.accordion-manual-header').addClass('active');
				}
	});
	
	$(function() {    

	 	 $('.endTime').timepicker({timeFormat:  'H:i'}); //timeFormat: 'hh:mm:ss tt z'
	 	 $('.startTime').timepicker({timeFormat: 'H:i'});
	  });
	  
</script>
<script type="text/javascript">
	

	textbox=false;
	$(function () {
		/*  For Income Center Name  */
	    $('.txtToInputIncomeCenter').live('dblclick', function () {
	        if(!textbox) {
	        var input = $('<input />', {'type': 'text','class': 'txtToInputIncomeCenter', 'name': 'aname','income_center':''+$(this).attr("income_center")+'', 'value': $(this).html()});
	        $(this).parent().append(input);
	        $(this).remove();
	        input.focus();
	       textbox=true;
	        }
	    });
	     $('.txtToInputIncomeCenter').live('blur', function () {
	    	
	        if(textbox) {
	       var icId = $(this).attr("income_center");
	    	var span = $('<span />', {'class': 'txtToInputIncomeCenter', 'id':'IC_NAME'+icId+'','income_center':''+icId+''});
	        if(updateIncomeCenter(icId,$(this).val())){
	        $(this).parent().append($(span).html($(this).val()));
	        $(this).remove();
	        textbox=false;
	        }else{  
	        	$(this).focus();
	        }
	        }
	    }); 
	});
	    /*  For Cash Drawer  */
	    $(function () {
	    $('.txtToInputCashDrawerName').live('dblclick', function () {
	        if(!textbox) {
	        var input = $('<input />', {'type': 'text','class': 'txtToInputCashDrawerName', 'name': 'aname', 'cash_drawer_name':''+$(this).attr("cash_drawer_name")+'', 'value': $(this).html()});
	        $(this).parent().append(input);
	        $(this).remove();
	        input.focus();
	       textbox=true;
	        }
	    });
	   
	    $('.txtToInputCashDrawerName').live('blur', function () {
	        if(textbox) {
	        var drawerId = $(this).attr("cash_drawer_name");
	    	var span = $('<span />', {'class': 'txtToInputCashDrawerName' , 'id':'tillName'+drawerId+'','cash_drawer_name':''+drawerId+''});
	        
	        if(updateCashDrawerName(drawerId, $(this).val())){ 
	        	$(this).parent().append($(span).html($(this).val()));
		        $(this).remove();
	        	textbox=false;	
	        }else{  
	        	$(this).focus();
	        }
	        }
	    });
	   }); 
	   
	   $(function () {
	    $('.txtToInputCashDrawerDesc').live('dblclick', function () {
	        if(!textbox) {
	        var input = $('<input />', {'type': 'text','class': 'txtToInputCashDrawerDesc', 'name': 'aname', 'cash_drawer_desc':''+$(this).attr("cash_drawer_desc")+'', 'value': $(this).html()});
	        $(this).parent().append(input);
	        $(this).remove();
	        input.focus();
	       textbox=true;
	        }
	    });
	   
	    $('.txtToInputCashDrawerDesc').live('blur', function () {
	    	
	        if(textbox) {
	        var drawerId = $(this).attr("cash_drawer_desc");
	    	var span = $('<span />', {'class': 'txtToInputCashDrawerDesc' , 'id':'tillDescription'+drawerId+'','cash_drawer_desc':''+drawerId+''});
	        
	        if(updateCashDrawerDesc(drawerId, $(this).val())){
	        	$(this).parent().append($(span).html($(this).val()));
		        $(this).remove();
	        	textbox=false;
	        }else{  
	        	$(this).focus();
	        }
	        
	        }
	    });
	   }); 
	   
	   /*  For Services  */
	
	$(function () {
	    $('.txtToInputService').live('dblclick', function () {
	        if(!textbox) {
	        var input = $('<input />', {'type': 'text','class': 'txtToInputService', 'name': 'aname', 'service_name':''+$(this).attr("service_name")+'', 'value': $(this).html()});
	        $(this).parent().append(input);
	        $(this).remove();
	        input.focus();
	       textbox=true;
	        }
	    });
	   
	    $('.txtToInputService').live('blur', function () {
	    	
	        if(textbox) {
	        var serviceId = $(this).attr("service_name");
	    	var span = $('<span />', {'class': 'txtToInputService' , 'id':'serviceName'+serviceId+'','service_name':''+serviceId+''});
	        $(this).parent().append($(span).html($(this).val()));
	        $(this).remove();
	        updateServiceName(serviceId, $(this).val());
	        textbox=false;
	        }
	    });
	   }); 
	
</script>

<script type="text/javascript">
	$(document).ready(function(){
		//$(".testing").accordion({collapsible : true, active : false});
		$('#setting-add-popup').hide();
		
		$('.accordion-manual-header').click(function() {
			var budgetIncomeCeneterId = $(this).attr("budgetid");
			if(budgetIncomeCeneterId != undefined){
			funcCheck($(this).attr("budgetid"));
			}
				//$('.accordion-manual-content').hide();
				$(this).next().slideToggle();
				if($(this).hasClass('active')){
					$('.accordion-manual-header').removeClass('active');
				} else {
					$(this).addClass('active');
				}
			});  
		});
		
		/* $('.select_box').click(function() {
		  $('.select_box option:checked').remove();
		}); */
		
		/* $('.select_box').change(function(){
        if($(this).prop('checked') === true){
           $('.select_box').text($(this).attr('value'));
        }else{
             $('.select_box').text('');
        }
    }); */
   /*  $(function(){
    	
			$('.income-center-other').find('input, checkbox').attr('disabled','disabled');
    }); */
    
    $(function () {
		$(":checkbox").change(function(e){
			$(this).val( $(":checked").length > 0 ? "true" : "false");
		});
	});
   
</script>
<script type="text/javascript">
	$(function(){
		$("#ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
		$("#ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
		$(".AddStaffTable tr:nth-child(odd)").css("background", "#ffffff");
		$(".AddStaffTable tr:nth-child(even)").css("background", "#f8f8f8");
		
	});
	function settingChangeInputs(){
		 window.location = "income-centers";
	}
</script>

<script type="text/javascript">
	$(document).ready(function(){
		 var test = true;
		shortcut.add("alt+n", function() {
	       if(test){
	        $("#slidecontent").animate({left:'0px'}, {queue: false, duration: 500});
	        window.location.hash = '#nav-cashup';
	        $("#clickme").html('<img src="images/prev.png" class="imgArrow">');
	    }
	     else{
	        $("#slidecontent").animate({left:'-70px'}, {queue: false, duration: 500});    
	        $("#clickme").html('<img src="images/next.png" class="imgArrow">');            
	        }      
	       test= !test; 
	    }); 
		$("#clickme").click(function () {
		   if(test){
	        $("#slidecontent").animate({left:'0px'}, {queue: false, duration: 500});
	        $("#clickme").html('<img src="images/prev.png" class="imgArrow">');
	    }
	     else{
	        $("#slidecontent").animate({left:'-70px'}, {queue: false, duration: 500});    
	        $("#clickme").html('<img src="images/next.png" class="imgArrow">');            
	        }      
	       test= !test; 
		});
	});
	
</script>


</head>

<body onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="">

	<%@include file="leftNavigation.jsp" %>
	<%@include file="common/header.jsp" %>
	
	<div id ="setting-add-popup">
	</div>
	<div class="wrapper" style="width:88%;">
	
		<div class="mainwrapper">
					<a class="btn btn-success" style="margin:0 0 10px 0; cursor:pointer" id="addBtn" onclick=" addNewSettingsIncomeCenter();" data-target="#income-center-add-popup" data-toggle="modal"><i class="fa fa-plus"></i> ADD</a>
					<!-- <img src="images/plus-grey.png" value="image" id="addBtn" onclick=" addNewSettingsIncomeCenter();" data-target="#income-center-add-popup" data-toggle="modal" style="cursor:pointer; margin-bottom: 3px; margin-left: 10px;"> -->
		
		<!-- <button class="button" onclick="addNewSettingsIncomeCenter()">Add Center</button> -->
		<input type="hidden" name="incomeCenterCount" id="incomeCenterCount" value="${incomeCenterListSize}">
			<c:forEach items="${incomeCenterList}" var="incomeCenter" varStatus="loop">
				  <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon-services.png" width="24" height="24" /></td>
						      <td width="83%"><input type="hidden" name="incomeCenterId" id="incomeCenterId" value="${incomeCenter.incomeCentreId }" ><span class='txtToInputIncomeCenter' id="IC_NAME${incomeCenter.incomeCentreId}" income_center="${incomeCenter.incomeCentreId }" income_center_name="${incomeCenter.icName }" style="cursor: auto;" >${incomeCenter.icName }</span></td>
						     <%--  <td style="float: right;"><a href="javascript:void(0)" onclick="editSettingIncomeCenter(${incomeCenter.incomeCentreId })">edit</a></td> --%>
					        </tr>
					      </table>
						</div>
				        <div id="income-center-content" class="accordion-manual-content" style="display:block">
				      <table>
				        <tr>
				        	<td>
				        	<div id="income-center-visible${incomeCenter.incomeCentreId }">
						 		<div class="row">
						 		<c:choose>
									<c:when test="${incomeCenter.isEnable == 'true'}">
									
										<span class="radio" style="float:left">
							            <label style="font-size: 16px">
							               <input  type="radio" name="isEnable${incomeCenter.incomeCentreId}" checked="checked" value="true" onchange="updateEnable(${incomeCenter.incomeCentreId })">
							                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
							                Enable :  
							            </label>
										</span>
										
										
										
										<span class="radio" style="float:left; margin-top:10px;">
							            <label style="font-size: 16px">
							                <input  type="radio"  name="isEnable${incomeCenter.incomeCentreId}"  value="false" onchange="updateEnable(${incomeCenter.incomeCentreId })">
							                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
							                Disable : 
							            </label>
										</span>
										
									</c:when>
									<c:otherwise>
									<span class="radio" style="float:left">
							            <label style="font-size: 16px">
							               <input  type="radio" name="isEnable${incomeCenter.incomeCentreId}" value="true" onchange="updateEnable(${incomeCenter.incomeCentreId })">
							                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
							                Enable :  
							            </label>
										</span>
									
									<span class="radio" style="float:left; margin-top:10px;">
							            <label style="font-size: 16px">
							                <input  type="radio"  name="isEnable${incomeCenter.incomeCentreId}" checked="checked" value="false" onchange="updateEnable(${incomeCenter.incomeCentreId })">
							                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
							                Disable : 
							            </label>
										</span>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							</td>
						</tr>
					</table>
				        	
				      <%--  <span id="icname"><h1 contenteditable="true" style="margin-bottom: 20px;">${incomeCenter.icName}</h1></span> --%>
					        <div class="accordion-manual" style="width: 70%">
					         <%-- <a href="javascript:void(0)" onclick="editSettingIncomeCenter(${incomeCenter.incomeCentreId })">edit</a> --%>
								<div class="accordion-manual-header"  style="background-color:#6ca51b;">
								  <table width="20%" border="0" cellspacing="2" cellpadding="0">
								    <tr>
								     <!--  <td width="17%" class="pad-left20"><img src="images/icon_cash.png" width="24" height="24" /></td>
								      <td width="83%">Cash Drawers </td> -->
								      
								      <td>
									      <div class="pad-left20" style="width:350px">
										      <span style="float:left;"><img src="images/icon_cash.png" width="24" height="24" /></span>
										      <span style="float:left; padding-top:5px">Cash Drawers</span>
										      <span style="float:left; margin-left:10px"><a href="#"  class="btn btn-success" id="addBtn" onclick="addBeveragePurchase();" data-target="#cashup-add-popup" data-toggle="modal"><i class="fa fa-plus" style="padding-right:5px" title="Add New Cash Drawer(Default Cash Drawer)"></i>Add</a></span>
										  </div>
								      </td>
							        </tr>
							      </table>
								</div>
								<%-- <input type="hidden" name="incomeCenterId" id="incomeCenterId" value="${incomeCenter.incomeCentreId }"> --%>
						        <div id="cash-drawer-content" class="accordion-manual-content" style="display:block">
						         	
								<div id ="settings_staff_popup">
								</div>
								
								<%-- <div style="display: inline-block; vertical-align: top;">
									<h5>
								        <a href="javascript:void(0)" class="add-button" onclick="addNewSettingsCashDrawer()" title="Add">Add</a> 
										<a href="javascript:void(0)" class="delete-button" onClick="deleteSettingsCashDrawer()" title="Delete">Delete</a><br>
										<input type="text" id="cash-drawer-search-string" name="cash-drawer-search-string" size="15" style="width: 105px; "/>
								        &nbsp;&nbsp;<a href="javascript:void(0)" onclick="cash_drawer_search_by_name(${incomeCenter.incomeCentreId})">
								        search
								        </a>
									</h5>
								</div>	 --%>	
								
								<div id="cash-drawer-list-details-result" > 
								   <form method="post" id="cashDrawerList${loop.index}" name="cashDrawerList${loop.index}">	
									<div id="cashDrawer_setting${loop.index}" class="percentDiv">
									<div class="table-responsive">
										   <table id="ServiceEevnt" class="table table-bordered" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
										       <tbody>
								                  <tr>
								                  	<%-- <th class="thclass">
														<input type="checkbox" class="select_box" name="selectallCashDrawers${loop.index}" id="selectallCashDrawers${loop.index}" onclick="selectAllCashDrawers(${loop.index})">
													</th> --%>
								                  	<!-- <th class="thclass">Edit</th> -->
											        <!-- <th class="thclass">Cash Drawer Id </th> -->
											        <th class="thclass">Cash Drawer Name</th>
											        <th class="thclass">Description</th>
											        <th class="thclass"><img id="deleteDrawer"  title="Remove drawer" href="javascript:void(0);" value="image" src="images/remove.png"></th>
								                  </tr>
										 		<c:forEach items="${incomeCenter.cashDrawersSettings}" var="cashDrawer" varStatus="loopOne">
											 		<tr>
											 			<%-- <td style="text-align: center;">
											 				<input type="checkbox" class="drawerCheck" name="check${loopOne.index}" id="check${loopOne.index}" value="${cashDrawer.cashDrawerId}" onchange="makeDirty(document.cashDrawerList.isDirty${loopOne.index})" />
											 			</td> --%>
											 			<!-- <td style="text-align: center;">
											 				<a href= "javaScript:void(0);" onclick="editSettingCashDrawer(${cashDrawer.cashDrawerId})" >edit</a>
											 			</td> -->
											 			<!-- <td style="text-align: center;"><a href= "javaScript:void(0);" onclick="viewSettingCashDrawer(${cashDrawer.cashDrawerId})" >${cashDrawer.cashDrawerId}</a></td> -->
											 			<%-- <td style="text-align: center;"><a href= "javaScript:void(0);" onclick="editSettingCashDrawer(${cashDrawer.cashDrawerId})" >${cashDrawer.tillName}</a></td>	 --%>
											 			<td style="text-align: center;"><span class='txtToInputCashDrawerName' id = "tillName${cashDrawer.cashDrawerId}" cash_drawer_name="${cashDrawer.cashDrawerId}" > ${cashDrawer.tillName}</span></td>			
											 			<td style="text-align: center;"><span class='txtToInputCashDrawerDesc' id = "tillDescription${cashDrawer.cashDrawerId}" cash_drawer_desc="${cashDrawer.cashDrawerId}" > ${cashDrawer.description}</span></td>
											 			<td style="text-align: center;"><img id="deleteDrawer" style="cursor:pointer; " onclick="deleteCashDrawer(${cashDrawer.cashDrawerId})" title="Remove ${cashDrawer.tillName}" src="images/remove.png"></td>
											 		</tr>
												</c:forEach>	
										</tbody> 		
									</table>
									</div>
									</div>
									</form>

									</div>
						        </div>
						        </div>
				 			
				 			<div class="accordion-manual" style="width: 70%">
							<div class="accordion-manual-header"  style="background-color:#6ca51b;">
							  <table width="20%" border="0" cellspacing="2" cellpadding="0">
							    <tr>
							      <td width="17%" class="pad-left20"><img src="images/icon-services.png" width="24" height="24" /></td>
							      <td width="83%">Services</td>
						        </tr>
						      </table>
							</div>
					        <div id="services-centent" class="accordion-manual-content" style="display:block">
					         
					        	<%-- <div style="display: inline-block; vertical-align: top;">
									<h5>
								        <a href="javascript:void(0)" class="add-button" onclick="addNewSettingsService()" title="Add">Add</a> 
										<a href="javascript:void(0)" class="delete-button" onClick="deleteSettingsService()" title="Delete">Delete</a><br>
										<input type="text" id="service-search-string" name="service-search-string" size="15" style="width: 105px; "/>
								        &nbsp;&nbsp;<a href="javascript:void(0)" onclick="service_search_by_name(${incomeCenter.incomeCentreId})">
								        search
								        </a>
									</h5>
								</div>	 --%>
								<div id="service-list-details-result" > 
								<div id="service_setting${loop.index }" class="percentDiv"> 
								   <form method="post" id="serviceList" name="serviceList">
								   <div class="table-responsive">	
										   <table id="ServiceEevnt" class="table table-bordered" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
										       <tbody>
								                  <tr>
								                  	<%-- <th class="thclass">
														<input type="checkbox" name="selectallServices${loop.index}" id="selectallServices${loop.index}"  onclick="selectAllServices(${loop.index})">
													</th> --%>
								                  	<!-- <th class="thclass">Edit</th>
											        <th class="thclass">Service Id </th> -->
											        <th class="thclass">Service Name</th>
											        <th class="thclass">Start Time</th>
											        <th class="thclass">End Time</th>
											        <th class="thclass"><img title="Remove service" href="javascript:void(0);" src="images/remove.png"></th>
								                  </tr>
										 		<c:forEach items="${incomeCenter.servicesSettings}" var="service" varStatus="loopTwo">
											 		<tr>
											 			<%-- <td style="text-align: center;">
											 				<input type="checkbox" class="serviceCheck"  name="check${loopTwo.index}" id="check${loopTwo.index}" value="${service.serviceId}" onchange="makeDirty(document.serviceList.isDirty${loopTwo.index})" />
											 			</td> --%>
											 			<!-- <td style="text-align: center;">
											 				<a href= "javaScript:void(0);" onclick="editSettingService(${service.serviceId})" >edit</a>
											 			</td> -->
											 			<!-- <td style="text-align: center;"><a href= "javaScript:void(0);" onclick="viewSettingService(${service.serviceId})" >${service.serviceId}</a></td> -->
											 			<%-- <td style="text-align: center;"><a href= "javaScript:void(0);" onclick="editSettingService(${service.serviceId})" >${service.serviceName}</a></td>	 --%>
											 			<td style="text-align: center;"><span class='txtToInputService' id="serviceName${service.serviceId}" service_name="${service.serviceId}">${service.serviceName}</span></td>	
											 			<td style="text-align: center;"><input type="text" class="startTime form-control" name="startTime${service.serviceId}" id="startTime${service.serviceId}" size="7" value="${service.startTime }" onkeypress="javascript:return isTimeNumber(event)" onblur="updateServiceTime(${service.serviceId})"></td>
											 			<td style="text-align: center;"><input type="text" class="endTime form-control" name="endTime${service.serviceId}" id="endTime${service.serviceId}" size="7" value="${service.endTime }" onkeypress="javascript:return isTimeNumber(event)" onblur="updateServiceTime(${service.serviceId})"></td>
											 			<td style="text-align: center;"><img id="removeService" style="cursor:pointer;" onclick="deleteService(${service.serviceId})" title="Remove ${service.serviceName}" src="images/remove.png"></td>
											 		</tr>
												</c:forEach>	
										</tbody> 		
									</table>
									</div>
								</form>
								</div>
								</div>
								
					        </div>
						 </div>
						 
						  <div class="accordion-manual" budgetid="${incomeCenter.incomeCentreId}" style="width: 70%">
								<div class="accordion-manual-header"  budgetid="${incomeCenter.incomeCentreId}" style="background-color:#6ca51b;">
								  <table width="20%" border="0" budgetid="${incomeCenter.incomeCentreId}" cellspacing="2" cellpadding="0">
								    <tr>
								      <td width="17%" class="pad-left20"><img src="images/icon-budget.png" width="24" height="24" /></td>
								      <td width="83%">Budget</td>
							        </tr>
							      </table>
								</div>
								
								
						        <div id="budget-content" class="accordion-manual-content" style="display:block">
	        					 	<%-- <c:forEach items="${loopableObject}" var="theObject" varStatus="theCount"> --%>
	        					 	<div id="budget-contents${loop.index}">
	        					 	<button class="button" onclick="updateBudgetSettings(${incomeCenter.incomeCentreId})">Save Budget</button>
	        					 	
	        					 	<c:set var="budget" value="${incomeCenter.budget}"/>
	        					 	
	        					 	<c:choose>
											<c:when test="${budget.budget_type eq 1}">
											<input type="hidden" name="budgetType" id="budgetType${incomeCenter.incomeCentreId}" value="1">
											<div class="budget_radio"  onload="funcCheck(1)">
											<span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="basic" id="basic-radio" checked="checked" id="basic${incomeCenter.incomeCentreId}" ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>Basic</label></span>
											<span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byService" id="byService${incomeCenter.incomeCentreId}"  ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Service</label></span>
											<span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayOfWeek" id="byDayOfWeek${incomeCenter.incomeCentreId}"  ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Day Of week</label></span>
											<span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayAndService" id="byDayAndService${incomeCenter.incomeCentreId}"><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Day & Service</label></span>         
											    </div>
											</c:when>
											<c:when test="${budget.budget_type eq 2}">
												<div class="budget_radio"  onload="funcCheck(2)">
												<input type="hidden" name="budgetType" id="budgetType${incomeCenter.incomeCentreId}" value="2">
										         <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="basic" id="basic-radio"  id="basic${incomeCenter.incomeCentreId}" ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>Basic</label></span>
												 <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byService" id="byService${incomeCenter.incomeCentreId}" checked="checked" ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Service</label></span>
										         <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayOfWeek" id="byDayOfWeek${incomeCenter.incomeCentreId}"  ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Day Of week</label></span>
										         <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayAndService" id="byDayAndService${incomeCenter.incomeCentreId}"><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Day & Service</label></span>  
											        <%--  <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="basic" id="basic-radio" id="basic${incomeCenter.incomeCentreId}" >Basic </label>
											         <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byService" checked="checked" id="byService${incomeCenter.incomeCentreId}"  > By Service</label>
											         <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayOfWeek" id="byDayOfWeek${incomeCenter.incomeCentreId}" > By Day Of week</label>
											         <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayAndService" id="byDayAndService${incomeCenter.incomeCentreId}" > By Day & Service</label> --%>
											    </div>
											</c:when>
											<c:when test="${budget.budget_type eq 3}">
											<div class="budget_radio"  onload="funcCheck(3)">
												<input type="hidden" name="budgetType" id="budgetType${incomeCenter.incomeCentreId}" value="3">
												 <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="basic" id="basic-radio"  id="basic${incomeCenter.incomeCentreId}" ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>Basic</label></span>
												 <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byService" id="byService${incomeCenter.incomeCentreId}"  ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Service</label></span>
										         <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayOfWeek" id="byDayOfWeek${incomeCenter.incomeCentreId}"  checked="checked"><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Day Of week</label></span>
										         <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayAndService" id="byDayAndService${incomeCenter.incomeCentreId}"><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Day & Service</label></span>
												
											         <%-- <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="basic" id="basic-radio" id="basic${incomeCenter.incomeCentreId}" >Basic </label>
											         <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byService"  id="byService${incomeCenter.incomeCentreId}"  > By Service</label>
											         <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayOfWeek"  id="byDayOfWeek${incomeCenter.incomeCentreId}" > By Day Of week</label>
											         <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayAndService" id="byDayAndService${incomeCenter.incomeCentreId}" > By Day & Service</label> --%>
											    </div>
											</c:when>
											<c:otherwise>
											<input type="hidden" name="budgetType" id="budgetType${incomeCenter.incomeCentreId}" value="4">
												<div class="budget_radio"  onload="funcCheck(4)">
												<span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="basic" id="basic-radio"  id="basic${incomeCenter.incomeCentreId}" ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>Basic</label></span>
												 <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byService" id="byService${incomeCenter.incomeCentreId}"  ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Service</label></span>
										         <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayOfWeek" id="byDayOfWeek${incomeCenter.incomeCentreId}" ><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Day Of week</label></span>
										         <span class="radio" style="float:left; margin:0px 0 10px 0"><label style="font-size: 16px" class="budgetLabel"><input  type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayAndService" id="byDayAndService${incomeCenter.incomeCentreId}" checked="checked"><span class="cr"><i class="cr-icon fa fa-circle"></i></span>By Day & Service</label></span>
											         <%-- <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="basic" id="basic-radio"  id="basic${incomeCenter.incomeCentreId}" >Basic </label>
											         <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byService" id="byService${incomeCenter.incomeCentreId}"  > By Service</label>
											         <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayOfWeek"  id="byDayOfWeek${incomeCenter.incomeCentreId}" > By Day Of week</label>
											         <label class="budgetLabel"><input type="radio" name="budgetType${incomeCenter.incomeCentreId}" value="byDayAndService"  id="byDayAndService${incomeCenter.incomeCentreId}" > By Day & Service</label> --%>
											    </div>
											</c:otherwise>
										</c:choose>
									<div id="basic_budget_setting${incomeCenter.incomeCentreId}" class="budgetDiv box basic_budget_setting"> 
									<form method="post" id="BasicBudget${incomeCenter.incomeCentreId}" name="BasicBudget${incomeCenter.incomeCentreId}">
								   		<table id="basicbudget${loop.index}" class="ServiceBudgate table responsive table-bordered" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="2" cellpadding="5">
											      <tbody> 
										      		<%-- <c:forEach items="" var="budget" varStatus="loopTwo"> --%>
											 		    <tr>
											 		    	<th class="thclass">Weekly Turnover ($)</th>
											 		    	<c:set var="basicTO" value=""/>
											 		    	<c:set var="basicTSFood" value=""/>
											 		    	<c:set var="basicTSBeverage" value=""/>
											 		    	<c:set var="basicFoodCost" value=""/>
											 		    	<c:set var="basicbevCost" value=""/>
											 		    	
											 		    	<c:if test="${budget.budget_type == 1}">
											 		    	<c:set var="basicTO" value="${budget.settings[0].turnover}"/>
											 		    	
											 		    	<c:set var="basicTSFood" value="${budget.settings[0].food_income}"/>
											 		    	<c:set var="basicTSBeverage" value="${budget.settings[0].bev_income}"/>
											 		    	<c:set var="basicFoodCost" value="${budget.settings[0].food_cost_pct}"/>
											 		    	<c:set var="basicbevCost" value="${budget.settings[0].bev_cost_pct}"/>
											 		    	
											 		    	</c:if>
											 		    	<td><input type="text" class="cost form-control" id="weeklyTurnOver${incomeCenter.incomeCentreId}" name="weeklyTurnOver${incomeCenter.incomeCentreId}" value="${basicTO}"></td>
											 		    	
											 		    </tr>
												 		<tr> 
												 			<th class="thclass">Turnover Split</th>
												 			<td>
												 				<table>
												 					<tr>
												 						<th align="center" class="thclass">Food (%)</th>
												 						<th align="center"class="thclass">Beverage (%)</th>
												 					</tr>
												 					<tr>
												 						<td>
											 						      	<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="foodTS${incomeCenter.incomeCentreId}" name="foodTS${incomeCenter.incomeCentreId}" value="${basicTSFood}">
												 						</td>
												 						<td>
												 							 <input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="beverageTS${incomeCenter.incomeCentreId}" name="beverageTS${incomeCenter.incomeCentreId}" value="${basicTSBeverage}">
												 						</td>
												 					</tr>
												 				</table>
												 			</td> 
											 		    </tr>
												 		<tr>
												 			<th class="thclass">Cost Of Goods</th>
											 		    	<td>
												 				<table>
												 					<tr>
												 						<th align="center" class="thclass">Food (%)</th>
												 						<th align="center"class="thclass">Beverage (%)</th>
												 					</tr>
												 					<tr>
												 						<td>
											 								<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="foodCost${incomeCenter.incomeCentreId}" name="foodCost${incomeCenter.incomeCentreId}" value="${basicFoodCost}">
												 						</td>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="beverageCost${incomeCenter.incomeCentreId}" name="beverageCost${incomeCenter.incomeCentreId}" value="${basicbevCost}">
												 						</td>
												 					</tr>
												 				</table>
												 			</td>
												 		</tr>
													<%-- </c:forEach>	 --%>
											</tbody>  	
										</table>
									</form>
								</div>
								
							 	<div id="service_budget_setting${incomeCenter.incomeCentreId}" class="budgetDiv box divScroll service_budget_setting"> 
									<form method="post" id="ServiceBudget${incomeCenter.incomeCentreId}" name="ServiceBudget${incomeCenter.incomeCentreId}" style="width: 1050px; ">	
								   		<table id="sericeBudget${loop.index}" class="ServiceBudgate table-bordered" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5" style="width: 1225px; ">
									     	<tbody>
									                  <tr>
									                  	<th  class="thclass"></th>
									                    <th style="text-align:center;" class="thclass">Turnover ($)</th>
									                    <th style="text-align:center;" class="thclass">Turnover split</th>
									                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
												      </tr>
											 		 <%-- <c:forEach items="" var="budget" varStatus="loopTwo"> --%>
											 		     	<c:set var="serviceBTO" value=""/>
											 		    	<c:set var="serviceBFoodTS" value=""/>
											 		    	<c:set var="serviceBBeverageTS" value=""/>
											 		    	<c:set var="serviceBFoodCost" value=""/>
											 		    	<c:set var="serviceBBeverageCost" value=""/>
											 		    	
											 		    	<c:set var="serviceLTO" value=""/>
											 		    	<c:set var="serviceLFoodTS" value=""/>
											 		    	<c:set var="serviceLBeverageTS" value=""/>
											 		    	<c:set var="serviceLFoodCost" value=""/>
											 		    	<c:set var="serviceLBeverageCost" value=""/>
											 		    	
											 		    	<c:set var="serviceDTO" value=""/>
											 		    	<c:set var="serviceDFoodTS" value=""/>
											 		    	<c:set var="serviceDBeverageTS" value=""/>
											 		    	<c:set var="serviceDFoodCost" value=""/>
											 		    	<c:set var="serviceDBeverageCost" value=""/>
											 		    	
											 		    	<c:if test="${budget.budget_type == 2}">
											 		    	  <%-- <c:if test="${budget.services.serviceName eq 'Breakfast'}"> --%>
												 		    	<c:set var="serviceBTO" value="${budget.settings[0].turnover}"/>
												 		    	<c:set var="serviceBFoodTS" value="${budget.settings[0].food_income}"/>
												 		    	<c:set var="serviceBBeverageTS" value="${budget.settings[0].bev_income}"/>
												 		    	<c:set var="serviceBFoodCost" value="${budget.settings[0].food_cost_pct}"/>
												 		    	<c:set var="serviceBBeverageCost" value="${budget.settings[0].bev_cost_pct}"/>
											 		    	   <%-- </c:if> --%>
											 		    	   
											 		    	   <c:set var="serviceLTO" value="${budget.settings[1].turnover}"/>
												 		    	<c:set var="serviceLFoodTS" value="${budget.settings[1].food_income}"/>
												 		    	<c:set var="serviceLBeverageTS" value="${budget.settings[1].bev_income}"/>
												 		    	<c:set var="serviceLFoodCost" value="${budget.settings[1].food_cost_pct}"/>
												 		    	<c:set var="serviceLBeverageCost" value="${budget.settings[1].bev_cost_pct}"/>
												 		    	
												 		    	 <c:set var="serviceDTO" value="${budget.settings[2].turnover}"/>
												 		    	<c:set var="serviceDFoodTS" value="${budget.settings[2].food_income}"/>
												 		    	<c:set var="serviceDBeverageTS" value="${budget.settings[2].bev_income}"/>
												 		    	<c:set var="serviceDFoodCost" value="${budget.settings[2].food_cost_pct}"/>
												 		    	<c:set var="serviceDBeverageCost" value="${budget.settings[2].bev_cost_pct}"/>
												 		    	
											 		    	</c:if>
											 		    	
												 		<tr>
											 		    	<th class="thclass">Breakfast</th>
											 		    		<td  style="width: 180px;padding-bottom:0px; ">
										 						<input type="text" class="cost form-control" style="margin:5px auto; width:90%" id="serviceBTO${incomeCenter.incomeCentreId}" name="serviceBTO${incomeCenter.incomeCentreId}" value="${serviceBTO}" >
										 						</td> 
										 					<td style="width: 403px; ">
												 				<table>
												 					<tr>
												 						<th align="center" class="thclass">Food (%)</th>
												 						<th align="center"class="thclass">Beverage (%)</th>
												 					</tr>
												 					<tr>
												 						<td>
											 								<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="serviceBFoodTS${incomeCenter.incomeCentreId}" name="serviceBFoodTS${incomeCenter.incomeCentreId}" value="${serviceBFoodTS}" >
												 						</td>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="serviceBBeverageTS${incomeCenter.incomeCentreId}" name="serviceBBeverageTS${incomeCenter.incomeCentreId}" value="${serviceBBeverageTS}">
												 						</td>
												 					</tr>
												 				</table>
												 			</td>
											 		    	<td style="width: 403px; ">
												 				<table>
												 					<tr>
												 						<th align="center" class="thclass">Food (%)</th>
												 						<th align="center"class="thclass">Beverage (%)</th>
												 					</tr>
												 					<tr>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="serviceBFoodCost${incomeCenter.incomeCentreId}" name="serviceBFoodCost${incomeCenter.incomeCentreId}" value="${serviceBFoodCost}">
												 						</td>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="serviceBBeverageCost${incomeCenter.incomeCentreId}" name="serviceBBeverageCost${incomeCenter.incomeCentreId}" value="${serviceBBeverageCost}">
												 						</td>
												 					</tr>
												 				</table>
												 			</td>
											 		    </tr>
											 		    <tr>
											 		    	<th class="thclass">Lunch</th>
											 		    	<td style="width: 180px;padding-bottom:0px; ">
												 				<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="serviceLTO${incomeCenter.incomeCentreId}" name="serviceLTO${incomeCenter.incomeCentreId}" value="${serviceLTO}">
									 						</td>
												 					 
											 		    	<td>
												 				<table>
												 					<!-- <tr>
												 						<th align="center" class="thclass">Food</th>
												 						<th align="center"class="thclass">Beverage</th>
												 					</tr> -->
												 					<tr>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="serviceLFoodTS${incomeCenter.incomeCentreId}" name="serviceLFoodTS${incomeCenter.incomeCentreId}" value="${serviceLFoodTS}">
												 						</td>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="serviceLBeverageTS${incomeCenter.incomeCentreId}" name="serviceLBeverageTS${incomeCenter.incomeCentreId}" value="${serviceLBeverageTS}">
												 						</td>
												 					</tr>
												 				</table>
												 			</td>
											 		    	<td>
												 				<table>
												 					<!-- <tr>
												 						<th align="center" class="thclass">Food</th>
												 						<th align="center"class="thclass">Beverage</th>
												 					</tr> -->
												 					<tr>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="serviceLFoodCost${incomeCenter.incomeCentreId}" name="serviceLFoodCost${incomeCenter.incomeCentreId}" value="${serviceLFoodCost}">
												 						</td>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="serviceLBeverageCost${incomeCenter.incomeCentreId}" name="serviceLBeverageCost${incomeCenter.incomeCentreId}" value="${serviceLBeverageCost}">
												 						</td>
												 					</tr>
												 				</table>
												 			</td>
											 		    </tr>
											 		    <tr>
											 		    	<th class="thclass">Dinner</th>
											 		    	<td style="width: 180px;padding-bottom:0px; "> 
												 				<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="serviceDTO${incomeCenter.incomeCentreId}" name="serviceDTO${incomeCenter.incomeCentreId}" value="${serviceDTO}">
												 			</td>	
												 			<td>
												 				<table>
												 					<!-- <tr>
												 						<th align="center" class="thclass">Food</th>
												 						<th align="center"class="thclass">Beverage</th>
												 					</tr> -->
												 					<tr>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="serviceDFoodTS${incomeCenter.incomeCentreId}" name="serviceDFoodTS${incomeCenter.incomeCentreId}" value="${serviceDFoodTS}">
												 						</td>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="serviceDBeverageTS${incomeCenter.incomeCentreId}" name="serviceDBeverageTS${incomeCenter.incomeCentreId}" value="${serviceDBeverageTS}">
												 						</td>
												 					</tr>
												 				</table>
												 			</td>
											 		    	<td>
												 				<table>
												 					<!-- <tr>
												 						<th align="center" class="thclass">Food</th>
												 						<th align="center"class="thclass">Beverage</th>
												 					</tr> -->
												 					<tr>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="serviceDFoodCost${incomeCenter.incomeCentreId}" name="serviceDFoodCost${incomeCenter.incomeCentreId}" value="${serviceDFoodCost}">
												 						</td>
												 						<td>
												 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="serviceDBeverageCost${incomeCenter.incomeCentreId}" name="serviceDBeverageCost${incomeCenter.incomeCentreId}" value="${serviceDBeverageCost}">
												 						</td>
												 					</tr>
												 				</table>
												 			</td>
											 		    </tr>
													<%-- </c:forEach>	 --%>
											</tbody>  	  	
										</table>
									</form>
								</div>
								
								<div id="weekday_budget_setting${incomeCenter.incomeCentreId}" class="budgetDiv box divScroll weekday_budget_setting"> 
									<form method="post" id="WeekdayBudget${incomeCenter.incomeCentreId}" name="weeekdayBudget${incomeCenter.incomeCentreId}">	
								   		<table id="weekdayBudget${loop.index}" class="ServiceBudgate table table-bordered" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
									    	<tbody>
								                  <tr>
								                  	<th  class="thclass"></th>
								                    <th style="text-align:center;" class="thclass">Monday</th>
											        <th style="text-align:center;" class="thclass">Tuesday</th>
											        <th style="text-align:center;" class="thclass">Wednesday</th>
											        <th style="text-align:center;" class="thclass">Thursday</th>
											        <th style="text-align:center;" class="thclass">Friday</th>
											        <th style="text-align:center;" class="thclass">Satarday</th>
											        <th style="text-align:center;" class="thclass">Sunday</th>
								                  </tr>
										 		 <%-- <c:forEach items="" var="budget" varStatus="loopTwo"> --%>
										 		    <tr>
											 		    	
											 		    	<c:set var="monTurnOver" value=""/>
											 		    	<c:set var="monFoodTS" value=""/>
											 		    	<c:set var="monBeverageTS" value=""/>
											 		    	<c:set var="monFoodCost" value=""/>
											 		    	<c:set var="monBeverageCost" value=""/>
											 		    	
											 		    	<c:set var="tueTurnOver" value=""/>
											 		    	<c:set var="tueFoodTS" value=""/>
											 		    	<c:set var="tueBeverageTS" value=""/>
											 		    	<c:set var="tueFoodCost" value=""/>
											 		    	<c:set var="tueBeverageCost" value=""/>
											 		    	
											 		    	<c:set var="wedTurnOver" value=""/>
											 		    	<c:set var="wedFoodTS" value=""/>
											 		    	<c:set var="wedBeverageTS" value=""/>
											 		    	<c:set var="wedFoodCost" value=""/>
											 		    	<c:set var="wedBeverageCost" value=""/>
											 		    	
											 		    	<c:set var="thurTurnOver" value=""/>
											 		    	<c:set var="thurFoodTS" value=""/>
											 		    	<c:set var="thurBeverageTS" value=""/>
											 		    	<c:set var="thurFoodCost" value=""/>
											 		    	<c:set var="thurBeverageCost" value=""/>
											 		    	
											 		    	<c:set var="friTurnOver" value=""/>
											 		    	<c:set var="friFoodTS" value=""/>
											 		    	<c:set var="friBeverageTS" value=""/>
											 		    	<c:set var="friFoodCost" value=""/>
											 		    	<c:set var="friBeverageCost" value=""/>
											 		    	
											 		    	<c:set var="satTurnOver" value=""/>
											 		    	<c:set var="satFoodTS" value=""/>
											 		    	<c:set var="satBeverageTS" value=""/>
											 		    	<c:set var="satFoodCost" value=""/>
											 		    	<c:set var="satBeverageCost" value=""/>
											 		    	
											 		    	<c:set var="sunTurnOver" value=""/>
											 		    	<c:set var="sunFoodTS" value=""/>
											 		    	<c:set var="sunBeverageTS" value=""/>
											 		    	<c:set var="sunFoodCost" value=""/>
											 		    	<c:set var="sunBeverageCost" value=""/>
											 		    	
											 		    	<c:if test="${budget.budget_type == 3}">
												 		    	<c:set var="monTurnOver" value="${budget.settings[0].turnover}"/>
												 		    	<c:set var="monFoodTS" value="${budget.settings[0].food_income}"/>
												 		    	<c:set var="monBeverageTS" value="${budget.settings[0].bev_income}"/>
												 		    	<c:set var="monFoodCost" value="${budget.settings[0].food_cost_pct}"/>
												 		    	<c:set var="monBeverageCost" value="${budget.settings[0].bev_cost_pct}"/>
												 		    	
												 		    	<c:set var="tueTurnOver" value="${budget.settings[1].turnover}"/>
												 		    	<c:set var="tueFoodTS" value="${budget.settings[1].food_income}"/>
												 		    	<c:set var="tueBeverageTS" value="${budget.settings[1].bev_income}"/>
												 		    	<c:set var="tueFoodCost" value="${budget.settings[1].food_cost_pct}"/>
												 		    	<c:set var="tueBeverageCost" value="${budget.settings[1].bev_cost_pct}"/>
												 		    	
												 		    	<c:set var="wedTurnOver" value="${budget.settings[2].turnover}"/>
												 		    	<c:set var="wedFoodTS" value="${budget.settings[2].food_income}"/>
												 		    	<c:set var="wedBeverageTS" value="${budget.settings[2].bev_income}"/>
												 		    	<c:set var="wedFoodCost" value="${budget.settings[2].food_cost_pct}"/>
												 		    	<c:set var="wedBeverageCost" value="${budget.settings[2].bev_cost_pct}"/>
												 		    	
												 		    	<c:set var="thurTurnOver" value="${budget.settings[3].turnover}"/>
												 		    	<c:set var="thurFoodTS" value="${budget.settings[3].food_income}"/>
												 		    	<c:set var="thurBeverageTS" value="${budget.settings[3].bev_income}"/>
												 		    	<c:set var="thurFoodCost" value="${budget.settings[3].food_cost_pct}"/>
												 		    	<c:set var="thurBeverageCost" value="${budget.settings[3].bev_cost_pct}"/>
												 		    	
												 		    	<c:set var="friTurnOver" value="${budget.settings[4].turnover}"/>
												 		    	<c:set var="friFoodTS" value="${budget.settings[4].food_income}"/>
												 		    	<c:set var="friBeverageTS" value="${budget.settings[4].bev_income}"/>
												 		    	<c:set var="friFoodCost" value="${budget.settings[4].food_cost_pct}"/>
												 		    	<c:set var="friBeverageCost" value="${budget.settings[4].bev_cost_pct}"/>
												 		    	
												 		    	<c:set var="satTurnOver" value="${budget.settings[5].turnover}"/>
												 		    	<c:set var="satFoodTS" value="${budget.settings[5].food_income}"/>
												 		    	<c:set var="satBeverageTS" value="${budget.settings[5].bev_income}"/>
												 		    	<c:set var="satFoodCost" value="${budget.settings[5].food_cost_pct}"/>
												 		    	<c:set var="satBeverageCost" value="${budget.settings[5].bev_cost_pct}"/>
												 		    	
												 		    	<c:set var="sunTurnOver" value="${budget.settings[6].turnover}"/>
												 		    	<c:set var="sunFoodTS" value="${budget.settings[6].food_income}"/>
												 		    	<c:set var="sunBeverageTS" value="${budget.settings[6].bev_income}"/>
												 		    	<c:set var="sunFoodCost" value="${budget.settings[6].food_cost_pct}"/>
												 		    	<c:set var="sunBeverageCost" value="${budget.settings[6].bev_cost_pct}"/>
												 		    	
											 		    	</c:if>
										 		    	
										 		    	<th class="thclass">Weekly Turnover ($)</th>
										 		    	<td><input type="text" class="cost form-control" style="width:100%; margin:5px auto" id="monTurnOver" name="monTO" value="${monTurnOver}"></td>
										 		    	<td><input type="text" class="cost form-control" style="width:100%; margin:5px auto" id="tueTurnOver" name="tueTO" value="${tueTurnOver}"></td>
										 		    	<td><input type="text" class="cost form-control" style="width:100%; margin:5px auto" id="wedTurnOver" name="wedTO" value="${wedTurnOver}"></td>
										 		    	<td><input type="text" class="cost form-control" style="width:100%; margin:5px auto" id="thurTurnOver" name="thurTO" value="${thurTurnOver}"></td>
										 		    	<td><input type="text" class="cost form-control" style="width:100%; margin:5px auto" id="friTurnOver" name="friTO" value="${friTurnOver}"></td>
										 		    	<td><input type="text" class="cost form-control" style="width:100%; margin:5px auto" id="satTurnOver" name="satTO" value="${satTurnOver}"></td>
										 		    	<td><input type="text" class="cost form-control" style="width:100%; margin:5px auto" id="sunTurnOver" name="sunTO" value="${sunTurnOver}"></td>
										 		    </tr>
											 		<tr> 
											 			<th class="thclass">Turnover Split</th>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="monFoodTS" name="monFoodTS" value="${monFoodTS}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="monBeverageTS" name="monBeverageTS" value="${monBeverageTS}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="tueFoodTS" name="tueFoodTS" value="${tueFoodTS}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="tueBeverageTS" name="tueBeverageTS" value="${tueBeverageTS}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="wedFoodTS" name="wedFoodTS" value="${wedFoodTS}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" name="wedBeverageTS" value="${wedBeverageTS}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="thurFoodTS" name="thurFoodTS" value="${thurFoodTS}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="thurBeverageTS" name="thurBeverageTS" value="${thurBeverageTS}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="friFoodTS" name="friFoodTS" value="${friFoodTS}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto" id="friBeverageTS" name="friBeverageTS" value="${friBeverageTS}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food</th>
											 						<th align="center"class="thclass">Beverage</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="satFoodTS" name="satFoodTS" value="${satFoodTS}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="satBeverageTS" name="satBeverageTS" value="${satBeverageTS}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="sunFoodTS" name="sunFoodTS" value="${sunFoodTS}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="sunBeverageTS" name="sunBeverageTS" value="${sunBeverageTS}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 		</tr>
											 		<tr>				 			 
										 		    	<th class="thclass">Cost Of Goods</th>
										 		    	<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="monFoodCost" name="monFoodCost" value="${monFoodCost}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="monBeverageCost" name="monBeverageCost" value="${monBeverageCost}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="tueFoodCost" name="tueFoodCost" value="${tueFoodCost}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="tueBeverageCost" name="tueBeverageCost" value="${tueBeverageCost}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="wedFoodCost" name="wedFoodCost" value="${wedFoodCost}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="wedBeverageCost" name="wedBeverageCost" value="${wedBeverageCost}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="thurFoodCost" name="thurFoodCost" value="${thurFoodCost}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="thurBeverageCost" name="thurBeverageCost" value="${thurBeverageCost}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="friFoodCost" name="friFoodCost" value="${friFoodCost}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="friBeverageCost" name="friBeverageCost" value="${friBeverageCost}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="satFoodCost" name="satFoodCost" value="${satFoodCost}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="satBeverageCost" name="satBeverageCost" value="${satBeverageCost}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
											 			<td>
											 				<table>
											 					<tr>
											 						<th align="center" class="thclass">Food (%)</th>
											 						<th align="center"class="thclass">Beverage (%)</th>
											 					</tr>
											 					<tr>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto" id="sunFoodCost" name="sunFoodCost" value="${sunFoodCost}">
											 						</td>
											 						<td>
											 							<input type="text" class="cost form-control" style="width:auto; margin:5px auto auto 10px" id="sunBeverageCost" name="sunBeverageCost" value="${sunBeverageCost}">
											 						</td>
											 					</tr>
											 				</table>
											 			</td>
										 		    </tr>
											 		
												<%-- </c:forEach>	 --%>
										</tbody>  	
										</table>
									</form>
									<br />
									<!-- <div class="scroll-slider"></div> -->
								</div>
								
								<div id="weekdayandservice_budget_setting${incomeCenter.incomeCentreId}" class="budgetDiv box divScroll weekdayandservice_budget_setting"> 
									<form method="post" id="weekdayandserviceBudget${incomeCenter.incomeCentreId}" name="weekdayandserviceBudget${incomeCenter.incomeCentreId}">	
										<table id="weekdayandservicebudget${loop.index}" class="ServiceBudgate table table-bordered" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
											<tbody>
												<tbody>
								                  <tr>
								                  	<th  class="thclass"></th>
								                    <th style="text-align:center;" class="thclass">Monday</th>
											        <th style="text-align:center;" class="thclass">Tuesday</th>
											        <th style="text-align:center;" class="thclass">Wednesday</th>
											        <th style="text-align:center;" class="thclass">Thursday</th>
											        <th style="text-align:center;" class="thclass">Friday</th>
											        <th style="text-align:center;" class="thclass">Satarday</th>
											        <th style="text-align:center;" class="thclass">Sunday</th>
								                  </tr>
								                  
								                  <tr>
								                  
								                  	<c:set var="monBTO" value=""/> <c:set var="monBFoodTS" value=""/> <c:set var="monBBeverageTS" value=""/> <c:set var="monBFoodCost" value=""/> <c:set var="monBBeverageCost" value=""/>
													<c:set var="tueBTO" value=""/> <c:set var="tueBFoodTS" value=""/> <c:set var="tueBBeverageTS" value=""/> <c:set var="tueBFoodCost" value=""/> <c:set var="tueBBeverageCost" value=""/>
													<c:set var="wedBTO" value=""/> <c:set var="wedBFoodTS" value=""/> <c:set var="wedBBeverageTS" value=""/> <c:set var="wedBFoodCost" value=""/> <c:set var="wedBBeverageCost" value=""/> 
													<c:set var="thurBTO" value=""/> <c:set var="thurBFoodTS" value=""/> <c:set var="thurBBeverageTS" value=""/> <c:set var="thurBFoodCost" value=""/> <c:set var="thurBBeverageCost" value=""/>
													<c:set var="friBTO" value=""/> <c:set var="friBFoodTS" value=""/> <c:set var="friBBeverageTS" value=""/> <c:set var="friBFoodCost" value=""/> <c:set var="friBBeverageCost" value=""/>
													<c:set var="satBTO" value=""/> <c:set var="satBFoodTS" value=""/> <c:set var="satBBeverageTS" value=""/> <c:set var="satBFoodCost" value=""/> <c:set var="satBBeverageCost" value=""/>
													<c:set var="sunBTO" value=""/> <c:set var="sunBFoodTS" value=""/> <c:set var="sunBBeverageTS" value=""/> <c:set var="sunBFoodCost" value=""/> <c:set var="sunBBeverageCost" value=""/>
													
													<c:set var="monLTO" value=""/> <c:set var="monLFoodTS" value=""/> <c:set var="monLBeverageTS" value=""/> <c:set var="monLFoodCost" value=""/> <c:set var="monLBeverageCost" value=""/>
													<c:set var="tueLTO" value=""/> <c:set var="tueLFoodTS" value=""/> <c:set var="tueLBeverageTS" value=""/> <c:set var="tueLFoodCost" value=""/> <c:set var="tueLBeverageCost" value=""/>
													<c:set var="wedLTO" value=""/> <c:set var="wedLFoodTS" value=""/> <c:set var="wedLBeverageTS" value=""/> <c:set var="wedLFoodCost" value=""/> <c:set var="wedLBeverageCost" value=""/> 
													<c:set var="thurLTO" value=""/> <c:set var="thurLFoodTS" value=""/> <c:set var="thurLBeverageTS" value=""/> <c:set var="thurLFoodCost" value=""/> <c:set var="thurLBeverageCost" value=""/>
													<c:set var="friLTO" value=""/> <c:set var="friLFoodTS" value=""/> <c:set var="friLBeverageTS" value=""/> <c:set var="friLFoodCost" value=""/> <c:set var="friLBeverageCost" value=""/>
													<c:set var="satLTO" value=""/> <c:set var="satLFoodTS" value=""/> <c:set var="satLBeverageTS" value=""/> <c:set var="satLFoodCost" value=""/> <c:set var="satLBeverageCost" value=""/>
													<c:set var="sunLTO" value=""/> <c:set var="sunLFoodTS" value=""/> <c:set var="sunLBeverageTS" value=""/> <c:set var="sunLFoodCost" value=""/> <c:set var="sunLBeverageCost" value=""/>
													
													<c:set var="monDTO" value=""/> <c:set var="monDFoodTS" value=""/> <c:set var="monDBeverageTS" value=""/> <c:set var="monDFoodCost" value=""/> <c:set var="monDBeverageCost" value=""/>
													<c:set var="tueDTO" value=""/> <c:set var="tueDFoodTS" value=""/> <c:set var="tueDBeverageTS" value=""/> <c:set var="tueDFoodCost" value=""/> <c:set var="tueDBeverageCost" value=""/>
													<c:set var="wedDTO" value=""/> <c:set var="wedDFoodTS" value=""/> <c:set var="wedDBeverageTS" value=""/> <c:set var="wedDFoodCost" value=""/> <c:set var="wedDBeverageCost" value=""/>
													<c:set var="thurDTO" value=""/> <c:set var="thurDFoodTS" value=""/> <c:set var="thurDBeverageTS" value=""/> <c:set var="thurDFoodCost" value=""/> <c:set var="thurDBeverageCost" value=""/>
													<c:set var="friDTO" value=""/> <c:set var="friDFoodTS" value=""/> <c:set var="friDBeverageTS" value=""/> <c:set var="friDFoodCost" value=""/> <c:set var="friDBeverageCost" value=""/>
													<c:set var="satDTO" value=""/> <c:set var="satDFoodTS" value=""/> <c:set var="satDBeverageTS" value=""/> <c:set var="satDFoodCost" value=""/> <c:set var="satDBeverageCost" value=""/>
													<c:set var="sunDTO" value=""/> <c:set var="sunDFoodTS" value=""/> <c:set var="sunDBeverageTS" value=""/> <c:set var="sunDFoodCost" value=""/> <c:set var="sunDBeverageCost" value=""/>
								                  
								                  <c:if test="${budget.budget_type == 4}">
												 		    <c:set var="monBTO" value="${budget.settings[0].turnover}"/> <c:set var="monBFoodTS" value="${budget.settings[0].food_income}"/>
															<c:set var="monBBeverageTS" value="${budget.settings[0].bev_income}"/> <c:set var="monBFoodCost" value="${budget.settings[0].food_cost_pct}"/>
															<c:set var="monBBeverageCost" value="${budget.settings[0].bev_cost_pct}"/>
															<c:set var="tueBTO" value="${budget.settings[1].turnover}"/> <c:set var="tueBFoodTS" value="${budget.settings[1].food_income}"/>
															<c:set var="tueBBeverageTS" value="${budget.settings[1].bev_income}"/> <c:set var="tueBFoodCost" value="${budget.settings[1].food_cost_pct}"/>
															<c:set var="tueBBeverageCost" value="${budget.settings[1].bev_cost_pct}"/>
															<c:set var="wedBTO" value="${budget.settings[2].turnover}"/> <c:set var="wedBFoodTS" value="${budget.settings[2].food_income}"/>
															<c:set var="wedBBeverageTS" value="${budget.settings[2].bev_income}"/> <c:set var="wedBFoodCost" value="${budget.settings[2].food_cost_pct}"/>
															<c:set var="wedBBeverageCost" value="${budget.settings[2].bev_cost_pct}"/>
															<c:set var="thurBTO" value="${budget.settings[3].turnover}"/> <c:set var="thurBFoodTS" value="${budget.settings[3].food_income}"/>
															<c:set var="thurBBeverageTS" value="${budget.settings[3].bev_income}"/> <c:set var="thurBFoodCost" value="${budget.settings[3].food_cost_pct}"/>
															<c:set var="thurBBeverageCost" value="${budget.settings[3].bev_cost_pct}"/>
															<c:set var="friBTO" value="${budget.settings[4].turnover}"/> <c:set var="friBFoodTS" value="${budget.settings[4].food_income}"/>
															<c:set var="friBBeverageTS" value="${budget.settings[4].bev_income}"/> <c:set var="friBFoodCost" value="${budget.settings[4].food_cost_pct}"/>
															<c:set var="friBBeverageCost" value="${budget.settings[4].bev_cost_pct}"/>
															<c:set var="satBTO" value="${budget.settings[5].turnover}"/> <c:set var="satBFoodTS" value="${budget.settings[5].food_income}"/>
															<c:set var="satBBeverageTS" value="${budget.settings[5].bev_income}"/> <c:set var="satBFoodCost" value="${budget.settings[5].food_cost_pct}"/>
															<c:set var="satBBeverageCost" value="${budget.settings[5].bev_cost_pct}"/>
															<c:set var="sunBTO" value="${budget.settings[6].turnover}"/> <c:set var="sunBFoodTS" value="${budget.settings[6].food_income}"/>
															<c:set var="sunBBeverageTS" value="${budget.settings[6].bev_income}"/> <c:set var="sunBFoodCost" value="${budget.settings[6].food_cost_pct}"/>
															<c:set var="sunBBeverageCost" value="${budget.settings[6].bev_cost_pct}"/>
															
															<c:set var="monLTO" value="${budget.settings[7].turnover}"/> <c:set var="monLFoodTS" value="${budget.settings[7].food_income}"/>
															<c:set var="monLBeverageTS" value="${budget.settings[7].bev_income}"/> <c:set var="monLFoodCost" value="${budget.settings[7].food_cost_pct}"/>
															<c:set var="monLBeverageCost" value="${budget.settings[7].bev_cost_pct}"/>
															<c:set var="tueLTO" value="${budget.settings[8].turnover}"/> <c:set var="tueLFoodTS" value="${budget.settings[8].food_income}"/>
															<c:set var="tueLBeverageTS" value="${budget.settings[8].bev_income}"/> <c:set var="tueLFoodCost" value="${budget.settings[8].food_cost_pct}"/>
															<c:set var="tueLBeverageCost" value="${budget.settings[8].bev_cost_pct}"/>
															<c:set var="wedLTO" value="${budget.settings[9].turnover}"/> <c:set var="wedLFoodTS" value="${budget.settings[9].food_income}"/>
															<c:set var="wedLBeverageTS" value="${budget.settings[9].bev_income}"/> <c:set var="wedLFoodCost" value="${budget.settings[9].food_cost_pct}"/>
															<c:set var="wedLBeverageCost" value="${budget.settings[9].bev_cost_pct}"/>
															<c:set var="thurLTO" value="${budget.settings[10].turnover}"/> <c:set var="thurLFoodTS" value="${budget.settings[10].food_income}"/>
															<c:set var="thurLBeverageTS" value="${budget.settings[10].bev_income}"/> <c:set var="thurLFoodCost" value="${budget.settings[10].food_cost_pct}"/>
															<c:set var="thurLBeverageCost" value="${budget.settings[10].bev_cost_pct}"/>
															<c:set var="friLTO" value="${budget.settings[11].turnover}"/> <c:set var="friLFoodTS" value="${budget.settings[11].food_income}"/>
															<c:set var="friLBeverageTS" value="${budget.settings[11].bev_income}"/> <c:set var="friLFoodCost" value="${budget.settings[11].food_cost_pct}"/>
															<c:set var="friLBeverageCost" value="${budget.settings[11].bev_cost_pct}"/>
															<c:set var="satLTO" value="${budget.settings[12].turnover}"/> <c:set var="satLFoodTS" value="${budget.settings[12].food_income}"/>
															<c:set var="satLBeverageTS" value="${budget.settings[12].bev_income}"/> <c:set var="satLFoodCost" value="${budget.settings[12].food_cost_pct}"/>
															<c:set var="satLBeverageCost" value="${budget.settings[12].bev_cost_pct}"/>
															<c:set var="sunLTO" value="${budget.settings[13].turnover}"/> <c:set var="sunLFoodTS" value="${budget.settings[13].food_income}"/>
															<c:set var="sunLBeverageTS" value="${budget.settings[13].bev_income}"/> <c:set var="sunLFoodCost" value="${budget.settings[13].food_cost_pct}"/>
															<c:set var="sunLBeverageCost" value="${budget.settings[13].bev_cost_pct}"/>
															
															<c:set var="monDTO" value="${budget.settings[14].turnover}"/> <c:set var="monDFoodTS" value="${budget.settings[14].food_income}"/>
															<c:set var="monDBeverageTS" value="${budget.settings[14].bev_income}"/> <c:set var="monDFoodCost" value="${budget.settings[14].food_cost_pct}"/>
															<c:set var="monDBeverageCost" value="${budget.settings[14].bev_cost_pct}"/>
															<c:set var="tueDTO" value="${budget.settings[15].turnover}"/> <c:set var="tueDFoodTS" value="${budget.settings[15].food_income}"/>
															<c:set var="tueDBeverageTS" value="${budget.settings[15].bev_income}"/> <c:set var="tueDFoodCost" value="${budget.settings[15].food_cost_pct}"/>
															<c:set var="tueDBeverageCost" value="${budget.settings[15].bev_cost_pct}"/>
															<c:set var="wedDTO" value="${budget.settings[16].turnover}"/> <c:set var="wedDFoodTS" value="${budget.settings[16].food_income}"/>
															<c:set var="wedDBeverageTS" value="${budget.settings[16].bev_income}"/> <c:set var="wedDFoodCost" value="${budget.settings[16].food_cost_pct}"/>
															<c:set var="wedDBeverageCost" value="${budget.settings[16].bev_cost_pct}"/>
															<c:set var="thurDTO" value="${budget.settings[17].turnover}"/> <c:set var="thurDFoodTS" value="${budget.settings[17].food_income}"/>
															<c:set var="thurDBeverageTS" value="${budget.settings[17].bev_income}"/> <c:set var="thurDFoodCost" value="${budget.settings[17].food_cost_pct}"/>
															<c:set var="thurDBeverageCost" value="${budget.settings[17].bev_cost_pct}"/>
															<c:set var="friDTO" value="${budget.settings[18].turnover}"/> <c:set var="friDFoodTS" value="${budget.settings[18].food_income}"/>
															<c:set var="friDBeverageTS" value="${budget.settings[18].bev_income}"/> <c:set var="friDFoodCost" value="${budget.settings[18].food_cost_pct}"/>
															<c:set var="friDBeverageCost" value="${budget.settings[18].bev_cost_pct}"/>
															<c:set var="satDTO" value="${budget.settings[19].turnover}"/> <c:set var="satDFoodTS" value="${budget.settings[19].food_income}"/>
															<c:set var="satDBeverageTS" value="${budget.settings[19].bev_income}"/> <c:set var="satDFoodCost" value="${budget.settings[19].food_cost_pct}"/>
															<c:set var="satDBeverageCost" value="${budget.settings[19].bev_cost_pct}"/>
															<c:set var="sunDTO" value="${budget.settings[20].turnover}"/> <c:set var="sunDFoodTS" value="${budget.settings[20].food_income}"/>
															<c:set var="sunDBeverageTS" value="${budget.settings[20].bev_income}"/> <c:set var="sunDFoodCost" value="${budget.settings[20].food_cost_pct}"/>
															<c:set var="sunDBeverageCost" value="${budget.settings[20].bev_cost_pct}"/>
												 		    	
											 		    </c:if>
								                  	<th class="thclass" style="text-align:left;">Breakfast</th>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  			<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monBTO" name="monBTO" value="${monBTO}">
										                  		</td>
										                  		<td>
										                  			<table>
									                  				<tr>
												 						<th align="center" class="thclass">Food (%)</th>
												 						<th align="center"class="thclass">Beverage (%)</th>
											 						</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monBFoodTS" name="monBFoodTS" value="${monBFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="monBBeverageTS" name="monBBeverageTS" value="${monBBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monBFoodCost" name="monBFoodCost" value="${monBFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monBBeverageCost" name="monBBeverageCost" value="${monBBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueBTO" name="tueBTO" value="${tueBTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food</th>
													 						<th align="center"class="thclass">Beverage</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueBFoodTS" name="tueBFoodTS" value="${tueBFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueBBeverageTS" name="tueBBeverageTS" value="${tueBBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueBFoodCost" name="tueBFoodCost" value="${tueBFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueBBeverageCost" name="tueBBeverageCost" value="${tueBBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedBTO" name="wedBTO" value="${wedBTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedBFoodTS" name="wedBFoodTS" value="${wedBFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedBBeverageTS" name="wedBBeverageTS" value="${wedBBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedBFoodCost" name="wedBFoodCost" value="${wedBFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedBBeverageCost" name="wedBBeverageCost" value="${wedBBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurBTO" name="thurBTO" value="${thurBTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurBFoodTS" name="thurBFoodTS" value="${thurBFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurBBeverageTS" name="thurBBeverageTS" value="${thurBBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurBFoodCost" name="thurBFoodCost" value="${thurBFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurBBeverageCost" name="thurBBeverageCost" value="${thurBBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friBTO" name="friBTO" value="${friBTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="friBFoodTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="friBFoodTS" value="${friBFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" id="friBBeverageTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="friBBeverageTS" value="${friBBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="friBFoodCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="friBFoodCost" value="${friBFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" id="friBBeverageCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="friBBeverageCost" value="${friBBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satBTO" name="satBTO" value="${satBTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="satBFoodTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="satBFoodTS" value="${satBFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" id="satBBeverageTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="satBBeverageTS" value="${satBBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="satBFoodCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="satBFoodCost" value="${satBFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" id="satBBeverageCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="satBBeverageCost" value="${satBBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunBTO" name="sunBTO" value="${sunBTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="sunBFoodTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="sunBFoodTS" value="${sunBFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" id="sunBBeverageTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="sunBBeverageTS" value="${sunBBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="sunBFoodCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="sunBFoodCost" value="${sunBFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" id="sunBBeverageCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="sunBBeverageCost" value="${sunBBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>	                  	
								                  </tr>
								                   <tr>
								                  	<th class="thclass" style="text-align:left;">Lunch</th>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  			<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monLTO" name="monLTO" value="${monLTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="monLFoodTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="monLFoodTS" value="${monLFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" id="monLBeverageTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="monLBeverageTS" value="${monLBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="monLFoodCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="monLFoodCost" value="${monLFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" id="monLBeverageCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="monLBeverageCost" value="${monLBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		  	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueLTO" name="tueLTO" value="${tueLTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="tueLFoodTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="tueLFoodTS" value="${tueLFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" id="tueLBeverageTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="tueLBeverageTS" value="${tueLBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="tueLFoodCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="tueLFoodCost" value="${tueLFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" id="tueLBeverageCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="tueLBeverageCost" value="${tueLBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" id="wedLTO" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="wedLTO" value="${wedLTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="wedLFoodTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="wedLFoodTS" value="${wedLFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" id="wedLBeverageTS" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="wedLBeverageTS" value="${wedLBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" id="wedLFoodCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="wedLFoodCost" value="${wedLFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" id="wedLBeverageCost" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" name="wedLBeverageCost" value="${wedLBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurLTO" name="thurLTO" value="${thurLTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurLFoodTS" name="thurLFoodTS" value="${thurLFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurLBeverageTS" name="thurLBeverageTS" value="${thurLBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurLFoodCost" name="thurLFoodCost" value="${thurLFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurLBeverageCost" name="thurLBeverageCost" value="${thurLBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friLTO" name="friLTO" value="${friLTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friLFoodTS" name="friLFoodTS" value="${friLFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friLBeverageTS" name="friLBeverageTS" value="${friLBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friLFoodCost" name="friLFoodCost" value="${friLFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friLBeverageCost" name="friLBeverageCost" value="${friLBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satLTO" name="satLTO" value="${satLTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satLFoodTS" name="satLFoodTS" value="${satLFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satLBeverageTS" name="satLBeverageTS" value="${satLBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satLFoodCost" name="satLFoodCost" value="${satLFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satLBeverageCost" name="satLBeverageCost" value="${satLBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunLTO" name="sunLTO" value="${sunLTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunLFoodTS" name="sunLFoodTS" value="${sunLFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunLBeverageTS" name="sunLBeverageTS" value="${sunLBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunLFoodCost" name="sunLFoodCost" value="${sunLFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunLBeverageCost" name="sunLBeverageCost" value="${sunLBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>	                  	
								                  </tr>
								                   <tr>
								                  	<th class="thclass" style="text-align:left;">Dinner</th>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
									                  		 		<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monDTO" name="monDTO" value="${monDTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monDFoodTS" name="monDFoodTS" value="${monDFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monDBeverageTS" name="monDBeverageTS" value="${monDBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monDFoodCost" name="monDFoodCost" value="${monDFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="monDBeverageCost" name="monDBeverageCost" value="${monDBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueDTO" name="tueDTO" value="${tueDTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueDFoodTS" name="tueDFoodTS" value="${tueDFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueDBeverageTS" name="tueDBeverageTS" value="${tueDBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueDFoodCost" name="tueDFoodCost" value="${tueDFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="tueDBeverageCost" name="tueDBeverageCost" value="${tueDBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedDTO" name="wedDTO" value="${wedDTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedDFoodTS" name="wedDFoodTS" value="${wedDFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedDBeverageTS" name="wedDBeverageTS" value="${wedDBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedDFoodCost" name="wedDFoodCost" value="${wedDFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="wedDBeverageCost" name="wedDBeverageCost" value="${wedDBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurDTO" name="thurDTO" value="${thurDTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;"  id="thurDFoodTS" name="thurDFoodTS" value="${thurDFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurDBeverageTS" name="thurDBeverageTS" value="${thurDBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:90%; margin:5px auto;" id="thurDFoodCost" name="thurDFoodCost" value="${thurDFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="thurDBeverageCost" name="thurDBeverageCost" value="${thurDBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friDTO" name="friDTO" value="${friDTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friDFoodTS" name="friDFoodTS" value="${friDFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friDBeverageTS" name="friDBeverageTS" value="${friDBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friDFoodCost" name="friDFoodCost" value="${friDFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="friDBeverageCost" name="friDBeverageCost" value="${friDBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satDTO" name="satDTO" value="${satDTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satDFoodTS" name="satDFoodTS" value="${satDFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satDBeverageTS" name="satDBeverageTS" value="${satDBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satDFoodCost" name="satDFoodCost" value="${satDFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="satDBeverageCost" name="satDBeverageCost" value="${satDBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>
								                  	<td>
								                  		<table>
								                  			<tr>
								                  				<th style="text-align:center;" class="thclass">Turnover ($)</th>
											                    <th style="text-align:center;" class="thclass">Turnover split</th>
											                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
										                  	</tr>
										                  	<tr>
										                  		<td class="padding-bottom">
										                  		 	<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunDTO" name="sunDTO" value="${sunDTO}">
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunDFoodTS" name="sunDFoodTS" value="${sunDFoodTS}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunDBeverageTS" name="sunDBeverageTS" value="${sunDBeverageTS}">
													 						</td> 
										                  				</tr>
										                  			</table>
										                  		</td>
										                  		<td>
										                  			<table>
										                  				<tr>
													 						<th align="center" class="thclass">Food (%)</th>
													 						<th align="center"class="thclass">Beverage (%)</th>
											 							</tr>
										                  				<tr>
										                  					<td>
										                  						<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunDFoodCost" name="sunDFoodCost" value="${sunDFoodCost}">
												 							</td>
													 						<td>
													 							<input type="text" class="cost form-control" style="width:auto; margin:5px 10px auto auto;" id="sunDBeverageCost" name="sunDBeverageCost" value="${sunDBeverageCost}">
													 						</td> 
										                  				</tr>
										                  			</table>	
										                  		</td>
										                  	</tr>
								                  		</table>
								                  	</td>	                  	
								                  </tr>
										
											</tbody>					
										</table>
									</form>
									<br />
									<!-- <div class="scroll-slider"></div> -->
								</div>								
                    			</div>
                    			<%-- </c:forEach> --%>
                    			</div>
		      				</div>
						 
						 
						 <div class="accordion-manual" style="width: 70%">
								<div class="accordion-manual-header"  style="background-color:#6ca51b;">
								  <table width="20%" border="0" cellspacing="2" cellpadding="0">
								    <tr>
								      <td width="17%" class="pad-left20"><img src="images/other-icon.png" width="24" height="24" /></td>
								      <td width="83%">Other</td>
							        </tr>
							      </table>
								</div>
						        <div id="income-center-content" class="accordion-manual-content" style="display:block">
						        <div id="income-center-general${incomeCenter.incomeCentreId }" class="income-center-other">
						        	<form action="" id="income-center-other${incomeCenter.incomeCentreId }" name="income-center-other${incomeCenter.incomeCentreId }">
							      	<div class="table-responsive">
							      	<table id="ServiceEevnt" width="100%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5" class="table table-bordered">
										       <tbody>
								                  <%-- <tr>				
													<th class="thclass">Income Center Name </th> 
													<th class="thclass">Location</th>
													<th class="thclass">Slush %</th>
													<th class="thclass">Fees %</th>
													<th class="thclass">Food Cost % </th> 
													<th class="thclass">Beverage Cost % </th> 
													<th class="thclass">Food Income % </th> 
													<th class="thclass">Beverage Income % </th>
								                  </tr>
										 		
											 		<tr>
			 											<td style="text-align: center;">
											 				<a href= "javaScript:void(0);" onclick="editSettingIncomeCenter(${incomeCenter.incomeCentreId })" >${incomeCenter.icName }</a></td>			
											 			<td style="text-align: center;">${incomeCenter.location }</td>
														<td style="text-align: center;">${incomeCenter.slush }</td>
														<td style="text-align: center;">${incomeCenter.fees }</td>
														<td style="text-align: center;">${incomeCenter.foodCost }</td>
														<td style="text-align: center;">${incomeCenter.beverageCost }</td>
														<td style="text-align: center;">${incomeCenter.foodIncome }</td>
														<td style="text-align: center;">${incomeCenter.beverageIncome }</td>
											 		</tr> --%>
											 		
											 		<tr>
											 			<td>
											 				<fieldset style="width: 100%">
											 				 <legend>Sales</legend>
											 				 <table>	
															<tr>
															<td>
															<table>
																<tr>
																	<td> Restaurant : </td>
																	<td>
																		<div class="checkbox" style="margin:6px 10px 0 -10px">
																	          <label style="font-size:14px">
																		           <input type="checkbox" value="">
																		           <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
																					<c:choose>
																						<c:when test="${incomeCenter.restaurant  == 'true'}">
																							<input type="checkbox" name="restaurant" id="restaurant" onclick="updateOtherIC(${incomeCenter.incomeCentreId })" checked="checked" value="${incomeCenter.restaurant }">	
																						</c:when>
																						<c:otherwise>
																							<input type="checkbox" name="restaurant" id="restaurant" onclick="updateOtherIC(${incomeCenter.incomeCentreId })" value="${incomeCenter.restaurant }">	
																						</c:otherwise>
																					</c:choose>
																					</span>
																				</label>
																				</div>	
																	</td>	
																	<td> Cafe : </td>
																	<td>
																	<div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="" >
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
																		<c:choose>
																				<c:when test="${incomeCenter.cafe == 'true'}">
																					<input type="checkbox" name="cafe" id="cafe" checked="checked" value="${incomeCenter.cafe }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																				</c:when>
																				<c:otherwise>
																					<input type="checkbox" name="cafe" id="cafe" value="${incomeCenter.cafe }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																				</c:otherwise>
																		</c:choose>
																		</span>
																		</label>
																		</div>
																	</td>
																	<td> Takeaway : </td>
																	<td>
																	<div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="" checked="checked">
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>				
																		<c:choose>
																			<c:when test="${incomeCenter.takeAway  == 'true'}">
																				<input type="checkbox" name="takeAway" id="takeAway" checked="checked" value="${incomeCenter.takeAway }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" name="takeAway" id="takeAway" value="${incomeCenter.takeAway }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																			</c:otherwise>
																		</c:choose>
																		</span>
																		</label>
																		</div>
																	</td>
																	<td>Bar :</td>
																	<td>
																	<div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="" checked="checked">
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>				
																		<c:choose>
																			<c:when test="${incomeCenter.bar  == 'true'}">
																				<input type="checkbox" name="bar" id="bar" checked="checked" value="${incomeCenter.bar}" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" name="bar" id="bar" value="${incomeCenter.bar}" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																			</c:otherwise>
																		</c:choose>
																		</span>
																		</label>
																		</div>
																	</td>	
																	<td> Deli :</td>
																	<td>
																	<div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="" >
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>				
																		<c:choose>
																			<c:when test="${incomeCenter.deli  == 'true'}">
																				<input type="checkbox" name="deli" id="deli" checked="checked" value="${incomeCenter.deli }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" name="deli" id="deli" value="${incomeCenter.deli }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																			</c:otherwise>
																		</c:choose>
																		</span>
																		</label>
																		</div>
																	</td>
																	<td>Retail : </td>
																	<td>
																	<div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="" checked="checked">
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>				
																		<c:choose>
																			<c:when test="${incomeCenter.retail  == 'true'}">
																				<input type="checkbox" name="retail" id="retail" checked="checked" value="${incomeCenter.retail }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																			</c:when>
																			<c:otherwise>
																				<input type="checkbox" name="retail" id="retail" value="${incomeCenter.retail }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																			</c:otherwise>
																		</c:choose>
																		</span>
																		</label>
																		</div>
																	</td>	
																	</tr>
																</table>
																</td>
																</tr>
																
																<tr>
																	<td>
																		<table>
																			<tr>
																				<td> Catering  :</td>
																				<td>
																				<div class="checkbox" style="margin:6px 10px 0 2px">
																		          <label style="font-size:14px">
																		            <input type="checkbox" value="" >
																		            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>				
																					<c:choose>
																						<c:when test="${incomeCenter.catering  == 'true'}">
																							<input type="checkbox" name="catering" id="catering" checked="checked" value="${incomeCenter.catering }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:when>
																						<c:otherwise>
																							<input type="checkbox" name="catering" id="catering" value="${incomeCenter.catering }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:otherwise>
																					</c:choose>
																					</span>
																					</label>
																					</div>
																				</td>
																				<td>Delivery :</td>
																				<td>
																				<div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="">
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>				
																					<c:choose>
																						<c:when test="${incomeCenter.delivery  == 'true'}">
																							<input type="checkbox" name="delivery" id="delivery" checked="checked" value="${incomeCenter.delivery }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:when>
																						<c:otherwise>
																							<input type="checkbox" name="delivery" id="delivery" value="${incomeCenter.delivery }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:otherwise>
																					</c:choose>
																					</span>
																					</label>
																					</div>
																				</td>	
																				<td> Events : </td>
																				<td>
																				<div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="">
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>				
																					<c:choose>
																						<c:when test="${incomeCenter.event  == 'true'}">
																							<input type="checkbox" name="event" id="event" checked="checked" value="${incomeCenter.event }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:when>
																						<c:otherwise>
																							<input type="checkbox" name="event" id="event" value="${incomeCenter.event }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:otherwise>
																					</c:choose>
																					</span>
																					</label>
																					</div>
																					</td>
																				<td> Room Service : </td>
																				<td>
																				<div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="" checked="checked">
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
																				<c:choose>
																						<c:when test="${incomeCenter.roomService  == 'true'}">
																							<input type="checkbox" name="roomService" id="roomService" checked="checked" value="${incomeCenter.roomService }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:when>
																						<c:otherwise>
																							<input type="checkbox" name="roomService" id="roomService" value="${incomeCenter.roomService }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:otherwise>
																					</c:choose>
																					</span>
																					</label>
																					</div>
																					</td>
																				<td> Custom 1: </td>
																				<td>
																				<div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="" >
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>				
																					<c:choose>
																						<c:when test="${incomeCenter.custom1  == 'true'}">
																							<input type="checkbox" name="custom1" id="custom1" checked="checked" value="${incomeCenter.custom1 }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:when>
																						<c:otherwise>
																							<input type="checkbox" name="custom1" id="custom1" value="${incomeCenter.custom1 }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:otherwise>
																					</c:choose>
																					</span>
																					</label>
																					</div>
																				</td>
																				 <td> Custom 2:</td>			 	
																				 <td>
																				 <div class="checkbox" style="margin:6px 10px 0 -10px">
																          <label style="font-size:14px">
																            <input type="checkbox" value="" >
																            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok chk-pad"></i>
																				 	<c:choose>
																						<c:when test="${incomeCenter.custom2  == 'true'}">
																							<input type="checkbox" name="custom2" id="custom2" checked="checked" value="${incomeCenter.custom2 }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:when>
																						<c:otherwise>
																							<input type="checkbox" name="custom2" id="custom2" value="${incomeCenter.custom2 }" onchange="updateOtherIC(${incomeCenter.incomeCentreId })">	
																						</c:otherwise>
																					</c:choose>
																					</span>
																					</label>
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																</table>
																</fieldset>
																<fieldset style="width: 100%">
																<legend>Tips</legend>
																<table>
																	<tr>
																		<td>Fees : </td>
																		<td><span style="float:left; margin:0 5px 0 10px"><input type="text" class="cost form-control" name="fees" value="${incomeCenter.fees }" id="fees" size="6" onblur="updateOtherIC(${incomeCenter.incomeCentreId })"></span>
																		<span style="margin:8px 10px 0 0 !important; float:left">%</span>
																		</td>
																		<td>Slush : </td>
																		<td><span style="float:left; margin:0 5px 0 10px"><input type="text" class="cost form-control" name="slush" value="${incomeCenter.slush }"  id="slush" size="6" onblur="updateOtherIC(${incomeCenter.incomeCentreId })"></span>
																		<span style="margin:8px 10px 0 0 !important; float:left">%</span>
																		</td>
																	</tr>
																</table>
															</fieldset>
												</tbody> 		
											</table>
											</div>
											</form>
										</div>
						  			</div>
							 </div>
						 
				       	</div>
					 </div>
				 </c:forEach>
		</div>
	</div>
	<div class="modal fade" id="income-center-add-popup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"></div>
<footer class="footer">
	
</footer>
</body>
</html>