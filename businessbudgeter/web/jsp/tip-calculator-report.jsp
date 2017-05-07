<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<head> 
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="common/resources.jsp" %>
<script src="js/report-calculation.js"></script> 
<script>
    /* $(document).ready(function () {
        $('.slider4').bxSlider({
            slideWidth: 565,
            minSlides: 1,
            maxSlides: 2,
            moveSlides: 1,
            slideMargin: 10
        });
    }); */
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
	
	 function handleChangeInputsReport(){
		 
		 console.log("incomeCenterId = "+incomeCenterId);
		 
		 window.location = "tipsreports?reportDate="+$("#reportDate").val()+"&incomeCenterId="+$("#incomeCenterId").val();
	} 
	
	$(document).ready(function() {

		var currentDate = "${reportDate}";
		$( ".myDate" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$('.myDate').datepicker().datepicker("setDate", currentDate);
		$('#reportDate').datepicker("option", "onSelect", function(){ handleChangeInputsReport(); });
		
		$(".nextDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime()+(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    handleChangeInputsReport();
		  });
		  
		  $(".prevDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime() -(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    
		    handleChangeInputsReport();
		  });
		 
		  if(incomeCenterId != "")
		  	$("#incomeCenterId").val("${param.incomeCenterId}");
		  
		});
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
<script type="text/javascript">
	
	function calculateAllocationTotalTips(){
		 var sum = 0;
			var total = 0;
			$(".tipAmount").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#totalTipAllocation").html(total);
	 }
	 
	 function calculateAllocationFees(){
		 var sum = 0;
			var total = 0;
			$(".feesAmount").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#totalCrCardPct").html(total);
	 }
	 
	 function calculateAllocationSlush(){
		 var sum = 0;
			var total = 0;
			$(".slushAmt").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#totalSlushPct").html(total);
	 }
	
	$(document).ready(function(){
	var tipSize = '${tipsize}';
	var index;
		for(index = 0;index<tipSize;index++){
		 var totDist = parseFloat($("#totalDistributable"+index).text());
		 var totTips = parseFloat($("#totalTips"+index).text());
		 var slush = parseFloat($("#slushAmount"+index).text());
		 var totShare = parseFloat($("#totalShares"+index).text());
			if(!isNaN(totDist)){
			$("#totalDistributable"+index).text(totDist.toFixed(2));
			}
			if(!isNaN(totTips)){
				$("#totalTips"+index).text(totTips.toFixed(2));
			}
			if(!isNaN(slush)){
			$("#slushAmount"+index).text(slush.toFixed(2));
			}
			if(!isNaN(totShare)){
				$("#totalShares"+index).text(totShare.toFixed(2));
			}
		}
			calculateAllocationTotalTips();
			calculateAllocationFees();
			calculateAllocationSlush();
	});
</script>
<div id="header-wrap">
<header class="header" id="Header">
	
		<div class="logo"><img src="images/bb-logo.png" alt="Business Budgeter" title="Business Budgeter"/></div>
		
	<div class="clear"> </div>
</header>
</div>
<div style="width:93%;" class="wrapper">
<div class="mainwrapper">
    <div class="accordion-manual">
		<div class="main-title">
			<table width="99%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				    <td width="30%">Tip Calculator</td>
				    <td width="60%" align="left"> 
						 Date:- <a href="javascript:void(0)"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevDate">
								</a>&nbsp;
								<a href="javascript:void(0)"><input type="text" class="myDate form-control" name="reportDate" id="reportDate" value="${ reportDate }" style="width: 124px; "> </a><a href="javascript:void(0)"><img width="17" height="18" src="images/next.png" class="nextDate" id="nextDate"></a>
						Income Centers:-
							<select style="width: 159px;" class="input-serch" name="incomeCenterId" id="incomeCenterId" onchange="handleChangeInputsReport()">
								<c:if test="${!empty incomeCenterList}">
						        <c:forEach items="${incomeCenterList}" var="income">
									<option value="${income.incomeCentreId}">${income.icName}</option>
								</c:forEach>
								</c:if>	
				   		  </select>
				    </td>
				    <td width="10%">
				    	<!-- <a href="reports"><button style="width: 150px;" class="button">Back To Reports</button></a> -->
				    	<input type="button" style="width: 150px;" class="button" value="Close This Window" onclick="self.close()">
				    </td>
				  </tr>
			</table>
	</div>
    <div style="display:block; border:none;" class="accordion-manual-content table-responsive">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
     
     
     <c:if test="${!empty tips}">
		<c:forEach items="${tips}" var="tipService" varStatus="loop">
			<td><table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt">
				<tr>
				   <th class="thclass" colspan="5">${tipService.serviceName}</th>
      			</tr>
		  <tr>
		  <td align="center">&nbsp;</td>
		  <td align="center">&nbsp;</td>
		  <td align="center">Fees</td>
		  <td align="center">&nbsp;</td>
		  <td align="center">&nbsp;</td>
		  </tr>
	      <tr >
	        <td>Credit Cards</td>
	        <td align="right">$<span class="tipAmount">${tipService.toatalCrdCardPay}</span></td>
	  		<td align="right">$<span class="feesAmount">${tipService.crdCardFees}</span></td>
	  		<td align="right">$${tipService.toatalCrdCardPay - tipService.crdCardFees}</td>
			<td align="center" rowspan="5">Delete the<br>tips shares <br>for those<br> not working</td> 
	      </tr>
	      <tr>
	       <td>Cash</td>
	        <td align="right">$<span class="tipAmount">${tipService.totalCash}</span></td>
		  	<td align="right">&nbsp;</td>
			 <td align="right">$${tipService.totalCash}</td>
		  </tr>
	     
	    
	     <tr>
	        <td>Total Tips</td>
	        <td align="right">&nbsp;</td>
	  		<td align="right">&nbsp;</td>
	  		<td align="right">$<span id="totalTips${loop.index}">${ tipService.toatalCrdCardPay + tipService.crdCardFees + tipService.totalCash}</span></td>
		</tr>
	      <tr>
	       	<td>Slush</td>
	       	<td align="right">${tipService.slushPct} %</td>
		  	<td align="right"><!-- $3.50 --></td> 
		  	<td align="right">$<span id="slushAmount${loop.index}" class="slushAmt">${tipService.slushAmount}</span></td>
		</tr>
	       <tr>
		        <td colspan="2">Total Distributable</td>
		        <td align="right">&nbsp;</td>
			  <td align="right">$<span id="totalDistributable${loop.index}">${ (tipService.toatalCrdCardPay + tipService.crdCardFees + tipService.totalCash) - tipService.slushAmount}</span></td>
			</tr>
	      <tr>
	       <td colspan="3">Numbers of Shares</td>
	        <td align="right">$<span id="totalShares${loop.index}">${(tipService.toatalCrdCardPay + tipService.crdCardFees + tipService.totalCash) - tipService.slushAmount}</span></td>
	<td align="right">10</td> 
	      </tr>
	      <c:forEach items="${tipService.staffRosterService}" var="staffShares">
			    <tr>
		       		<td colspan="3">${staffShares.staffName}</td>
		       		 <td align="right">$${tipService.shares}</td> 
					<td align="right">0</td> 
		      </tr>
	      </c:forEach>
		   </table></td><td>&nbsp;</td>
		</c:forEach>
		</c:if>
 		<tr>
 		<td style=" padding-top:20px;">
 		<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt" class="table table-bordered">
        	<tr>
 				<th colspan="4" class="thclass">Allocation</th>
      		</tr>
	  
      		<tr>
        		<td colspan="2">TOTAL</td>
        		<td align="right">$<span id="totalTipAllocation">0.0</span> </td>
				<td align="center" rowspan="3">Rounded to <br>the nearest $5</td> 
      		</tr>
      		<tr>
       			<td colspan="2">Credit Card %</td>
        		<td align="right">$<span id="totalCrCardPct">0.0</span></td>
			</tr>
        	<tr>
		        <td colspan="2">Slush</td>
		        <td align="right">$<span id="totalSlushPct">0.0</span></td>
			</tr>
      		<tr>
       			<td colspan="2">David</td>
        		<td align="right">167</td>
				<td align="right">179</td> 
      		</tr>
	    	<tr>
       			<td colspan="2">Erwin</td>				
        		<td align="right">54.86</td>
				<td align="right">55</td> 
      		</tr>
	    	<tr>
       			<td colspan="2">Diego</td>			
        		<td align="right">355</td>
				<td align="right">44</td> 
      		</tr>
	    	<tr>
       			<td colspan="2">0</td>
        		<td align="right">535</td>
				<td align="right">45</td> 
      		</tr>
	    	<tr>
       			<td colspan="2">Marta</td>
        		<td align="right">454</td>
				<td align="right">65</td> 
      		</tr>
	  		<tr>
       			<td colspan="2">0</td>
        		<td align="right">565</td>
				<td align="right">56</td> 
      		</tr>
	  		<tr>
       			<td colspan="2"></td>
				<td align="right">$1,573.47</td>
  				<td align="right">$1,350.00</td>
      		</tr>
	  <tr>
       	<td colspan="2"></td>
  	   	<td align="right">-$136.97</td>
		<td colspan="2"></td>
      </tr>
  		</table></td><td colspan="4"></td></tr>
	</table>
    </div>
</div>
</div>
<footer class="footer">
</footer>
</div>
</body>
</html>
