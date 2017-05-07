<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="common/resources.jsp" %>
<script>
	function handleChangeInputsPayslipReport(){
		 
		 console.log("incomeCenterId = "+incomeCenterId);
		 
		 window.location = "payslipreports?payslipReportDate="+$("#payslipReportDate").val()+"&incomeCenterId="+$("#incomeCenterId").val();
	} 
    $(document).ready(function () {
    $(':input').click(function() {
	        $(this).select();
		});
        var currentDate = "${payslipReportDate}";
		$( ".myDate" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$('.myDate').datepicker().datepicker("setDate", currentDate);
		$('#payslipReportDate').datepicker("option", "onSelect", function(){handleChangeInputsPayslipReport(); });
		
		$(".nextDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime()+(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    handleChangeInputsPayslipReport();
		  });
		  
		  $(".prevDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime() -(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    
		    handleChangeInputsPayslipReport();
		  });
		 
		  if(incomeCenterId != ""){
		  	$("#incomeCenterId").val("${param.incomeCenterId}");
		  }	
		  
    });
	$(function(){
	$("#ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
		$("#ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
		$(".AddStaffTable tr:nth-child(odd)").css("background", "#ffffff");
		$(".AddStaffTable tr:nth-child(even)").css("background", "#f8f8f8");		
	
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
	
	$(function(){
	var payslipSize = "${paySlipDataSize}";
			var index;
			for(index = 0; index < payslipSize; index++){
				var pubHoliday = parseFloat($("#pubHoliday"+index).text());
				var superPct = parseFloat($("#super"+index).text());
				$("#pubHoliday"+index).text(pubHoliday.toFixed(2));
				$("#super"+index).text(superPct.toFixed(2));
				
		}
	});
</script>

</head>
<body>
	<div id="header-wrap">
	<header class="header" id="Header">
		
			<div class="logo"><img src="images/bb-logo.png" alt="Business Budgeter" title="Business Budgeter"/></div>
			<div id="menu" class="nav_menu">
				<ul>
				  <!-- <li><a href="#">Logout</a></li> -->
				</ul>
			</div>
		<div class="clear"> </div>
	</header>
	</div>
	<div style="width:93%;" class="wrapper">
	<div class="mainwrapper">
    	<div class="accordion-manual">
		<div class="main-title"><table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tbody><tr>
    <td width="20%">Pay Slip  Report</td>
    
     <td width="45%" align="left"> 
				<div class="day" style="text-align:left !important;  padding-top: 24px;"> Date 
					<a href="javascript:void(0)"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevDate">
					</a>&nbsp;<a href="javascript:void(0)"><input type="text" class="myDate" name= payslipReportDate id="payslipReportDate" value = ${ payslipReportDate }> </a> 
					<a href="javascript:void(0)"><img width="17" height="18" src="images/next.png" class="nextDate" id="nextDate"></a> 
			    </div>
			    <div style=" float:left; margin-left:10px;"><select style="width: 159px;" class="input-serch" name="incomeCenterId" id="incomeCenterId" onchange="handleChangeInputsProfitLossReport()">
		      
						<c:if test="${!empty incomeCenterList}">
				        <c:forEach items="${incomeCenterList}" var="income">
							<option value="${income.incomeCentreId}" >${income.icName}</option>
						</c:forEach>
						</c:if>	
		    </select>
		    
			</div>
    </td>
    
    <td>
    	<!-- <a href="reports"><button style="width: 150px;" class="button">Back To Reports</button></a> -->
    	<input type="button" style="width: 150px;" class="button" value="Close This Window" onclick="self.close()">
    </td>
  </tr>
  <tr><td style="padding-top:10px;" colspan="2"><table width="97%" cellspacing="0" cellpadding="0" border="0">
  <tbody>
  <tr>
    <td style="background-color:#eedbcc; padding:6px 5px 1px 7px;">   <input type="text" style=" height:20px;" class="input-serch" value="From Date" name="From Date">     <input type="text" style=" height:20px;" class="input-serch" value="TO Date" name="TO Date"> <input type="text" style=" height:20px; width:200px;" class="input-serch" value="Staff Name" name="TO Date"> <select style=" height:24px; width:200px;" class="input-serch">
      <option selected="">Select Multiple Employee</option>
      <option>Employee 1</option>
      <option>Employee 2</option>
      <option>Employee 3</option>
    </select><button class="button"> Show </button></td>
  </tr>
</tbody></table>
</td></tr>
<tr>
    <td style="font-size: 16px; padding-top:10px;">Pay Advice</td>
   
  </tr>
  
  </tbody></table>
  
</div>


<c:choose>
<c:when test="${empty paySlipData}">
	<div class="accordion-manual-content" style="display:block; border:none; margin-bottom: -7px;">
	  <table width="45%" cellspacing="0" cellpadding="0" border="0">
  		<tbody>
  		<tr>
    		<td width="251" valign="top" style="border:1px solid #c99e7b;">
    			<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt">
				<tbody>
				<tr>
					<th width="50px" align="center" colspan="2" style="font-weight: bold; text-align: left; font-size: 15px; background-color:#c99e7b !important;">Bistro Rivage</th> 
				</tr>
	  
      			<tr>
				 	<td>Week Ending</td>
					<td align="right"></td>
      			</tr>
      			<tr>
					<td colspan="2" style="font-size: 15px; font-weight: bold;"></td>
      			</tr>
    			<tr>
					<td>Pay Date</td>
					<td align="right">${paymentDate}</td>
     			 </tr>
     			</tbody>
     			</table>
			</td>
    		<td width="5">&nbsp;</td>
   			<td width="281" valign="middle" align="center" style="border:1px solid #c99e7b;"><img src="images/img.png"></td>
  		</tr>
		</tbody>
	</table>
    </div>
	<div class="accordion-manual-content" style="display:block; border:none;">
		<table width="45%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt">
       <tbody><tr>
        <th class="thclass"></th><th align="center" class="thclass">Hours - Calc Rate</th>
  		<th align="center" class="thclass">Hours</th>
        <th align="center" class="thclass">Amount</th>  
      </tr>
      <tr>
        <td>Base Weeky (Gross Taxable)</td>
        <td></td>
        <td align="right"></td>
 		<td align="right"></td>
     </tr>
     <tr>
       <td>Including Public Holday Rates</td>
       <td></td>
       <td align="right"></td>
  	   <td align="right"></td> 
  	 </tr>
     <tr>
        <td>Income Tax - PAYG witholding</td>
        <td></td>
        <td align="right"></td>
  		<td align="right"></td>  
  	</tr>
    <tr>
       <td>Super</td><td></td>
       <td align="right"></td>
	   <td align="right"></td>
	</tr>
	<tr>
      <td  class="total">Net Pay</td>
      <td  class="total"></td>
      <td align="right" class="total"></td>
      <td align="right" class="total"></td> 
    </tr>
  </tbody>
 </table>
</div>

	<div class="accordion-manual-content" style="border-bottom: 1px solid #bb7235; background:none; border-left:none; margin-top: -20px;">
 
   </div>
</c:when>
<c:otherwise>
   <c:forEach items="${paySlipData}" var="paySlip" varStatus="loop">
      <div class="accordion-manual-content" style="display:block; border:none; margin-bottom: -7px;">
	  <table width="45%" cellspacing="0" cellpadding="0" border="0">
  		<tbody>
  		<tr>
    		<td width="251" valign="top" style="border:1px solid #c99e7b;">
    			<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt">
				<tbody>
				<tr>
					<th width="50px" align="center" colspan="2" style="font-weight: bold; text-align: left; font-size: 15px; background-color:#c99e7b !important;">Bistro Rivage</th> 
				</tr>
	  
      			<tr>
				 	<td>Week Ending</td>
					<td align="right">${weekEnding}</td>
      			</tr>
      			<tr>
					<td colspan="2" style="font-size: 15px; font-weight: bold;">${paySlip.staffName}</td>
      			</tr>
    			<tr>
					<td>Pay Date</td>
					<td align="right">${paymentDate}</td>
     			 </tr>
     			</tbody>
     			</table>
			</td>
    		<td width="5">&nbsp;</td>
   			<td width="281" valign="middle" align="center" style="border:1px solid #c99e7b;"><img src="images/img.png"></td>
  		</tr>
		</tbody>
	</table>
    </div>
	<div class="accordion-manual-content" style="display:block; border:none;">
		<table width="45%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt">
       <tbody><tr>
        <th class="thclass"></th><th align="center" class="thclass">Hours - Calc Rate</th>
  		<th align="center" class="thclass">Hours</th>
        <th align="center" class="thclass"></th>  
      </tr>
      <tr>
        <td>Base Weeky (Gross Taxable)</td>
        <td>$${paySlip.weeklyRate}</td>
        <td align="right">${paySlip.totalHours}</td>
 		<td align="right">$${paySlip.totalIncome}</td>
     </tr>
     <tr>
       <td>Including Public Holday Rates</td>
       <td>$${paySlip.publicHolidayRate}</td>
       <td align="right">${paySlip.holidayHours}</td>
  	   <td align="right">$<span id="pubHoliday${loop.index}">${paySlip.publicHolidayRate * paySlip.holidayHours}</span></td> 
  	 </tr>
     <tr>
        <td>Income Tax - PAYG witholding</td>
        <td></td>
        <td align="right"></td>
  		<td align="right">$0.00</td>  
  	</tr>
    <tr>
       <td>Super</td><td></td>
       <td align="right"></td>
	   <td align="right">$<span id="super${loop.index}">${paySlip.totalIncome *(9/100)}</span></td>
	</tr>
	<tr>
      <td  class="total">Net Pay</td>
      <td  class="total"></td>
      <td align="right" class="total"></td>
      <td align="right" class="total">$${paySlip.totalIncome}</td> 
    </tr>
  </tbody>
 </table>
</div>

	<div class="accordion-manual-content" style="border-bottom: 1px solid #bb7235; background:none; border-left:none; margin-top: -20px;">
 
   </div>
  </c:forEach>
 </c:otherwise>
 </c:choose>
 
</div>

</div>
<footer class="footer">

</footer>
</div>
</body>
</html>
