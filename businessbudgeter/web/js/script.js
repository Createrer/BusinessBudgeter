function goToCashupCash() {

    $.ajax({
        url: "cashup-cash",
        type: "POST",
       
        success: function(data, textStatus, jqXHR) {
           
        },
        error: function(jqXHR, textStatus, errorThrown) {
            // if fails
        }
    });

}


	function validateCashup(){
		if($("#serviceDate").val() == ""){
			$("#serviceDate").css("border-color","red");
			alert("Date can not be empty.");
		}else{
			$("#serviceDate").css("border-color","");
			return true;
		}
		return false;
	}

	
	
function updateCashup() {
	
	console.log("inside updateCashup")
	
	if(validateCashup()){
	var postData = $("#cashUpCash").serializeArray();
	//var postData2 = $("#servicefrm").serializeArray();
    $.ajax({
        url: "update-cashUp",
        type: "POST",
        data: postData ,
        success: function(data, textStatus, jqXHR) {
        	 handleChangeInputs();
            toastr.success('Cashup-Cash Updated');
        },
        error: function(jqXHR, textStatus, errorThrown) {
        	
        }
    });
} 
} 
function isNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode;
    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57) &&  (iKeyCode < 37 || iKeyCode > 40 && iKeyCode != 13))
        return false;

    return true;
}  

function isTimeNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode;
    if (iKeyCode != 58 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57) &&  (iKeyCode < 37 || iKeyCode > 40 && iKeyCode != 13))
        return false;

    return true;
}  

function isInteger(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode;
    if (iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57) &&  (iKeyCode < 37 || iKeyCode > 40 && iKeyCode != 13))
        return false;

    return true;
} 

function makeDirty(jgObject) {
	jgObject.value = 1;
}


/*function addFoodPurchase() {
	var postData = $("#cashUpCash").serializeArray();
	
    $.ajax({
        traditional: true,
        url: "add-new-food-purchase",
        type: "GET",
        data: postData,
        success: function(data, textStatus, jqXHR) {
            $("#cashup_purchase_details").load("cashup-purchase");
            toastr.success('New food purchase added');
        },
        error: function(jqXHR, textStatus, errorThrown) {
           
        }
    });
}

function addBeveragePurchase() {
	var postData = $("#cashUpCash").serializeArray();
    $.ajax({
        traditional: true,
        url: "add-new-beverage-purchase",
        type: "GET",
        data: postData,
        
        success: function(data, textStatus, jqXHR) {
            $("#cashup_purchase_details").load("cashup-purchase");
            toastr.success('New beverage purchase added');
        },
        error: function(jqXHR, textStatus, errorThrown) {
           
        }
    });
}

function addNewCashupVoid() {
	var postData = $("#cashUpCash").serializeArray();
    $.ajax({
        traditional: true,
        url: "add-new-cashup-void",
        type: "GET",
        data: postData,
        
        success: function(data, textStatus, jqXHR) {
            $("#cashup_void_details").load("cashup-void");
            toastr.success('New cashup void added');
        },
        error: function(jqXHR, textStatus, errorThrown) {
           
        }
    });
}*/

function staff_search_by_name() {
	
    var e = $('#staff-list');
    var n = $('#staff-search-string').val();
    if (n.length < 1) {
        e.style.display = 'none';
        return false;
    } else {

        $.ajax({
            url: "search-staff-by-name",
            type: "GET",
            data: {
                staffname : n
            },
            success: function(data, textStatus, jqXHR) {
            	$('#staff-list-details-result').html(data);
                $('#staff-list-details-result').html();
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // if fails
            }
        });

        return true;
    }
}

/*function selectIncomeCenter(val) {

    $.ajax({
        url: "cashup-cash",
        type: "GET",
        data: {
        	incomeCenterId : val,
        },
        success: function(data, textStatus, jqXHR) {
           
        },
        error: function(jqXHR, textStatus, errorThrown) {
            // if fails
        }
    });
}*/

function selectService(val) {

    $.ajax({
        url: "cashup-cash",
        type: "GET",
        data: {
        	serviceId : val,
        },
        success: function(data, textStatus, jqXHR) {
           
        },
        error: function(jqXHR, textStatus, errorThrown) {
            // if fails
        }
    });
}

function select_staff_action(staffId) {
	
	$.ajax({
		url : "get-staff-id-by-name",
		type : "GET",
		data : {
			staffId : staffId
		},
		success : function(data, textStatus, jqXHR) {
			 $('#staffIdStaff').html();
             $('#staffIdStaff').html(data);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			// if fails
		}
	});
}

function addRosterEvent() {
	$.ajax({
		traditional : true,
		url : "add-roster-event",
		type : "GET",
		data : {
			//mealId:mealid
		},
		success : function(data, textStatus, jqXHR) {
			
			$("#roster-event-popup").html(data);
			
			var dialog = $('#roster-event-popup').dialog({
        		title: "Add New Event ", 
        		height: "auto",
        		width:  "auto",
       			modal: true,
       			create: function( event, ui ) {
       				$(this).css('maxWidth', dWidth);
	   			},
        		buttons: {
        			//class:'button-popup',
					"Add" : function() {
						var postData = $("#add_roster_events").serialize();

                    	$.ajax({
		                    url: "add-new-roster-event",
		                    type: "POST",
		                    data: postData,
		                    success: function(data, textStatus, jqXHR) {
		                    	dialog.dialog('close');
		                    	handleChangeInputsRoster();
		                        toastr.success('Event Added');
		                    },
		                    error: function(jqXHR, textStatus, errorThrown) {
                        	}
                    });
					},
					"Close" : function() {
						$(this).dialog('close');
						$("#roster-event-popup").html("");
					}
				},
				
				open : function() {
					dialogOpen();
				},
				close : function() {
				},
			});

			dialog.dialog("open");
		},
		error : function(jqXHR, textStatus, errorThrown) {
        },
	});

}

function validateRosterDate(){
	if ($("#rosterDate").val().length == 0) {
		$("#rosterDate").css("border-color","red");
		alert("Please Select Roster Date");
		$("#rosterDate").focus();
		return false;
	}else{
		$("#rosterDate").css("border-color","");
		return true;
	}
}


var wWidth = $(window).width();
var dWidth = wWidth * 0.8;

function addRosterShift() {
	
	//exampleModal
	
	$.ajax({
		traditional : true,
		url : "add-roster-shift", // mapped in controller to get details
		type : "GET",
		data : {
			//mealId:mealid
		},
		success : function(data, textStatus, jqXHR) {

			$("#exampleModal").html(data); 
		},
		error : function(jqXHR, textStatus, errorThrown) {
        },
	});
}

function addRosterShiftOnShortCutKey() {
	
	//exampleModal
	$.ajax({
		traditional : true,
		url : "add-roster-shift", // mapped in controller to get details
		type : "GET",
		data : {
			//mealId:mealid
		},
		success : function(data, textStatus, jqXHR) {
			$("#exampleModal").html(data); 
			$('#exampleModal').modal("show");
		},
		error : function(jqXHR, textStatus, errorThrown) {
        },
	});
}

function saveRosterShift(command)
{
	var postData = $("#add_roster_shifts").serialize(); //form id of new jsp
	var formData = $('#add_roster_shifts').serializeArray().reduce(function(obj, v) { obj[v.name] = v.value; return obj; }, { });
	if(!validateRosterDate()){
		//$(this).dialog('close');
		$("#exampleModal").html("");
	}
	else
	{
		if(validateRosterShift(formData))
		{
			$.ajax({
	            url: "add-new-roster-shift", //mapped in cotroller to add data in new window
	            type: "POST",
	            data: postData,
	            success: function(data, textStatus, jqXHR) {
	            	//dialog.dialog('close');
	            	handleChangeInputsRoster();
	                if(command == 0){
	                	 toastr.success('Shift Added');
                	}
                	else{
                		 toastr.success('Shift Updated');
                	}
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	        	}
			});
		}
	}
}

function editShift(staff_roster_id) {
	$.ajax({
		traditional : true,
		url : "add-roster-shift?staff_roster_id="+staff_roster_id, // mapped in controller to get details
		type : "GET",
		data : {
		},
		success : function(data, textStatus, jqXHR) {
			
			$("#exampleModal").html(data); 
		},
		error : function(jqXHR, textStatus, errorThrown) {
        },
	});
}
  


function allocateStaff() {
	$.ajax({
		traditional : true,
		url : "add_staff_roster",
		type : "GET",
		data : {
		},
		success : function(data, textStatus, jqXHR) {
			
			$("#roster-event-popup").html(data);
			
			var dialog = $('#roster-event-popup').dialog({
        		title: "Allocate Staff",
        		height: "auto",
        		width:  "auto",
       			modal: true,
       			create: function( event, ui ) {
       				$(this).css('maxWidth', dWidth);
	   			},
        		buttons: {
					"Add" : function() {
						var postData = $("#add_staf_rosters").serialize();
						
                    	$.ajax({
		                    url: "allocate-staff-to-roster",
		                    type: "POST",
		                    data: postData,
		                    success: function(data, textStatus, jqXHR) {
		                    	dialog.dialog('close');
		                    	handleChangeInputsRoster();
		                        toastr.success('Staff Allocated Succeed !');
		                    },
		                    error: function(jqXHR, textStatus, errorThrown) {
                        	}
                    });
					},
					"Close" : function() {
						$(this).dialog('close');
						$("#roster-event-popup").html("");
					}
				},
				open : function() {
					dialogOpen();
				},
				close : function() {
				},
				
			});

			dialog.dialog("open");
		},
		error : function(jqXHR, textStatus, errorThrown) {
        },
	});
}
	
	function allocateService(staff_roster_id) {
		$.ajax({
			traditional : true,
			url : "add_service_roster?staff_roster_id="+staff_roster_id,
			type : "GET",
			data : {
			},
			success : function(data, textStatus, jqXHR) {
				
				$("#exampleModal").html(data); 
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});
}
	
	function saveAllocatedServices(){
		
		var postData = $("#add_service_rosters").serialize();
		var totalHours = $("#totalHours").val();
		if(totalHours.length == 0){
			alert("Please enter total hours"); $("#totalHours").focus();
		}else{
			$.ajax({
				url: "allocate-service-to-roster",
				type: "POST",
				data: postData,
				success: function(data, textStatus, jqXHR) {
					handleChangeInputsRoster();
					toastr.success('Service Allocated Succeed !');
				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
	}
	
	function allocateEvent(staff_roster_id) {
		$.ajax({
			traditional : true,
			url : "add_event_roster?staff_roster_id="+staff_roster_id,
			type : "GET",
			data : {
			},
			success : function(data, textStatus, jqXHR) {
				
				$("#roster-event-popup").html(data);
				
				var dialog = $('#roster-event-popup').dialog({
	        		title: "Allocate event",
	        		height: "auto",
	        		width:  "auto",
	       			modal: true,
	       			create: function( event, ui ) {
	       				$(this).css('maxWidth', dWidth);
		   			},
	        		buttons: {
						"Add" : function() {
							var postData = $("#add_event_rosters").serialize();

	                    	$.ajax({
			                    url: "allocate-event-to-roster",
			                    type: "POST",
			                    data: postData,
			                    success: function(data, textStatus, jqXHR) {
			                    	dialog.dialog('close');
			                    	handleChangeInputsRoster();
			                        toastr.success('Event Allocated Succeed !');
			                    },
			                    error: function(jqXHR, textStatus, errorThrown) {
	                        	}
	                    });
						},
						"Close" : function() {
							$(this).dialog('close');
							$("#roster-event-popup").html("");
						}
					},
					close : function() {
					},
					open : function() {
						dialogOpen();
					},
					
				});

				dialog.dialog("open");
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});
}

	function autoUpdateCashup() {
		console.log("inside autoUpdateCashup")
		
		var postData = $("#cashUpCash").serializeArray();
		//var postData2 = $("#servicefrm").serializeArray();
	    $.ajax({
	        url: "update-cashUp",
	        type: "POST",
	        data: postData ,
	        success: function(data, textStatus, jqXHR) {
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	        }
	    });
	} 
	
	function dialogOpen() {
		 $('.ui-dialog-buttonset').find('button').removeClass('ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only');
		 $('.ui-dialog-buttonset').find('button').addClass('button-popup-style');
		 $('.ui-dialog-buttonset').find('button').hover(function(e){
		    $(this).removeClass("ui-state-hover");
		});
		 $('.ui-dialog-titlebar').find('a').hover(function(e){
		    $(this).removeClass("ui-state-hover");
		});
		 $('.ui-dialog-titlebar').find('a').focus(function(e){
			 $(this).removeClass("ui-state-focus");
		});
			 
	}
	
	function removeStaffOrShift(operation, satffRosterId, staffId, incomeCenterId) {
		
		var staffOrShift = "";
		if("removeShift" == operation){
			staffOrShift = "shift";
		}else{
			staffOrShift = "staff";
		}
		
	    var r = confirm("Are you sure want to remove "+staffOrShift+"?");
	    if (r == true) {

	        $.ajax({
	            url: "remove_staff_roster",
	            type: "POST",
	            data: {
	            	operation : operation,
	            	satffRosterId : satffRosterId,
	                "staffId": staffId,
	                incomeCenterId : incomeCenterId
	            },
	            success: function(data, textStatus, jqXHR) {
	            	//toastr.success('Staff removed !');
	            	handleChangeInputsRoster();
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		        	alert('Failed to remove staff: ');
		        },
	         });
	      }
	}
	
	function allocateRosterShift(staff_roster_id, staffId, staffName){
		$.ajax({
			traditional : true,
			url : "allocate-roster-shift?staff_roster_id="+staff_roster_id, // mapped in controller to get details
			type : "GET",
			data : {
				//mealId:mealid
			},
			success : function(data, textStatus, jqXHR) {
				
				$("#exampleModal").html(data); 
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});
	}
	
 	function saveAllocatedShift(command) {
 		
 		var postData = $("#allocate_roster_shifts").serialize(); //form id of new jsp
		var formData = $('#allocate_roster_shifts').serializeArray().reduce(function(obj, v) { obj[v.name] = v.value; return obj; }, { });
		
		if(validateAllocateRosterShift(formData)){
			$.ajax({
				url: "allocate-new-roster-shift", //mapped in cotroller to add data in new window
				type: "POST",
				data: postData,
				success: function(data, textStatus, jqXHR) {
					handleChangeInputsRoster();
					toastr.success('Shift Added');
				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
	} 
	
 	var focusTimeOutOnPopUp = 450;
 	
	function addFoodPurchase() {
		$("#cashup-add-popup").html("");
		$("#cashup_purchase_food_details").slideUp("fast");
		$.ajax({
			traditional : true,
			url : "add-cashup-food-purchase",
			type : "GET",
			data : {
			},
			success : function(data, textStatus, jqXHR) {
				$("#cashup-add-popup").html(data);
				setTimeout(function(){ $("#purchaseFoodName").focus(); }, focusTimeOutOnPopUp);
			},
			complete : function(){
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});
	}
	
	function saveFoodPurchase() {
		
		var postData = $("#add_food_purchase_popup").serialize();
		var formData = $('#add_food_purchase_popup').serializeArray().reduce(function(obj, v) { obj[v.name] = v.value; return obj; }, { });
		if(validateFoodPurchase(formData)){
    	$.ajax({
            url: "add-new-food-purchase",
            type: "POST",
            data: postData,
            success: function(data, textStatus, jqXHR) {
            	//data-dismiss="modal";
            	//$("#cashup_purchase_food_details").load("cashup-purchase");
            	handleChangeInputs();
                toastr.success('Food Purchase Succeed !');
            },
            error: function(jqXHR, textStatus, errorThrown) {
        	}
    });
		}
	} 
	
	function addBeveragePurchase() {
		$("#cashup_purchase_beverage_details").slideUp("fast");
		$.ajax({
			traditional : true,
			url : "add-cashup-beverage-purchase",
			type : "GET",
			data : {
			},
			success : function(data, textStatus, jqXHR) {
				$("#cashup-add-popup").html(data);
				setTimeout(function(){ $("#purchaseBeverageName").focus(); }, focusTimeOutOnPopUp);
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});
	}
	
	function saveBeveragePurchase() {
		
		var postData = $("#add_beverage_purchase_popup").serialize();
		var formData = $('#add_beverage_purchase_popup').serializeArray().reduce(function(obj, v) { obj[v.name] = v.value; return obj; }, { });
		if(validateBeveragePurchase(formData)){
	    	$.ajax({
	            url: "add-new-beverage-purchase",
	            type: "POST",
	            data: postData,
	            success: function(data, textStatus, jqXHR) {
	            	//$("#cashup_purchase_beverage_details").load("cashup-purchase-beverage");
	            	handleChangeInputs();
	                toastr.success('Beverage Purchase Succeed !');
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	        	}
	    	});
		}
		
	}
	
	function addNewCashupVoid() {
		
		$("#cashup_void_details").slideUp("fast");
		$.ajax({
			traditional : true,
			url : "add-cashup-voids",
			type : "GET",
			data : {
			},
			success : function(data, textStatus, jqXHR) {
				$("#cashup-add-popup").html(data);
			},
			error : function(jqXHR, textStatus, errorThrown) {
	     },
		});
	} 
	
	function validateCashupVoidData(formData){
		if($.trim(formData.staffId).length == 0){
			alert("Please select the staff");
			$("#staffId").focus();
			return false;
		}
		if($.trim(formData.value).length == 0){
			alert("Please enter the value");
			$("#value").focus();
			return false;
		}
		if($.trim(formData.timepopup).length == 0){
			alert("Please select the time");
			$("#timepopup").focus();
			return false;
		}
		if($.trim(formData.why).length == 0){
			alert("Please enter the reason in why field");
			$("#why").focus();
			return false;
		}
		return true;
	}
	
	function saveCashupVoid() {
		
		var postData = $("#add_cashup_voids_popup").serialize();
		var formData = $('#add_cashup_voids_popup').serializeArray().reduce(function(obj, v) { obj[v.name] = v.value; return obj; }, { });
		if(validateCashupVoidData(formData)){
			$.ajax({
				url: "add-new-cashup-void",
				type: "POST",
				data: postData,
				success: function(data, textStatus, jqXHR) {
					//$("#cashup_void_details").load("cashup-void");
					handleChangeInputs();
					toastr.success('CashUp Voids Succeed !');
				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
		
	}
	
	/* Settings start */
	
	function addNewSettingsStaff() {
		
		$.ajax({
			traditional : true,
			url : "add-staff",
			type : "GET",
			data : {
			},
			success : function(data, textStatus, jqXHR) {
				
				$("#setting-add-popup").html(data);
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});

	}

	function saveStaffDetails(command) {
		if(validateStaff()){
			var postData = $("#add_setting_staff").serialize();
			
        	$.ajax({
                url: "add-new-staff",
                type: "POST",
                data: postData,
                success: function(data, textStatus, jqXHR) {
                	window.location = "staff";
                	if(command == 0){
                		toastr.success('Staff Added');
                	}
                	else{
                		toastr.success('Staff Updated');
                	}
                },
                error: function(jqXHR, textStatus, errorThrown) {
            	}
        });
			}
	}
	
	function validateStaff(){
		var i,j;
		for(i=0,j=0;i<=11,j<=11;i++,j++){
			if(document.getElementById("staffname").value == "" || document.getElementById("email_id").value == "" || document.getElementById("postcode").value == "" 
				|| document.getElementById("cell_no").value == ""  || document.getElementById("address").value == "" || document.getElementById("position").value == ""
					|| document.getElementById("hourly_daily_rate").value == "" || document.getElementById("saturday_day_rate").value == "" ||
					document.getElementById("sunday_day_rate").value == "" || document.getElementById("other_rate").value == "" || document.getElementById("agency").value == ""){
				for(;j<=11;j++){
					switch(j){
						case 0:
							if(document.getElementById("staffname").value == "" || document.getElementById("staffname").value == 0)
								$("#staffname").css("border-color","red");
							
							else
								$("#staffname").css("border-color","");
							break;
						case 1:
							if(document.getElementById("email_id").value == "" || document.getElementById("email_id").value == 0)
								$("#email_id").css("border-color","red");
							
							else
								$("#email_id").css("border-color","");
							break;
						case 2:
							if(document.getElementById("postcode").value == "" || document.getElementById("postcode").value == 0)
								$("#postcode").css("border-color","red");
							
							else
								$("#postcode").css("border-color","");
							break;
						case 3:
							if(document.getElementById("cell_no").value == "" || document.getElementById("cell_no").value == 0)
								$("#cell_no").css("border-color","red");
							else
								$("#cell_no").css("border-color","");
							break;
						case 4:
							if(document.getElementById("address").value == "" || document.getElementById("address").value == 0)
								$("#address").css("border-color","red");
							
							else
								$("#address").css("border-color","");
							break;
						case 5:
							if(document.getElementById("position").value == "" || document.getElementById("position").value == 0)
								$("#position").css("border-color","red");
							
							else
								$("#position").css("border-color","");
							break;
						
						case 6:
							if(document.getElementById("hourly_daily_rate").value == "" || document.getElementById("hourly_daily_rate").value == 0)
								$("#hourly_daily_rate").css("border-color","red");
							
							else
								$("#hourly_daily_rate").css("border-color","");
							break;
							
						case 7:
							if(document.getElementById("saturday_day_rate").value == "" || document.getElementById("saturday_day_rate").value == 0)
								$("#saturday_day_rate").css("border-color","red");
							else
								$("#saturday_day_rate").css("border-color","");
							break;
						case 8:
							if(document.getElementById("sunday_day_rate").value == "" || document.getElementById("sunday_day_rate").value == 0)
								$("#sunday_day_rate").css("border-color","red");
							else
								$("#sunday_day_rate").css("border-color","");
							break;
							
						case 9:
							if(document.getElementById("public_holiday_rate").value == "" || document.getElementById("public_holiday_rate").value == 0)
								$("#public_holiday_rate").css("border-color","red");
							else
								$("#public_holiday_rate").css("border-color","");
							break;
						case 10:
							if(document.getElementById("other_rate").value == "" || document.getElementById("other_rate").value == 0)
								$("#other_rate").css("border-color","red");
							else
								$("#other_rate").css("border-color","");
							break;
							
						case 11:
							if(document.getElementById("agency").value == "" || document.getElementById("agency").value == 0)
								$("#agency").css("border-color","red");
							else
								$("#agency").css("border-color","");
							break;
					}
				}
				alert("Required Field");
				return false;
			}		
		}
		
		var email = document.getElementById("email_id").value;
	    var atpos = email.indexOf("@");
	    var dotpos = email.lastIndexOf(".");
	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {
	        alert("e-mail address is not valid");
	        return false;
	    }
	    
		var phoneNo = document.getElementById('cell_no');
        if (phoneNo.value.length < 10 || phoneNo.value.length > 10) {
            alert("Cell No. is not valid, Please Enter 10 Digit Cell No.");
			$("#cell_no").css("border-color","red");
			return false;
        }else
			$("#cell_no").css("border-color","");

        var isSysCheck = document.getElementById('system_access').value;
        
        if($('#system_access').prop("checked") == true){
        	
        var userId = document.getElementById('userid');
        if(userId.value == "" && userId.value.length == 0){
        	$("#userid").css("border-color","red");
        }else
			$("#userid").css("border-color","");
        
        var password = document.getElementById('password');
        if(password.value == "" && password.value.length == 0){
        	$("#password").css("border-color","red");
        }else
			$("#password").css("border-color","");

          
        var confirmPassword = document.getElementById('confirm_password');
        
        if(confirmPassword.value == "" && confirmPassword.value.length == 0){
        	$("#confirm_password").css("border-color","red");
        }else
			$("#confirm_password").css("border-color","");
        
        if(userId.value == "" && userId.value.length == 0 || password.value == "" && password.value.length == 0 || confirmPassword.value == "" && confirmPassword.value.length == 0)   {
        	alert("Required Field");
        return false;	
        }  
        
        if(password.value != confirmPassword.value){
        	alert('Password dosent match');
        	return false;
        }
	}
        return true;
        
	}
	function ValidateNo() {
        var phoneNo = document.getElementById('cell_no');

        if (phoneNo.value.length < 10 || phoneNo.value.length > 10) {
            alert("Cell No. is not valid, Please Enter 10 Digit Cell No.");
            return false;
        }
        return true;
        }

	function editSettingStaff(staffid) {
		$.ajax({
			traditional : true,
			url : "add-staff?staffid="+staffid,
			type : "GET",
			data : {
				
	        },
			success : function(data, textStatus, jqXHR) {
				
				$("#setting-add-popup").html(data);
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});

	}

	function viewSettingStaff(staffid) {
		
		$.ajax({
			traditional : true,
			url : "add-staff?staffid="+staffid,
			type : "GET",
			data : {
				
	        },
			success : function(data, textStatus, jqXHR) {
				
				$("#setting-add-popup").html(data);
				
				var dialog = $('#setting-add-popup').dialog({
	        		title: "View Staff ",
	        		height: "auto",
	        		width:  "auto",
	       			modal: true,
	       			create: function( event, ui ) {
	       				$(this).css('maxWidth', dWidth);
		   			},
	        		buttons: {
						
						"Close" : function() {
	                    $(this).dialog('close');
						$("#setting-add-popup").html("");
						}
					},
					close : function() {
					},
					open : function() {
					dialogOpen();
					},
				});

				dialog.dialog("open");
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});

	}
	
	function deleteSettingsStaff() {

	    var selected = [];

	    $('#staff-details_setting input:checked').each(function() {
	        selected.push($(this).attr('value'));
	    });

	    if(selected.length == 0){
	    	alert('Please select staff to delete.');
	        return false;
	    }
	   else {

	        var r = confirm("Are you sure want to remove selected staff ?");
	        
	        if (r == true) {
	            $.ajax({
	                traditional: true,
	                cache: false,
	                url: "delete-staff",
	                type: "POST",
	                data: {
	                    staffIdList : selected
	                },
	                success: function(data, textStatus, jqXHR) {
	                	$("#staff-details_setting").load("staff-list");
	                    toastr.success('Staff Deleted');
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    toastr.error('not deleted');
	                }
	            });

	        }
	    }
	}
	
function addNewSettingsEvent() {
		
		$.ajax({
			traditional : true,
			url : "add-setting-event",
			type : "GET",
			data : {
			},
			success : function(data, textStatus, jqXHR) {
				
				$("#event-add-popup").html(data);
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});

	}

	function editSettingEvent(eventid) {
		
		$.ajax({
			traditional : true,
			url : "add-setting-event?eventid="+eventid,
			type : "GET",
			data : {},
			success : function(data, textStatus, jqXHR) {
				$("#event-add-popup").html(data);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				
	        }
		});

	}
	
	function saveEventDetails(command){
		
		var postData = $("#add_setting_event").serialize();
		var formData = $('#add_setting_event').serializeArray().reduce(function(obj, v) { obj[v.name] = v.value; return obj; }, { });
		if(validateEvents(formData)){
        	$.ajax({
                url: "add-new-event",
                type: "POST",
                data: postData,
                success: function(data, textStatus, jqXHR) {
                	//$("#event-details_setting").load("setting-event-list");
                	window.location = "events";
                	 if(command == 0){
                		 toastr.success('Event Added');
                	}
                	else{
                		 toastr.success('Event Updated');
                	}
                   
                },
                error: function(jqXHR, textStatus, errorThrown) {
            	}
        	});
		}
		
	}

	function viewSettingEvent(eventid) {
		
		$.ajax({
			traditional : true,
			url : "add-setting-event?eventid="+eventid,
			type : "GET",
			data : {
				
	        },
			success : function(data, textStatus, jqXHR) {
				
				$("#setting-add-popup").html(data);
				
				var dialog = $('#setting-add-popup').dialog({
	        		title: "View Event ",
	        		height: "auto",
	        		width:  "auto",
	       			modal: true,
	       			create: function( event, ui ) {
	       				$(this).css('maxWidth', dWidth);
		   			},
	        		buttons: {
						
						"Close" : function() {
	                    $(this).dialog('close');
						$("#setting-add-popup").html("");
						}
					},
					close : function() {
					},
					open : function() {
					dialogOpen();
					},
				});

				dialog.dialog("open");
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});

	}
	
	function deleteSettingsEvent() {

	    var selected = [];

	    $('#event-details_setting input:checked').each(function() {
	        selected.push($(this).attr('value'));
	    });
	    if (document.getElementsByName("check").checked == false) {
	        alert('nothing is checked');
	        return false;
	    } else {

	        var r = confirm("Are you sure want to remove selected staff ?");
	        if (r == true) {
	            $.ajax({
	                traditional: true,
	                cache: false,
	                url: "delete-event",
	                type: "POST",
	                data: {
	                    eventIdList : selected
	                },
	                success: function(data, textStatus, jqXHR) {
	                	$("#event-details_setting").load("setting-event-list");
	                    toastr.success('Event Deleted');
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    toastr.error('not deleted');
	                }
	            });

	        }
	    }
	}
	
	function event_search_by_name() {
	    var e = $('#setting-event-list');
	    var n = $('#event-search-string').val();
	   /* if (n.length < 1) {
	        e.style.display = 'none';
	        return false;
	    } else {*/

	        $.ajax({
	            url: "search-event-by-name",
	            type: "GET",
	            data: {
	                eventname : n
	            },
	            success: function(data, textStatus, jqXHR) {
	            	$('#event-list-details-result').html(data);
	                $('#event-list-details-result').html();
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                // if fails
	            }
	        });

	        return true;
	   // }
	   
	}
	function addNewSettingsUser() {
		
		$.ajax({
			traditional : true,
			url : "add-user",
			type : "GET",
			data : {
			},
			success : function(data, textStatus, jqXHR) {
				
				$("#setting-add-popup").html(data);
				
				var dialog = $('#setting-add-popup').dialog({
	        		title: "Add New User ",
	        		height: "auto",
	        		width:  "auto",
	       			modal: true,
	       			create: function( event, ui ) {
	       				$(this).css('maxWidth', dWidth);
		   			},
	        		buttons: {
						"Add" : function() {
							var postData = $("#add_setting_user").serialize();

	                    	$.ajax({
			                    url: "add-new-user",
			                    type: "POST",
			                    data: postData,
			                    success: function(data, textStatus, jqXHR) {
			                    	dialog.dialog('close');
			                    	$("#user-details_setting").load("user-list");
			                        toastr.success('User Added');
			                    },
			                    error: function(jqXHR, textStatus, errorThrown) {
	                        	}
	                    });
						},
						"Close" : function() {
	                    $(this).dialog('close');
						$("#setting-add-popup").html("");
						}
					},
					close : function() {
					},
					open : function() {
					dialogOpen();
					},
				});

				dialog.dialog("open");
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});
	}
	
	function deleteSettingsUser() {
		
	    var selected = [];

	    $('#user-details_setting input:checked').each(function() {
	        selected.push($(this).attr('value'));
	    });

	    if (document.getElementsByName("check").checked == false) {
	        alert('nothing is checked');
	        return false;
	    } else {

	        var r = confirm("Are you sure want to remove selected user ?");
	        if (r == true) {
	            $.ajax({
	                traditional: true,
	                cache: false,
	                url: "delete-user",
	                type: "POST",
	                data: {
	                	userIdList : selected
	                },
	                success: function(data, textStatus, jqXHR) {
	                	$("#user-details_setting").load("user-list");
	                    toastr.success('User Deleted');
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    toastr.error('not deleted');
	                }
	            });

	        }
	    }
	}
	
	 function user_search_by_name() {
	    	
	        var e = $('#user-list');
	        var n = $('#user-search-string').val();
	        
	        if (n.length < 1) {
	        	e.style.display = 'none';
	            return false;
	        } else {

	            $.ajax({
	                url: "search-user-by-name",
	                type: "GET",
	                data: {
	                    username : n
	                },
	                success: function(data, textStatus, jqXHR) {
	                	$('#user-list-details-result').html(data);
	                    $('#user-list-details-result').html();
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    // if fails
	                }
	            });

	            return true;
	        }
	    }
	 
	 function editSettingUser(userid) {
			
			$.ajax({
				traditional : true,
				url : "add-user?userid="+userid,
				type : "GET",
				data : {
					
		        },
				success : function(data, textStatus, jqXHR) {
					
					$("#setting-add-popup").html(data);
					
					var dialog = $('#setting-add-popup').dialog({
		        		title: "Edit User ",
		        		height: "auto",
		        		width:  "auto",
		       			modal: true,
		       			create: function( event, ui ) {
		       				$(this).css('maxWidth', dWidth);
			   			},
		        		buttons: {
							"Update" : function() {
								var postData = $("#add_setting_user").serialize();

		                    	$.ajax({
				                    url: "add-new-user",
				                    type: "POST",
				                    data: postData,
				                    success: function(data, textStatus, jqXHR) {
				                    	dialog.dialog('close');
				                    	$("#user-details_setting").load("user-list");
				                        toastr.success('User Updated');
				                    },
				                    error: function(jqXHR, textStatus, errorThrown) {
		                        	}
		                    });
							},
							"Close" : function() {
		                    $(this).dialog('close');
							$("#setting-add-popup").html("");
							}
						},
						close : function() {
						},
						open : function() {
						dialogOpen();
						},
					});

					dialog.dialog("open");
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        },
			});

		}

	 function viewSettingUser(userid) {
			
			$.ajax({
				traditional : true,
				url : "add-user?userid="+userid,
				type : "GET",
				data : {
					
		        },
				success : function(data, textStatus, jqXHR) {
					
					$("#setting-add-popup").html(data);
					
					var dialog = $('#setting-add-popup').dialog({
		        		title: "View User ",
		        		height: "auto",
		        		width:  "auto",
		       			modal: true,
		       			create: function( event, ui ) {
		       				$(this).css('maxWidth', dWidth);
			   			},
		        		buttons: {
							
							"Close" : function() {
		                    $(this).dialog('close');
							$("#setting-add-popup").html("");
							}
						},
						close : function() {
						},
						open : function() {
						dialogOpen();
						},
					});

					dialog.dialog("open");
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        },
			});

		}
	/* Settings end*/
	
	 function resetNewPassword(userid) {
		
		$.ajax({
			traditional : true,
			url : "set-new-password?userid="+userid,
			type : "GET",
			data : {
				
	        },
			success : function(data, textStatus, jqXHR) {
				
				$("#setting-add-popup").html(data);
				
				var dialog = $('#setting-add-popup').dialog({
	        		title: "Reset Password ",
	        		height: "auto",
	        		width:  "auto",
	       			modal: true,
	       			create: function( event, ui ) {
	       				$(this).css('maxWidth', dWidth);
		   			},
	        		buttons: {
						
						"Close" : function() {
	                    $(this).dialog('close');
						$("#setting-add-popup").html("");
						}
					},
					close : function() {
					},
					open : function() {
					dialogOpen();
					},
				});

				dialog.dialog("open");
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});

	}
	 
/*	 function changePassword(userid) {
			
			$.ajax({
				traditional : true,
				url : "change-password?userid="+userid,
				type : "GET",
				data : {
					
		        },
				success : function(data, textStatus, jqXHR) {
					
					$("#change-password-popup").html(data);
					
					var dialog = $('#change-password-popup').dialog({
		        		title: "Reset Password ",
		        		width : 688,
						height : 377,
		       			modal: true,
		       			buttons: {
							"Reset" : function() {
								var postData = $("#change_password").serialize();

		                    	$.ajax({
				                    url: "create-new-password",
				                    type: "POST",
				                    data: postData,
				                    success: function(data, textStatus, jqXHR) {
				                    	dialog.dialog('close');
				                    	$("#user-details_setting").load("user-list");
				                        toastr.success('User Updated');
				                    },
				                    error: function(jqXHR, textStatus, errorThrown) {
		                        	}
		                    });
							},
							"Close" : function() {
		                    $(this).dialog('close');
							$("#setting-add-popup").html("");
							}
						},
						close : function() {
						},
						open : function() {
						dialogOpen();
						},
					});

					dialog.dialog("open");
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        },
			});

		}*/
	 
	 function changePassword(userid) {
			$.ajax({
				traditional : true,
				url : "password?userid="+userid,
				type : "GET",
				data : {
					
		        },
				success : function(data, textStatus, jqXHR) {
					
					$("#change-password-popup").html(data);
					
					var dialog = $('#change-password-popup').dialog({
		        		title: "Change Password ",
		        		height: "auto",
		        		width:  "auto",
		       			modal: true,
		       			create: function( event, ui ) {
		       				$(this).css('maxWidth', dWidth);
			   			},
		        		buttons: {
							"Update" : function() {
								var postData = $("#change_password").serialize();

		                    	$.ajax({
				                    url: "create-new-password",
				                    type: "POST",
				                    data: postData,
				                    success: function(data, textStatus, jqXHR) {
				                    	dialog.dialog('close');
				                    	$("#user-details_setting").load("user-list");
				                        toastr.success('Password changed');
				                    },
				                    error: function(jqXHR, textStatus, errorThrown) {
		                        	}
		                    });
							},
							"Close" : function() {
		                    $(this).dialog('close');
							$("#change-password-popup").html("");
							}
						},
						close : function() {
						},
						open : function() {
						dialogOpen();
						},
					});

					dialog.dialog("open");
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        },
			});

		}
	 
	 function addNewSettingsCashDrawer() {
			
			$.ajax({
				traditional : true,
				url : "add-setting-cash-drawer",
				type : "GET",
				data : {
				},
				success : function(data, textStatus, jqXHR) {
					
					$("#setting-add-popup").html(data);
					
					var dialog = $('#setting-add-popup').dialog({
		        		title: "Add New Cash Drawer ",
		        		height: "auto",
		        		width:  "auto",
		       			modal: true,
		       			create: function( event, ui ) {
		       				$(this).css('maxWidth', dWidth);
			   			},
		        		buttons: {
							"Add" : function() {
								var postData = $("#add_setting_cash_drawer").serialize();

		                    	$.ajax({
				                    url: "add-new-cash-drawer",
				                    type: "POST",
				                    data: postData,
				                    success: function(data, textStatus, jqXHR) {
				                    	dialog.dialog('close');
				                    	/*$("#cash-drawers-details_setting").load("setting-cash-drawer-list");*/
				                    	settingChangeInputs();
				                        toastr.success('Cash Drawer Added');
				                    },
				                    error: function(jqXHR, textStatus, errorThrown) {
		                        	}
		                    });
							},
							"Close" : function() {
		                    $(this).dialog('close');
							$("#setting-add-popup").html("");
							}
						},
						close : function() {
						},
						open : function() {
						dialogOpen();
						},
					});

					dialog.dialog("open");
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        },
			});

		}

		function editSettingCashDrawer(drawerid) {
			
			$.ajax({
				traditional : true,
				url : "add-setting-cash-drawer?drawerid="+drawerid,
				type : "GET",
				data : {
				},
				success : function(data, textStatus, jqXHR) {
					
					$("#setting-add-popup").html(data);
					
					var dialog = $('#setting-add-popup').dialog({
		        		title: "Edit Cash Drawer ",
		        		height: "auto",
		        		width:  "auto",
		       			modal: true,
		       			create: function( event, ui ) {
		       				$(this).css('maxWidth', dWidth);
			   			},
		        		buttons: {
							"Update" : function() {
									if(document.getElementById("drawername").value == ""){
										$("#drawername").css("border-color","red");
										alert("Required Field");
										return false;
											}
										else
											$("#drawername").css("border-color","");
									
								var postData = $("#add_setting_cash_drawer").serialize();

		                    	$.ajax({
				                    url: "add-new-cash-drawer",
				                    type: "POST",
				                    data: postData,
				                    success: function(data, textStatus, jqXHR) {
				                    	dialog.dialog('close');
				                    	/*$("#cash-drawers-details_setting").load("setting-cash-drawer-list");*/
				                    	settingChangeInputs();
				                        toastr.success('Cash Drawer Updated');
				                    },
				                    error: function(jqXHR, textStatus, errorThrown) {
		                        	}
		                    });
							},
							"Close" : function() {
		                    $(this).dialog('close');
							$("#setting-add-popup").html("");
							}
						},
						close : function() {
						},
						open : function() {
						dialogOpen();
						},
					});

					dialog.dialog("open");
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        },
			});

		}

		function  viewSettingCashDrawer(drawerid) {
			
			$.ajax({
				traditional : true,
				url : "add-setting-cash-drawer?drawerid="+drawerid,
				type : "GET",
				data : {
					
		        },
				success : function(data, textStatus, jqXHR) {
					
					$("#setting-add-popup").html(data);
					
					var dialog = $('#setting-add-popup').dialog({
		        		title: "View Cash Drawer ",
		        		height: "auto",
		        		width:  "auto",
		       			modal: true,
		       			create: function( event, ui ) {
		       				$(this).css('maxWidth', dWidth);
			   			},
		        		buttons: {
							
							"Close" : function() {
		                    $(this).dialog('close');
							$("#setting-add-popup").html("");
							}
						},
						close : function() {
						},
						open : function() {
						dialogOpen();
						},
					});

					dialog.dialog("open");
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        },
			});

		}
		
		/*function deleteSettingsCashDrawer(){

		    var selected = [];

		    $('#cashDrawerList input:checked').each(function() {
		        selected.push($(this).attr('value'));
		    });
		   var newSelected = [];
		   var i, j = 1;
		   for(i=0;i<selected.length-1;i++)
			   {
			   newSelected[i] = selected[j];
			   j++;
			   }
		    alert(selected);
		    if (document.getElementsByName("check").checked == false) {
		        alert('nothing is checked');
		        return false;
		    } else {

		        var r = confirm("Are you sure want to remove selected drawer ?");
		        if (r == true) {
		            $.ajax({
		                traditional: true,
		                cache: false,
		                url: "delete-cash-drawer",
		                type: "POST",
		                data: {
		                    cashDrawerIdList : selected
		                },
		                success: function(data, textStatus, jqXHR) {
		                	$("#cash-drawers-details_setting").load("setting-cash-drawer-list");
		                	settingChangeInputs();
		                    toastr.success('Cash Drawer Deleted');
		                },
		                error: function(jqXHR, textStatus, errorThrown) {
		                    toastr.error('not deleted');
		                }
		            });

		        }
		    }
		}*/
		
			traditional : true,
			url : "add-news-cashup-drawer",
			data : {
			},

			success : function(data, textStatus, jqXHR) {
				$("#cashup-add-popup").html(data);
				setTimeout(function(){ $("#purchaseBeverageName").focus(); }, focusTimeOutOnPopUp);
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        },
		});
	}
