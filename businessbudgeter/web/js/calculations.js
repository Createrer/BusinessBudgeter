
function makeAllDirty(val){
	for(f=0;f<val;f++){
		document.frmMain.elements['isDirty'+f].value=1;
		document.frmMain.elements['isDirty1'+f].value=1;
		document.frmMain.elements['isDirty2'+f].value=1;
		document.frmMain.elements['isDirty3'+f].value=1;
		document.frmMain.elements['isDirty4'+f].value=1;
	}
} 

function calculatefloatAmtSum(element) {
	//alert(index);
		var index = $(element).attr("indexOne");
		console.log(" index = "+index);
	    var sum = 0;
	    $(".floatAmt"+index).each(function() {
            if(!isNaN(this.value) && this.value.length!=0) {
                sum += parseFloat(this.value);
            }
        });
        $("#floatAmtSum"+index).html(sum.toFixed(2));
        calculateCashTakingAmtSum(index);
    }
   
   function calculateDrawerAmtSum(element) {
       var sum = 0;
       var index = $(element).attr("indexOne");
       $(".drawerAmt"+index).each(function() {
           if(!isNaN(this.value) && this.value.length!=0) {
               sum += parseFloat(this.value);
           }
       });
       $("#drawerAmtSum"+index).html(sum.toFixed(2));
       calculateCashTakingAmtSum(index);
   }
   
   function calculateLessFloatAmtSum() {
  	 
       var sum = 0;
       $(".floatAmt").each(function() {
           if(!isNaN(this.value) && this.value.length!=0) {
               sum += parseFloat(this.value);
           }
       });
       $("#lessFloatAmtSum").html(sum.toFixed(2));
   }
  function calculateSales() {
	       var val1 = parseFloat($("#totalfoodSales").text()),
	          val2 = parseFloat($("#totalbeverageSales").text());
	       $("#totalAmtSum").text((val1 + val2).toFixed(2));
  }
  
  function calculateCredit() { 
	  var val1 = $("#visaccRead").val(),
      val2 = $("#visatillRead").val(),
      val3 = $("#amexccRead").val(),
      val4 = $("#amextillRead").val(),
      val5 = $("#masterccRead").val(),
      val6 = $("#mastertillRead").val(),
      val7 = $("#debitccRead").val(),
      val8 = $("#debittillRead").val();
	  
	  $("#visaVarience").val((parseFloat(val1)-parseFloat(val2)).toFixed(2));
      $("#amexVarience").val((parseFloat(val3)-parseFloat(val4)).toFixed(2));
      $("#masterVarience").val((parseFloat(val5)-parseFloat(val6)).toFixed(2));
      $("#debitVarience").val((parseFloat(val7)-parseFloat(val8)).toFixed(2));
      
      
 }
  function calculateTotalCreditCards(){
	  var val1 = $("#visaTotal").text(),
      val2 = $("#amexTotal").text(),
      val3 = $("#masterTotal").text(),
      //val4 = $("#onAccountTotal").text(),
     
      //total = ((parseFloat(val1))+(parseFloat(val2))+(parseFloat(val3))+(parseFloat(val4))).toFixed(2) ;
      total = ((parseFloat(val1))+(parseFloat(val2))+(parseFloat(val3))).toFixed(2) ;
	  $("#totalCrCards").val(total);
	  
	 
  }
  function calculateCashTakingAmtSum(index) {
	 	 
      var sum = 0;
      $(".cashTakingAmt"+index).each(function() {
          if(!isNaN(this.value) && this.value.length!=0) {
              sum += parseFloat(this.value);
          }
      });
      $("#cashTakingAmtSum"+index).html(sum.toFixed(2));
      
      calculateCashInTill();
  }
  
  function calculateFoodPurchase() {
	 	 
      var sum = 0;
      $(".foodPurchase").each(function() {
          if(!isNaN(this.value) && this.value.length!=0) {
              sum += parseFloat(this.value);
          }
      });
      $("#foodPurchaseTotal").val(sum.toFixed(2));
  }
  
  function calculateBeveragePurchase() {
	 	 
      var sum = 0;
      $(".beveragePurchase").each(function() {
          if(!isNaN(this.value) && this.value.length!=0) {
              sum += parseFloat(this.value);
          }
      });
      $("#beveragePurchaseTotal").val(sum.toFixed(2));
  }
  
  function totalCreditTips() {
	  var val1 = parseFloat($("#creditCardsTips").val());
	  var fees = parseFloat($("#fees").val());
	  $("#tipsFee").val((val1*(fees/100)));
      var val2 = $("#tipsFee").val();
	  $("#tipsCreditFeeTotal").val((parseFloat(val1)-parseFloat(val2)).toFixed(2));
	  $("#totalCashCreditTips").val((parseFloat($("#tipsCreditFeeTotal").val())+parseFloat($("#totalCashTips").val())).toFixed(2));
	  $("#totalTipsSummary").val($("#totalCashCreditTips").val());
	  calculateSlushAmt();
	  calculateTotalDistributable();
}
  
  
  function test(till,demon){
  	console.log(" till = "+till+" demon = "+demon);
		//$("#lessfloatAmount"+index).val($("#floatAmount"+index).val());
		/*if($("#drawerAmount"+till+demon).val().length == 0 ? 0.0 : ($("#drawerAmount"+till+demon).val()))
		if($("#floatAmount"+till+demon).val().length == 0 ? 0.0 : ($("#floatAmount"+till+demon).val()))*/
	   if(!isNaN($("#drawerAmount"+till+demon).val()) ? $("#drawerAmount"+till+demon).val() : 0)
	   if(!isNaN($("#floatAmount"+till+demon).val()) ? $("#floatAmount"+till+demon).val() : 0)
		$("#cashTaking"+till+demon).val((parseFloat($("#drawerAmount"+till+demon).val())- parseFloat($("#floatAmount"+till+demon).val())).toFixed(2));
		
		calculateCashInTill();
		calculateCashForDay();
		calculateTotalTakeSummary(); 
		makeAllDirty();
	}

	 function purchaseKeyUp(){
	        	$("#foodVariance").val(parseFloat($("#foodBudgetedAllowwance").val())- parseFloat($("#foodPurchaseTotal").val()));
	        	$("#beverageVariance").val(parseFloat($("#beverageBudgetedAllowwance").val())- parseFloat($("#beveragePurchaseTotal").val()));
	        }
	        
	 function tipsKeyUp(){
		$("#totalCashTips").val($("#cashTips").val());
		$("#totalCashCreditTips").val((parseFloat($("#tipsCreditFeeTotal").val())+parseFloat($("#totalCashTips").val())).toFixed(2));
		$("#totalTipsSummary").val($("#totalCashCreditTips").val());
		calculateSlushAmt();
		calculateCashForDay();
	}
	 
	 function calculateSlushAmt(){
		 var val1 = parseFloat($("#slush").val());
		  var val2 = parseFloat($("#totalCashCreditTips").val());
		  $("#slushAmt").val((val2*(val1/100)).toFixed(2));
		  $("#slushAmtTotal").val($("#slushAmt").val());
		  calculateTotalDistributable();
	 }
	 
	 function calculateTotalDistributable(){
		 var val1 = parseFloat($("#totalCashCreditTips").val());
		  var val2 = parseFloat($("#slushAmtTotal").val());
		  $("#totalDistributible").val((val1-val2).toFixed(2));
	 }
	 
	 function calculateSalesCover() {
			var sum = 0;
			$(".salesCover").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {
					sum += parseFloat(this.value);
					total = parseInt(sum);
				}
			});
			$("#totalItemsSum").html(total);
		}

		function calculateSalesFood() {
			var sum = 0;
			$(".salesFood").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {
					sum += parseFloat(this.value);
				}
			});
			$("#totalfoodSales").html(sum.toFixed(2));
		}

		function calculateSalesBeverage() {
			var sum = 0;
			$(".salesBeverage").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {
					sum += parseFloat(this.value);
				}
			});
			$("#totalbeverageSales").html(sum.toFixed(2));
		}
		
		/*function calculateSalesOther() {
			var sum = 0;
			$(".salesOther").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {
					sum += parseFloat(this.value);
				}
			});
			$("#totalOtherSales").html(sum.toFixed(2));
		}*/
	 
		function calculateCashInTill() {
			var sum = 0;
			var txt;
			for(var index = 0; index < noOfTill; index++ ){
				txt = $("#cashTakingAmtSum"+index).text();
				sum += parseFloat(txt);
			}
	    	$("#cashInTillSummary").val((sum).toFixed(2)); 
		}
		
		function calculateCashForDay() {
			var val1 = parseFloat($("#totalTipsSummary").val());
	    	var val2 = parseFloat($("#cashInTillSummary").val());
	    	$("#totalCashForDay").val((val1+val2).toFixed(2));
		}
		
		function calculateTotalTakeSummary() {
			var val1 = parseFloat($("#cashInTillSummary").val());
	    	var val2 = parseFloat($("#totalDebit").val());
	    	var val3 = parseFloat($("#totalCrCards").val());
	    	$("#totalTakeSummary").val((val1 + val2 + val3).toFixed(2));
		}
		
		function totalCashZSummary()
		{
			$("#totalCashZ").val($("#totalAmtSum").text());
		}
		
		function calculateCashVarienceSummary() {
			var val1 = parseFloat($("#cashInTillSummary").val());
			var val2 = parseFloat($("#totalCashZ").val());
	    	$("#cashVarienceSummary").val((val1-val2).toFixed(2));
		}
		
		function calculateVarienceSummary() {
			var val1 = parseFloat($("#totalTakeSummary").val());
			var val2 = parseFloat($("#zReadSummary").val());
	    	$("#varienceSummary").val((val1-val2).toFixed(2));
		}
		function calculateCreditSalesForVisa() {
			var sum = 0;
			$(".visaSales").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {

					sum += parseFloat(this.value);
				}
			});
			$("#visaTotal").html(sum.toFixed(2));
		}
		
		function calculateCreditSalesForAmex() {
			var sum = 0;
			$(".amexSales").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {

					sum += parseFloat(this.value);
				}
			});
			$("#amexTotal").html(sum.toFixed(2));
		}
		
		function calculateCreditSalesForMaster() {
			var sum = 0;
			$(".masterSales").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {
					sum += parseFloat(this.value);
				}
			});
			$("#masterTotal").html(sum.toFixed(2));
		}
		
		function calculateCreditSalesForOnAccount() {
			var sum = 0;
			$(".onAccountSales").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {

					sum += parseFloat(this.value);
				}
			});
			$("#onAccountTotal").html(sum.toFixed(2));
		}
		
		function calculateCreditSalesForDebit() {
			var sum = 0;
			$(".debitSales").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {

					sum += parseFloat(this.value);
				}
			});
			$("#debitTotal").html(sum.toFixed(2));
		}
		
		function calculateCreditSalesForComp() {
			var sum = 0;
			$(".compSales").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {

					sum += parseFloat(this.value);
				}
			});
			$("#compTotal").html(sum.toFixed(2));
		}
		
		function isEven(){
			var value = parseFloat($("#floatAmount").val());
			if((value % 2)==0)
				return true;
			else
				alert("Plese enter multiples of 5 only");
			
		}
		 