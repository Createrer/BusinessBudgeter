<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="common/resources.jsp" %>
<script src="js/report-calculation.js"></script>
<script>
	function handleChangeInputsProfitLossReport(){
		 
		 console.log("incomeCenterId = "+incomeCenterId);
		 
		 window.location = "profitlossreports?profitLossReportDate="+$("#profitLossReportDate").val()+"&incomeCenterId="+$("#incomeCenterId").val();
	} 
    $(document).ready(function () {
    $(':input').click(function() {
	        $(this).select();
		});
        var currentDate = "${profitLossReportDate}";
		$( ".myDate" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$('.myDate').datepicker().datepicker("setDate", currentDate);
		$('#profitLossReportDate').datepicker("option", "onSelect", function(){handleChangeInputsProfitLossReport(); });
		
		$(".nextDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime()+(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    handleChangeInputsProfitLossReport();
		  });
		  
		  $(".prevDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime() -(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    
		    handleChangeInputsProfitLossReport();
		  });
		 
		  if(incomeCenterId != "")
		  	$("#incomeCenterId").val("${param.incomeCenterId}");
		  
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

	 function calculateMondayTotalPL(){
		 var sum = 0;
			var total = 0;
			$(".mondayStaffIncomePL").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#TotalPL1").html(total);
	 }
	 
	 function calculateTuesdayTotalPL(){
		 var sum = 0;
			var total = 0;
			$(".tuesdayStaffIncomePL").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#TotalPL2").html(total);
	 }
	 function calculateWednesdayTotalPL(){
		 var sum = 0;
			var total = 0;
			$(".wednesdayStaffIncomePL").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#TotalPL3").html(total);
	 }
	 function calculateThursdayTotalPL(){
		 var sum = 0;
			var total = 0;
			$(".thursdayStaffIncomePL").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#TotalPL4").html(total);
	}
	 function calculateFridayTotalPL(){
		 var sum = 0;
			var total = 0;
			$(".fridayStaffIncomePL").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#TotalPL5").html(total);
	 }
	 function calculateSaturdayTotalPL(){
		 var sum = 0;
			var total = 0;
			$(".saturdayStaffIncomePL").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#TotalPL6").html(total);
	 }
	 function calculateSundayTotalPL(){
		 var sum = 0;
			var total = 0;
			$(".sundayStaffIncomePL").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#TotalPL7").html(total);
	 }
	 function calculateIncomeTotalPL(){
		 var sum = 0;
			var total = 0;
			$(".staffTotalIncomePL").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#incomeTotalPL").html(total);
	 }  
	 
	  function calculateTotalDailyPredict(){
		var sum = 0;
	    $(".dailyPrediction").each(function() {
            if(!isNaN(this.value) && this.value.length!=0) {
                sum += parseFloat(this.value);
            }
        });
        $("#dailyPredictionTotal").html(sum.toFixed(2));
        
	 }	 
	/* function calculatePredLessGST(){
	}
	
	function calculateTuePredLessGST(){
	} */
	
	$(document).ready(function(){
		
		calculateMondayTotalPL();
		calculateTuesdayTotalPL();
		calculateWednesdayTotalPL();
		calculateThursdayTotalPL();
		calculateFridayTotalPL();
		calculateSaturdayTotalPL();
		calculateSundayTotalPL();
		calculateIncomeTotalPL();
		
		$(".dailyPrediction").keyup(function(){
			var predTot = $("#predTot").text("0");
			calculateTotalDailyPredict();
			var d_val = $(this).val();
			if(isNaN(d_val)) {
				d_val = 0;
			}
			var id = $(this).attr("id").split("t");
			var p_val =parseFloat(d_val)-( parseFloat(d_val)/11);
			$("#predRevGst"+id[1]).text(p_val.toFixed(2));
			var p_tot = $("#predTot").text();
			p_tot = parseFloat(p_tot) + parseFloat(p_val);
			$("#predTot").text(p_tot.toFixed(2));
			var profitLostTot = $(".profitNLoss"+id[1]).text();
			p_tot =$("#predRevGst"+id[1]).text();
			profitLostTot = (parseFloat(profitLostTot) / parseFloat(p_tot))*100;
			$("#labourCost"+id[1]).text(parseInt(profitLostTot));
			var lc_tot = $("#labourCostTot").text();
			lc_tot = parseFloat(lc_tot) + parseFloat($("#labourCost"+id[1]).text());
			$("#labourCostTot").text(lc_tot);
			
			$("#revPred"+id[1]).text(parseFloat($("#actDaily"+id[1]).text()) - parseFloat($("#predRevGst"+id[1]).text()));
			$("#revPred8").text(parseFloat($("#actTot").text()) - parseFloat($("#predTot").text()));
			var ng_predTot = 0;
			for(var i = 1; i < 8; i++){
				var dailyPredict = parseFloat($("#predRevGst"+i).text());
				ng_predTot = parseFloat(ng_predTot) + dailyPredict;
				$("#predTot").text(ng_predTot.toFixed(2));
				$("#turnoverIn").text($("#predTot").text());
				$("#turnoverInCopy").text($("#turnoverIn").text());
			}
			
			var labourCostOut = parseFloat($("#labourCostOut").text());
			var l_turnoverIn = parseFloat($("#turnoverIn").text());
			$("#labourCostPer").val((parseFloat(labourCostOut/l_turnoverIn)*100).toFixed(0));
		});
		
		var g_finalTot = 0;
		for(var i = 1; i < 4; i++){
			var finalFoodTot = 0;
			var finalBevTot = 0;
			for(var j = 1; j < 8; j++){
			var foodTot = $("#foodInc"+i+""+j).text();
			var bevTot = $("#bevInc"+i+""+j).text();
			finalFoodTot += parseFloat(foodTot);
			finalBevTot += parseFloat(bevTot);
			var fb_tot = $("#foodInc"+i+""+j).text();
			//alert("fb_tot= "+fb_tot);
			}
			$("#foodInc"+i).text(finalFoodTot.toFixed(2));
			$("#bevInc"+i).text(finalBevTot.toFixed(2));
			g_finalTot += parseFloat($("#foodInc"+i).text()) + parseFloat($("#bevInc"+i).text());
		}
		$("#fbInc8").text(g_finalTot.toFixed(2));
		
		for(var i = 1; i < 8; i++){
			var finalTot = 0;
			for(var j = 1; j < 4; j++){
			var foodTot = $("#foodInc"+j+""+i).text();
			var bevTot = $("#bevInc"+j+""+i).text();
			var fbTot = (parseFloat(foodTot) + parseFloat(bevTot));
			finalTot += fbTot;
			}
			$("#fbInc"+i).text(finalTot.toFixed(2));
		}
		var g_fTot = 0;
		var g_bTot = 0;
		for(var i = 1; i < 4; i++){
			var fPer = (parseFloat($("#foodInc"+i).text())/parseFloat($("#fbInc8").text()))*100;
			var bPer = (parseFloat($("#bevInc"+i).text())/parseFloat($("#fbInc8").text()))*100;
			g_fTot += parseFloat($("#foodInc"+i).text());
			g_bTot += parseFloat($("#bevInc"+i).text());
			if(isNaN(fPer)){
				fPer=0;
			} 
			if(isNaN(bPer)){
				bPer=0;
			}
			$("#foodPer"+i).text(fPer.toFixed(2));
			$("#bevPer"+i).text(bPer.toFixed(2));
		}
		
		var bevTotPer = ((parseFloat(g_bTot)/parseFloat($("#fbInc8").text()))*100);
		var foodTotPer = ((parseFloat(g_fTot)/parseFloat($("#fbInc8").text()))*100);
		if(isNaN(bevTotPer)){
			bevTotPer = 0;
		}
		if(isNaN(foodTotPer)){
			foodTotPer = 0;
		}
		$("#bevTotPer").text(bevTotPer.toFixed(2));
		$("#foodTotPer").text(foodTotPer.toFixed(2));
		
		for(var i = 0; i < 8; i++){
			//var rev = $("#revenue"+i).text();
			if(parseFloat($("#revenue"+i).text()) < 0){
				var rev = ($("#revenue"+i).text()).split("-");
				$("#revenue"+i).text(rev[i]);
			}
		}
		var finalActRevTot = 0;
		for(var j = 1; j < 8; j++){
			var actRev = $("#actDaily"+j).text();
			finalActRevTot += parseFloat(actRev);
		}
		$("#actTot").text(finalActRevTot.toFixed(2));
		
		var finalRevTot = 0;
		var finalGSTTot = 0;
		var totActIncomeTotal = 0;
		for(var j = 1; j < 8; j++){
			var actRev = $("#revenue"+j).text();
			finalRevTot += parseFloat(actRev);
			$("#gst"+j).text((parseFloat(actRev)/11).toFixed(2));
			var gst = $("#gst"+j).text();
			finalGSTTot += parseFloat(gst);
			$("#totActIncome"+j).text((parseFloat(actRev) - (parseFloat(gst)).toFixed(2)));
			var actTotIncome = $("#totActIncome"+j).text();
			totActIncomeTotal += parseFloat(actTotIncome);
			var totalPL = $("#TotalPL"+j).text();
			var staffCost = ((parseFloat(totalPL) / (parseFloat(actTotIncome)))*100);
			if (staffCost === Infinity || isNaN(staffCost)) {
				    staffCost = 0;
				}
			
			$("#actStaffCost"+j).text(staffCost.toFixed(2));
			
		}
		$("#revenueTot").text(finalRevTot.toFixed(2));
		$("#gstTot").text(finalGSTTot.toFixed(2));
		$("#totActIncomeTotal").text(totActIncomeTotal.toFixed(2));
		var totalPLAll= $("#incomeTotalPL").text();
		var totActIncomeAll = $("#totActIncomeTotal").text();
		var staffCostTot = ((parseFloat(totalPLAll) / (parseFloat(totActIncomeAll)))*100);
			if (staffCostTot === Infinity || isNaN(staffCostTot)) {
				    staffCostTot = 0;
				}
			
			$("#actStaffCostTotal").text(staffCostTot.toFixed(2));
			
			var g_foodSpendTot = 0;
			$("#foodCostP, #foodSaleP").keyup(function(){
				g_foodSpendTot = 0;
				var g_foodVarience = 0;
				for(var i = 1; i < 8; i++){
					var prdRev = parseFloat($("#predRevGst"+i).text());
					var foodSale = parseFloat($("#foodSaleP").val());
					var tot = (prdRev * (foodSale/100));
					var turnoverIn = parseFloat($("#turnoverIn"+i).text());
					$("#fCostIn").text(turnoverIn*(foodSale/100));
					var foodCost = parseFloat($("#foodCostP").val());
					var foodSpend = (tot * (foodCost/100));
					$("#fspend"+i).text(foodSpend.toFixed(2));
					var foodSpendTot = parseFloat($("#fspend"+i).text());
					g_foodSpendTot = g_foodSpendTot + foodSpendTot;
					$("#fvarience"+i).text((parseFloat($("#fspend"+i).text())-parseFloat($("#actFoodSpend"+i).text())).toFixed(2));
					var foodVarience = parseFloat($("#fvarience"+i).text());
					g_foodVarience = g_foodVarience + parseFloat(foodVarience);
					$("#fvarienceTot").text(g_foodVarience.toFixed(2));
				}
				$("#fspendTot").text(g_foodSpendTot.toFixed(2));
				$("#fspendPer").text($("#foodCostP").val());
				var fvarienceTot = $("#fvarienceTot").text();
				var fspendTot = $("#fspendTot").text();
				if(parseFloat(fspendTot) == 0.00){
					$("#fvariencePer").text("0.00");
				}
				else{
					$("#fvariencePer").text(((parseFloat(fvarienceTot)/parseFloat(fspendTot))*100).toFixed(2));
				}
				var turnoverIn = parseFloat($("#turnoverIn").text());
				var foodSaleP = parseFloat($("#foodSaleP").val());
				$("#fCostIn").text((turnoverIn*(foodSaleP/100)).toFixed(2));
				$("#fCostInFinal").text($("#fCostIn").text());
				var fCostIn = parseFloat($("#fCostIn").text());
				var foodCostP = parseFloat($("#foodCostP").val());
				$("#fCostOut").text((fCostIn*(foodCostP/100)).toFixed(2));
				var fCostOut = parseFloat($("#fCostOut").text());
				var bCostOut = parseFloat($("#bCostOut").text());
				var labourCostOut = parseFloat($("#labourCostOut").text());
				$("#costOutTotal").text((fCostOut + bCostOut + labourCostOut).toFixed(2));
				var costOutTotal = parseFloat($("#costOutTotal").text());
				var turnoverInCopy = parseFloat($("#turnoverInCopy").text());
				$("#turnoverTotal").text((turnoverInCopy - costOutTotal).toFixed(2));
				var turnoverTotal = parseFloat($("#turnoverTotal").text());
				var l_turnoverIn = parseFloat($("#turnoverIn").text());
				$("#turnoverTotalPer").text((parseFloat(turnoverTotal/l_turnoverIn)*100).toFixed(2)+"%");
				var sp = $("#turnoverTotalPer").text().split(".");
				$("#turnoverTotalPer").text(sp[0]+"%");
			});
			
			var g_foodActSpend = 0;
			for(var i = 1; i < 8; i++){
				var foodActSpend = parseFloat($("#actFoodSpend"+i).text());
				if(isNaN(foodActSpend)){
					foodActSpend = 0;
				}
				g_foodActSpend = g_foodActSpend + parseFloat(foodActSpend);
			}
			
			$("#actFoodSpendTot").text(g_foodActSpend.toFixed(2));
			$("#fCostOutFinal").text($("#actFoodSpendTot").text());
			var actFoodSpendTot = parseFloat($("#actFoodSpendTot").text());
			var foodIncTot = parseFloat($("#foodInc1").text()) + parseFloat($("#foodInc2").text()) + parseFloat($("#foodInc3").text());
			if(parseFloat(foodIncTot) == 0.00){
				$("#actFoodSpendPct").text("0.00");
			}
			else{
				$("#actFoodSpendPct").text(((parseFloat(actFoodSpendTot)/parseFloat(foodIncTot))*100).toFixed(2));
			}
			
//------------------------------------------------Beverage Report-----------------------------------------------------------//
			var g_bevSpendTot = 0;
			$("#bevCostP, #bevSaleP").keyup(function(){
				g_bevSpendTot = 0;
				var g_bevVarience = 0;
				for(var i = 1; i < 8; i++){
					var prdRev = parseFloat($("#predRevGst"+i).text());
					var bevSale = parseFloat($("#bevSaleP").val());
					var tot = (prdRev * (bevSale/100));
					var bevCost = parseFloat($("#bevCostP").val());
					var bevSpend = (tot * (bevCost/100));
					$("#bspend"+i).text(bevSpend.toFixed(2));
					var bevSpendTot = parseFloat($("#bspend"+i).text());
					g_bevSpendTot = g_bevSpendTot + bevSpendTot;
					$("#bvarience"+i).text((parseFloat($("#bspend"+i).text())-parseFloat($("#actBevSpend"+i).text())).toFixed(2));
					var bevVarience = parseFloat($("#bvarience"+i).text());
					g_bevVarience = g_bevVarience + parseFloat(bevVarience);
					$("#bvarienceTot").text(g_bevVarience.toFixed(2));
				}
				$("#bspendTot").text(g_bevSpendTot.toFixed(2));
				$("#bspendPer").text($("#bevCostP").val());
				var bvarienceTot = $("#bvarienceTot").text();
				var bspendTot = $("#bspendTot").text();
				if(parseFloat(bspendTot) == 0.00){
					$("#bvariencePer").text("0.00");
				}
				else{
					$("#bvariencePer").text(((parseFloat(bvarienceTot)/parseFloat(bspendTot))*100).toFixed(2));
				}
				var turnoverIn = parseFloat($("#turnoverIn").text());
				var bevSaleP = parseFloat($("#bevSaleP").val());
				if(parseFloat(bspendTot) == 0.00){
					$("#bCostIn").text("0.00");
				}
				else{
					$("#bCostIn").text((turnoverIn*(bevSaleP/100)).toFixed(2));
				}
				$("#bCostInFinal").text($("#bCostIn").text());
				var bCostIn = parseFloat($("#bCostIn").text());
				var bevCostP = parseFloat($("#bevCostP").val());
				$("#bCostOut").text((bCostIn*(bevCostP/100)).toFixed(2));
				$("#bevSalePFinal").text($("#bevSaleP").val());
				var fCostOut = parseFloat($("#fCostOut").text());
				var bCostOut = parseFloat($("#bCostOut").text());
				var labourCostOut = parseFloat($("#labourCostOut").text());
				$("#costOutTotal").text((fCostOut + bCostOut + labourCostOut).toFixed(2));
				var costOutTotal = parseFloat($("#costOutTotal").text());
				var turnoverInCopy = parseFloat($("#turnoverInCopy").text());
				$("#turnoverTotal").text((turnoverInCopy - costOutTotal).toFixed(2));
				var turnoverTotal = parseFloat($("#turnoverTotal").text());
				var l_turnoverIn = parseFloat($("#turnoverIn").text());
				$("#turnoverTotalPer").text((parseFloat(turnoverTotal/l_turnoverIn)*100).toFixed(2)+"%");
				var sp = $("#turnoverTotalPer").text().split(".");
				$("#turnoverTotalPer").text(sp[0]+"%");
			});
			
			var g_bevActSpend = 0;
			for(var i = 1; i < 8; i++){
				var bevActSpend = parseFloat($("#actBevSpend"+i).text());
				if(isNaN(bevActSpend)){
					bevActSpend = 0;
				}
				g_bevActSpend = g_bevActSpend + parseFloat(bevActSpend);
			}
			$("#actBevSpendTot").text(g_bevActSpend.toFixed(2));
			$("#bCostOutFinal").text($("#actBevSpendTot").text());
			var actbevSpendTot = parseFloat($("#actBevSpendTot").text());
			var bevIncTot = parseFloat($("#bevInc1").text()) + parseFloat($("#bevInc2").text()) + parseFloat($("#bevInc3").text());
			if(parseFloat(bevIncTot) == 0.00){
				$("#actBevSpendPct").text("0.00");
			}
			else{
				$("#actBevSpendPct").text(((parseFloat(actbevSpendTot)/parseFloat(bevIncTot))*100).toFixed(2));
			}
			$("#turnoverInFinal").text($("#totActIncomeTotal").text());
			var sum = 0;
			for(var k = 1; k < 4; k++){
				sum = sum + parseFloat($("#bevInc"+k).text());
			}
			$("#bCostInFinal").text(sum.toFixed(2));
			
			var bCostInFinal = parseFloat($("#bCostInFinal").text());
			var turnoverIn = parseFloat($("#turnoverInFinal").text());
			if(turnoverIn == 0.00){
				$("#bevSalePFinal").text("0.00");
			}
			else{
				$("#bevSalePFinal").text(((bCostInFinal/turnoverIn)*100).toFixed(2)+"%");
			}
			sum = 0;
			for(var k = 1; k < 4; k++){
				sum = sum + parseFloat($("#foodInc"+k).text());
			}
			$("#fCostInFinal").text(sum.toFixed(2));
			
			var fCostInFinal = parseFloat($("#fCostInFinal").text());
			var turnoverIn = parseFloat($("#turnoverInFinal").text());
			if(turnoverIn == 0.00){
				$("#foodSalePFinal").text("0.00");
			}
			else{
				$("#foodSalePFinal").text((parseFloat(fCostInFinal/turnoverIn)*100).toFixed(2)+"%");
			}
			var fCostOutFinal = parseFloat($("#fCostOutFinal").text());
			var fCostInFinal = parseFloat($("#fCostInFinal").text());
			if(fCostInFinal == 0.00){
				$("#fPerFinal").text("0.00");
			}
			else{
				$("#fPerFinal").text(((fCostOutFinal/fCostInFinal)*100).toFixed(2));
			}
			var bCostOutFinal = parseFloat($("#bCostOutFinal").text());
			var bCostInFinal = parseFloat($("#bCostInFinal").text());
			if(bCostInFinal == 0.00){
				$("#bPerFinal").text("0.00");
			}
			else{
				$("#bPerFinal").text(((bCostOutFinal/bCostInFinal)*100).toFixed(2));
			}
			$("#labourOutFinal").text((parseFloat($("#incomeTotalPL").text())).toFixed(2));
			var labourOutFinal = parseFloat($("#labourOutFinal").text());
			if(turnoverIn == 0.00){
				$("#labourPerFinal").text("0.00");
			}
			else{
				$("#labourPerFinal").text((parseFloat(labourOutFinal/turnoverIn)*100).toFixed(2));
			}
			$("#turnoverInTotal").text($("#turnoverInFinal").text());
			$("#turnoverOutTotal").text((fCostOutFinal + bCostOutFinal + labourOutFinal).toFixed(2));
			var turnoverOutTotal = parseFloat($("#turnoverOutTotal").text());
			var turnoverInTotal = parseFloat($("#turnoverInTotal").text());
			$("#turnoverFinalTotal").text((turnoverInTotal - turnoverOutTotal).toFixed(2));
			var turnoverFinalTotal = parseFloat($("#turnoverFinalTotal").text());
			if(turnoverIn == 0.00){
				$("#turnoverFinalPer").text("0");
			}
			else{
				$("#turnoverFinalPer").text((parseFloat(turnoverFinalTotal/turnoverIn)*100).toFixed(2)+"%");
				var sp = $("#turnoverFinalPer").text().split(".");
				$("#turnoverFinalPer").text(sp[0]+"%");
			}
			var fCostOut = parseFloat($("#fCostOut").text());
			var bCostOut = parseFloat($("#bCostOut").text());
			var labourCostOut = parseFloat($("#labourCostOut").text());
			$("#costOutTotal").text((fCostOut + bCostOut + labourCostOut).toFixed(2));
			var costOutTotal = parseFloat($("#costOutTotal").text());
			var turnoverInCopy = parseFloat($("#turnoverInCopy").text());
			$("#turnoverTotal").text((turnoverInCopy - costOutTotal).toFixed(2));
			var turnoverTotal = parseFloat($("#turnoverTotal").text());
			var l_turnoverIn = parseFloat($("#turnoverIn").text());
			if(l_turnoverIn == 0.00){
				$("#turnoverTotalPer").text("0%");
			}
			else{
				$("#turnoverTotalPer").text((parseFloat(turnoverTotal/l_turnoverIn)*100).toFixed(2)+"%");
			}
			
	});
</script>

<div id="header-wrap">
<header class="header" id="Header">
	
		<div class="logo"><img src="images/bb-logo.png" alt="Business Budgeter" title="Business Budgeter"/></div>
		<!-- <div id="menu" class="nav_menu">
			<ul>
			  <li><a href="#">Logout</a></li>
			</ul>
		</div> -->
	<div class="clear"> </div>
</header>
</div>
<div style="width:93%;" class="wrapper">
<div class="mainwrapper">

    	<div class="accordion-manual">
		<div class="main-title">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
    <td width="35%">Profit and Loss Report</td>
     <td width="65%" align="left"> 
				<div class="day" style="text-align:left !important;  padding-top: 24px;"> Date 
					<a href="javascript:void(0)"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevDate">
					</a>&nbsp;<a href="javascript:void(0)"><input type="text" class="myDate" name= profitLossReportDate id="profitLossReportDate" value = ${ profitLossReportDate }> </a> 
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
 </tbody></table>
		</div>
		
        <div class="accordion-manual-content" style="display:block; border:none;">
        <div class="table-responsive">
		<table class="table table-bordered" width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt">
      	 <tbody><tr>
        	<th class="thclass"></th>
			<th width="200px" align="center" class="thclass"><button class="button">Update Starting Staff Cost</button></th>
			<th align="center" class="thclass">Monday</th>
  			<th align="center" class="thclass">Tuesday</th>
        	<th align="center" class="thclass">Wednesday</th>
        	<th align="center" class="thclass">Thursday</th>
        	<th align="center" class="thclass">Friday</th>
        	<th align="center" class="thclass">Saturday</th>
   			<th align="center" class="thclass">Sunday</th>
        	<th align="center" class="thclass">Total</th>
      </tr>
	  
	   <c:if test="${!empty wagesData}">
	        <c:forEach items="${wagesData}" var="wagesReport" varStatus="loop">
		      <tr>
		      	<td>${loop.index}</td>
		        <td>${wagesReport.staffName}</td>
		        <td align="right"><span class="mondayStaffIncomePL">${wagesReport.wages[0].staffIncome}</span></td>
				<td align="right"><span class="tuesdayStaffIncomePL">${wagesReport.wages[1].staffIncome}</span></td>
				<td align="right"><span class="wednesdayStaffIncomePL">${wagesReport.wages[2].staffIncome}</span></td>
				<td align="right"><span class="thursdayStaffIncomePL">${wagesReport.wages[3].staffIncome}</span></td>
				<td align="right"><span class="fridayStaffIncomePL">${wagesReport.wages[4].staffIncome}</span></td>
				<td align="right"><span class="saturdayStaffIncomePL">${wagesReport.wages[5].staffIncome}</span></td>
				<td align="right"><span class="sundayStaffIncomePL">${wagesReport.wages[6].staffIncome}</span></td>
				<td align="right"><span class="staffTotalIncomePL">${wagesReport.totalIncome}</span> </td>
		      </tr>
     </c:forEach>
    </c:if>
      
      <tr>
        <td class="total"></td><td class="total">Total</td>
        <td align="right" class="total"><span id="TotalPL1" class="profitNLoss1"> 0.00</span></td>
        <td align="right" class="total"><span id="TotalPL2" class="profitNLoss2"> 0.00</span></td>
        <td align="right" class="total"><span id="TotalPL3" class="profitNLoss3"> 0.00</span></td>
        <td align="right" class="total"><span id="TotalPL4" class="profitNLoss4"> 0.00</span></td>
   		<td align="right" class="total"><span id="TotalPL5" class="profitNLoss5"> 0.00</span></td>
        <td align="right" class="total"><span id="TotalPL6" class="profitNLoss6"> 0.00</span></td>
        <td align="right" class="total"><span id="TotalPL7" class="profitNLoss7"> 0.00</span></td>
        <td align="right" class="total"><span id="incomeTotalPL"> 0.00</span></td>
      </tr>

  </tbody></table>
  </div>
        </div>

<div style="display:block; border:none;" class="accordion-manual-content table-responsive">
<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" class="table table-bordered" id="ServiceEevnt">
       <tbody><tr>
        <th width="39px" class="thclass">&nbsp;</th>
		<th width="200px" align="center" class="thclass"></th>
		<th align="center" class="thclass">Monday</th>
  		<th align="center" class="thclass">Tuesday</th>
        <th align="center" class="thclass">Wednesday</th>
        <th align="center" class="thclass">Thursday</th>
        <th align="center" class="thclass">Friday</th>
        <th align="center" class="thclass">Saturday</th>
   		<th align="center" class="thclass">Sunday</th>
        <th align="center" class="thclass">Total</th>
      </tr>
	  
      <tr>
       <td>&nbsp;</td>
       <td>Labour Cost % Against Prediction</td>
    	<td align="right" id="labourCost1">0.00</td>
        <td align="right" id="labourCost2">0.00</td>
  		<td align="right" id="labourCost3">0.00</td>
  		<td align="right" id="labourCost4">0.00</td>
		<td align="right" id="labourCost5">0.00</td>
  		<td align="right" id="labourCost6">0.00</td>
  		<td align="right" id="labourCost7">0.00</td>
  		<td align="right" id="labourCostTot">0.00</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Daily Revenue Prediction</td>
    	<td align="right"><input type="text" style="width:80px !important" class="input-drawer dailyPrediction" id="dailyPredict1" value="0.0"></td>
        <td align="right"><input type="text" style="width:80px !important" class="input-drawer dailyPrediction" id="dailyPredict2" value="0.0"></td>
  		<td align="right"><input type="text" style="width:80px !important" class="input-drawer dailyPrediction" id="dailyPredict3" value="0.0"></td>
  		<td align="right"><input type="text" style="width:80px !important" class="input-drawer dailyPrediction" id="dailyPredict4" value="0.0"></td>
		<td align="right"><input type="text" style="width:80px !important" class="input-drawer dailyPrediction" id="dailyPredict5" value="0.0"></td>
  		<td align="right"><input type="text" style="width:80px !important" class="input-drawer dailyPrediction" id="dailyPredict6" value="0.0"></td>
  		<td align="right"><input type="text" style="width:80px !important" class="input-drawer dailyPrediction" id="dailyPredict7" value="0.0"></td>
  		<td align="right"><span id="dailyPredictionTotal">0.00</span></td>
      </tr>
     
    <tr>
        <td>&nbsp;</td>
        <td>Predicet Rev less GST</td>
	    <td align="right" id="predRevGst1">0.00</td>
	    <td align="right" id="predRevGst2">0.00</td>
	 	<td align="right" id="predRevGst3">0.00</td>
	 	<td align="right" id="predRevGst4">0.00</td>
		<td align="right" id="predRevGst5">0.00</td>
	 	<td align="right" id="predRevGst6">0.00</td>
	 	<td align="right" id="predRevGst7">0.00</td>
	  	<td align="right" id="predTot">0.00</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Actual Daily Revenue</td>
    	<td align="right" id="actDaily1">${reportData[0].actualDailyRevenue}</td>
        <td align="right" id="actDaily2">${reportData[1].actualDailyRevenue}</td>
  		<td align="right" id="actDaily3">${reportData[2].actualDailyRevenue}</td>
  		<td align="right" id="actDaily4">${reportData[3].actualDailyRevenue}</td>
		<td align="right" id="actDaily5">${reportData[4].actualDailyRevenue}</td>
  		<td align="right" id="actDaily6">${reportData[5].actualDailyRevenue}</td>
  		<td align="right" id="actDaily7">${reportData[6].actualDailyRevenue}</td>
  		<td align="right" id="actTot">0.00</td>
     </tr>
      <tr>
                 <td>&nbsp;</td>
<td>Revenue Prediction Variance
</td>
    	<td align="right" id="revPred1">0.00</td>
        <td align="right" id="revPred2">0.00</td>
  		<td align="right" id="revPred3">0.00</td>
  		<td align="right" id="revPred4">0.00</td>
		<td align="right" id="revPred5">0.00</td>
  		<td align="right" id="revPred6">0.00</td>
  		<td align="right" id="revPred7">0.00</td>
  		<td align="right" id="revPred8">0.00</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
<td>Revenue
</td>
    	<td align="right" id="revenue1">${reportData[0].actualDailyRevenue}</td>
        <td align="right" id="revenue2">${reportData[1].actualDailyRevenue}</td>
  		<td align="right" id="revenue3">${reportData[2].actualDailyRevenue}</td>
  		<td align="right" id="revenue4">${reportData[3].actualDailyRevenue}</td>
		<td align="right" id="revenue5">${reportData[4].actualDailyRevenue}</td>
  		<td align="right" id="revenue6">${reportData[5].actualDailyRevenue}</td>
  		<td align="right" id="revenue7">${reportData[6].actualDailyRevenue}</td>
  		<td align="right" id="revenueTot">0.00</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
		<td>GST</td>
    	<td align="right" id="gst1">0.00</td>
        <td align="right" id="gst2">0.00</td>
  		<td align="right" id="gst3">0.00</td>
  		<td align="right" id="gst4">0.00</td>
		<td align="right" id="gst5">0.00</td>
  		<td align="right" id="gst6">0.00</td>
  		<td align="right" id="gst7">0.00</td>
  		<td align="right" id="gstTot">0.00</td>
      </tr>
      
      <tr class="total">
        <td class="total"></td>
        <td class="total">Total Actual Income</td>
        <td align="right" class="total" id="totActIncome1">0.00</td>
        <td align="right" class="total" id="totActIncome2">0.00</td>
        <td align="right" class="total" id="totActIncome3">0.00</td>
        <td align="right" class="total" id="totActIncome4">0.00</td>
        <td align="right" class="total" id="totActIncome5">0.00 </td>
   		<td align="right" class="total" id="totActIncome6">0.00</td>
        <td align="right" class="total" id="totActIncome7">0.00</td>
        <td align="right" class="total" id="totActIncomeTotal">0.00 </td>
      </tr>
	  <tr class="total">
        <td class="total"></td>
        <td class="total">Actual Staff Cost</td>
        <td align="right" class="total" id="actStaffCost1">0.00</td>
        <td align="right" class="total" id="actStaffCost2">0.00</td>
        <td align="right" class="total" id="actStaffCost3">0.00</td>
        <td align="right" class="total" id="actStaffCost4">0.00</td>
        <td align="right" class="total" id="actStaffCost5">0.00</td>
   		<td align="right" class="total" id="actStaffCost6">0.00</td>
        <td align="right" class="total" id="actStaffCost7">0.00</td>
        <td align="right" class="total" id="actStaffCostTotal">0.00</td>
      </tr>
  </tbody>
 </table>
  </div>
	<div class="accordion-manual-content table-responsive" style="display:block; border:none;">
	<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt" class="table table-bordered">
       <tbody>
	  
      <tr>
        <th width="39px" class="thclass">&nbsp;</th>
		<th width="200px" align="center" class="thclass"></th>
		<th align="center" class="thclass">Monday</th>
	  	<th align="center" class="thclass">Tuesday</th>
        <th align="center" class="thclass">Wednesday</th>
        <th align="center" class="thclass">Thursday</th>
        <th align="center" class="thclass">Friday</th>
        <th align="center" class="thclass">Saturday</th>
  		<th align="center" class="thclass">Sunday</th>
        <th align="center" class="thclass">Total</th>
      </tr>

	<tr>
       <td width="39px" rowspan="3">&nbsp;</td>
       <td rowspan="3">Food Income</td>
   		<td align="right" id="foodInc11">${reportData[0].profitLoss[0].totalFoodIncome}</td>
        <td align="right" id="foodInc12">${reportData[1].profitLoss[0].totalFoodIncome}</td>
  		<td align="right" id="foodInc13">${reportData[2].profitLoss[0].totalFoodIncome}</td>
  		<td align="right" id="foodInc14">${reportData[3].profitLoss[0].totalFoodIncome}</td>
		<td align="right" id="foodInc15">${reportData[4].profitLoss[0].totalFoodIncome}</td>
  		<td align="right" id="foodInc16">${reportData[5].profitLoss[0].totalFoodIncome}</td>
  		<td align="right" id="foodInc17">${reportData[6].profitLoss[0].totalFoodIncome}</td>
  		<td align="right" id="foodInc1">0.00</td>
   		<td align="right" id="foodPer1">0.00</td>
    	<td align="right" id="foodTotPer" rowspan="3">0.00</td>
      </tr>
      <tr>
        <td align="right" id="foodInc21">${reportData[0].profitLoss[1].totalFoodIncome}</td>
        <td align="right" id="foodInc22">${reportData[1].profitLoss[1].totalFoodIncome}</td>
  		<td align="right" id="foodInc23">${reportData[2].profitLoss[1].totalFoodIncome}</td>
  		<td align="right" id="foodInc24">${reportData[3].profitLoss[1].totalFoodIncome}</td>
		<td align="right" id="foodInc25">${reportData[4].profitLoss[1].totalFoodIncome}</td>
  		<td align="right" id="foodInc26">${reportData[5].profitLoss[1].totalFoodIncome}</td>
  		<td align="right" id="foodInc27">${reportData[6].profitLoss[1].totalFoodIncome}</td>
  		<td align="right" id="foodInc2">0.00</td>
   		<td align="right" id="foodPer2">0.00</td>
    </tr>
     <tr>
        <td align="right" id="foodInc31">${reportData[0].profitLoss[2].totalFoodIncome}</td>
        <td align="right" id="foodInc32">${reportData[1].profitLoss[2].totalFoodIncome}</td>
  		<td align="right" id="foodInc33">${reportData[2].profitLoss[2].totalFoodIncome}</td>
  		<td align="right" id="foodInc34">${reportData[3].profitLoss[2].totalFoodIncome}</td>
		<td align="right" id="foodInc35">${reportData[4].profitLoss[2].totalFoodIncome}</td>
  		<td align="right" id="foodInc36">${reportData[5].profitLoss[2].totalFoodIncome}</td>
  		<td align="right" id="foodInc37">${reportData[6].profitLoss[2].totalFoodIncome}</td>
  		<td align="right" id="foodInc3">0.00</td>
   		<td align="right" id="foodPer3">0.00</td>
    </tr>
    <tr>
         <td rowspan="3" style="background-color:#FFFFFF;">&nbsp;</td>
         <td rowspan="3" style="background-color:#FFFFFF;">Beverage Income</td>
    	<td align="right" id="bevInc11">${reportData[0].profitLoss[0].totalBeverageIncome}</td>
        <td align="right" id="bevInc12">${reportData[1].profitLoss[0].totalBeverageIncome}</td>
  		<td align="right" id="bevInc13">${reportData[2].profitLoss[0].totalBeverageIncome}</td>
  		<td align="right" id="bevInc14">${reportData[3].profitLoss[0].totalBeverageIncome}</td>
		<td align="right" id="bevInc15">${reportData[4].profitLoss[0].totalBeverageIncome}</td>
  		<td align="right" id="bevInc16">${reportData[5].profitLoss[0].totalBeverageIncome}</td>
  		<td align="right" id="bevInc17">${reportData[6].profitLoss[0].totalBeverageIncome}</td>
  		<td align="right" id="bevInc1">0.00</td>
   		<td align="right" id="bevPer1">0.00</td>
    	<td align="right" id="bevTotPer" rowspan="3">0.00</td>
      </tr>
      <tr>
        <td align="right" id="bevInc21">${reportData[0].profitLoss[1].totalBeverageIncome}</td>
        <td align="right" id="bevInc22">${reportData[1].profitLoss[1].totalBeverageIncome}</td>
  		<td align="right" id="bevInc23">${reportData[2].profitLoss[1].totalBeverageIncome}</td>
  		<td align="right" id="bevInc24">${reportData[3].profitLoss[1].totalBeverageIncome}</td>
		<td align="right" id="bevInc25">${reportData[4].profitLoss[1].totalBeverageIncome}</td>
  		<td align="right" id="bevInc26">${reportData[5].profitLoss[1].totalBeverageIncome}</td>
  		<td align="right" id="bevInc27">${reportData[6].profitLoss[1].totalBeverageIncome}</td>
  		<td align="right" id="bevInc2">0.00</td>
   		<td align="right" id="bevPer2">0.00</td>
    </tr>
     <tr>
        <td align="right" id="bevInc31">${reportData[0].profitLoss[2].totalBeverageIncome}</td>
        <td align="right" id="bevInc32">${reportData[1].profitLoss[2].totalBeverageIncome}</td>
  		<td align="right" id="bevInc33">${reportData[2].profitLoss[2].totalBeverageIncome}</td>
  		<td align="right" id="bevInc34">${reportData[3].profitLoss[2].totalBeverageIncome}</td>
		<td align="right" id="bevInc35">${reportData[4].profitLoss[2].totalBeverageIncome}</td>
  		<td align="right" id="bevInc36">${reportData[5].profitLoss[2].totalBeverageIncome}</td>
  		<td align="right" id="bevInc37">${reportData[6].profitLoss[2].totalBeverageIncome}</td>
  		<td align="right" id="bevInc3">0.00</td>
   		<td align="right" id="bevPer3">0.00</td>
    </tr>
      <tr>
        <td class="total"></td><td class="total">Total</td>
        <td align="right" class="total" id="fbInc1">0.00</td>
        <td align="right" class="total" id="fbInc2">0.00</td>
        <td align="right" class="total" id="fbInc3">0.00</td>
        <td align="right" class="total" id="fbInc4">0.00</td>
   		<td align="right" class="total" id="fbInc5">0.00</td>
        <td align="right" class="total" id="fbInc6">0.00</td>
        <td align="right" class="total" id="fbInc7">0.00</td>
        <td align="right" class="total" id="fbInc8">00.00</td>
      </tr>
  </tbody></table>
        </div>

<div style="display:block; border:none;" class="accordion-manual-content table-responsive">
<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" class="table table-bordered" id="ServiceEevnt">
       <tbody>
	  
      <tr>
        <th width="39px" class="thclass">&nbsp;</th>
		<th width="200px" align="center" class="thclass"></th>
		<th align="center" class="thclass">Monday</th>
  		<th align="center" class="thclass">Tuesday</th>
        <th align="center" class="thclass">Wednesday</th>
        <th align="center" class="thclass">Thursday</th>
        <th align="center" class="thclass">Friday</th>
        <th align="center" class="thclass">Saturday</th>
   		<th align="center" class="thclass">Sunday</th>
        <th align="center" class="thclass">Total</th>
      </tr>
	<tr>
		<td width="39px">&nbsp;</td>
       	<td>Food Spend Budget</td>
    	<td align="right" id="fspend1">0.00</td>
        <td align="right" id="fspend2">0.00</td>
	 	<td align="right" id="fspend3">0.00</td>
	  	<td align="right" id="fspend4">0.00</td>
		<td align="right" id="fspend5">0.00</td>
	  	<td align="right" id="fspend6">0.00</td>
	  	<td align="right" id="fspend7">0.00</td>
	  	<td align="right" id="fspendTot">0.00</td>
	   	<td align="right" id="fspendPer">0.00</td>
     </tr>
      <tr>
        <td></td>
		<td>Actual Food Spend</td>
		<td align="right" id="actFoodSpend1">${reportData[0].actualFoodSpendTotal}</td>
        <td align="right" id="actFoodSpend2">${reportData[1].actualFoodSpendTotal}</td>
	  	<td align="right" id="actFoodSpend3">${reportData[2].actualFoodSpendTotal}</td>
	  	<td align="right" id="actFoodSpend4">${reportData[3].actualFoodSpendTotal}</td>
		<td align="right" id="actFoodSpend5">${reportData[4].actualFoodSpendTotal}</td>
	 	<td align="right" id="actFoodSpend6">${reportData[5].actualFoodSpendTotal}</td>
	  	<td align="right" id="actFoodSpend7">${reportData[6].actualFoodSpendTotal}</td>
	  	<td align="right" id="actFoodSpendTot">0.00</td>
	   	<td align="right" id="actFoodSpendPct">0.00</td>
    </tr>
     
    <tr>
        <td>&nbsp;</td>
        <td>Variance</td>
    	<td align="right" id="fvarience1">0.00</td>
        <td align="right" id="fvarience2">0.00</td>
		<td align="right" id="fvarience3">0.00</td>
		<td align="right" id="fvarience4">0.00</td>
		<td align="right" id="fvarience5">0.00</td>
	  	<td align="right" id="fvarience6">0.00</td>
	  	<td align="right" id="fvarience7">0.00</td>
	  	<td align="right" id="fvarienceTot">0.00</td>
	   	<td align="right" id="fvariencePer">0.00</td>
     </tr>
      
      
  </tbody></table>
        </div>
<div class="accordion-manual-content table-responsive" style="display:block; border:none;">
<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt" class="table table-bordered">
       <tbody>
	  
      <tr>
        <th width="39px" class="thclass">&nbsp;</th>
		<th width="200px" align="center" class="thclass"></th>
		<th align="center" class="thclass">Monday</th>
  		<th align="center" class="thclass">Tuesday</th>
        <th align="center" class="thclass">Wednesday</th>
        <th align="center" class="thclass">Thursday</th>
        <th align="center" class="thclass">Friday</th>
        <th align="center" class="thclass">Saturday</th>
   		<th align="center" class="thclass">Sunday</th>
        <th align="center" class="thclass">Total</th>
      </tr>
	<tr>
		<td width="39px">&nbsp;</td>
       	<td>Beverage Spend Budget</td>
    	<td align="right" id="bspend1">0.00</td>
        <td align="right" id="bspend2">0.00</td>
  		<td align="right" id="bspend3">0.00</td>
  		<td align="right" id="bspend4">0.00</td>
		<td align="right" id="bspend5">0.00</td>
  		<td align="right" id="bspend6">0.00</td>
  		<td align="right" id="bspend7">0.00</td>
  		<td align="right" id="bspendTot">0.00</td>
   		<td align="right" id="bspendPer">0.00</td>
    </tr>
      <tr>
        <td></td>
		<td>Actual Beverage Spend</td>
		<td align="right" id="actBevSpend1">${reportData[0].actualBeverageSpendTotal}</td>
        <td align="right" id="actBevSpend2">${reportData[1].actualBeverageSpendTotal}</td>
	  	<td align="right" id="actBevSpend3">${reportData[2].actualBeverageSpendTotal}</td>
	  	<td align="right" id="actBevSpend4">${reportData[3].actualBeverageSpendTotal}</td>
		<td align="right" id="actBevSpend5">${reportData[4].actualBeverageSpendTotal}</td>
	 	<td align="right" id="actBevSpend6">${reportData[5].actualBeverageSpendTotal}</td>
	  	<td align="right" id="actBevSpend7">${reportData[6].actualBeverageSpendTotal}</td>
  		<td align="right" id="actBevSpendTot">0.00</td>
   		<td align="right" id="actBevSpendPct">0.00</td>
    </tr>
     
    <tr>
       	<td>&nbsp;</td>
		<td>Variance</td>
		<td align="right" id="bvarience1">0.00</td>
		<td align="right" id="bvarience2">0.00</td>
		<td align="right" id="bvarience3">106.79</td>
		<td align="right" id="bvarience4">0.00</td>
		<td align="right" id="bvarience5">101.70</td>
		<td align="right" id="bvarience6">0.00</td>
		<td align="right" id="bvarience7">111.87</td>
		<td align="right" id="bvarienceTot">0.00</td>
		<td align="right" id="bvariencePer">0.00</td>
   </tr>
  </tbody></table>
        </div>
<div class="accordion-manual-content table-responsive" style="display:block; border:none;">
<table width="59%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt" class="table table-bordered">
       <tbody>
	  
      <tr>
        <th width="39" class="thclass">&nbsp;</th>
<th width="200" align="center" class="thclass"></th><th align="center" class="thclass">Percentage</th>
  <th align="center" class="thclass">Out</th>
        <th align="center" class="thclass">In</th>
        <th align="center" class="thclass"></th>
        <th align="center" class="thclass"></th>
        <th align="center" class="thclass"></th>
      </tr>
<tr>
       
<td width="39">&nbsp;</td>
       <td>Turnover</td>

    <td align="right"></td>
        <td align="right"></td>
  <td align="right" id="turnoverIn">0.00</td>
  <td align="right"></td>
<td align="right"></td>
  
  
  
   <td align="right"></td>
      </tr>
      <tr>
        <td></td>
<td>Food cost</td>

<td align="right"><input type="text" style="width:80px !important" class="input-drawer"  id="foodCostP" value="0"></td>
        <td align="right" id="fCostOut">0.00</td>
  <td align="right" id="fCostIn">0.00</td>
  <td align="right"><input type="text" style="width:80px !important" class="input-drawer" id="foodSaleP" value="0"></td>
<td align="center">Food Sales %</td>
  <td align="right"></td>
    </tr>
     
    <tr>
         <td>&nbsp;</td>
         <td>Beverage cost</td>
    <td align="right"><input type="text" style="width:80px !important" class="input-drawer" id="bevCostP" value="0"></td>
        <td align="right"  id="bCostOut">0.00</td>
  <td align="right"  id="bCostIn">0.00</td>
  <td align="right"><input type="text" style="width:80px !important" class="input-drawer" id="bevSaleP" value="0"></td>
<td align="center">Bev Sales %</td>
  <td align="right"></td>
      </tr>
<tr>
        <td></td>
<td>Labour</td>

<td align="right"><input type="text" style="width:80px !important" class="input-drawer" id="labourCostPer" value="0"></td>
        <td align="right" id="labourCostOut">9365.97</td>
  <td align="right"></td>
  <td align="center" style="font-weight:bold; font-size:22px;" rowspan="2" colspan="2"  id="turnoverTotal">0.00		
		
		
</td>
<td align="center" style="font-weight:bold; font-size:22px;" rowspan="2"  id="turnoverTotalPer">0%


</td>
    </tr>
<tr>
         <td>&nbsp;</td>
         <td></td>
    <td align="right"></td>
        <td align="right"  id="costOutTotal">0.00</td>
  <td align="right"  id="turnoverInCopy">0.00</td>
  </tr>
  </tbody></table>
        </div>
<div class="accordion-manual-content table-responsive" style="display:block; border:none;">
<table width="59%" cellspacing="1" cellpadding="5" border="0" bgcolor="#e0e0e0" id="ServiceEevnt" class="table table-bordered">
       <tbody>
	  
      <tr>
        <th width="39" class="thclass">&nbsp;</th>
<th width="200" align="center" class="thclass"></th><th align="center" class="thclass">Percentage</th>
  <th align="center" class="thclass">Out</th>
        <th align="center" class="thclass">In</th>
        <th align="center" class="thclass"></th>
        <th align="center" class="thclass"></th>
        <th align="center" class="thclass"></th>
      </tr>
<tr>
       
<td width="39">&nbsp;</td>
       <td>Turnover</td>

    <td align="right"></td>
        <td align="right"></td>
  <td align="right"   id="turnoverInFinal">0.00</td>
  <td align="right"></td>
<td align="right"></td>
  
  
  
   <td align="right"></td>
      </tr>
      <tr>
        <td></td>
<td>Food cost</td>

<td align="right" id="fPerFinal">0%</td>
        <td align="right" id="fCostOutFinal">0.00</td>
  <td align="right"  id="fCostInFinal">0.00</td>
  <td align="right"  id="foodSalePFinal">0%</td>
<td align="center">Food Sales %</td>
  <td align="right"></td>
    </tr>
     
    <tr>
         <td>&nbsp;</td>
         <td>Beverage cost</td>
    <td align="right" id="bPerFinal">0%</td>
        <td align="right"  id="bCostOutFinal">0.00</td>
  <td align="right"  id="bCostInFinal">0.00</td>
  <td align="right" id="bevSalePFinal">0%</td>
<td align="center">Bev Sales %</td>
  <td align="right"></td>
      </tr>
<tr>
        <td></td>
<td>Labour</td>

<td align="right" id="labourPerFinal">27%</td>
        <td align="right" id="labourOutFinal">$9,365.97</td>
  <td align="right"></td>
  <td align="center" colspan="2" rowspan="2" style="font-weight:bold; font-size:22px;"  id="turnoverFinalTotal">19898.20		
		
		
	
		
		
</td>
<td align="center" rowspan="2" style="font-weight:bold; font-size:22px;" id="turnoverFinalPer">0%


</td>
    </tr>
<tr>
         <td>&nbsp;</td>
         <td></td>
    <td align="right"></td>
        <td align="right" id="turnoverOutTotal">0.00</td>
  <td align="right" id="turnoverInTotal">0.00</td>
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
