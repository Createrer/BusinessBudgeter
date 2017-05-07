/**
 * 
 */


function validateAllocateRosterShift(data) {
	if (data.startTime.length == 0) {
		alert("Please enter start time");
		$("#startTime").focus();
		return false;
	} else if (data.endTime.length == 0) {
		alert("Please enter end time");
		$("#endTime").focus();
		return false;
	} else {
		return true;
	}
}

function validateRosterShift(addRosterShiftFormData) {

	if (addRosterShiftFormData.staffName.length == 0) {
		alert("Please enter staff name");
		$("#staffName").focus();
	} else if (addRosterShiftFormData.role.length == 0) {
		alert("Please enter role");
		$("#role").focus();
	} else if (addRosterShiftFormData.startTime.length == 0) {
		alert("Please enter start time");
		$("#startTime").focus();
	} else if (addRosterShiftFormData.endTime.length == 0) {
		alert("Please enter end time");
		$("#endTime").focus();
	} else {
		return true;
	}
	
	/*$("#add_roster_shifts").validate({
	    focusInvalid: false,
	    onkeyup: false,
	    onfocusout: false,
	    
	    errorPlacement: function(error, element) {
	        error.appendTo(element.parent());
	    }, 
	    rules: {
	        "staffName": {
	            required: true,
	            minlength: 1,
	            lettersonly:true
	        }, 
	        "role": {
	            required: true,
	            minlength: 1,
	            lettersonly:true
	        }, 
	        "startTime": {
	            required: true,
	        }, 
	        
	        "endTime": {
	            required: true,
	        }, 
	       },
	
	    messages: {
	        "staffName": {
	            required: "Please enter staff name",
	            minlength: " name must be at least 1 character ",
	            lettersonly:"You must Enter Characters"
	        },
	        "role": {
	            required: "Please enter role",
	        },  
	        "startTime": {
	            required: "Please enter start time",
	        },  
	        "endTime": {
	            required: "Please enter end time",
	            },
	        
			}
	});*/	
	
	return false;
}


function validateBeveragePurchase(beveragePurchaseFormData) {
	if (beveragePurchaseFormData.purchaseBeverageName.length == 0) {
		alert("Please enter beverage");
		$("#purchaseBeverageName").focus();
	} 
	else if (beveragePurchaseFormData.purchaseBeverageValue.length == 0) {
		alert("Please enter price");
		$("#beveragePrice").focus();
	} 
	else {
		return true;
	}
	return false;
}

function validateFoodPurchase(foodPurchaseFormData) {
	if (foodPurchaseFormData.purchaseFoodName.length == 0) {
		alert("Please enter food");
		$("#purchaseFoodName").focus();
	} 
	else if (foodPurchaseFormData.purchaseFoodValue.length == 0) {
		alert("Please enter price");
		$("#foodPrice").focus();
	} 
	else {
		return true;
	}
	return false;
}

function validateEvents(eventFormData) {
	if (eventFormData.eventname.length == 0) {
		alert("Please enter event name");
		$("#eventname").focus();
	} 
	else if (eventFormData.food_budgeted_income.length == 0) {
		alert("Please enter food budgeted income");
		$("#food_budgeted_income").focus();
	} 
	else if (eventFormData.food_actual.length == 0) {
		alert("Please enter food actual");
		$("#food_actual").focus();
	} 
	else if (eventFormData.beverage_budgeted_income.length == 0) {
		alert("Please enter beverage budgeted income ");
		$("#beverage_budgeted_income").focus();
	} 
	else if (eventFormData.beverage_actual.length == 0) {
		alert("Please enter beverage actual");
		$("#beverage_actual").focus();
	} 
	else if (eventFormData.other_budgeted_income.length == 0) {
		alert("Please enter other budgeted income");
		$("#other_budgeted_income").focus();
	} 
	else if (eventFormData.food_budgeted_income.length == 0) {
		alert("Please enter food budgeted income ");
		$("#food_budgeted_income").focus();
	} 
	else if (eventFormData.other_actual.length == 0) {
		alert("Please enter other actual");
		$("#other_actual").focus();
	} 
	
	else {
		return true;
	}
	return false;
}
