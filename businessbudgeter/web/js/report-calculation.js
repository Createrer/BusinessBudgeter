	 
	 function calculateTotalTakeReport(element) {
			var index = $(element).attr("indexOne");
			 var sum = 0;
			 var total = 0;
			 
			$('.cardsDetails'+index).each(function () {
		    var val = parseFloat(this.innerHTML, 10);
		    if (val != 0) {
		    /*if (!isNaN(val) && val.length != 0) {*/
		    sum += val;
		        total = parseFloat(sum);
		        }
		   });
				$("#totalTakeReport"+index).html(total); 
		}

	 function calculateVisaTotal() {
			var sum = 0;
			var total = 0;
			$(".visaCard").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				 /* if (!isNaN(val)) {*/
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#visaCardTotal").html(total);
		}
	 
	 function calculateAmexTotal() {
			var sum = 0;
			var total = 0;
			$(".amexCard").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#amexCardTotal").html(total);
		}
	 
	 function calculateMasterTotal() {
			var sum = 0;
			var total = 0;
			$(".masterCard").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#masterCardTotal").html(total);
		}
	 
	 function calculateOnAccountTotal() {
			var sum = 0;
			var total = 0;
			$(".onAccount").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#onAccountTotal").html(total);
		}
	 
	 function calculateDebitTotal() {
			var sum = 0;
			var total = 0;
			$(".debitCard").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#debitCardTotal").html(total);
		}
	 
	 function calculateCompTotal() {
			var sum = 0;
			var total = 0;
			$(".comp").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#compTotal").html(total);
		}
	 
	 function calculateTotalTakeTotal(){
			var sum = 0;
			var total = 0;
			$(".totalTake").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#totalTakeTotal").html(total);
		}
	 function calculateDailyZReadTotal(){
			var sum = 0;
			var total = 0;
			$(".dailyZRead").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#dailyZReadTotal").html(total);
		}
	 
	 function calculateDailyTakeTotal(){
			var sum = 0;
			var total = 0;
			$(".dailyTake").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#dailyTakeTotal").html(total);
		}
	 
	 function  calculateVarienceTotal(){
			var sum = 0;
			var total = 0;
			$(".varience").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#varienceTotal").html(total);
		}
	
	 function calculateCvtsTotal(){
			var sum = 0;
			var total = 0;
			$(".cvts").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#cvtsTotal").html(total);
		}
	 
	 function calculateSpendPPTotal(){
			var sum = 0;
			var total = 0;
			$(".spendPP").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#spendPPTotal").html(total);
		}
	
	 function calculateFoodIncomeTotal(){
			var sum = 0;
			var total = 0;
			$(".foodIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#foodIncomeTotal").html(total);
		}
	 
	 function calculateBeverageIncomeTotal(){
			var sum = 0;
			var total = 0;
			$(".beverageIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#beverageIncomeTotal").html(total);
		}
	 function calculateTipsLessFeesTotal(){
			var sum = 0;
			var total = 0;
			$(".tipsLessFees").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (val != 0) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			
			$("#tipsLessFeesTotal").html(total);
		}
	 
	 /*function calculateAllocationTotalTips(){
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
	 }*/
	 
	/* function calculateMondayTotal(){
		 var sum = 0;
			var total = 0;
			$(".mondayStaffIncome").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#mondayTotal").html(total);
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
			$("#tuesdayTotal").html(total);
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
			$("#wednesdayTotal").html(total);
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
			$("#thursdayTotal").html(total);
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
			
			$("#fridayTotal").html(total);
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
			$("#saturdayTotal").html(total);
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
			$("#sundayTotal").html(total);
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
			$("#incomeTotal").html(total);
	 }*/
	 
	/* function calculateMondayTotalPL(){
		 var sum = 0;
			var total = 0;
			$(".mondayStaffIncomePL").each(function() {
				 var val = parseFloat(this.innerHTML, 10);
				 if (!isNaN(val)) {
				        sum += val;
				        total = parseFloat(sum);
				        }
				   });
			$("#mondayTotalPL").html(total);
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
			$("#tuesdayTotalPL").html(total);
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
			$("#wednesdayTotalPL").html(total);
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
			$("#thursdayTotalPL").html(total);
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
			
			$("#fridayTotalPL").html(total);
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
			$("#saturdayTotalPL").html(total);
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
			$("#sundayTotalPL").html(total);
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
	 }*/