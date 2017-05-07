<html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<style type="text/css">

	.budgetDiv {   height: auto; overflow: hidden;	 width: 95%;	}
    .box{  padding: 20px; display: block;  margin-top: 20px; border: 1px solid #000; }
    .budgetLabel{ display: inline-block; font-size: 13px; font-weight: bold; margin-bottom: 5px;  }
    /* .ui-budget-slider-handle { cursor: default; height: 1.2em  position: absolute; width: 14.2em; z-index: 2;} */
    .padding-bottom{padding-bottom:38px;}
    .divScroll { overflow-x: scroll; /*  height:200px;  width:100px; */  }
 </style>
  
<script type="text/javascript">
$(function(){
		$(".ServiceBudgate tr:nth-child(odd)").css("background", "#ffffff");
		$(".ServiceBudgate tr:nth-child(even)").css("background", "#f8f8f8");
	});
	
	$(document).ready(function(){
    $("#basic_budget_setting").show();
    $("#service_budget_setting").hide();
    $("#weekday_budget_setting").hide();
    $("#weekdayandservice_budget_setting").hide();
			$('input[type="radio"]').click(function(){

				if($(this).attr("value")=="basic"){

					$(".box").not("#basic_budget_setting").hide();

					$("#basic_budget_setting").show();

				}

				if($(this).attr("value")=="byService"){

					$(".box").not("#service_budget_setting").hide();

					$("#service_budget_setting").show();

				}

				if($(this).attr("value")=="byDayOfWeek"){

					$(".box").not("#weekday_budget_setting").hide();

					$("#weekday_budget_setting").show();

				}
				
				if($(this).attr("value")=="byDay&Service"){

					 $(".box").not("#weekdayandservice_budget_setting").hide();
                     
                     $("#weekdayandservice_budget_setting").show();
				}
			});
    });

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
</head> 

<body>
<div id="budget-content" class="accordion-manual-content" style="display:block">
	<div>
         <label class="budgetLabel"><input type="radio" name="budgetType" value="basic" checked="checked" >Basic</label>
         <label class="budgetLabel"><input type="radio" name="budgetType" value="byService"> By Service</label>
         <label class="budgetLabel"><input type="radio" name="budgetType" value="byDayOfWeek"> By Day Of week</label>
         <label class="budgetLabel"><input type="radio" name="budgetType" value="byDay&Service"> By Day & Service</label>
    </div>        
  		<div id="basic_budget_setting" class="budgetDiv box"> 
		<form method="post" id="BasicBudgetList" name="BasicBudgetList">	
	   		<table id="basicbudget" class="ServiceBudgate" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="2" cellpadding="5">
				      <tbody> 
			      		<%-- <c:forEach items="" var="budget" varStatus="loopTwo"> --%>
				 		    <tr>
				 		    	<th class="thclass">Weekly Turnover</th>
				 		    	<td>$ &nbsp;<input type="text" id="weeklyTurnOver" name="weeklyTurnOver" value=""></td>
				 		    </tr>
					 		<tr> 
					 			<th class="thclass">Turnover Split</th>
					 			<td>
					 				<table>
					 					<tr>
					 						<th align="center" class="thclass">Food</th>
					 						<th align="center"class="thclass">Beverage</th>
					 					</tr>
					 					<tr>
					 						<td>
				 						      	<input type="text" id="foodTS" name="foodTS" value="">%
					 						</td>
					 						<td>
					 							 <input type="text" id="beverageTS" name="beverageTS" value="">%
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
					 						<th align="center" class="thclass">Food</th>
					 						<th align="center"class="thclass">Beverage</th>
					 					</tr>
					 					<tr>
					 						<td>
				 								<input type="text" id="foodCost" name="foodCost" value="">%
					 						</td>
					 						<td>
					 							<input type="text" id="beverageCost" name="beverageCost" value="">%
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
	
 	<div id="service_budget_setting" class="budgetDiv box divScroll"> 
		<form method="post" id="ServiceBudgetList" name="ServiceBudgetList" style="width: 1050px; ">	
	   		<table id="sericeBudget" class="ServiceBudgate" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5" style="width: 1225px; ">
		     	<tbody>
		                  <tr>
		                  	<th  class="thclass"></th>
		                    <th style="text-align:center;" class="thclass">Turnover</th>
		                    <th style="text-align:center;" class="thclass">Turnover split</th>
		                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
					      </tr>
				 		 <%-- <c:forEach items="" var="budget" varStatus="loopTwo"> --%>
				 		     
					 		<tr>
				 		    	<th class="thclass">Breakfast</th>
				 		    		<td  style="width: 180px;padding-bottom:0px; ">
			 						<br />$ &nbsp;<input type="text" id="serviceBTO" name="serviceBTO" value="" >
			 						</td> 
			 					<td style="width: 403px; ">
					 				<table>
					 					<tr>
					 						<th align="center" class="thclass">Food</th>
					 						<th align="center"class="thclass">Beverage</th>
					 					</tr>
					 					<tr>
					 						<td>
				 								<input type="text" id="serviceBFoodTS" name="serviceBFoodTS" value="" >%
					 						</td>
					 						<td>
					 							<input type="text" id="serviceBBeverageTS" name="serviceBBeverageTS" value="">%
					 						</td>
					 					</tr>
					 				</table>
					 			</td>
				 		    	<td style="width: 403px; ">
					 				<table>
					 					<tr>
					 						<th align="center" class="thclass">Food</th>
					 						<th align="center"class="thclass">Beverage</th>
					 					</tr>
					 					<tr>
					 						<td>
					 							<input type="text" id="serviceBFoodCost" name="serviceBFoodCost" value="">%
					 						</td>
					 						<td>
					 							<input type="text" id="serviceBBeverageCost" name="serviceBBeverageCost" value="">%
					 						</td>
					 					</tr>
					 				</table>
					 			</td>
				 		    </tr>
				 		    <tr>
				 		    	<th class="thclass">Lunch</th>
				 		    	<td style="width: 180px;padding-bottom:0px; ">
					 				<br />$ &nbsp;<input type="text" id="serviceLTO" name="serviceLTO" value="">
		 						</td>
					 					 
				 		    	<td>
					 				<table>
					 					<tr>
					 						<th align="center" class="thclass">Food</th>
					 						<th align="center"class="thclass">Beverage</th>
					 					</tr>
					 					<tr>
					 						<td>
					 							<input type="text" id="serviceLFoodTS" name="serviceLFoodTS" value="">%
					 						</td>
					 						<td>
					 							<input type="text" id="serviceLBeverageTS" name="serviceLBeverageTS" value="">%
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
					 							<input type="text" id="serviceLFoodCost" name="serviceLFoodCost" value="">%
					 						</td>
					 						<td>
					 							<input type="text" id="serviceLBeverageCost" name="serviceLBeverageCost" value="">%
					 						</td>
					 					</tr>
					 				</table>
					 			</td>
				 		    </tr>
				 		    <tr>
				 		    	<th class="thclass">Dinner</th>
				 		    	<td style="width: 180px;padding-bottom:0px; "> 
					 				<br />$ &nbsp;<input type="text" id="serviceDTO" name="serviceDTO" value="">
					 			</td>	
					 			<td>
					 				<table>
					 					<tr>
					 						<th align="center" class="thclass">Food</th>
					 						<th align="center"class="thclass">Beverage</th>
					 					</tr>
					 					<tr>
					 						<td>
					 							<input type="text" id="serviceDFoodTS" name="serviceDFoodTS" value="">%
					 						</td>
					 						<td>
					 							<input type="text" id="serviceDBeverageTS" name="serviceDBeverageTS" value="">%
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
					 							<input type="text" id="serviceDFoodCost" name="serviceDFoodCost" value="">%
					 						</td>
					 						<td>
					 							<input type="text" id="serviceDBeverageCost" name="serviceDBeverageCost" value="">%
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
	
	<div id="weekday_budget_setting" class="budgetDiv box divScroll"> 
		<form method="post" id="WeekdayBudgetList" name="weeekdayBudgetList">	
	   		<table id="weekdayBudget" class="ServiceBudgate" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
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
			 		    	<th class="thclass">Weekly Turnover</th>
			 		    	<td><br />$ &nbsp;<input type="text" id="monTurnOver" name="monTO" value=""></td>
			 		    	<td><br />$ &nbsp;<input type="text" id="tueTurnOver" name="tueTO" value=""></td>
			 		    	<td><br />$ &nbsp;<input type="text" id="wedTurnOver" name="wedTO" value=""></td>
			 		    	<td><br />$ &nbsp;<input type="text" id="thurTurnOver" name="thurTO" value=""></td>
			 		    	<td><br />$ &nbsp;<input type="text" id="friTurnOver" name="friTO" value=""></td>
			 		    	<td><br />$ &nbsp;<input type="text" id="satTurnOver" name="satTO" value=""></td>
			 		    	<td><br />$ &nbsp;<input type="text" id="sunTurnOver" name="sunTO" value=""></td>
			 		    </tr>
				 		<tr> 
				 			<th class="thclass">Turnover Split</th>
				 			<td>
				 				<table>
				 					<tr>
				 						<th align="center" class="thclass">Food</th>
				 						<th align="center"class="thclass">Beverage</th>
				 					</tr>
				 					<tr>
				 						<td>
				 							<input type="text" id="monFoodTS" name="monFoodTS" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="monBeverageTS" name="monBeverageTS" value="">%
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
				 							<input type="text" id="tueFoodTS" name="tueFoodTS" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="tueBeverageTS" name="tueBeverageTS" value="">%
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
				 							<input type="text" id="wedFoodTS" name="wedFoodTS" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="wedBeverageTS" name="wedBeverageTS" value="">%
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
				 						<th align="center" class="thclass">Food</th>
				 						<th align="center"class="thclass">Beverage</th>
				 					</tr>
				 					<tr>
				 						<td>
				 							<input type="text" id="thurFoodTS" name="thurFoodTS" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="thurBeverageTS" name="thurBeverageTS" value="">%
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
				 							<input type="text" id="friFoodTS" name="friFoodTS" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="friBeverageTS" name="friBeverageTS" value="">%
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
				 							<input type="text" id="satFoodTS" name="satFoodTS" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="satBeverageTS" name="satBeverageTS" value="">%
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
				 							<input type="text" id="sunFoodTS" name="sunFoodTS" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="sunBeverageTS" name="sunBeverageTS" value="">%
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
				 						<th align="center" class="thclass">Food</th>
				 						<th align="center"class="thclass">Beverage</th>
				 					</tr>
				 					<tr>
				 						<td>
				 							<input type="text" id="monFoodCost" name="monFoodCost" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="monBeverageCost" name="monBeverageCost" value="">%
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
				 							<input type="text" id="tueFoodCost" name="tueFoodCost" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="tueBeverageCost" name="tueBeverageCost" value="">%
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
				 							<input type="text" id="wedFoodCost" name="wedFoodCost" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="wedBeverageCost" name="wedBeverageCost" value="">%
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
				 							<input type="text" id="thurFoodCost" name="thurFoodCost" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="thurBeverageCost" name="thurBeverageCost" value="">%
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
				 							<input type="text" id="friFoodCost" name="friFoodCost" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="friBeverageCost" name="friBeveragecost" value="">%
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
				 							<input type="text" id="satFoodCost" name="satFoodCost" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="satBeverageCost" name="satBeverageCost" value="">%
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
				 							<input type="text" id="sunFoodCost" name="sunFoodCost" value="">%
				 						</td>
				 						<td>
				 							<input type="text" id="sunBeverageCost" name="sunBeverageCost" value="">%
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
	
	<div id="weekdayandservice_budget_setting" class="budgetDiv box divScroll"> 
		<form method="post" id="weekdayandserviceBudgetList" name="weekdayandserviceBudgetList">	
			<table id="weekdayandservicebudget" class="ServiceBudgate" width="70%" bgcolor="#e0e0e0" border="0" cellspacing="1" cellpadding="5">
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
	                  	<th class="thclass" style="text-align:left;">Breakfast</th>
	                  	<td>
	                  		<table>
	                  			<tr>
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  			<br />$ &nbsp;<input type="text" id="monBTO" name="monBTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
		                  				<tr>
					 						<th align="center" class="thclass">Food</th>
					 						<th align="center"class="thclass">Beverage</th>
				 						</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="monBFoodTS" name="monBFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="monBBeverageTS" name="monBBeverageTS" value="">%
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
			                  						<input type="text" id="monBFoodCost" name="monBFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="monBBeverageCost" name="monBBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp;<input type="text" id="tueBTO" name="tueBTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="tueBFoodTS" name="tueBFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="tueBBeverageTS" name="tueBBeverageTS" value="">%
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
			                  						<input type="text" id="tueBFoodCost" name="tueBFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="tueBBeverageCost" name="tueBBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp;<input type="text" id="wedBTO" name="mwedBTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="wedBFoodTS" name="wedBFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="wedBBeverageTS" name="wedBBeverageTS" value="">%
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
			                  						<input type="text" id="wedBFoodCost" name="wedBFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="wedBBeverageCost" name="wedBBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="thurBTO" name="thurBTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="thurBFoodTS" name="thurBFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="thurBBeverageTS" name="thurBBeverageTS" value="">%
						 						</td> 
			                  				</tr>
			                  			</table>
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="thurBFoodCost" name="thurBFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="thurBBeverageCost" name="thurBBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="friBTO" name="friBTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="friBFoodTS" name="friBFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="friBBeverageTS" name="friBBeverageTS" value="">%
						 						</td> 
			                  				</tr>
			                  			</table>
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="friBFoodCost" name="friBFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="friBBeverageCost" name="friBBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="satBTO" name="satBTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="satBFoodTS" name="satBFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="satBBeverageTS" name="satBBeverageTS" value="">%
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
			                  						<input type="text" id="satBFoodCost" name="satBFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="satBBeverageCost" name="satBBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="sunBTO" name="sunBTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="sunBFoodTS" name="sunBFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="sunBBeverageTS" name="sunBBeverageTS" value="">%
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
			                  						<input type="text" id="sunBFoodCost" name="sunBFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="sunBBeverageCost" name="sunBBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  			<br />$ &nbsp;<input type="text" id="monLTO" name="monLTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="monLFoodTS" name="monLFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="monLBeverageTS" name="monLBeverageTS" value="">%
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
			                  						<input type="text" id="monLFoodCost" name="monLFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="monLBeverageCost" name="monLBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		  	<br />$ &nbsp; <input type="text" id="tueLTO" name="tueLTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="tueLFoodTS" name="tueLFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="tueLBeverageTS" name="tueLBeverageTS" value="">%
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
			                  						<input type="text" id="tueLFoodCost" name="tueLFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="tueLBeverageCost" name="tueLBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="wedLTO" name="wedLTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="wedLFoodTS" name="wedLFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="wedLBeverageTS" name="wedLBeverageTS" value="">%
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
			                  						<input type="text" id="wedLFoodCost" name="wedLFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="wedLBeverageCost" name="wedLBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="thurLTO" name="thurLTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="thurLFoodTS" name="thurLFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="thurLBeverageTS" name="thurLBeverageTS" value="">%
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
			                  						<input type="text" id="thurLFoodCost" name="thurLFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="thurLBeverageCost" name="thurLBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="friLTO" name="friLTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="friLFoodTS" name="friLFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="friLBeverageTS" name="friLBeverageTS" value="">%
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
			                  						<input type="text" id="friLFoodCost" name="friLFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="friLBeverageCost" name="friLBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="satLTO" name="satLTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="satLFoodTS" name="satLFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="satLBeverageTS" name="satLBeverageTS" value="">%
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
			                  						<input type="text" id="satLFoodCost" name="satLFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="satLBeverageCost" name="satLBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="sunLTO" name="sunLTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="sunLFoodTS" name="sunLFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="sunLBeverageTS" name="sunLBeverageTS" value="">%
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
			                  						<input type="text" id="sunLFoodCost" name="sunLFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="sunLBeverageCost" name="sunLBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
		                  		 		<br />$ &nbsp;<input type="text" id="monDTO" name="monDTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="monDFoodTS" name="monDFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="monDBeverageTS" name="monDBeverageTS" value="">%
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
			                  						<input type="text" id="monDFoodCost" name="monDFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="monDBeverageCost" name="monDBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="tueDTO" name="tueDTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="tueDFoodTS" name="tueDFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="tueDBeverageTS" name="tueDBeverageTS" value="">%
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
			                  						<input type="text" id="tueDFoodCost" name="tueDFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="tueDBeverageCost" name="tueDBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="wedDTO" name="wedDTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="wedDFoodTS" name="wedDFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="wedDBeverageTS" name="wedDBeverageTS" value="">%
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
			                  						<input type="text" id="wedDFoodCost" name="wedDFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="wedDBeverageCost" name="wedDBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="thurDTO" name="thurDTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="thurDFoodTS" name="thurDFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="thurBBeverageTS" name="thurBBeverageTS" value="">%
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
			                  						<input type="text" id="thurDFoodCost" name="thurDFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="thurDBeverageCost" name="thurDBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="friDTO" name="friDTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="friDFoodTS" name="friDFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="friDBeverageTS" name="friDBeverageTS" value="">%
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
			                  						<input type="text" id="friDFoodCost" name="friDFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="friDBeverageCost" name="friDBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="satDTO" name="satDTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="satDFoodTS" name="satDFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="satDBeverageTS" name="satDBeverageTS" value="">%
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
			                  						<input type="text" id="satDFoodCost" name="satDFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="satDBeverageCost" name="satDBeverageCost" value="">%
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
	                  				<th style="text-align:center;" class="thclass">Turnover</th>
				                    <th style="text-align:center;" class="thclass">Turnover split</th>
				                    <th style="text-align:center;" class="thclass">Cost Of Goods</th>
			                  	</tr>
			                  	<tr>
			                  		<td class="padding-bottom">
			                  		 	<br />$ &nbsp; <input type="text" id="sunDTO" name="sunDTO" value="">
			                  		</td>
			                  		<td>
			                  			<table>
			                  				<tr>
						 						<th align="center" class="thclass">Food</th>
						 						<th align="center"class="thclass">Beverage</th>
				 							</tr>
			                  				<tr>
			                  					<td>
			                  						<input type="text" id="sunDFoodTS" name="sunDFoodTS" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="sunDBeverageTS" name="sunDBeverageTS" value="">%
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
			                  						<input type="text" id="sunDFoodCost" name="sunDFoodCost" value="">%
					 							</td>
						 						<td>
						 							<input type="text" id="sunDBeverageCost" name="sunDBeverageCost" value="">%
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
</html>
</body>