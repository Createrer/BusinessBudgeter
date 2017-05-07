<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">


  $(function() {
 	$("#user-list-details").load("user-list-result");
	 $('#user-search-string').keypress(function(e) {
		if(e.which != 13) { 
		
			user_search_by_name();
			
		}
	}); 
 });
  
 </script> 

<div id ="settings_user_popup">
</div>

<div style="display: inline-block; vertical-align: top;">
	<h5>
        <a href="javascript:void(0)" class="add-button" onclick="addNewSettingsUser()" title="Add">Add</a> 
		<a href="javascript:void(0)" class="delete-button" onClick="deleteSettingsUser()" title="Delete">Delete</a><br>
		<input type="text" id="user-search-string" name="user-search-string" size="15" style="width: 105px; " onclick="user_search_by_name()"/>
        &nbsp;&nbsp;<a href="javascript:void(0)" onclick="user_search_by_name()">
        search
        </a>
	</h5>
</div>	

<div id="user-list-details" > 
  
</div>
