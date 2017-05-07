<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="robots" content="noindex,nofollow" />
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link href="css/fonts.css" rel="stylesheet" media="screen"/>
<link rel="stylesheet" href="css/style.css" media="screen" />
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/respond.src.js"></script>
<script src="js/html5shiv.js"></script>
<script src="js/script.js"></script>
<script type="text/javascript" src="jquery.ui.timepicker.js?v=0.3.0"></script>
<script src="js/businessBudgeter-ui.js"></script>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/resources/themes/master.css" type="text/css" />
<link
 href="js/jquery/jquery-ui1.8.css" rel="stylesheet" type="text/css" />
 <script src="js/jquery/jquery1.7.2.js" type="text/javascript"></script>
<script src="js/jquery/jquery-ui.min1.8.js" type="text/javascript"></script>
 
 
<script
 src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js"
 type="text/javascript"></script>
<script src="/resources/scripts/mysamplecode.js" type="text/javascript"></script>
 <script type="text/javascript">
 function myFunction() {
 
    var d = new Date();
    var x = document.getElementById("starttime");
    var h = addZero(d.getHours());
    var m = addZero(d.getMinutes());
    var s = addZero(d.getSeconds());
    x.innerHTML = h + ":" + m + ":" + s;
}

</script>
<script type="text/javascript">

 $(document).ready(function() {
 
 var myCounter = 1;
 $(".myDate").datepicker();
  
 $("#moreDates").click(function(){
   
  $('.myTemplate')
   .clone()
   .removeClass("myTemplate")
   .addClass("additionalDate")
   .show()
   .appendTo('#importantDates');
   
  myCounter++;
  $('.additionalDate input[name=inputDate]').each(function(index) {
   $(this).addClass("myDate");
   $(this).attr("name",$(this).attr("name") + myCounter);
  });
   
  $(".myDate").on('focus', function(){
      var $this = $(this);
      if(!$this.data('datepicker')) {
       $this.removeClass("hasDatepicker");
       $this.datepicker();
       $this.datepicker("show");
      }
  });
   
 });
  
});

$(document).ready(function() {
$('.myDate').datepicker("setDate", 'getDate');
$(".nextDate").click(function(){
   var date = $('.myDate').datepicker('getDate');
    date.setTime(date.getTime()+(1000*60*60*24));
    $('.myDate').datepicker("setDate", date);
  });
  
  $(".prevDate").click(function(){
   var date = $('.myDate').datepicker('getDate');
    date.setTime(date.getTime() - (1000*60*60*24));
    $('.myDate').datepicker("setDate", date);
  });
});
</script>
<script>
$(document).ready(function() {
                // create DatePicker from input HTML element
               
	$(function(){
		$("#ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
		$("#ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
		$(".AddStaffTable tr:nth-child(odd)").css("background", "#ffffff");
		$(".AddStaffTable tr:nth-child(even)").css("background", "#f8f8f8");
		
	});
	var countServiceEvent = 3;
	function AddServiceEvent(){
		countServiceEvent++;		
		$('#ServiceEevnt tbody').append("<tr>"+
					"<td>Service/Event Name "+countServiceEvent+"</td>"+
					"<td align='center'><input type='text' class='input' /></td>"+
					"<td align='center'><input type='text' class='input' /></td>"+
				  "</tr>");	
			$("#ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
		$("#ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");	
		 }
		 
	var countAddstaff = 2;
	function Addstaff(){
		countAddstaff++;		
		$('.Addstaff').append("<table class='AddStaffTable' width='100%' bgcolor='#e0e0e0' border='0' style='margin:5px 0 0 0' cellspacing='1' cellpadding='5'>"+
							"<thead>"+
							"<tr><th colspan='5' valign='middle' class='thclass' style='padding:2px 5px 0 5px'>Staff "+countAddstaff+" Name <div class='AddIcon'><img src='images/plus-grey.png' width='26' onClick='Addstaff();' height='26' style='cursor:pointer' /></div></th></tr>"+
							"</thead>"+
							"<tbody>"+
							"<tr>"+
							"<td align='center'><input type='text' class='input' style='text-align:left' value='Start' /></td>"+
							"<td align='center'><input type='text' class='input' style='text-align:left' value='Finish' /></td>"+
							"<td align='center'><input type='text' class='input' style='text-align:left' value='Hours' /></td>"+
							"<td align='left'>Event or Service</td>"+
							"<td align='center'><input type='text' class='input' style='text-align:left value='Income' /></td>"+
							"</tr>"+
							"<tr>"+
							"<td align='center'><input type='text' class='input' style='text-align:left' value='' /></td>"+
							"<td align='center'><input type='text' class='input' style='text-align:left' value='' /></td>"+
							"<td align='center'><input type='text' class='input' /></td>"+
							"<td align='left'>Event</td>"+
							"<td align='center'><input type='text' class='input' style='text-align:left' value='Hours' /></td>"+
							"</tr>"+
							"</tbody>"+
							"</table>");	
							$(".AddStaffTable tr:nth-child(odd)").css("background", "#ffffff");
		$(".AddStaffTable tr:nth-child(even)").css("background", "#f8f8f8");
		 }
		 
		 
	
</script>
<!--[if gte IE 9]>
  <style type="text/css">
    .content_container {
       filter: none;
    }
  </style>
<![endif]-->
</head>
<body>
<div id="header-wrap">
<header class="header" id="Header">

		<div class="logo"><a href="#"><img src="images/bb-logo.png" alt="Business Budgeter" width="300" height="29" title="Business Budgeter"/></a></div>
		<div id="menu" class="nav_menu">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
			</ul>
		</div>
	
</header>
</div>

<form method="post" id="servicefrm" action="cashup-cash" name="servicefrm">
 <div class="wrapper" style="width:93%;">
<div class="mainwrapper">
		<div class="day">  Select Date 
			<a href="#"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevDate">
			</a>&nbsp;<a href="#"><input type="text" class="myDate" name= serviceDate id="serviceDate" value = ${ transactionDate }> </a> 
			<a href="#"><img width="17" height="18" src="images/next.png" class="nextDate" id="nextDate"></a> 
	    <button class="button">Add Service</button></div>
        
    <div id="service-details" class="percentDiv"> 
    
     <table cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" width="100%" id="ServiceEevnt">
      <tbody><tr>
        <th align="center" valign="middle" class="thclass"><input type="checkbox"  name="selectallServices" id="selectallServices" value="" onclick="selectAllServices()" /></th>
        <th align="center" valign="middle" class="thclass">Services</th>
        <th align="center" valign="middle" class="thclass">Start Time </th>
        <th align="center" valign="middle" class="thclass">End Time </th>
        <th align="center" valign="middle" class="thclass">Description</th>
      </tr>
      <c:forEach items="${service}" var="service" varStatus="loop">
      <tr>
        <td align="left" valign="middle"><input type="checkbox" name="check${loop.index}" id="check${loop.index}" value="${service.serviceId }"></td>
        <td align="center" valign="middle"><input type="hidden" value="${service.serviceId }" class="input">${service.serviceName }</td>
        <td align="center" valign="middle"><input type="text" class="input" id="starttime" value="${service.startTime }" onclick="$('#starttime').timepicker();"></td>
        <td align="center" valign="middle"><input type="text" value="${service.endTime }" class="input"></td>
        <td align="center" valign="middle"><input type="text" class="input" value="${service.description }" ></td>
      </tr>
     </c:forEach>
    </tbody></table>
                    
        <a href="cashup-cash"> <button class="button">OK</button> </a>  
      </div>
   
</div>
</div>
</form>
		<div class="clear"></div>
	

<footer class="footer">

</footer>
</body>
</html>
