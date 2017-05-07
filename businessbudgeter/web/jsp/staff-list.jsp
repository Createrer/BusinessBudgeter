<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
    #abc
    {
   color: #4c4c4c;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 16pt;
    }
</style>
<script type="text/javascript">

 $(function() {
	 $('#staff-search-string').focus();
 	$("#staff-list-details").load("staff-list-result");
	 $('#staff-search-string').keyup(function(e) {
		if(e.which != 13) { 
			staff_search_by_name();
		}
		
	}); 
 });
 
 </script> 

<div id ="settings_staff_popup">
</div>

<div style="display: inline-block; vertical-align: top;">
	<h5 >
        <a id="abc" href="javascript:void(0)" class="btn btn-success" onclick="addNewSettingsStaff()" data-target="#setting-add-popup" data-toggle="modal" title="Add" style="color:#fff;"><i class="fa fa-plus" style="padding-right:5px"></i>Add</a> 
		<a id="abc" href="javascript:void(0)" class="btn btn-danger" onClick="deleteSettingsStaff()" title="Delete" style="color:#fff; "><i class="fa fa-minus" style="padding-right:5px"></i>Delete</a>
		<div style="margin:10px 0 0 0">
		<span style="float:left"><input type="text" class="form-control" id="staff-search-string" name="staff-search-string" size="15" style="width: 200px; margin-right:10px"/></span>
        <span style="float:left"><a id="abc" href="javascript:void(0)" onclick="staff_search_by_name()"><i class="fa fa-search" style="padding:9px; border:1px solid #ccc; border-radius:4px"></i></a></span>
        </div>
	</h5>
	
</div>	

<div id="staff-list-details" > 
  
</div>
