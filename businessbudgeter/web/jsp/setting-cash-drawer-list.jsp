<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

 $(function() {
 	$("#cash-drawer-list-details").load("setting-cash-drawer-list-result");
	 $('#cash-drawer-search-string').keypress(function(e) {
		if(e.which != 13) { 
			cash_drawer_search_by_name();
		}
	}); 
 });
 
 </script> 

<div id ="settings_staff_popup">
</div>

<div style="display: inline-block; vertical-align: top;">
	<h5>
        <a href="javascript:void(0)" class="add-button" onclick="addNewSettingsCashDrawer()" title="Add">Add</a> 
		<a href="javascript:void(0)" class="delete-button" onClick="deleteSettingsCashDrawer()" title="Delete">Delete</a><br>
		<input type="text" id="cash-drawer-search-string" name="cash-drawer-search-string" size="15" style="width: 105px; "/>
        &nbsp;&nbsp;<a href="javascript:void(0)" onclick="cash_drawer_search_by_name()">
        search
        </a>
	</h5>
</div>	

<div id="cash-drawer-list-details" > 
  
</div>
