<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"/>
<link type="text/css" href="bootstrap/Fonts/glyphicons/css/glyphicons.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/Fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/Fonts/themify-icons/themify-icons.css" rel="stylesheet"><!-- Themify Icons -->

<script type="text/javascript">
        $(function() {
            $("#profitlossreport").focus();
        });    
        
 </script>
 <div class="container">

<div id ="all-reports-list">
	<div>
		<h5>
	        <div class="col-md-4"><a href="javascript:void(0)"  onclick="profitlossreportaction()" title="Profit And Loss Report" id="profitlossreport"> <button class="btn btn-success" style="width:180px; height:120px; margin-bottom:20px"><i class="fa fa-line-chart" style="font-size:30px; padding-bottom:10px"></i><br> Profit & Loss Report</button></a></div>
			<div class="col-md-4"><a href="javascript:void(0)" style="color:#fff" onClick="wagesreportaction()" title="Wages Report" id="wagesreport"><button class="btn btn-success" style="width:180px; height:120px; margin-bottom:20px"><i class="fa fa-th-list" style="font-size:30px; padding-bottom:10px"></i><br> Wages Report</button></a></div>
			<div class="col-md-4"><a href="javascript:void(0)" style="color:#fff"  onClick="totalreportaction()" title="Totals Report" id="totalreport"><button class="btn btn-success" style="width:180px; height:120px; margin-bottom:20px"><i class="fa fa-cubes" style="font-size:30px; padding-bottom:10px"></i><br> Totals Report</button></a></div>
			<div class="col-md-4"><a href="javascript:void(0)" style="color:#fff" onClick="tipreportaction()" title="Tips Report" id="tipreport"><button class="btn btn-success" style="width:180px; height:120px; margin-bottom:20px"><i class="fa fa-newspaper-o" style="font-size:30px; padding-bottom:10px"></i><br> Tips Report</button></a></div>
			<div class="col-md-4"> <a href="javascript:void(0)" style="color:#fff"  onClick="payslipreportaction()" title="Generate PaySlips" id="payslipreport"><button class="btn btn-success" style="width:180px; height:120px; margin-bottom:20px"><i class="fa fa-paste" style="font-size:30px; padding-bottom:10px"></i><br>Generate PaySlips</button></a></div>
		</h5>
 </div>	
 </div>
</div>
