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
<script type="text/javascript" src="js/shortcut.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		/* $("#staff-details_setting").load("staff-list");
		$("#user-details_setting").load("user-list");
		$("#cash-drawers-details_setting").load("setting-cash-drawer-list");
		$("#services-details_setting").load("setting-service-list");
		$("#income-center-details_setting").load("setting-income-center-list"); */
		$("#all-event-details_setting").load("setting-all-events-list");
		$("#event-details_setting").load("setting-event-list");
		$('#setting-add-popup').hide();
		$('.accordion-manual-header').click(function() {
				//$('.accordion-manual-content').hide();
				$(this).next().slideToggle();
				if($(this).hasClass('active')){
					$('.accordion-manual-header').removeClass('active');
				} else {
					$(this).addClass('active');
				}
			});  
		});
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
			<div class="main-title">
			 	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			   	<tr>
					<td>
				
					</td>     
			   	</tr>
			 	</table>
			 </div>	
		     <!--  	 <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon_staff.png" width="24" height="24" /></td>
						      <td width="83%">Staff</td>
					        </tr>
					      </table>
						</div>
				      	<div id="staff-details" class="accordion-manual-content" style="display:block">
				        	<div id="staff-details_setting">
							</div>
				        </div>
				 </div>
				         
				 <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon-user.png" width="24" height="24" /></td>
						      <td width="83%">Users</td>
					        </tr>
					      </table>
						</div>
				        <div id="new-user" class="accordion-manual-content" style="display:block">
				         
				        	<div id="user-details_setting">
							</div>
				        </div>
				 </div>
				  <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon-cash-drawer.png" width="24" height="24" /></td>
						      <td width="83%">Cash Drawers</td>
					        </tr>
					      </table>
						</div>
				        <div id="new-user" class="accordion-manual-content" style="display:block">
				         
				        	<div id="cash-drawers-details_setting">
							</div>
				        </div>
				 </div>
				  <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon-services.png" width="24" height="24" /></td>
						      <td width="83%">Services</td>
					        </tr>
					      </table>
						</div>
				        <div id="new-user" class="accordion-manual-content" style="display:block">
				         
				        	<div id="services-details_setting">
							</div>
				        </div>
				 </div>
				  <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon-services.png" width="24" height="24" /></td>
						      <td width="83%">Income Centers</td>
					        </tr>
					      </table>
						</div>
				        <div id="new-user" class="accordion-manual-content" style="display:block">
				         
				        	<div id="income-center-details_setting">
							</div>
				        </div>
				 </div> -->
				 
				 <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon-event.png"/></td>
						      <td width="83%">All Events</td>
					        </tr>
					      </table>
						</div>
				        <div id="new-user" class="accordion-manual-content" style="display:block">
				         
				        	<div id="all-event-details_setting">
							</div>
				        </div>
				 </div>
				
				 <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon-event2.png"/></td>
						      <td width="83%">Manage Event</td>
					        </tr>
					      </table>
						</div>
				        <div id="event-details" class="accordion-manual-content" style="display:block">
				        	<div id="event-details_setting">
							</div>
				        </div>
				 </div>
				  
				 
		</div>
	</div>
	<div class="modal fade" id="event-add-popup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"></div>
<footer class="footer">
	
</footer>
</body>
</html>