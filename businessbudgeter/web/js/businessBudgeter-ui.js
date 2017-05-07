
function selectAllServices(index) {
	
	var cb1 = $("#selectallServices"+index).is(':checked');
	if (cb1) {
		$("#service_setting"+index).find('.serviceCheck').prop(
				"checked", true);
	} else {
		$("#service_setting"+index).find('.serviceCheck').prop(
				"checked", false);
	}
}

function selectAllStaff() {
	var cb1 = $("#selectallStaff").is(':checked');
	if (cb1) {
		$("#staff_setting").find('input[type=checkbox]').prop(
				"checked", true);
	} else {
		$("#staff_setting").find('input[type=checkbox]').prop(
				"checked", false);
	}
}

function selectAllEvent() {
	var cb1 = $("#selectallEventList").is(':checked');
	if (cb1) {
		$("#all_event_setting").find('input[type=checkbox]').prop(
				"checked", true);
	} else {
		$("#all_event_setting").find('input[type=checkbox]').prop(
				"checked", false);
	}
}

function selectAllCashDrawers(index) {
	var cb1 = $("#selectallCashDrawers"+index).is(':checked');
	if (cb1) {
		$("#cashDrawer_setting"+index).find('.drawerCheck').prop(
				"checked", true);
	} else {
		$("#cashDrawer_setting"+index).find('.drawerCheck').prop(
				"checked", false);
	}
}

function selectAllUser() {
	var cb1 = $("#selectallUser").is(':checked');
	if (cb1) {
		$("#user_setting").find('input[type=checkbox]').prop(
				"checked", true);
	} else {
		$("#user_setting").find('input[type=checkbox]').prop(
				"checked", false);
	}
}

function selectAllIncomeCenter(){
	var cb1 = $("#selectallIncomeCenter").is(':checked');
	if (cb1) {
		$("#income_center_setting").find('input[type=checkbox]').prop(
				"checked", true);
	} else {
		$("#income_center_setting").find('input[type=checkbox]').prop(
				"checked", false);
	}
	
}

