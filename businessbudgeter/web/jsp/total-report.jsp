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
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"/>
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
	/* var noOfCards = '${cardsCount}'; */
	var noOfRecords = '${cashupdatasize}';
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
	
	 function handleChangeInputsTotalReport(){
		 
		 console.log("incomeCenterId = "+incomeCenterId);
		 
		 window.location = "totalreport?totReportDate="+$("#totReportDate").val()+"&incomeCenterId="+$("#incomeCenterId").val();
	} 
	
	$(document).ready(function() {

		var currentDate = "${totReportDate}";
		$( ".myDate" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$('.myDate').datepicker().datepicker("setDate", currentDate);
		$('#totReportDate').datepicker("option", "onSelect", function(){ handleChangeInputsTotalReport(); });
		
		$(".nextDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime()+(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    handleChangeInputsTotalReport();
		  });
		  
		  $(".prevDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime() -(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    handleChangeInputsTotalReport();
		  });
		 
		  if(incomeCenterId != "")
		  	$("#incomeCenterId").val("${param.incomeCenterId}");
		 
		});
	</script>

</head>
<body>

	<script type="text/javascript">
				
		 $(document).ready(function() {
				var index;
				var i;	
				for(i = 0; i < noOfRecords; i++){
				var noOfCards = '${cardsCount}';
		 		for(index = 0; index < noOfCards; index++){
			        $(".cardsDetails"+index).each(function() {
			 				calculateTotalTakeReport(this);
	 			});
	 			 var totTake = parseFloat($("#totalTakeReport"+index).text());
	 			var zRead = parseFloat($("#dailyZReport"+index).text());
	 			var varience =totTake-zRead;
	 			$("#varienceReport"+index).text(varience); 
	 			
	 			var covers = parseFloat($("#coversReport"+index).text());
	 			if(covers != 0 && covers <= totTake){
		 			var spendPP =totTake/covers;
		 			$("#spendPPReport"+index).text(spendPP);
	 			}else{
	 				spendPP = 0.0;
	 				$("#spendPPReport"+index).text(spendPP);
	 			}
	 			
	 		}	
		}
					calculateVisaTotal();
			 		calculateAmexTotal();
			 		calculateMasterTotal();
			 		calculateOnAccountTotal();
			 		calculateDebitTotal();
			 		calculateCompTotal();
			 		calculateTotalTakeTotal();
			 		calculateDailyZReadTotal();
			 		calculateDailyTakeTotal();
	 				calculateVarienceTotal();
	 				calculateCvtsTotal();
	 				calculateSpendPPTotal();
	 				calculateFoodIncomeTotal();
	 				calculateBeverageIncomeTotal();
	 				calculateTipsLessFeesTotal();
	 				
	 			var foodIncome = parseFloat($("#foodIncomeTotal").text());
	 			var beverageIncome = parseFloat($("#beverageIncomeTotal").text());
	 			if(foodIncome != 0 && foodIncome >= beverageIncome){
		 			var foodIncomePct =foodIncome/(foodIncome+beverageIncome);
		 			$("#foodIncomePct").text(foodIncomePct.toFixed(2));
	 			}else{
	 				foodIncomePct = 0.0;
	 				$("#foodIncomePct").text(foodIncomePct);
	 			}
	 			
	 			if(foodIncome != 0 && beverageIncome >= foodIncome){
		 			var beverageIncomePct =beverageIncome/(beverageIncome+foodIncome);
		 			$("#beverageIncomePct").text(beverageIncomePct.toFixed(2));
	 			}else{
	 				beverageIncomePct = 0.0;
	 				$("#beverageIncomePct").text(beverageIncomePct);
	 			}
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
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
	    <td width="35%">Total Report</td>
	    <td width="63%" align="left"> 
			<div class="day" style="text-align:left !important; padding-top: 24px;"> Date 
				<a href="javascript:void(0)"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevDate">
				</a>&nbsp;<a href="javascript:void(0)"><input type="text" class="myDate" name= totReportDate id="totReportDate" value = ${ totReportDate }> </a> 
				<a href="javascript:void(0)"><img width="17" height="18" src="images/next.png" class="nextDate" id="nextDate"></a> 
		    </div>
			  <div style=" float:left; margin-left:10px;">
			    <select style="width: 159px;" class="input-serch" name="incomeCenterId" id="incomeCenterId" onchange="handleChangeInputsTotalReport()">
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
		
        <div style="display:block; border:none;" class="accordion-manual-content table-responsive">
		<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" class="table table-bordered" id="ServiceEevnt">
	      <tbody><tr>
	        <th class="thclass"></th>
	        <th class="thclass">Visa</th>
	  		<th class="thclass">Amex</th>
	        <th class="thclass">Mastercard</th>
	        <th class="thclass">On Account</th>
	        <th class="thclass">Debit</th>
	        <th class="thclass">Comp</th>
	   		<th class="thclass">Total Take </th>
	        <th class="thclass">Daily Z Read</th>
	        <th class="thclass">Daily Take</th>
	        <th class="thclass">Varience</th>
	        <th class="thclass">#Cvts</th>
	   		<th class="thclass">Spend P/P</th>
	        <th class="thclass">Food Income</th>
	        <th class="thclass">Bev Income</th>
	        <th class="thclass">Tips Less Fees</th>
	      </tr>
	      
	           <c:if test="${!empty cashupdata}">
					        <c:forEach items="${cashupdata}" var="cashupDataVal" varStatus="loop">
	
	      <tr>
	        <td><!-- Monday Lunch --> ${cashupDataVal.cashupCreditCardDate} ${cashupDataVal.serviceName}</td>
	        
	        	<%-- <c:forEach items="${cashupDataVal.cashUpCreditCards}" var="cashUpCrdCard" >
			        <td align="right">$<span class="cardsDetails${loop.index}" indexOne="${loop.index}">${cashUpCrdCard.foodBeverageSales+cashUpCrdCard.eventFoodBeverageSales }</span></td>
		        </c:forEach>  --%>
		      <td align="right">$<span class="cardsDetails${loop.index} visaCard" indexOne="${loop.index}">${cashupDataVal.cashUpCreditCards[0].foodBeverageSales+cashupDataVal.cashUpCreditCards[0].eventFoodBeverageSales }</span></td>
		      <td align="right">$<span class="cardsDetails${loop.index} amexCard" indexOne="${loop.index}">${cashupDataVal.cashUpCreditCards[1].foodBeverageSales+cashupDataVal.cashUpCreditCards[1].eventFoodBeverageSales }</span></td>
		      <td align="right">$<span class="cardsDetails${loop.index} masterCard" indexOne="${loop.index}">${cashupDataVal.cashUpCreditCards[2].foodBeverageSales+cashupDataVal.cashUpCreditCards[2].eventFoodBeverageSales }</span></td>
		      <td align="right">$<span class="cardsDetails${loop.index} onAccount" indexOne="${loop.index}">${cashupDataVal.cashUpCreditCards[4].foodBeverageSales+cashupDataVal.cashUpCreditCards[4].eventFoodBeverageSales }</span></td>
		      <td align="right">$<span class="cardsDetails${loop.index} debitCard" indexOne="${loop.index}">${cashupDataVal.cashUpCreditCards[3].foodBeverageSales+cashupDataVal.cashUpCreditCards[3].eventFoodBeverageSales }</span></td>
		      <td align="right">$<span class="cardsDetails${loop.index} comp" indexOne="${loop.index}">${cashupDataVal.cashUpCreditCards[5].foodBeverageSales+cashupDataVal.cashUpCreditCards[5].eventFoodBeverageSales }</span></td>
	        	
			<td align="right">$<span id="totalTakeReport${loop.index}" class="totalTake">0.0</span></td>
			<td align="right">$<span id="dailyZReport${loop.index}" class="dailyZRead">${cashupDataVal.dailyZRead}</span></td>
			
			<c:choose>
				<c:when test="${empty cashupDataVal.dailyTake}">
					<td align="right"></td>
				</c:when>
				<c:otherwise>
					<td align="right">$<span class="dailyTake">${cashupDataVal.dailyTake}</span></td>
				</c:otherwise>
			</c:choose>
			<td align="right">$<span id="varienceReport${loop.index}" class="varience">0.0</span></td>
			<td align="right"><span id="coversReport${loop.index}" class="cvts">${cashupDataVal.totalCovers}</span></td>
			 <td align="right"><span id="spendPPReport${loop.index}" class="spendPP">0.00</span></td>
			<td align="right">$<span class="foodIncome">${cashupDataVal.totalFoodIncome}</span></td>
			<td align="right">$<span class="beverageIncome">${cashupDataVal.totalBeverageIncome}</span></td>
			<td align="right">$<span class="tipsLessFees">${cashupDataVal.tipsLessFees}</span></td> 
	      </tr>
	</c:forEach>      
	</c:if>    
	
	      <tr class="total">
	        <td>Total</td>
	        <td align="right" class="total">$<span id="visaCardTotal">0.00</span></td>
	        <td align="right" class="total">$<span id="amexCardTotal">0.00</span></td>
	        <td align="right" class="total">$<span id="masterCardTotal">0.00</span></td>
	        <td align="right" class="total">$<span id="onAccountTotal">0.00</span></td>
	   		<td align="right" class="total">$<span id="debitCardTotal">0.00</span></td>
	        <td align="right" class="total">$<span id="compTotal">0.00</span></td>
	        <td align="right" class="total">$<span id="totalTakeTotal">0.00</span></td>
	        <td align="right" class="total">$<span id="dailyZReadTotal">0.00</span></td>
	   		<td align="right" class="total">$<span id="dailyTakeTotal">0.00</span></td>
	        <td align="right" class="total">$<span id="varienceTotal">0.00</span></td>
	        <td align="right" class="total"><span id="cvtsTotal">0</span></td>
	        <td align="right" class="total">$<span id="spendPPTotal">0.00</span></td>
	  		<td align="right" class="total">$<span id="foodIncomeTotal">0.00</span></td>
	        <td align="right" class="total">$<span id="beverageIncomeTotal">0.00</span></td>
	        <td align="right" class="total">$<span id="tipsLessFeesTotal">0.00</span></td>
	       
	        
	      </tr>
	<tr>
	       <td colspan="13"></td>
	         
	  <td align="right"><span id="foodIncomePct">0.00</span>%</td>
	  <td align="right"><span id="beverageIncomePct">0.00</span>%</td>
	  <td align="right">&copy; fnb 2014</td>
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
