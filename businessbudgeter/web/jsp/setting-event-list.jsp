<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

 $(function() {
 	$("#event-list-details").load("setting-event-list-result");
	 $('#event-search-string').keypress(function(e) {
		if(e.which != 13) { 
			event_search_by_name();
		}
	}); 
 });
 
 </script> 

<div id ="settings_staff_popup">
</div>

<div style="display: inline-block; vertical-align: top; margin-bottom:10px">
	<h5>
        <span style="float:left"><a href="javascript:void(0)" class="add-new-button btn btn-success"  onclick="addNewSettingsEvent()" data-toggle="modal" data-target="#event-add-popup" title="Add"><i class="fa fa-plus" style="padding:0 5px 0 0"></i>Add</a></span> 
		<span style="float:left"><a href="javascript:void(0)" class="delete-button btn btn-danger" onClick="deleteSettingsEvent()" title="Delete"><i class="fa fa-minus" style="padding:0 5px 0 5px"></i>Delete</a></span>
		<span style="float:left"><input type="text" class="form-control" id="event-search-string" name="event-search-string" size="15" style="width: 105px; "/></span>
        <span style="float:left"><a href="javascript:void(0)" onclick="event_search_by_name()"><i class="fa fa-search" style="padding:10px 0 0 10px"></i></a></span>
	</h5>
</div>	

<div id="event-list-details" > 
  
</div>


