<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/report-calculation.js"></script>
<%@include file="common/resources.jsp" %>
<script>
   
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
</script>

<script type="text/javascript">
	var d = new Date();
	var weekday = new Array(7);
	weekday[0]=  "Sunday";
	weekday[1] = "Monday";
	weekday[2] = "Tuesday";
	weekday[3] = "Wednesday";
	weekday[4] = "Thursday";
	weekday[5] = "Friday";
	weekday[6] = "Saturday";
	
	var n = weekday[d.getDay()];
	var incomeCenterId = "${param.incomeCenterId}";
	
	 function handleChangeInputsWagesReport(){
		 
		 console.log("incomeCenterId = "+incomeCenterId);
		 
		 window.location = "wagesreport?wagesReportDate="+$("#wagesReportDate").val()+"&incomeCenterId="+$("#incomeCenterId").val();
	} 
	
	$(document).ready(function() {
	
	$(':input').click(function() {
	        $(this).select();
		});
		var currentDate = "${wagesReportDate}";
		$( ".myDate" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$('.myDate').datepicker().datepicker("setDate", currentDate);
		$('#wagesReportDate').datepicker("option", "onSelect", function(){ handleChangeInputsWagesReport(); });
		
		$(".nextDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime()+(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    handleChangeInputsWagesReport();
		  });
		  
		  $(".prevDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime() -(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    handleChangeInputsWagesReport();
		  });
		 
		  if(incomeCenterId != "")
		  	$("#incomeCenterId").val("${param.incomeCenterId}");
		 
		});
	</script>

</head>
<body>

<script type="text/javascript">

 function calculateMondayTotal(){
		 var sum = 0;
			var total = 0;
			$(".mondayStaffIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#mondayTotal").html(total.toFixed(2));
	 }
	 
	 function calculateTuesdayTotal(){
		 var sum = 0;
			var total = 0;
			$(".tuesdayStaffIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#tuesdayTotal").html(total.toFixed(2));
	 }
	 function calculateWednesdayTotal(){
		 var sum = 0;
			var total = 0;
			$(".wednesdayStaffIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#wednesdayTotal").html(total.toFixed(2));
	 }
	 function calculateThursdayTotal(){
		 var sum = 0;
			var total = 0;
			$(".thursdayStaffIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#thursdayTotal").html(total.toFixed(2));
	}
	 function calculateFridayTotal(){
		 var sum = 0;
			var total = 0;
			$(".fridayStaffIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#fridayTotal").html(total.toFixed(2));
	 }
	 function calculateSaturdayTotal(){
		 var sum = 0;
			var total = 0;
			$(".saturdayStaffIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#saturdayTotal").html(total.toFixed(2));
	 }
	 function calculateSundayTotal(){
		 var sum = 0;
			var total = 0;
			$(".sundayStaffIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#sundayTotal").html(total.toFixed(2));
	 }
	 function calculateHoursTotal(){
		 var sum = 0;
			var total = 0;
			$(".staffTotalHours").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#hoursTotal").html(total);
	 }
	 function calculateIncomeTotal(){
		 var sum = 0;
			var total = 0;
			$(".staffTotalIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#incomeTotal").html(total.toFixed(2));
	 }
	 
	 function calculateGrossETFWages(){
		 var sum = 0;
			var total = 0;
			$(".grossEFTWages").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#grossETFWagesTotal").html(total.toFixed(2));
	 }
	 
	 function calculateCashWages(){
		 var sum = 0;
			var total = 0;
			$(".cashWages").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#cashWagesTotal").html(total.toFixed(2));
	 }
	 
	  function calculateTotalWages(){
		 var val1 = parseFloat($("#cashWagesTotal").text()),
	          val2 = parseFloat($("#grossETFWagesTotal").text());
	       $("#totalWages").text((val1 + val2).toFixed(2));
	 }
	 
	 function calculateNetEFTWages(index){
	 	var val1 = parseFloat($("#grossEFTWage"+index).text());
	     var val2 = parseFloat($("#tax"+index).val());
	    if(isNaN(val2)) {
			val2 = 0;
		}
	      $("#netEFTWage"+index).text((val1 - val2).toFixed(2));
	    
	 }
	 
	  function calculateNetEFTWagesTotal(){
		 var sum = 0;
			var total = 0;
			$(".grossEFTWages").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				       }
				   });
			$("#netETFWagesTotal").html(total.toFixed(2));
	 }
	 
	 function calculateTotalTaxes(){
		var sum = 0;
	    $(".taxAmt").each(function() {
            if(!isNaN(this.value) && this.value.length!=0) {
                sum += parseFloat(this.value);
            }
        });
        $("#taxesTotal").html(sum.toFixed(2));
        calculateNetEFTWagesTotal();
	 }	 
	 
	$(document).ready(function(){
		/* $('#totalHours').text().replace("/./",":"); */
		/* $('#totalHours').text().toFixed(2); */
		
		calculateMondayTotal();
		calculateTuesdayTotal();
		calculateWednesdayTotal();
		calculateThursdayTotal();
		calculateFridayTotal();
		calculateSaturdayTotal();
		calculateSundayTotal();
		calculateHoursTotal(); 
		calculateIncomeTotal();
		calculateGrossETFWages();
		calculateCashWages();
		calculateTotalWages();
		calculateNetEFTWagesTotal();
						 
		$(".taxAmt").keyup(function(){
			calculateTotalTaxes();
		});
		var wagesDataSize = "${wagesDataSize}";
		var index;
		for(index = 0; index < wagesDataSize; index++){
			calculateNetEFTWages(index);
		}
		
	});
</script>

<div id="header-wrap">
<header class="header" id="Header">
	
		<div class="logo"><img src="images/bb-logo.png" alt="Business Budgeter" title="Business Budgeter"/></div>
		<div id="menu" class="nav_menu">
			<!-- <ul>
			  <li><a href="#">Logout</a></li>
			</ul> -->
		</div>
	<div class="clear"> </div>
</header>
</div>
<div style="width:93%;" class="wrapper">
<div class="mainwrapper">

    	<div class="accordion-manual">
		<div class="main-title"><table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td width="35%">Wages Report</td>
    <td width="63%" align="left"> 
			<div class="day" style="text-align:left !important; padding-top: 24px;"> Date 
				<a href="javascript:void(0)"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevDate">
				</a>&nbsp;<a href="javascript:void(0)"><input type="text" class="myDate" name= wagesReportDate id="wagesReportDate" value = ${ wagesReportDate }> </a> 
				<a href="javascript:void(0)"><img width="17" height="18" src="images/next.png" class="nextDate" id="nextDate"></a> 
		    </div>
			  <div style=" float:left; margin-left:10px;">
			    <select style="width: 159px;" class="input-serch" name="incomeCenterId" id="incomeCenterId" onchange="handleChangeInputsWagesReport()">
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
  </table>
</div>
		
        <div style="display:block; border:none;" class="accordion-manual-content">
         <input type="hidden" name="wagesDataSize" value="${wagesDataSize}" >
<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt">
       <tbody><tr>
        <th align="center" class="thclass"></th>
         <%--  <c:if test="${!empty wagesData}">
			        <c:forEach items="${wagesData}" var="wages" varStatus="loop">
        <th align="center" class="thclass">${wages.rosterDate}</th>
        </c:forEach>
        </c:if> --%>
  		<th align="center" class="thclass"> Monday</th>
        <th align="center" class="thclass">Tuesday</th>
        <th align="center" class="thclass">Wednesday</th>
        <th align="center" class="thclass">Thursday</th>
        <th align="center" class="thclass">Friday</th>
   		<th align="center" class="thclass">Saturday</th>
        <th align="center" class="thclass">Sunday</th>
        <th align="center" class="thclass" colspan="2"></th>
		<th align="center" class="thclass" rowspan="2">GROSS EFT WAGE</th>
        <th align="center" class="thclass" rowspan="2">TAX</th>
   		<th align="center" class="thclass" rowspan="2">NET EFT WAGES</th>
        <th align="center" class="thclass" rowspan="2">Cash Wages</th>
       <!--  <th align="center" class="thclass" rowspan="2"></th> -->
      </tr>
	  <tr>
	  <td align="center">Employee</td>
	  <td align="center">&nbsp;</td>
	  <td align="center">&nbsp;</td>
	  <td align="center">&nbsp;</td>
	  <td align="center">&nbsp;</td>
	  <td align="center">&nbsp;</td>
	  <td align="center">&nbsp;</td>
	  <td align="center">&nbsp;</td>
	  <td align="center" style="border-left:1px solid #d0d0d0;border-right:1px solid #d0d0d0;">Tot Hrs</td>
	   <td align="center">Total</td>
	  </tr>
	  <c:if test="${!empty wagesData}">
			        <c:forEach items="${wagesData}" var="wagesReport" varStatus="loop">
				      <tr>
				        <td>${wagesReport.staffName}</td>
				        		
				        		<td align="right"><span class="mondayStaffIncome">${wagesReport.wages[0].staffIncome}</span></td>
							  	<td align="right"><span class="tuesdayStaffIncome">${wagesReport.wages[1].staffIncome}</span></td>
							  	<td align="right"><span class="wednesdayStaffIncome">${wagesReport.wages[2].staffIncome}</span></td>
								<td align="right"><span class="thursdayStaffIncome">${wagesReport.wages[3].staffIncome}</span></td>
							  	<td align="right"><span class="fridayStaffIncome">${wagesReport.wages[4].staffIncome}</span></td>
							  	<td align="right"><span class="saturdayStaffIncome">${wagesReport.wages[5].staffIncome}</span></td>
							  	<td align="right"><span class="sundayStaffIncome">${wagesReport.wages[6].staffIncome}</span></td>
							  
							  	<td align="right"> <span id="totalHours" class="staffTotalHours"> ${wagesReport.totalHours}</span></td>
							  	<td align="right"><span class="staffTotalIncome">${wagesReport.totalIncome}</span> </td>
							   	<td align="right"><span class="grossEFTWages" id="grossEFTWage${loop.index}">${wagesReport.grossEFTWages}</span></td>
							  	<td align="right"><input type="text" style="width:80px !important" class="input-drawer taxAmt" id="tax${loop.index}" value="0.0" onkeyup="calculateNetEFTWages(${loop.index}) "></td>
							  	<td align="right"><span class="netEFTWages" id="netEFTWage${loop.index}">0.0</span></td>
							  	<td align="right"><span class="cashWages">${wagesReport.cashWages}</span></td>
				  
				  				<!-- <td align="right"><input type="checkbox" checked value="" name="">Paid</td> -->
				      </tr>
     </c:forEach>
    </c:if>
   
      <tr class="total">
        <td class="total">Total</td>
        <td align="right" class="total"><span id="mondayTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="tuesdayTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="wednesdayTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="thursdayTotal"> 0.00</span></td>
   		<td align="right" class="total"><span id="fridayTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="saturdayTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="sundayTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="hoursTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="incomeTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="grossETFWagesTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="taxesTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="netETFWagesTotal"> 0.00</span></td>
        <td align="right" class="total"><span id="cashWagesTotal"> 0.00</span></td>
   		<!-- <td align="right" class="total">&nbsp;</td> -->
      </tr>
	  <tr>
       	<td colspan="12"></td>
    	<td align="right" class="total">Total Wages</td>
  		<td align="right" class="total"><span id="totalWages"> 0.00</span></td>
  		<!-- <td align="right">&nbsp;</td> -->
      </tr>
  </tbody></table>

        </div>
</div>



</div>
<footer class="footer">

</footer>


</div>
</body>
</html>
