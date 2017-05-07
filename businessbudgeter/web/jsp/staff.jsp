<!DOCTYPE html>
<html>
<head> 
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="common/resources.jsp" %>
<link rel="stylesheet" href="css/style.css" media="screen" />
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/shortcut.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#staff-details_setting").load("staff-list");
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

<body onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="">

	<%@include file="leftNavigation.jsp" %>
    <%@include file="common/header.jsp" %>
    
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
				 </div>
			<footer class="footer">
			</footer>
		</div>	
	<div class="modal fade" id="setting-add-popup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"></div>
</body>
</html>