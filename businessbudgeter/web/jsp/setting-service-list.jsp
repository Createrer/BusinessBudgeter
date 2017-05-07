<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

 $(function() {
 	$("#service-list-details").load("setting-service-list-result");
	 $('#service-search-string').keypress(function(e) {
		if(e.which != 13) { 
			service_search_by_name();
		}
	}); 
 });
 
 </script> 

<div id ="settings_staff_popup">
</div>

<div style="display: inline-block; vertical-align: top;">
	<h5>
        <a href="javascript:void(0)" class="add-button" onclick="addNewSettingsService()" title="Add">Add</a> 
		<a href="javascript:void(0)" class="delete-button" onClick="deleteSettingsService()" title="Delete">Delete</a><br>
		<input type="text" id="service-search-string" name="service-search-string" size="15" style="width: 105px; "/>
        &nbsp;&nbsp;<a href="javascript:void(0)" onclick="service_search_by_name()">
        search
        </a>
	</h5>
</div>	

<div id="service-list-details" > 
  
</div>
