 
<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link href="css/fonts.css" rel="stylesheet" media="screen"/>
<link rel="stylesheet" href="css/style.css" media="screen" />
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/respond.src.js"></script>
<script src="js/html5shiv.js"></script>
<script type="text/javascript" src="js/shortcut.js"></script>

<script>
	$( document ).ready(function() {
 		$( "#focusOn" ).focus();
    });
</script>
<script type="text/javascript">
	$(document).ready(function(){
		 var test = true;
		shortcut.add("alt+n", function() {
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
<body  onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
    
    <%@include file="leftNavigation.jsp" %>
	<%@include file="common/header.jsp" %>

 <div class="wrapper" style="width:93%;">
<div class="mainwrapper">
    	<div class="img_wrapper1">
		<div id="focusOn" class="img_box" style="float:left">
        <div class="img_box_strip">
        <div class="title">Income Centers</div>
        </div>
        <div class="icons"><a href="income-centers"><img src="images/image-incomecenter.png" /></a></div>
        </div>
        
        <div class="img_box" style="float:right">
        <div class="img_box_strip">
        <div class="title">Staff</div>
        </div>
        <div class="icons"><a href="staff"><img src="images/image-staff.png" /></a></div>
        </div>
        
        <!--<div class="img_box" style="float:left">
        <div class="img_box_strip">
        <div class="title">Event</div>
        </div>
        <div class="icons"><a href="events"><img src="images/image-event.png" /></a></div>
        </div> -->
        
        
        
        </div><!--- imgwrapper div end -->
        
		<div class="clear"></div>
        
	</div>
</div>
<footer class="footer">

</footer>
</body>
</html>




<%-- <!DOCTYPE html>
<html>
<head> 
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="common/resources.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$("#staff-details_setting").load("staff-list");
		$("#event-details_setting").load("setting-event-list");
		$("#user-details_setting").load("user-list");
		$("#cash-drawers-details_setting").load("setting-cash-drawer-list");
		$("#services-details_setting").load("setting-service-list");
		$("#income-center-details_setting").load("setting-income-center-list");
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
</head>

<body onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="">
    <div id="header-wrap">
	<header class="header" id="Header">
		
			<div class="logo"><a href="home"><img src="images/bb-logo.png" alt="Business Budgeter" title="Business Budgeter"/></a></div>
			<div id="menu" class="nav_menu">
				<ul>
				   <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
				</ul>
			</div>
		
	</header>
	</div>
	<div id ="setting-add-popup">
	</div>
	<div class="wrapper" style="width:93%;">
		<div class="mainwrapper">
		       <!--  <div class="no-accordion">
						<div class="no-accordion-header"> -->
					 <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon_staff.png" width="24" height="24" /></td>
						      <td width="83%">Staff</td>
					        </tr>
					      </table>
						</div>
				       <!--  <div id="staff-details" class="no-accordion-content" style="display:block"> -->
				        	<div id="staff-details" class="accordion-manual-content" style="display:block">
				        	<div id="staff-details_setting">
							</div>
				        </div>
				 </div>
				        <div class="accordion-manual">
						<div class="accordion-manual-header">
						  <table width="20%" border="0" cellspacing="2" cellpadding="0">
						    <tr>
						      <td width="17%" class="pad-left20"><img src="images/icon-event.png" width="24" height="24" /></td>
						      <td width="83%">Event</td>
					        </tr>
					      </table>
						</div>
				        <div id="event-details" class="accordion-manual-content" style="display:block">
				        	<div id="event-details_setting">
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
				 </div>
		</div>
	</div>
	
<footer class="footer">
	
</footer>
</body>
</html> --%>