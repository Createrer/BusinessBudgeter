function minuteToHHMMSS(minute) {
	var seconds = minute * 60;
	var date = new Date(seconds * 1000);
	var hh = date.getUTCHours();
	var mm = date.getUTCMinutes();
	var ss = date.getSeconds();
	// If you were building a timestamp instead of a duration, you would
	// uncomment the following line to get 12-hour (not 24) time
	// if (hh > 12) {hh = hh % 12;}
	// These lines ensure you have two-digits
	if (hh < 10) {
		hh = "0" + hh;
	}
	if (mm < 10) {
		mm = "0" + mm;
	}
	if (ss < 10) {
		ss = "0" + ss;
	}

	var t = hh + ":" + mm;// + ":" + ss;

	return t;
}

$(function() {

	var startTime;
	var endTime;

	$("#slider-range").slider({ range : true, min : 0, max : 1440, values : [ 540, 1020 ], step : 15, slide : slideTime, change : checkMax });

	$('#startTimeDefault,#finishTimeDefault').change(function() {
		var start_time = $('#startTimeDefault').val();
		var end_time = $('#finishTimeDefault').val();

		if (start_time.length > 0 && end_time.length > 0) {

			var start = start_time.split(':');
			var finish = end_time.split(':');
			var minsdiff = parseInt(finish[0], 10) * 60 + parseInt(finish[1], 10) - parseInt(start[0], 10) * 60 - parseInt(start[1], 10);
			var result = String(100 + Math.floor(minsdiff / 60)).substr(1) + ':' + String(100 + minsdiff % 60).substr(1);
			$('#totalHours').val(result);

			startTime = $('#startTimeDefault').val();
			arr = startTime.split(':');
			startHour = parseInt(arr[0]);
			startMin = parseInt(arr[1]);

			endTime = $('#finishTimeDefault').val();
			arr = endTime.split(':');
			endHour = parseInt(arr[0]);
			endMin = parseInt(arr[1]);

			if (startMin != 0 && endMin != 0) {

				$("#slider-range").slider({ range : true, min : 0, max : 1440, values : [ (startHour + 0.5) * 60, (endHour + 0.5) * 60 ], step : 15, slide : slideTime, change : checkMax });

				StartTime = getTime(startHour, startMin);
				EndTime = getTime(endHour, endMin);
				$("#time").text(StartTime + ' - ' + EndTime);

			} else if (startMin != 0 && endMin == 0) {

				$("#slider-range").slider({ range : true, min : 0, max : 1440, values : [ (startHour + 0.5) * 60, endHour * 60 ], step : 15, slide : slideTime, change : checkMax

				});

				StartTime = getTime(startHour, startMin);
				EndTime = getTime(endHour, endMin);
				$("#time").text(StartTime + ' - ' + EndTime);

			} else if (startMin == 0 && endMin != 0) {

				$("#slider-range").slider({ range : true, min : 0, max : 1440, values : [ startHour * 60, (endHour + 0.5) * 60 ], step : 15, slide : slideTime, change : checkMax });

				StartTime = getTime(startHour, startMin);
				EndTime = getTime(endHour, endMin);
				$("#time").text(StartTime + ' - ' + EndTime);

			} else

				$("#slider-range").slider({ range : true, min : 0, max : 1440, values : [ startHour * 60, endHour * 60 ], step : 15, slide : slideTime, change : checkMax });

			StartTime = getTime(startHour, startMin);
			EndTime = getTime(endHour, endMin);
			$("#time").text(StartTime + ' - ' + EndTime);
		}
	});

	$('#finishTimeDefault').timepicker({ timeFormat : 'H:i' });
	$('#startTimeDefault').timepicker({ timeFormat : 'H:i' });
	$('#startTime').timepicker({ timeFormat : 'H:i' });

	$("#ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
	$("#ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
	$(".AddStaffTable tr:nth-child(odd)").css("background", "#ffffff");
	$(".AddStaffTable tr:nth-child(even)").css("background", "#f8f8f8");

	$("#ulBGColor").css("background-color", "black");
	$("#tabs-2").hide();
	$("#tabs").tabs();
	collpsible: true;
	
	$("#timelineTab").click(function() {
		$("#tabs-2").hide();
		$("#tabs-1").show();
	});
	
	$("#shiftTab").click(function() {
		$("#tabs-1").hide();
		$("#tabs-2").show();
	});

	$(".ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
	$(".ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
	$(".AddStaffTable tr:nth-child(odd)").css("background", "#ffffff");
	$(".AddStaffTable tr:nth-child(even)").css("background", "#f8f8f8");

	$('.accordion-manual-header').click(function() {
		$(this).next().slideToggle();
		if ($(this).hasClass('active')) {
			$('.accordion-manual-header').removeClass('active');
		} else {
			$(this).addClass('active');
		}
	});

});

$(document).ready(function() {

	$('#isPublicHoliday').change(function() {
		if ($(this).attr('checked')) {
			$(this).val('true');
		} else {
			$(this).val('false');
		}
	});

	if (workofhouse != "") {
		$("#workofhouse").val("${param.workofhouse}");
	}

	$('#roster-event-popup').hide();

	$(".resizediv").resizable({ maxWidth : 413, containment : 'parent', handles : 'w, e',
	// grid: [10,10]

	});
	$(".resizediv").draggable({ containment : 'parent', handles : 'w, e',
	// grid: [10,10]

	});

	$("#slider-range").draggable({ containment : 'parent', handles : 'w, e',
	// grid: [10,10]

	});
	$("#staffName1").draggable({ containment : 'parent', handles : 'w, e',
	// grid: [10,10]

	});
	var currentDate = $("#rosterDate").val();
	$(".myDate").datepicker({ dateFormat : 'dd/mm/yy' });
	$('.myDate').datepicker().datepicker("setDate", currentDate);
	$('#rosterDate').datepicker("option", "onSelect", function() {
		handleChangeInputsRoster();
	});

	$(".nextDate").click(function() {
		var date = $('.myDate').datepicker('getDate');
		date.setTime(date.getTime() + (24 * 60 * 60 * 1000));
		$('.myDate').datepicker("setDate", date);
		handleChangeInputsRoster();
	});

	$(".prevDate").click(function() {
		var date = $('.myDate').datepicker('getDate');
		date.setTime(date.getTime() - (24 * 60 * 60 * 1000));
		$('.myDate').datepicker("setDate", date);
		handleChangeInputsRoster();
	});
	
	if (incomeCenterId != "")
		$("#incomeCenterId").val("${param.incomeCenterId}");

	$("#disableUS").click(function() {
		$("#country option[value='United State']").attr("disabled", true);
	});

	var test = true;
	shortcut.add("alt+n", function() {
		if (test) {
			$("#slidecontent").animate({ left : '0px' }, { queue : false, duration : 500 });
			window.location.hash = '#nav-cashup';
			$("#clickme").html('<img src="images/prev.png" class="imgArrow">');
		} else {
			$("#slidecontent").animate({ left : '-70px' }, { queue : false, duration : 500 });
			$("#clickme").html('<img src="images/next.png" class="imgArrow">');
		}
		test = !test;
	});
	$("#clickme").click(function() {
		if (test) {
			$("#slidecontent").animate({ left : '0px' }, { queue : false, duration : 500 });
			$("#clickme").html('<img src="images/prev.png" class="imgArrow">');
		} else {
			$("#slidecontent").animate({ left : '-70px' }, { queue : false, duration : 500 });
			$("#clickme").html('<img src="images/next.png" class="imgArrow">');
		}
		test = !test;
	});

	$('.startTime').timepicker({ timeFormat : 'H:i' }); // timeFormat: 'hh:mm:ss
	// tt z'
	$('.finishTime').timepicker({ timeFormat : 'H:i' });

	$('.startTime').change(function() {
		var indexOne = $(this).attr("indexOne");
		var indexTwo = $(this).attr("indexTwo");
		var satffRosterId = $(this).attr("satffRosterId");

		var start_time = $(this).val();
		var end_time = $('#finishTime' + satffRosterId).val();
		if (start_time.length > 0 && end_time.length > 0) {
			mints = moment.duration(end_time, 'HH:mm:ss').asMinutes() - moment.duration(start_time, 'HH:mm:ss').asMinutes();
			hours = moment.duration(mints, 'HH:mm:ss').asHours();
			$('#totalHours' + satffRosterId).val(Math.abs(mints / 60));
		}
	});

	$('.finishTime').change(function() {
		var indexOne = $(this).attr("indexOne");
		var indexTwo = $(this).attr("indexTwo");
		var satffRosterId = $(this).attr("satffRosterId");

		var start_time = $('#startTime' + satffRosterId).val();
		var end_time = $(this).val();
		if (start_time.length > 0 && end_time.length > 0) {
			mints = moment.duration(end_time, 'HH:mm:ss').asMinutes() - moment.duration(start_time, 'HH:mm:ss').asMinutes();
			hours = moment.duration(mints, 'HH:mm:ss').asHours();
			$('#totalHours' + satffRosterId).val(Math.abs(mints / 60));
		}
	});

	/*shortcut.add("ctrl+alt+n", function() {
		addRosterShift();
	});*/

	noBack();
	blank();
});

function slideTime(event, ui) {
	var val0 = $("#slider-range").slider("values", 0);
	val1 = $("#slider-range").slider("values", 1);
	minutes0 = parseInt(val0 % 60, 10);
	hours0 = parseInt(val0 / 60 % 24, 10);
	minutes1 = parseInt(val1 % 60, 10);
	hours1 = parseInt(val1 / 60 % 24, 10);
	startTime = getTime(hours0, minutes0);
	endTime = getTime(hours1, minutes1);
	$("#time").text(startTime + ' - ' + endTime);
}

function allocateShiftRoster() {
	var rosterid = $("#rosterId").attr("rosterId");
	allocateRosterShift(rosterid, "", "");
}

function setHoliday() {
	$('#isPublicHoliday').change(function() {
		if ($(this).attr('checked')) {
			setPublicHoliday();
		} else {
			resetPublicHoliday();
		}
	});
}

function setPublicHoliday() {
	$.ajax({ traditional : true, url : "set-public-holiday", type : "GET", data : {

	}, success : function(data, textStatus, jqXHR) {
	}, error : function(jqXHR, textStatus, errorThrown) {
	// if fails
	} });
}

function resetPublicHoliday() {
	$.ajax({ traditional : true, url : "reset-public-holiday", type : "GET", data : {

	}, success : function(data, textStatus, jqXHR) {
	}, error : function(jqXHR, textStatus, errorThrown) {
	// if fails
	} });
}

function saveChanges() {
	var data = [];
	var size = 0;
	$(".satffRosterId").each(function() {
		size++;
		var satffRosterId = $(this).val();
		var startTime = $("#startTime" + satffRosterId).val();
		var finishTime = $("#finishTime" + satffRosterId).val();
		var totalHours = $("#totalHours" + satffRosterId).val();

		var object = { satffRosterId : satffRosterId, startTime : startTime, finishTime : finishTime, totalHours : totalHours };
		data.push(object);
	});

	var services = [];
	$(".staffRosterServiceId").each(function() {
		var staffRosterServiceId = $(this).attr("staffRosterServiceId");
		var value = $(this).val();
		services.push({ staffRosterServiceId : staffRosterServiceId, value : value });
	});

	var events = [];
	$(".staffRosterEventId").each(function() {
		var value = $(this).val();
		var satffRosterEventId = $(this).attr("satffRosterEventId");
		events.push({ staffRosterEventId : satffRosterEventId, value : value });
	});

	$.ajax({ traditional : true, url : "roster-update-services?size=" + size, type : "POST", dataType : "json", contentType : 'application/json; charset=utf-8', data : JSON.stringify(services),
		success : function(data, textStatus, jqXHR) {}, error : function(jqXHR, textStatus, errorThrown) {} });

	$.ajax({ traditional : true, url : "roster-update-events?size=" + size, type : "POST", dataType : "json", contentType : 'application/json; charset=utf-8', data : JSON.stringify(events),
		success : function(data, textStatus, jqXHR) {}, error : function(jqXHR, textStatus, errorThrown) {} });

	$.ajax({ traditional : true, url : "roster?size=" + size, type : "POST", dataType : "json", contentType : 'application/json; charset=utf-8', data : JSON.stringify(data),
		success : function(data, textStatus, jqXHR) {
			handleChangeInputs();
		}, error : function(jqXHR, textStatus, errorThrown) {} });
}

function getTime(hours, minutes) {
	minutes = minutes + "";
	if (minutes.length == 1) {
		minutes = "0" + minutes;
	}
	return hours + ":" + minutes;
}

function checkMax() {
	var startedTime = $('#startTimeDefault').val(startTime);
	console.log(startedTime);
	var finishedTime = $('#finishTimeDefault').val(endTime);
	console.log(finishedTime);
}

function rosterAlert(Start_Time, End_Time) {
	var start_time = Start_Time;
	var end_time = End_Time;

	var startMin;
	var endMin;

	if (start_time.length > 0 && end_time.length > 0) {
		var start = start_time.split(':');
		var finish = end_time.split(':');
		var minsdiff = parseInt(finish[0], 10) * 60 + parseInt(finish[1], 10) - parseInt(start[0], 10) * 60 - parseInt(start[1], 10);
		var result = String(100 + Math.floor(minsdiff / 60)).substr(1) + ':' + String(100 + minsdiff % 60).substr(1);
		$('#totalHours').val(result);

		startTime = start_time;
		arr = startTime.split(':');
		startHour = parseInt(arr[0]);
		startMin = parseInt(arr[1]);
		endTime = end_time;
		arr = endTime.split(':');
		endHour = parseInt(arr[0]);
		endMin = parseInt(arr[1]);

		if (startMin != 0 && endMin != 0) {
			$("#slider-range").slider({ range : true, min : 0, max : 1440, values : [ (startHour + 0.5) * 60, (endHour + 0.5) * 60 ], step : 15, slide : slideTime, change : checkMax

			});
			$("#staffName1").slider({ range : true, min : 0, max : 1440, values : [ (startHour + 0.5) * 60, (endHour + 0.5) * 60 ], step : 15, slide : slideTime, change : checkMax

			});
			StartTime = getTime(startHour, startMin);
			EndTime = getTime(endHour, endMin);
			$("#time").text(StartTime + ' - ' + EndTime);
		} else if (startMin != 0 && endMin == 0) {
			$("#slider-range").slider({ range : true, min : 0, max : 1440, values : [ (startHour + 0.5) * 60, endHour * 60 ], step : 15, slide : slideTime, change : checkMax

			});
			$("#staffName1").slider({ range : true, min : 0, max : 1440, values : [ (startHour + 0.5) * 60, endHour * 60 ], step : 15, slide : slideTime, change : checkMax

			});
			StartTime = getTime(startHour, startMin);
			EndTime = getTime(endHour, endMin);
			$("#time").text(StartTime + ' - ' + EndTime);
		} else if (startMin == 0 && endMin != 0) {
			$("#slider-range").slider({ range : true, min : 0, max : 1440, values : [ startHour * 60, (endHour + 0.5) * 60 ], step : 15, slide : slideTime, change : checkMax

			});
			$("#staffName1").slider({ range : true, min : 0, max : 1440, values : [ startHour * 60, (endHour + 0.5) * 60 ], step : 15, slide : slideTime, change : checkMax

			});
			StartTime = getTime(startHour, startMin);
			EndTime = getTime(endHour, endMin);
			$("#time").text(StartTime + ' - ' + EndTime);
		}
		$("#slider-range").slider({ range : true, min : 0, max : 1440, values : [ startHour * 60, endHour * 60 ], step : 15, slide : slideTime, change : checkMax

		});
		$("#staffName1").slider({ range : true, min : 0, max : 1440, values : [ startHour * 60, endHour * 60 ], step : 15, slide : slideTime, change : checkMax

		});
		StartTime = getTime(startHour, startMin);
		EndTime = getTime(endHour, endMin);
		$("#time").text(StartTime + ' - ' + EndTime);
	}
}

var countServiceEvent = 3;
function AddServiceEvent() {
	countServiceEvent++;
	$('#ServiceEevnt tbody').append(
			"<tr>" + "<td>Service/Event Name " + countServiceEvent + "</td>" + "<td align='center'><input type='text' class='input' /></td>" + "<td align='center'><input type='text' class='input' /></td>"
					+ "</tr>");
	$("#ServiceEevnt tr:nth-child(odd)").css("background", "#ffffff");
	$("#ServiceEevnt tr:nth-child(even)").css("background", "#f8f8f8");
}

var countAddstaff = 2;
function Addstaff() {
	countAddstaff++;
	$('.Addstaff').append(
			"<table class='AddStaffTable' width='100%' bgcolor='#e0e0e0' border='0' style='margin:5px 0 0 0' cellspacing='1' cellpadding='5'>" + "<thead>"
					+ "<tr><th colspan='5' valign='middle' class='thclass' style='padding:2px 5px 0 5px'>Staff " + countAddstaff
					+ " Name <div class='AddIcon'><img src='images/plus-grey.png'  onClick='Addstaff();' style='cursor:pointer' /></div></th></tr>" + "</thead>" + "<tbody>" + "<tr>"
					+ "<td align='center'><input type='text' class='input' style='text-align:left' value='Start' /></td>"
					+ "<td align='center'><input type='text' class='input' style='text-align:left' value='Finish' /></td>"
					+ "<td align='center'><input type='text' class='input' style='text-align:left' value='Hours' /></td>" + "<td align='left'>Event or Service</td>"
					+ "<td align='center'><input type='text' class='input' style='text-align:left value='Income' /></td>" + "</tr>" + "<tr>"
					+ "<td align='center'><input type='text' class='input' style='text-align:left' value='' /></td>"
					+ "<td align='center'><input type='text' class='input' style='text-align:left' value='' /></td>" + "<td align='center'><input type='text' class='input' /></td>"
					+ "<td align='left'>Event</td>" + "<td align='center'><input type='text' class='input' style='text-align:left' value='Hours' /></td>" + "</tr>" + "</tbody>" + "</table>");
	$(".AddStaffTable tr:nth-child(odd)").css("background", "#ffffff");
	$(".AddStaffTable tr:nth-child(even)").css("background", "#f8f8f8");
}

var d = new Date();
var weekday = new Array(7);
weekday[0] = "Sunday";
weekday[1] = "Monday";
weekday[2] = "Tuesday";
weekday[3] = "Wednesday";
weekday[4] = "Thursday";
weekday[5] = "Friday";
weekday[6] = "Saturday";

var n = weekday[d.getDay()];

var incomeCenterId = "${param.incomeCenterId}";
var workofhouse = "${param.workofhouse}";
var isPublicHoliday = "${param.isPublicHoliday}";

function handleChangeInputsRoster() {
	if ($("#rosterDate").val().length == 0) {
		$("#rosterDate").css("border-color","red");
		alert("Please Select Roster Date");
		$("#rosterDate").focus();
		return false;
	}else{
		$("#rosterDate").css("border-color","");
		window.location = "roster?rosterDate=" + $("#rosterDate").val() + "&incomeCenterId=" + $("#incomeCenterId").val() + "&workofhouse=" + $("#workofhouse").val();
		return true;
	}
	
	/*if ($("#rosterDate").val().length == 0) {
		alert("Please Select Roster Date");
		$("#rosterDate").focus();
		return false;
	} else {
		window.location = "roster?rosterDate=" + $("#rosterDate").val() + "&incomeCenterId=" + $("#incomeCenterId").val() + "&workofhouse=" + $("#workofhouse").val();
	}
	return true;*/
	// +"&tab="+selectedTab
}

function blank() {
	var Start_Time = $('#startTimeDefault').val("09 : 00 ");

	var End_Time = $('#finishTimeDefault').val("17 : 00 ");
	rosterAlert(Start_Time, End_Time);
}

function createTimeLineForStaff(startTimeString, endTimeString, satffRosterId){

	var unitTimeSlot = 30;
	var step = 4;
	var defaultValuesMax = 16;
	
	if(startTimeString.length == 8){
		startTimeString = startTimeString.substr(0, startTimeString.length - 3);
	}
	if(endTimeString.length == 8){
		endTimeString = endTimeString.substr(0, endTimeString.length - 3);
	}
	
	var start = startTimeString.split(':');
	console.log("start[0] = "+start[0]);
	console.log("start[1] = "+start[1]);
	
	var startmin = (parseInt(start[0]) * 60) + (parseInt(start[1]));
	  
	var end = endTimeString.split(':');
	var end0 = parseInt(end[0]);
	//if(end0 > 12)
		//end0 += 12;
	var endmin = (end0 * 60) + (parseInt(end[1]));
	
	var startPoint = (startmin/unitTimeSlot)*4;
	var endPoint =  (endmin/unitTimeSlot)*4;
	
	console.log("startTimeString = "+startTimeString+" endTimeString = "+endTimeString+" start min = "+startmin+ " end min = "+endmin+ " startPoint = "+startPoint+" endPoint = "+endPoint);
	
	
	 $("#slider"+satffRosterId).rangeSlider({
		arrows:false,
		valueLabels: "hide",
		bounds: {min: 0, max: (24*2*4 - 4)},
		defaultValues:{min: 00, max: defaultValuesMax},
		step: step
	}).bind("valuesChanging", function(e, data){
		console.log("Values Changing. min: " + data.values.min + " max: " + data.values.max);
		var starttime = (data.values.min/step) * unitTimeSlot;
		  var endtime = data.values.max * (unitTimeSlot/step);
		  var startTimeHHMMSS = minuteToHHMMSS(starttime);
		  var endTimeHHMMSS = minuteToHHMMSS(endtime);
			
			$("#timelineStart"+satffRosterId).html(startTimeHHMMSS);
			$("#timelineEnd"+satffRosterId).html(endTimeHHMMSS);
			
	}).bind("valuesChanged", function(e, data){
		
		  console.log("Values just changed. min: " + data.values.min + " max: " + data.values.max);
		  var starttime = (data.values.min/step) * unitTimeSlot;
		  var endtime = data.values.max * (unitTimeSlot/step);
		  console.log(" starttime : " + starttime +" min" + " endtime : " + endtime+ " min");
		  
		  //$("#slider${shift.satffRosterId}").rangeSlider("values", 20, 100);
		    
		var startTimeHHMMSS = minuteToHHMMSS(starttime);
		console.log("start Time textbox"+startTimeHHMMSS);
		$("#startTime"+satffRosterId).val(startTimeHHMMSS);
		
		var endTimeHHMMSS = minuteToHHMMSS(endtime);
		console.log("end Time textbox"+endTimeHHMMSS);
		$("#finishTime"+satffRosterId).val(endTimeHHMMSS);
		
		var start_time = $("#startTime"+satffRosterId).val();
		var finish_time = $("#finishTime"+satffRosterId).val();
		var start;
		var finish;
		var minsdiff;
		if(start_time.length > 0 && finish_time.length > 0){
			  start=start_time.split(':');
			  finish=finish_time.split(':');
			  minsdiff=parseInt(finish[0],10)*60+parseInt(finish[1],10)-parseInt(start[0],10)*60-parseInt(start[1],10);
			  var result = String(100+Math.floor(minsdiff/60)).substr(1)+':'+String(100+minsdiff%60).substr(1);
			  $("#totalHours"+satffRosterId).val(result);
		}
		
		var element = $("#slider"+satffRosterId).first().children('.ui-rangeSlider-leftLabel');//children().find('.ui-rangeSlider-rightLabel');
		element = element.first().children('.ui-rangeSlider-label-value');
		element.html(startTimeHHMMSS);
		
		var element = $("#slider"+satffRosterId).first().children('.ui-rangeSlider-rightLabel');//children().find('.ui-rangeSlider-rightLabel');
		element = element.first().children('.ui-rangeSlider-label-value');
		element.html(endTimeHHMMSS);
		
		$("#timelineStart"+satffRosterId).html(startTimeHHMMSS);
		$("#timelineEnd"+satffRosterId).html(endTimeHHMMSS);
		
		updateRosterShiftTimeline(satffRosterId, startTimeHHMMSS, endTimeHHMMSS);
		
	});
	
	$("#slider"+satffRosterId).rangeSlider("values", startPoint, endPoint);
	
	$("#slider"+satffRosterId).slider("refresh");
	
}

function updateRosterShiftTimeline(satffRosterId, startTimeHHMMSS, endTimeHHMMSS){
	var postData = "staffRosterId="+satffRosterId+"&startTime="+startTimeHHMMSS+"&endTime="+endTimeHHMMSS+"&totalHours=1.0";
	 $.ajax({
     url: "update-roster-shift-timeline", //mapped in cotroller to add data in new window
     type: "POST",
     data: postData,
     success: function(data, textStatus, jqXHR) {
     	toastr.success('Changes Saved');
     	handleChangeInputsRoster();
     },
     error: function(jqXHR, textStatus, errorThrown) {
     	toastr.error('Unable to save chnages.');
     }
	 });
}