<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="jquery.formError.js" type="text/javascript"></script>

<%@include file="common/resources.jsp" %>

<script type="text/javascript" src="js/shortcut.js"></script>

<script src="js/autoNumeric.js"></script>
 <!-- <script type="text/javascript">
	$(function(){
	    $(".input-drawer,.salesFood,.salesBeverage,.salesOther,.card,.tips").autoNumeric();
        $(".input-drawer,.salesFood,.salesBeverage,.salesOther,.card,.tips").on('load keyup blur', function(){
            if(this.value != null && this.value.match(/^\d{1,3}(,?\d{3})*?(.\d*)?$/)){
                 this.value=this.value.replace(/,/g, "");
               }
        });
    });
</script>  -->

<script>
    shortcut.add("ctrl+alt+f", function() {
       addFoodPurchase();
    });  
    
    shortcut.add("ctrl+alt+b", function() {
       addBeveragePurchase();
    }); 
    
    shortcut.add("ctrl+alt+v", function() {
       addNewCashupVoid();
    });  
    
     shortcut.add("ctrl+alt+s", function() {
       updateCashup();
    });
    
    $(function() {
    	var val = ${tillDetailsListCount};
    	if(val <= 2){
	    	$(".cs_rightBtn").css("display","none");
    	}
    });
    
    
   
</script>

<script>
  function summaryCalculation(){

	var total;
    	var val1 = $("#visaccRead").val();
    	var val2 = $("#amexccRead").val();
    	var val3 = $("#masterccRead").val();
    	var val4 = $("#debitccRead").val();
    	var val5 = $("#cashInTillSummary").val();
    	var val6 = $("#totalZ").val();
    	var val7 = $("#zReadSummary").val();
    	total = ((parseFloat(val1))+(parseFloat(val2))+(parseFloat(val3))).toFixed(2) ;
        $("#totalCc").val(total);
        $("#dbAmt").val(val4);
        var allTotal = ((parseFloat(total))+(parseFloat(val4))+(parseFloat(val5))).toFixed(2) ;
        $("#total").val(allTotal);
        var totalVar = ((parseFloat(allTotal))-(parseFloat(val6))).toFixed(2) ;
        $("#totalVar").val(totalVar);
        var cashVariance = ((parseFloat(val5))-(parseFloat(val7))).toFixed(2) ;
        $("#cashVariance").val(cashVariance);
}

$(document).ready(function(){
		summaryCalculation();
    $("#visaccRead, #amexccRead, #masterccRead, #debitccRead, #totalZ, #zReadSummary").keyup(function(){
		  summaryCalculation();
    });
});
</script>

<script type="text/javascript">
	function cashDrawerCollapse() {
		$('#one').slideToggle('slow');
	} 
</script>
	<script type="text/javascript">
	var noOfTill = '${tillDetailsListCount}';
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
	
	var serviceId = "${param.serviceId}";
	var incomeCenterId = "${param.incomeCenterId}";
	
	function handleChangeInputs(){
		 
		 console.log("serviceId = "+serviceId);
		 console.log("incomeCenterId = "+incomeCenterId);
		 
		 if(incomeCenterId == 1 && serviceId == null)
			 $("#serviceId").val("1");
		 
		 window.location = "cashup-cash?serviceDate="+$("#serviceDate").val()+"&incomeCenterId="+$("#incomeCenterId").val()+"&serviceId="+$("#serviceId").val();
	}
	
	/* $(document).ready(function() {
		var variance = $("#visaVarience").val();
		if(variance == ""){
		
		}
	}); */
	$(document).ready(function() {
	
		$(':input').click(function() {
	        $(this).select();

	    });
	    
	   /*  $(':text').each(function(){
      		var text = $(this).val();
      		$(this).val($(text).replace(',',''));
  		}); */
	    
	    $(".salesCover").attr('maxlength','9');
	    $(".salesFood").attr('maxlength','9');
	    $(".salesBeverage").attr('maxlength','9');
	    $(".salesOther").attr('maxlength','9');
	    $(".card").attr('maxlength','9');
	    $(".tips").attr('maxlength','9');
	    
		$("#cashup_purchase_food_details").load("cashup-purchase");
		$("#cashup_purchase_beverage_details").load("cashup-purchase-beverage");
		$("#cashup_void_details").load("cashup-void");
		$('#cashup-add-popup').hide();
				
		var currentDate = "${serviceDate}";
		$( ".myDate" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$('.myDate').datepicker().datepicker("setDate", currentDate);
		$('#serviceDate').datepicker("option", "onSelect", function(){ handleChangeInputs(); });
		
		$(".nextDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime()+(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    handleChangeInputs();
		  });
		  
		  $(".prevDate").click(function(){
		   var date = $('.myDate').datepicker('getDate');
		    date.setTime(date.getTime() -(24*60*60*1000));
		    $('.myDate').datepicker("setDate", date);
		    
		    handleChangeInputs();
		  });
		 
		  if(incomeCenterId != "")
		  	$("#incomeCenterId").val("${param.incomeCenterId}");
		  if(serviceId != "")
		  	$("#serviceId").val("${param.serviceId}");
		});
	</script>
	

<script type="text/javascript">
        $(function() {
        	var cashUpCashsSize = "${cashUpCashsSize}";
        	var firstDrowerNumber;
        	var lastDrowerNumber;
        	
        	var $inp = $('.drawerAmt');
            $inp.bind('keydown', function(e) {
                //var key = (e.keyCode ? e.keyCode : e.charCode);
                var key = e.which;
                if (key == 9) {
                    //e.preventDefault();
                    var nxtIdx;
                    if(e.shiftKey)
                    	nxtIdx = $inp.index(this) - 1;
                    else
                    	nxtIdx = $inp.index(this) + 1;
                    console.log("inp keydown nxtIdx = "+nxtIdx);
                    if(nxtIdx == cashUpCashsSize){
                    	$(".cs_rightBtn").trigger("click");
                    }
                }
            });
            
            var $inpDrawerAmt2 = $('.drawerAmt2');
            $inpDrawerAmt2.bind('keydown', function(e) {
                //var key = (e.keyCode ? e.keyCode : e.charCode);
                var key = e.which;
                if (key == 9) {
                    //e.preventDefault();
                     var nxtIdx;
                    if(e.shiftKey)
                    	nxtIdx = $inp.index(this) - 1;
                    else
                    	nxtIdx = $inp.index(this) + 1;
                    console.log("inpDrawerAmt2 keydown nxtIdx = "+nxtIdx);
                    if(e.shiftKey){
                    	console.log("inpDrawerAmt2 keydown e.shiftKey");
                    }
                    if(nxtIdx == cashUpCashsSize){
                    	$(".cs_leftBtn").trigger("click");
                    }
                }
            });
            
           /*  $('.floatCount').focus();
            var $inp = $('.floatCount');
            $inp.bind('keydown', function(e) {
                //var key = (e.keyCode ? e.keyCode : e.charCode);
                var key = e.which;
                if (key == 9) {
                    e.preventDefault();
                    var nxtIdx = $inp.index(this) + 1;
                    console.log("keydown nxtIdx = "+nxtIdx);
                    $("#floatAmount"+nxtIdx).focus();
                }
            }); */
            
            /* $inp.bind('keyup', function(e) {
                //var key = (e.keyCode ? e.keyCode : e.charCode);
                var key = e.which;
                if (key == 9) {
                    e.preventDefault();
                    var nxtIdx = $inp.index(this) - 1;
                    console.log("keyup nxtIdx = "+nxtIdx);
                    $("#floatAmount"+nxtIdx).focus();
                }
            }); */
        });
    </script>

<!--  <script type="text/javascript">
        $(function() {
            $('.tabSalesFood').focus();
            var $inp = $('.tabSalesFood');
            $inp.bind('keydown', function(e) {
                //var key = (e.keyCode ? e.keyCode : e.charCode);
                var key = e.which;
                if (key == 9) {
                    e.preventDefault();
                    var nxtIdx = $inp.index(this) + 1;
                    alert(nxtIdx);
                   /*  $("#floatAmount"+nxtIdx).focus(); */
                    /* alert(FA);
                    $(FA.focus()); */
                    $(".tabSalesFood(" + nxtIdx + ")").focus();
                }
            });
        });
    </script> -->
	<script type="text/javascript">
	    
		$(function(){
			$(".ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
			$(".ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
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
	
	<script type="text/javascript">
	
	function calculateSalesOther() {
			var sum = 0;
			$(".salesOther").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {
					sum += parseFloat(this.value);
				}
			});
			$("#totalOtherSales").html(sum.toFixed(2));
		}
	
	function makeAllDirty(){
		for(f=0;f<<%=request.getAttribute("i")%>;f++){
			document.frmMain.elements['isDirty'+f].value=1;
			document.frmMain.elements['isDirtyFood'+f].value=1;
			document.frmMain.elements['isDirtyBev'+f].value=1;
			document.frmMain.elements['isDirtyVoid'+f].value=1;
		}
	} 
	
	/* $(function(){
		$('#cashUpCash input:text').blur(function() {
			autoUpdateCashup();
		});
	}); */
	
	function isMultipleOf(element){
		var val;
		var cashTypeName = $(element).attr("cashTypeName"); //e.g. 100, 50, 20, 10 ..
		cashTypeName = cashTypeName.replace("$","");
	 	if(!isNaN(element.value) && element.value.length!=0) {
		 	val = parseFloat(element.value);
		 	
		 	if(cashTypeName == "0.20" || cashTypeName == "0.10" || cashTypeName == "0.05"){
		 		var dVal = val.toString().replace(".","");
		 			console.log("Val : "+dVal);
		 		var cashType = cashTypeName.replace(".","");
		 		var gVal;
		 		var cashTypeValue;
		 		var last = cashType.slice(-1);
		 		
		 		if(last == "0"){
		 			cashTypeValue = cashType.slice(0,-1);
		 		}else{
		 			cashTypeValue = cashType;
		 		}
		 		
		 		if(parseInt(cashTypeValue) > parseInt(dVal)){
		 		    gVal = dVal.concat("0");
		 		} else {
		 		 	gVal = dVal; 
		 		 	}  
		 		 	
			 		if(gVal % cashTypeValue != 0){
			 		$(".validation").hide();
			 		$(element).focus();
			 		$(element).removeClass("input-drawer");
			 		$(element).addClass("input-drawer-red").after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter a multiple of $" +cashTypeName+"</div>");
			 		return false;
				 }else{
				 		$(".validation").hide();
					$(element).removeClass("input-drawer-red").next(".validation").remove();;
					$(element).addClass("input-drawer");
					//console.log("FALSE cashTypeName = "+cashTypeName+" & val = "+val);
					return true;
				 }
		 	}
		 	else if(val % cashTypeName != 0){
		 		$(".validation").hide();
		 		$(element).focus();
		 		$(element).removeClass("input-drawer");
		 		$(element).addClass("input-drawer-red").after("<div class='validation' style='color:red;margin-bottom: 20px;'>Please enter a multiple of $" +cashTypeName+"</div>");
		 		//console.log("TRUE cashTypeName = "+cashTypeName+" & val = "+val);
		 		return false;
			 }else{
			 		$(".validation").hide();
				$(element).removeClass("input-drawer-red").next(".validation").remove();;
				$(element).addClass("input-drawer");
				//console.log("FALSE cashTypeName = "+cashTypeName+" & val = "+val);
				return true;
			 }
     	}
	 	return false;
	}
	
	$(document).ready(function(){
		var index;	 		
 		for(index = 0; index < noOfTill; index++){
	        $(".floatAmt"+index).each(function() {
	 				calculatefloatAmtSum(this);
	 				
	 			$(this).blur(function(){
	            	isMultipleOf(this);
	 				if(!isMultipleOf(this)){
	       		 		$(this).select();
	       		 	}
	 			});
	            $(this).keyup(function(){
	            	calculatefloatAmtSum(this);
	            });
	        });
    	
	    	$(".drawerAmt"+index).each(function() {
	 				calculateDrawerAmtSum(this);
		            	 isMultipleOf(this);
	 				$(this).blur(function(){
		       		 	if(!isMultipleOf(this)){
		       		 		$(this).select();
		       		 	}
		 			});
		            $(this).keyup(function(){
		            	 calculateDrawerAmtSum(this);
		            });
	        });
		} 
		
            var no = '${cashUpCashsSize}';
		    var i;
			/* for (i = 0; i < no; i++) {
		   		$("#lessfloatAmount"+i).val($("#floatAmount"+i).val());
		  	}  
		  	
		  	$(".floatAmt").each(function() {
 				calculateLessFloatAmtSum();
	            $(this).change(function(){
	            	calculateLessFloatAmtSum();
	            });
	        }); */
		  	for(var i = 0; i < noOfTill; i++){
		  	for (var j = 0; j < no; j++){
		  	     if(!isNaN($("#drawerAmount"+i+j).val()) ? $("#drawerAmount"+i+j).val() : 0)
	             if(!isNaN($("#floatAmount"+i+j).val()) ? $("#floatAmount"+i+j).val() : 0)
	              $("#cashTaking"+i+j).val((parseFloat($("#drawerAmount"+i+j).val())- parseFloat($("#floatAmount"+i+j).val())).toFixed(2));
		  		
			  }		  	
		  	}
		  	
		  	for(index = 0; index < noOfTill; index++){
			  	 $(".cashTakingAmt"+index).each(function() {
	 				calculateCashTakingAmtSum(index);
		            $(".floatAmt"+index).keyup(function(){
		            	calculateCashTakingAmtSum(index);
						calculateCashInTill(); 
						calculateCashForDay();
						calculateCashVarienceSummary();
						calculateTotalTakeSummary();  
						calculateVarienceSummary();             	
		            });
		            $(".drawerAmt"+index).keyup(function(){
		            	calculateCashTakingAmtSum(index);
						calculateCashInTill();   
						calculateCashForDay();     
						calculateCashVarienceSummary();
						calculateTotalTakeSummary(); 
						calculateVarienceSummary();      	
		            });
		        }); 
       		}
	 	 if( '${incomeCenter.restaurant}' == 'true')
	    {
	        $("#RestaurantSalesRow").show();
	    }else{
	        $("#RestaurantSalesRow").hide();
	    }
	    
	    if( '${incomeCenter.cafe}' == 'true')
	    {
	        $("#CafeSalesRow").show();
	    }else{
	        $("#CafeSalesRow").hide();
	    }
	    
	    if( '${incomeCenter.takeAway}' =='true')
	    {
	        $("#TakeawaySalesRow").show();
	    }else{
	        $("#TakeawaySalesRow").hide();
	    } 
	    
	     if( '${incomeCenter.bar}' =='true')
	    {
	        $("#BarSalesRow").show();
	    }else{
	        $("#BarSalesRow").hide();
	    } 
	    
	    if( '${incomeCenter.deli}' =='true')
	    {
	        $("#DeliSalesRow").show();
	    }else{
	        $("#DeliSalesRow").hide();
	    } 
	    
	    if( '${incomeCenter.retail}' =='true')
	    {
	        $("#RetailSalesRow").show();
	    }else{
	        $("#RetailSalesRow").hide();
	    } 
	    if( '${incomeCenter.catering}' =='true')
	    {
	        $("#CateringSalesRow").show();
	    }else{
	        $("#CateringSalesRow").hide();
	    } 
	     if( '${incomeCenter.delivery}' =='true')
	    {
	        $("#DeliverySalesRow").show();
	    }else{
	        $("#DeliverySalesRow").hide();
	    } 
	    if( '${incomeCenter.event}' =='true')
	    {
	        $("#EventSalesRow").show();
	    }else{
	        $("#EventSalesRow").hide();
	    } 
	    if( '${incomeCenter.roomService}' =='true')
	    {
	        $("#RoomServiceSalesRow").show();
	    }else{
	        $("#RoomServiceSalesRow").hide();
	    } 
	    if( '${incomeCenter.custom1}' =='true')
	    {
	        $("#Custom1SalesRow").show();
	    }else{
	        $("#Custom1SalesRow").hide();
	    } 
	     if( '${incomeCenter.custom2}' =='true')
	    {
	        $("#Custom2SalesRow").show();
	    }else{
	        $("#Custom2SalesRow").hide();
	    } 
	    
	    $(".salesCover").each(function() {
 				calculateSalesCover(); 				 
            $(this).keyup(function(){
            	calculateSalesCover();            	 
            });
        });
        
         $(".salesFood").each(function() {
 				calculateSalesFood();
 				calculateSales();
            $(this).keyup(function(){
            	calculateSalesFood();
            	calculateSales();
            	totalCashZSummary();
            	calculateCashVarienceSummary();
            });
        });
        
         $(".salesBeverage").each(function() {
 				calculateSalesBeverage();
 				calculateSales();
            $(this).keyup(function(){
            	calculateSalesBeverage();
            	calculateSales();
            	totalCashZSummary();
            	calculateCashVarienceSummary();
            });
        });
        
         $(".salesOther").each(function() {
 				calculateSalesOther();
            $(this).keyup(function(){
            	calculateSalesOther();
            });
        });
	    
	       calculateCredit();
 			
		 $("#visaccRead, #visatillRead,#amexccRead,#amextillRead,#masterccRead,#mastertillRead,#onAccccRead,#onAcctillRead,#debitccRead,#debittillRead").keyup(function(){
	   			calculateCredit();
	   			//calculateTotalTakeSummary(); 
		});
		
        $("#totalCashTips").val($("#cashTips").val());
        
          totalCreditTips();
 			
		 $("#creditCardsTips").keyup(function(){
	   			 totalCreditTips();
	   			 $("#distccTips").val($("#tipsCreditFeeTotal").val());
		});
		$("#totalCashCreditTips").val((parseFloat($("#tipsCreditFeeTotal").val())+parseFloat($("#totalCashTips").val())).toFixed(2));
		$("#distccTips").val($("#tipsCreditFeeTotal").val());
		
		calculateSlushAmt();
		
		calculateTotalDistributable();
		
		$("#totalTipsSummary").val($("#totalCashCreditTips").val());
		$("#totalCashZ").val($("#totalAmtSum").text());
		
			$(".visaSales").each(function() {
 					calculateCreditSalesForVisa();
            	$(this).keyup(function(){
            		calculateCreditSalesForVisa();
            		calculateTotalCreditCards();
            		calculateTotalTakeSummary();
            		calculateVarienceSummary();
            	});
            });
            
	         $(".amexSales").each(function() {
	 				calculateCreditSalesForAmex();
	            $(this).keyup(function(){
	            	calculateCreditSalesForAmex();
	            	calculateTotalCreditCards();
	            	calculateTotalTakeSummary();
	            	calculateVarienceSummary();
	            });
	        });
	        
	        $(".masterSales").each(function() {
	 				calculateCreditSalesForMaster();
	            $(this).keyup(function(){
	            	calculateCreditSalesForMaster();
	            	calculateTotalCreditCards();
	            	calculateTotalTakeSummary();
	            	calculateVarienceSummary();
	            });
	        });
	        
	        $(".onAccountSales").each(function() {
	 				calculateCreditSalesForOnAccount();
	            $(this).keyup(function(){
	            	calculateCreditSalesForOnAccount();
	            	calculateTotalTakeSummary();
	            	calculateVarienceSummary();
	            });
	        });
	        
	        $(".debitSales").each(function() {
	 				calculateCreditSalesForDebit();
	            $(this).keyup(function(){
	            	calculateCreditSalesForDebit();
	            	var total = $("#debitTotal").text();	
	            	$("#totalDebit").val(total); 
	            	calculateTotalTakeSummary();
	            	calculateVarienceSummary();
	            });
	        });
	        
	        $(".compSales").each(function() {
	 				calculateCreditSalesForComp();
	            $(this).keyup(function(){
	            	calculateCreditSalesForComp();
	            	calculateTotalTakeSummary();
	            	calculateVarienceSummary();
	            });
	        });
			 
		 	calculateCashInTill(); 
		 	calculateCashForDay();
		    calculateTotalCreditCards();
			calculateTotalTakeSummary(); 
			calculateCashVarienceSummary();
			calculateVarienceSummary();
			
			var total = $("#debitTotal").text();	
	        $("#totalDebit").val(total); 
			
	  });
	  
	$(function(){
		$('#one input:text').blur(function() {
			if(isMultipleOf(this)== true)
				autoUpdateCashup();
			
			else
			{ 
				var pointer = this;	
				/* $("#div-dialog-warning").dialog({
				    title: "Warning",
				    resizable: false,
				    height: 160,
				    modal: true,
				    buttons: {
				        "Ok" : function () 
				        {
					        $(this).dialog("close"); 
				  	        $(pointer).focus();	 
			        	}
			    	}
				});  */
			}
		});
	}); 
	
 	$(function(){
		$('#sales input:text').blur(function() {	
		autoUpdateCashup();			 
		});		
	});
	
	$(function(){
		$('#credit input:text').blur(function() {	
		autoUpdateCashup();			 
		});		
	}); 
		
	$(function(){
		$('#cashup_purchase_details input:text').blur(function() {	
		autoUpdateCashup();			 
		});		
	}); 
	
	$(function(){
		$('#cashup_void_details input:text').blur(function() {	
		autoUpdateCashup();			 
		});		
	}); 
	
	$(function(){
		$('#tips input:text').blur(function() {	
		autoUpdateCashup();			 
		});		
	}); 
	
	$(function(){
		$('#summery input:text').blur(function() {	
		autoUpdateCashup();			 
		});		
	});  	 
	
</script>

	<script type="text/javascript">
	var slider;
	/* $(document).ready(function () {
	    slider = $('.slider4').bxSlider({
	        slideWidth: 565,
	        minSlides: 1,
	        maxSlides: 2,
	        moveSlides: 1,
	        slideMargin: 10,
		});
	}); */
	
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#cashUpCash input:text').keypress(function(e) {
				if(e.which == 9) { 
					floattabs();
				}
			});
		});

		function floattabs(){
			$(".floatAmt"+index).each(function() {
			  var tabindex = 0;
				$('.floatAmt,select').each(function() {
					for(var index = 0; index < noOfTill; index++ ){
						if (this.type != "hidden") {
							var $input = $(this);
							$input.attr("tabindex", tabindex);
							tabindex++;
							/* if(index==tabindex)
							{
								cashtabs();
								noOfTill++;
							} */
						}
					}
				});
				 
			});
		}
		
		function cashtabs(){
		$(".drawerAmt"+index).each(function() {
			  var tabindex = 1;
				$('input,select').each(function() {
					for(var index = 0; index < noOfTill; index++ ){
						if (this.type != "hidden") {
						var $input = $(this);
						$input.attr("tabindex", tabindex);
						tabindex++;						
						/* if(index==tabindex)
							{
								floattabs();
								
							} */
						}
					}
				});		 
			});
		} 
	</script>
	
<BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
	
	<%@include file="leftNavigation.jsp" %>
	<%@include file="common/header.jsp" %>
			
 	<div id ="cashup-add-popup">
	</div>
 	<div class="wrapper" style="width:93%;">
	<div class="mainwrapper">
    	<div class="accordion-manual">
    	<form method="post" action="cashup-cash" id="cashUpCash" name="cashUpCash">
		<div class="main-title">
			
				<div class="row">
				<div class="col-md-12" style="text-align:center; margin-bottom:20px;">
					<span><label>Cash Up for</label></span>
					<span><label>${service_Date}</label> ${service.serviceName} for <label>${incomeCenter.icName}</label></span>
				</div><!-- col-md-12 -->
					<div class="col-md-4">
						<SPAN STYLE="font-size: 10pt;font-weight: bold; margin:5px 5px 0 0;">Date</SPAN>
						
						<span>
						<a href="javascript:void(0)"><img width="17" height="18" src="images/prev.png" class="prevDate" id="prevDate">
						</a>
						<a href="javascript:void(0)"><input type="text" size="10" class="myDate" name= serviceDate id="serviceDate" value = ${ transactionDate }></a> <a href="javascript:void(0)"><img width="17" height="18" src="images/next.png" class="nextDate" id="nextDate"></a> 
						</span>
					</div><!-- col-md-4 -->
					
					
					
					<div class="col-md-4">
					<span class="day" STYLE="font-size: 10pt;font-weight: bold; margin:3px 5px 0 0;">Income Centers: </span>
					<span><select style="width: 159px;" class="input-serch" name="incomeCenterId" id="incomeCenterId" onchange="handleChangeInputs()" onload="selectIncomeCenter(this.value)">
		      <!-- <option value=" ">Select Income Center</option> -->
						<c:if test="${!empty incomeCenterList}">
				        <c:forEach items="${incomeCenterList}" var="income">
							<option value="${income.incomeCentreId}" >${income.icName}</option>
						</c:forEach>
						</c:if>	
		    </select></span>
					
					</div>
					
					
					<div class="col-md-4">
					<span STYLE="font-size: 10pt;font-weight: bold; margin:3px 5px 0 0;">Services : </span>
					<span><select style="width: 159px;" class="input-serch" name="incomeCenterId" id="incomeCenterId" onchange="handleChangeInputs()" onload="selectIncomeCenter(this.value)">
		      <!-- <option value=" ">Select Income Center</option> -->
						<c:if test="${!empty incomeCenterList}">
				        <c:forEach items="${incomeCenterList}" var="income">
							<option value="${income.incomeCentreId}" >${income.icName}</option>
						</c:forEach>
						</c:if>	
		    </select></span>
					
					</div>
					
				</div><!-- row -->
			
		</div>
		<%-- <form method="post" id="cashUpCash" name="cashUpCash"> --%>
		<div class="accordion-manual-header"   id="cashDrawerCollapse" onclick="cashDrawerCollapse()"><table width="20%" border="0" cellspacing="2" cellpadding="0">
		  <tr>
		    <td width="17%"   class="pad-left20"><img src="images/icon_cash.png" width="24" height="24" /></td>
		    <td width="83%">Cash Drawers</td>
		  </tr>
		</table>
		</div>
		<input type="hidden" id="i" name="i" value="${tillDetailsListCount}">
		<input type="hidden" id="j" name="j" value="${cashUpCashsSize}">
		<div id="one" class="contentslider">
		 <div class="cs_wrapper">
		   <div class="cs_slider">
				<c:forEach items="${tillDetailsList}" var="tillDetails" varStatus="loop">
					<c:if test="${loop.index % 2 == 0}">
						<div class="cs_article" style=  height:auto; overflow:hidden;">
					</c:if>
					 
					 	<div  style="width:48%; height:auto; overflow:hidden; float: left;">
						<table width="95%" cellspacing="0" cellpadding="0" border="0" style="margin: 0px 30px;" alifn="left">
					  	 	<tr>
					    		<td><h3>${tillDetails.tillName}(${loop.index+1} / ${tillDetailsListCount})</h3></td>
					     	</tr>
					  	 	<tr>
						    <td align="left" valign="top">
							    <table width="95%" border="0" cellspacing="1" cellpadding="5" bgcolor="#c0e057" class="ServiceEevnt">
							      <tr>
							        <th class="thclass">Denom</th>
							        <th class="thclass">Float Count $</th>
							        <th class="thclass">Cash in Drawer $</th>
		        				<!-- <th   class="thclass">Less Float</th> -->
							        <th class="thclass">Cash Taking $</th>
							      </tr>
							      <c:forEach items="${tillDetails.cashUpCashsList}" var="cashUpCash" varStatus="cashUpCashLoop">
								      <tr>
								        <td style="text-align: right;"> <b>${cashUpCash.cashTypeName}</b>
								        <input type="hidden" name="isDirty${loop.index}${cashUpCashLoop.index}" value="0" />
								        <input type="hidden" cashTypeName="${cashUpCash.cashTypeName}" indexOne="${loop.index}" id="cashUpCashId${loop.index}${cashUpCashLoop.index}" name="cashUpCashId${loop.index}${cashUpCashLoop.index}" value="${cashUpCash.cashUpCashId}"/></td>
								        <td align="center"><input type="text" cashTypeName="${cashUpCash.cashTypeName}" indexOne="${loop.index}" style="width:80px !important" id="floatAmount${loop.index}${cashUpCashLoop.index}" name="floatAmount${loop.index}${cashUpCashLoop.index}" class="input-drawer floatAmt${loop.index} " value="${cashUpCash.floatAmount}" onkeypress="javascript:return isNumber(event)" onkeyup="test(${loop.index},${cashUpCashLoop.index})" onchange="makeDirty(document.cashUpCash.isDirty${loop.index}${cashUpCashLoop.index})" onclick=" $(this).select();" tabindex="0" maxlength="9" data-v-max="999999999.99" data-m-dec="2"/></td>
								        <td align="center"><input type="text" cashTypeName="${cashUpCash.cashTypeName}" indexOne="${loop.index}" style="width:80px !important" id="drawerAmount${loop.index}${cashUpCashLoop.index}" name="drawerAmount${loop.index}${cashUpCashLoop.index}" class="input-drawer drawerAmt${loop.index}" value="${cashUpCash.drawerAmount}" onkeyup="test(${loop.index},${cashUpCashLoop.index})" onchange="makeDirty(document.cashUpCash.isDirty${loop.index}${cashUpCashLoop.index})" onkeypress="javascript:return isNumber (event)" onclick=" $(this).select();" tabindex="1" maxlength="9" data-v-max="999999999.99" data-m-dec="2"/></td>
								       <%--  <td><input type="text" style="width:80px !important" id="lessfloatAmount${cashUpCashLoop.index}" name="lessfloatAmount${cashUpCashLoop.index}" class="input-drawer lessfloatAmt"  tabindex="-1" readonly="readonly" /></td> --%>
								        <td align="center"><input type="text" indexOne="${loop.index}" style="width:80px !important" id="cashTaking${loop.index}${cashUpCashLoop.index}" class="input-drawer cashTakingAmt${loop.index}" value="" tabindex="-1" readonly="readonly"  tabindex="-1"/></td>
								      </tr>
							      </c:forEach>
							      <tr class="total">
							        <td class="total" align="right">Total</td>
							        <td class="total">$<span id="floatAmtSum${loop.index}" >0.00</span></td>
							        <td class="total">$<span id="drawerAmtSum${loop.index}">0.00</span></td>
		        				<!-- <td class="total">$<span id="lessFloatAmtSum">0.00</span></td> -->
							        <td class="total">$<span id="cashTakingAmtSum${loop.index}">0.00</span></td>
							      </tr>
							    </table>
							   </td> 
							 </tr>
						</table>
					   </div>
					   
					 <c:if test="${(loop.index+1) % 2 == 0}">
						</div>
					</c:if>
					</c:forEach>
				</div>
			 </div>
			</div>
		</div>
		
        <div class="accordion-manual">
		<div class="accordion-manual-header">
		  <table width="20%" border="0" cellspacing="2" cellpadding="0">
		    <tr>
		      <td width="17%" class="pad-left20"><img src="images/icon_sales.png" width="24" height="24" /></td>
		      <td width="83%">Sales</td>
	        </tr>
	      </table>
		</div>
        <div id="sales" class="accordion-manual-content" style="display:block">
        <div class="table-responsive">
        <table   bgcolor="#c0e057" class="ServiceEevnt table table-bordered">
          <tr class="thclass"  >  
          	 <th class="thclass"></th>
          	<th align="center" class="thclass" >Covers/Transaction $</th>
          	<th align="center" class="thclass" >Food Sales $</th>
          	<th align="center" class="thclass" >Beverage Sales $</th>
          	<th align="center" class="thclass" >Others $</th>
         </tr>
		 
		  <tr style="background:#f8f8f8;" id="RestaurantSalesRow">
		    <td >Restaurant</td>
		    <td align="center"><input type="hidden" class="input" id="cashSalesId" name="cashSalesId" value="${cashSale.cashSalesId}" onkeypress="javascript:return isNumber (event)">
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="restaurantCovers" name="restaurantCovers" value="${cashSale.restaurantCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger(event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="restaurantFoodSalesAmt" name="restaurantFoodSalesAmt" value="${cashSale.restaurantFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="restaurantBevSalesAmt" name="restaurantBevSalesAmt" value="${cashSale.restaurantBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="restaurantOtherSalesAmt" name="restaurantOtherSalesAmt" value="${cashSale.restaurantOtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		   <tr style="background:#f8f8f8;" id="CafeSalesRow">
		    <td>Cafe</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="cafeCovers" name="cafeCovers" value="${cashSale.cafeCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger(event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="cafeFoodSalesAmt" name="cafeFoodSalesAmt" value="${cashSale.cafeFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="cafeBevSalesAmt" name="cafeBevSalesAmt" value="${cashSale.cafeBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="cafeOtherSalesAmt" name="cafeOtherSalesAmt" value="${cashSale.cafeOtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		  <tr style="background:#f8f8f8;" id="TakeawaySalesRow">
		    <td>Takeaway</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="takeAwayCovers" name="takeAwayCovers" value="${cashSale.takeAwayCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="takeAwayFoodSalesAmt" name="takeAwayFoodSalesAmt" value="${cashSale.takeAwayFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="takeAwayBevSalesAmt" name="takeAwayBevSalesAmt" value="${cashSale.takeAwayBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="takeAwayOtherSalesAmt" name="takeAwayOtherSalesAmt" value="${cashSale.takeAwayOtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		 <tr style="background:#f8f8f8;" id="BarSalesRow">
		    <td>Bar</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="barCovers" name="barCovers" value="${cashSale.barCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="barFoodSalesAmt" name="barFoodSalesAmt" value="${cashSale.barFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="barBevSalesAmt" name="barBevSalesAmt" value="${cashSale.barBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="barOtherSalesAmt" name="barOtherSalesAmt" value="${cashSale.barOtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		  
		   <tr style="background:#f8f8f8;" id="DeliSalesRow">
		    <td>Deli</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="deliCovers" name="deliCovers" value="${cashSale.deliCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="deliFoodSalesAmt" name="deliFoodSalesAmt" value="${cashSale.deliFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="deliBevSalesAmt" name="deliBevSalesAmt" value="${cashSale.deliBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="deliOtherSalesAmt" name="deliOtherSalesAmt" value="${cashSale.deliOtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		  
		 <tr style="background:#f8f8f8;" id="RetailSalesRow">
		    <td>Retail</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="retailCovers" name="retailCovers" value="${cashSale.retailCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="retailFoodSalesAmt" name="retailFoodSalesAmt" value="${cashSale.retailFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="retailBevSalesAmt" name="retailBevSalesAmt" value="${cashSale.retailBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="retailOtherSalesAmt" name="retailOtherSalesAmt" value="${cashSale.retailOtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		  <tr style="background:#f8f8f8;" id="CateringSalesRow">
		    <td>Catering</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="cateringCovers" name="cateringCovers" value="${cashSale.cateringCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="cateringFoodSalesAmt" name="cateringFoodSalesAmt" value="${cashSale.cateringFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="cateringBevSalesAmt" name="cateringBevSalesAmt" value="${cashSale.cateringBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="cateringOtherSalesAmt" name="cateringOtherSalesAmt" value="${cashSale.cateringOtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		   <tr style="background:#f8f8f8;" id="DeliverySalesRow">
		    <td>Delivery</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="deliveryCovers" name="deliveryCovers" value="${cashSale.deliveryCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="deliveryFoodSalesAmt" name="deliveryFoodSalesAmt" value="${cashSale.deliveryFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="deliveryBevSalesAmt" name="deliveryBevSalesAmt" value="${cashSale.deliveryBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="deliveryOtherSalesAmt" name="deliveryOtherSalesAmt" value="${cashSale.deliveryOtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		 <tr style="background:#f8f8f8;" id="EventSalesRow">
		    <td>Events</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="eventsCovers" name="eventsCovers" value="${cashSale.eventCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8" maxlength="9"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="eventsFoodSalesAmt" name="eventsFoodSalesAmt" value="${cashSale.eventFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="eventsBevSalesAmt" name="eventsBevSalesAmt" value="${cashSale.eventBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" maxlength="9" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="eventsOtherSalesAmt" name="eventsOtherSalesAmt" value="${cashSale.eventOtherSales}" onkeypress="javascript:return isNumber (event)" size="8"  data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		  <tr style="background:#f8f8f8;" id="RoomServiceSalesRow">
		    <td>Room Service</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="roomServiceCovers" name="roomServiceCovers" value="${cashSale.roomServiceCovers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="roomServiceFoodSalesAmt" name="roomServiceFoodSalesAmt" value="${cashSale.roomServiceFoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="roomServiceBevSalesAmt" name="roomServiceBevSalesAmt" value="${cashSale.roomServiceBeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="roomServiceOtherSalesAmt" name="roomServiceOtherSalesAmt" value="${cashSale.roomServiceOtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		   <tr style="background:#f8f8f8;" id="Custom1SalesRow">
		    <td>Custom 1</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="custom1Covers" name="custom1Covers" value="${cashSale.custom1Covers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="custom1FoodSalesAmt" name="custom1FoodSalesAmt" value="${cashSale.custom1FoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="custom1BevSalesAmt" name="custom1BevSalesAmt" value="${cashSale.custom1BeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="custom1OtherSalesAmt" name="custom1OtherSalesAmt" value="${cashSale.custom1OtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		 <tr style="background:#f8f8f8;" id="Custom2SalesRow">
		    <td>Custom 2</td>
		    <td align="center"><input type="text" class="input1 form-control salesCover" id="custom2Covers" name="custom2Covers" value="${cashSale.custom2Covers}" style=" text-align: right: ; " onkeypress="javascript:return isInteger (event)" size="8"></td>
		    <td align="center"><input type="text" class="input1 form-control salesFood tabSalesFood" id="custom2FoodSalesAmt" name="custom2FoodSalesAmt" value="${cashSale.custom2FoodSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesBeverage" id="custom2BevSalesAmt" name="custom2BevSalesAmt" value="${cashSale.custom2BeverageSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		    <td align="center"><input type="text" class="input1 form-control salesOther" id="custom2OtherSalesAmt" name="custom2OtherSalesAmt" value="${cashSale.custom2OtherSales}" onkeypress="javascript:return isNumber (event)" size="8" data-v-max="999999999.99" data-m-dec="2"></td>
		  </tr>
		  <tr class="total">
		    <td class="total">Total</td>
		    <td align="center" class="total"><span id="totalItemsSum">0.0</span></td>
		    <td align="center" class="total"><span id=totalfoodSales>0.0</span></td>
		    <td align="center" class="total"><span id="totalbeverageSales">0.0</span></td>
		    <td align="center" class="total"><span id="totalOtherSales">0.0</span></td>
		  </tr>
		</table>
		</div>
       </div>
       </div>
        
  		<div class="accordion-manual">
		<div class="accordion-manual-header">
		  <table width="20%" border="0" cellspacing="2" cellpadding="0">
		    <tr>
		      <td width="17%" class="pad-left20"><img src="images/icon_credit.png" width="24" height="24" /></td>
		      <td width="83%" >Credit</td>
	        </tr>
	      </table>
		</div>
        <div id="credit" class="accordion-manual-content" style="display:block">
        <div class="table-responsive">
        <table  bgcolor="#c0e057" class="table table-bordered ServiceEevnt">
		  <tr>
		    <th class="thclass">&nbsp;</th>
		    <th align="center" class="thclass" >Visa</th>
		    <th align="center" class=" thclass ">Amex</th>
		    <th align="center" class=" thclass">Master Card</th>
		    <th align="center" class=" thclass">On Account</th>
		    <th align="center" class=" thclass">Debit</th>
		       <th  align="center" class=" thclass">Comp</th>
		  </tr>
		  <tr>
		    <td style="width: 19%">Credit card settlement report
		    
		    <input type="hidden" id="creditCardTypeId1" name="creditCardTypeId1" class="input1 form-control" value ="${cardValuesList[0].creditCardTypeId }" onkeypress="javascript:return isNumber (event)"/>
		    <input type="hidden" id="creditCardTypeId2" name="creditCardTypeId2" class="input1 form-control" value ="${cardValuesList[1].creditCardTypeId }" onkeypress="javascript:return isNumber (event)"/>
		    <input type="hidden" id="creditCardTypeId3" name="creditCardTypeId3" class="input1 form-control" value ="${cardValuesList[2].creditCardTypeId }" onkeypress="javascript:return isNumber (event)"/>
		    <input type="hidden" id="creditCardTypeId5" name="creditCardTypeId5" class="input1 form-control" value ="${cardValuesList[4].creditCardTypeId }" onkeypress="javascript:return isNumber (event)"/>
		     <input type="hidden" id="creditCardTypeId4" name="creditCardTypeId4" class="input1 form-control" value ="${cardValuesList[3].creditCardTypeId }" onkeypress="javascript:return isNumber (event)"/>
		    <input type="hidden" id="creditCardTypeId6" name="creditCardTypeId6" class="input1 form-control" value ="${cardValuesList[5].creditCardTypeId }" onkeypress="javascript:return isNumber (event)"/></td>
		    
		    <td align="center"><input type="text" id="visaccRead" name="visaccRead" class="input1 form-control card" value ="${cardValuesList[0].ccReading }" onkeypress="javascript:return isNumber (event)" data-v-max="999999999.99" data-m-dec="2"/></td>
		    <td align="center"><input type="text" id="amexccRead" name="amexccRead" class="input1 form-control card" value="${cardValuesList[1].ccReading }" onkeypress="javascript:return isNumber (event)" data-v-max="999999999.99" data-m-dec="2"/></td>
		    <td align="center"><input type="text" id="masterccRead" name="masterccRead" class="input1 form-control card" value="${cardValuesList[2].ccReading }"" onkeypress="javascript:return isNumber (event)" data-v-max="999999999.99" data-m-dec="2"/></td>
		   <td rowspan="3" style=" background-color: #e2e2e2; border-width:0px;"><!-- <input type="text" style="height:60px; text-align: center; "  class="input"> --></td>
		    <td align="center"><input type="text" id="debitccRead" name="debitccRead" class="input1 form-control card" value="${cardValuesList[3].ccReading }" onkeypress="javascript:return isNumber (event)" data-v-max="999999999.99" data-m-dec="2"/></td>
		    <td rowspan="3" style=" background-color: #e2e2e2; border-width:0px;"><!-- <input type="text" style="height:60px; text-align: center; "  class="input"> --></td>
		    </tr>
		  <tr style="background:#f8f8f8">
		    <td>System Settlement Report</td>
		    <td align="center"><input type="text" id="visatillRead" name="visatillRead" class="input1 form-control card" value="${cardValuesList[0].tillReading }" onkeypress="javascript:return isNumber (event)" data-v-max="999999999.99" data-m-dec="2"/></td>
		    <td align="center"><input type="text" id="amextillRead" name="amextillRead" class="input1 form-control card" value="${cardValuesList[1].tillReading }" onkeypress="javascript:return isNumber (event)" data-v-max="999999999.99" data-m-dec="2"/></td>
		    <td align="center"><input type="text" id="mastertillRead" name="mastertillRead" class="input1 form-control card" value="${cardValuesList[2].tillReading }" onkeypress="javascript:return isNumber (event)" data-v-max="999999999.99" data-m-dec="2"/></td>
		    <td align="center"><input type="text" id="debittillRead" name="debittillRead" class="input1 form-control card" value="${cardValuesList[3].tillReading }" onkeypress="javascript:return isNumber (event)" data-v-max="999999999.99" data-m-dec="2"/></td>
		    </tr>
		  <tr>
		    <td  >Varience</td>
		    <td align="center"><input type="text" id="visaVarience" class="input1 form-control" value="" readonly="readonly" tabindex="-1" /></td>
		    <td align="center"><input type="text" id="amexVarience" class="input1 form-control" value="" readonly="readonly" tabindex="-1"/></td>
		    <td align="center"><input type="text" id="masterVarience" class="input1 form-control" value="" readonly="readonly" tabindex="-1"/></td>
		    <td align="center"><input type="text" id="debitVarience" class="input1 form-control" value="" readonly="readonly" tabindex="-1"/></td>
	     </tr>
		 </table>
		</div>
		</div>
	    </div> 
        
        <div class="accordion-manual">
		<div class="accordion-manual-header">
		  <table width="20%" border="0" cellspacing="2" cellpadding="0">
			  <thead>  
		    <tr>
		      <td width="17%"   class="pad-left20"><img src="images/icon_purchese.png" width="24" height="24" /></td>
				      <td width="83%"> Food Purchases <img src="images/add.png" value="image" id="addBtn" title="add food item(Ctrl+Alt+F) " onclick=" addFoodPurchase();" style="cursor:pointer; margin-bottom: -7px;"> </td>
	        </tr>
		      </thead>
	      </table>
		</div>
	      <div class="accordion-manual-content" id="cashup_purchase_food_details" style="display:block">
		</div>
	       
		</div>
		
		
		<div class="accordion-manual">
		<div class="accordion-manual-header">
		  <table width="20%" border="0" cellspacing="2" cellpadding="0">
			  <thead>  
		    <tr>
		      <td width="17%"   class="pad-left20"><img src="images/icon_purchese.png" width="24" height="24" /></td>
				      <td width="83%"  >Beverage Purchases <img src="images/add.png" value="image" id="addBtn" title="add beverage item(Ctrl+Alt+B)" onclick="addBeveragePurchase();" style="cursor:pointer; margin-bottom: -7px;"> </td> 
	        </tr>
		      </thead>
	      </table>
		</div>
	      <div class="accordion-manual-content" id="cashup_purchase_beverage_details" style="display:block">
		</div>
	       
		</div>
		
	
        
		<div class="accordion-manual">
		<div class="accordion-manual-header">
		  <table width="20%" border="0" cellspacing="2" cellpadding="0">
		    <tr>
		      <td width="17%"   class="pad-left20"><img src="images/icon_voids.png" width="24" height="24" /></td>
		      <td width="83%"  >Voids  <img src="images/add.png" value="image" title="add void(Ctrl+Alt+V)" id="addBtn" onclick="addNewCashupVoid()" style="cursor:pointer; margin-bottom: -5px;"></td>
	        </tr>
	       <!--  <a href="javaScript:void(0)" class="add-button" onclick="addNewCashupVoid()" -->
	      </table>
		</div>
        <div class="accordion-manual-content" style="display:block" id="cashup_void_details">
        
     </div>
     </div>
        
        <div class="accordion-manual">
		<div class="accordion-manual-header">
		  <table width="20%" border="0" cellspacing="2" cellpadding="0" >
		    <tr>
		      <td width="17%"   class="pad-left20"><img src="images/icon_tips.png" width="24" height="24" /></td>
		      <td width="83%"  >Tips</td>
	        </tr>
	      </table>
		</div>
        <div id="tips" class="accordion-manual-content" style="display:block">
        <div class="table-responsive">
		<table width="100%" border="0" cellspacing="1" cellpadding="5" bgcolor="#c0e057" class="table table-bordered ServiceEevnt">
		  <tr>
		    <th width="22%"  align="left" class="thclass" >&nbsp;</th>
		    <th width="12%" align="left" class=" thclass ">&nbsp;</th>
		    <th width="12%" align="left" class=" thclass"><!-- Fees (2%) --></th>
		    <th width="12%" align="left" class=" thclass">&nbsp;</th>
		    <th width="12%" align="left" class=" thclass">&nbsp;</th>
		  </tr>
		  <tr>
		    <td>Credit Cards</td>
		    <td  ><input name="cashUpTipsId" id="cashUpTipsId" type="hidden" value="${cashUpTips.cashUpTipsId}" class="input1 form-control"/>
		    	  <input name="creditCardsTips" id="creditCardsTips" type="text" value="${cashUpTips.cerditCardTips}" class="input1 form-control tips" onkeypress="javascript:return isNumber (event)" data-v-max="999999999.99" data-m-dec="2"/></td>
		    <td><input name="fees" id="fees" type="hidden" class="input" value="${cashUpTips.feesPct}" readonly="readonly" tabindex="-1" />
		    	<input name="tipsFee" id="tipsFee" type="hidden" class="input1 form-control" value="" readonly="readonly" tabindex="-1"/></td> 
		    <td><input name="tipsCreditFeeTotal" id="tipsCreditFeeTotal" type="hidden" class="input1 form-control" value="" readonly="readonly" tabindex="-1"/></td>
		    <td rowspan="4"  style="text-align:center;" >Delete the tips<br> shares for those not working</td>
		    </tr>
		  <tr style="background:#f8f8f8">
		    <td>Cash</td>
		    <td  ><input name="cashTips" id="cashTips" type="text" class="input1 form-control tips" value="${cashUpTips.cashTips}" onkeypress="javascript:return isNumber (event)" onkeyup="tipsKeyUp()" data-v-max="999999999.99" data-m-dec="2"/></td>
		    <td  >&nbsp;</td>
		    <td  ><input name="totalCashTips" id="totalCashTips" type="hidden" class="input1 form-control" value="" readonly="readonly" tabindex="-1"/></td>
		    </tr>
		  <tr>
		    <td  >Total Tips</td>
		    <td  >&nbsp;</td>
		    <td  >&nbsp;</td>
		    <td  ><input name="totalCashCreditTips" id="totalCashCreditTips" type="text" class="input1 form-control" onkeypress="javascript:return isNumber (event)" readonly="readonly" tabindex="-1"/></td>
		    </tr>
		  
		  <tr> 
		    <td colspan="2"  >Total Distributible</td>
		    <td>&nbsp;</td>
		    <td>
			    <input name="slush" id="slush" type="hidden" class="input1 form-control"  onkeypress="javascript:return isNumber (event)" value="${cashUpTips.slushPct}"/> 
			    <input name="slushAmt" id="slushAmt" type="hidden" class="input1 form-control"  readonly="readonly" tabindex="-1"/> 
			    <input name="slushAmtTotal" id="slushAmtTotal" type="hidden" class="input1 form-control" readonly="readonly" tabindex="-1"/> 
			    <input name="totalDistributible" id="totalDistributible" type="type" class="input1 form-control" readonly="readonly" tabindex="-1"/>
		    </td>
		    </tr>
		  
	</table>
	</div>
	</div>
    </div>
        
        <div class="accordion-manual">
		<div class="accordion-manual-header">
		  <table width="20%" border="0" cellspacing="2" cellpadding="0">
		    <tr>
		      <td width="17%"   class="pad-left20"><img src="images/icon_summery.png" width="24" height="24" /></td>
		      <td width="83%"  >Z-Read &amp; Summary</td>
	        </tr>
	      </table>
		</div>
       <div id="summery" class="accordion-manual-content" style="display:block">
	  <div class="table-responsive">
  	 <table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#c0e057" class="table table-bordered ServiceEevnt">
	     <tr style="background: #e0e0e0 none repeat scroll 0% 0%;">
	     	<th width="1%"  align="center" class="thclass" ></th> 
     		<th style="padding-left: 141px;"width="12%" align="center" class="thclass" >Total CC</th>
     		 <th style="padding-left: 24px;"width="1%" align="center" class="thclass"></th>  
	      	<th width="12%" align="center" class=" thclass ">Cash In Till</th>
	      	<th width="1%"  align="center" class="thclass" ></th>
	      	<th width="12%" align="center" class=" thclass">Debit Card</th>
	      	<th width="1%"  align="center" class="thclass" ></th>
	       	<th width="12%" align="center" class=" thclass">Total</th>
	       	<th width="1%"  align="center" class="thclass" ></th>
	       	<th width="12%" align="center" class=" thclass">Total Z</th>
	       	<th width="1%"  align="center" class="thclass" ></th>
	       	<th width="12%" align="center" class=" thclass">Total Variance</th>
	     </tr>
	     <tr style="background: #FFF none repeat scroll 0% 0%;">
	         <td>Total</td>
	         	<td align="center">
	         		<input style="margin-left: 130px;text-align:center;" name="totalCc" id="totalCc" value="0.0" type="text" class="input1 form-control" size="10" readonly="readonly" tabindex="-1" >
	         	</td>
	         	<td align="center">+</td>
	         	<td align="center">
	         		<input style="text-align:center;" name="cashInTillSummary" id="cashInTillSummary" value="0.0" type="text" class="input1 form-control" size="10" readonly="readonly" tabindex="-1" >
	         	</td>
	         	<td align="center">+</td>
	         	<td align="center">
	         		<input style="text-align: center; margin-right: 18px;" name="dbAmt" id="dbAmt" value="0.0" type="text" class="input1 form-control" size="10" readonly="readonly" tabindex="-1" >
	         	</td>
         		<td align="center">=</td>
         		<td align="center">
	         		<input style="text-align: center; margin-right: 19px;" name="total" id="total" value="0.0" type="text" class="input1 form-control" size="10" readonly="readonly" tabindex="-1" >
	         	</td>
	         	<td>-</td>
	         	<td align="center">
	         		<input style="text-align: center;" name="totalZ" id="totalZ" value="0.0" type="text" class="input1 form-control" size="10">
	         	</td>
	         	<td align="center">=</td>
         		<td align="center">
	         		<input style="text-align: center;margin-right: 18px;" name="totalVar" id="totalVar" value="0.0" type="text" class="input1 form-control" size="10" readonly="readonly" tabindex="-1" >
	         	</td>
	     </tr>
	     <tr style="background: #F8F8F8 none repeat scroll 0% 0%;">
	     	<td colspan="2"></td>
	     	<td></td>
	     	<td align="center">-</td>
	     	<td colspan="8"></td>
	     </tr>
	     <tr style="background: #FFF none repeat scroll 0% 0%;">
	     	<td width="12%" colspan="2"  style="width: 103px; ">Cash z Read</td>
	     	<td></td>
	     	 <td align="center">
	     	 	<!-- <input style="text-align: center; margin-right: 18px;" name="cashZRead" id="cashZRead" value="0.0" type="text" class="input" size="10"  tabindex="-1"   > -->
	     	 	<input style="text-align: center" name="zReadSummary" size="10" id="zReadSummary" type="text" class="input1 form-control" onkeyup="calculateVarienceSummary()" value="${cashUpZRead.zRead}" onkeypress="javascript:return isNumber (event)"/>
	      		<input type="hidden" name="cashUpZReadId" id="cashUpZReadId"  value="${cashUpZRead.cashUpZReadId}" class="input1 form-control"/>
	     	 </td>
	     	 <td colspan="8"></td>
	     </tr>
	     <tr style="background: #F8F8F8 none repeat scroll 0% 0%;">
	     	<td colspan="2"></td>
	     	<td></td>
	     	<td align="center">=</td>
	     	<td colspan="8"></td>
	     </tr>
	     <tr style="background: #FFF none repeat scroll 0% 0%;">
	     	<td width="12%" colspan="2"  style="width: 103px; ">Cash Variance</td> 
	     	<td></td>
	     	 <td align="center">
	     	 	<input style="text-align: center;" name="cashVariance" id="cashVariance" value="0.0" type="text" class="input1 form-control" size="10"  tabindex="-1" readonly >
	     	 </td>
	     	 <td colspan="8"></td>
	     </tr>
	     <tr width="20%"></tr>
  	 </table>
  	 
	<br />
    <table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#c0e057" class="table table-bordered ServiceEevnt">
	     <tr style="background: #e0e0e0 none repeat scroll 0% 0%;">
	     	<th width="1%"  align="center" class="thclass" ></th> 
     		<th width="12%" align="center" class="thclass" >Dist CC Tips</th>
     		 <th width="1%" align="center" class="thclass"></th>  
	      	<th width="12%" align="center" class=" thclass ">Cash Tips</th>
	      	<th width="1%"  align="center" class="thclass" ></th>
	      	<th width="12%" align="center" class=" thclass">Total Dist Tips</th>
	      	<th width="1%"  align="center" class="thclass" ></th>
	       	<th width="12%" align="center" class=" thclass"> </th>
	       	<th width="1%"  align="center" class="thclass" ></th>
	       	<th width="12%" align="center" class=" thclass"> </th>
	       	<th width="1%"  align="center" class="thclass" ></th>
	       	<th width="12%" align="center" class=" thclass"></th>
	     </tr>
	     <tr style="background: #FFF none repeat scroll 0% 0%;">
         	<td width="12%" >Tips</td>
         	<td align="center">
         		<input style="text-align: center; name="distccTips" id="distccTips" value="0.0" type="text" class="input1 form-control" size="10" readonly="readonly" tabindex="-1" >
         	</td>
         	<td align="center">+</td>
         	<td align="center">
         		<input style="text-align: center;" name="cashTips" id="cashTips" value="0.0" type="text" class="input1 form-control" size="10" >
         	</td>
         	<td align="center">=</td>
         	<td align="center">
         		<input style="text-align: center;" name="totalDistTips" id="totalDistTips" value="0.0" type="text" class="input1 form-control" size="10" readonly="readonly" tabindex="-1" >
         	</td>
         	<td colspan="6"></td>
	     </tr>
	     <tr style="background: #FFF none repeat scroll 0% 0%;">
	     	<td width="12%" colspan="2" style="width: 103px; ">Cash in Bag</td> 
	     	<td></td>
	     	 <td align="center">
	     	 	<input style="text-align: center;" name="cashInBag" id="cashInBag" value="0.0" type="text" class="input1 form-control" size="10"  tabindex="-1" readonly >
	     	 </td>
	     	 <td colspan="8"></td>
	     </tr>
  	 </table>
  	 </div>
	 </div>
     </div>
     </form>
     <div style="display:none" id="div-dialog-warning">
     	<p>plese enter multiples of denom only.<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"> </span><div/></p>
	 </div>
  	 </div>
  
  	</div></div>
	
	<footer class="footer">

	</footer>
	
	
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/jquery.ennui.contentslider.js"></script>
	<script type="text/javascript">
	
		$(function() {
			
			$("#floatAmount00").focus();
			$("#floatAmount00").select();
			
			$('#one').ContentSlider({
				width : '1213px',
				height : '485px',
				speed : 800,
				easing : 'easeInOutBack'
			});
			
			/* $('#floatAmount0').focus();
			$('#floatAmount0').setCursorToTextEnd(); */
		});
		
		
	</script>
		
 </body>
</html>

