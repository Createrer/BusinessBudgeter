<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"/>
<link type="text/css" href="bootstrap/Fonts/glyphicons/css/glyphicons.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/Fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" href="bootstrap/css/Fonts/themify-icons/themify-icons.css" rel="stylesheet"><!-- Themify Icons -->
<link href="css/fonts.css" rel="stylesheet" media="screen"/>
<link rel="stylesheet" href="css/style.css" media="screen" />

<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/respond.src.js"></script>
<script src="js/html5shiv.js"></script>
<script type="text/javascript" src="js/shortcut.js"></script>

<script type="text/javascript">
        $(function() {
            $("#cashupbtn").focus();
        });    
 </script>

<!--[if gte IE 9]>
  <style type="text/css">
    .content_container {
       filter: none;
    }
  </style>
<![endif]-->
</head>
<body  onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">

	<%@include file="common/header.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4" style="margin-top:100px">
				<div class="img_box" >
			        <div class="img_box_strip">
			        <div class="title">Cash Up</div>
			        </div>
			        <div class="icons"><a href="cashup-cash" id="cashupbtn" title="Select Cash Up page" ><img src="images/img_1.png" /></a></div>
			        </div>
			</div><!-- col-md-4 -->
			
			<div class="col-md-4" style="margin-top:100px">
				<div class="img_box" >
			        <div class="img_box_strip">
			        <div class="title">Roster</div>
			        </div>
			        <div class="icons"><a href="roster" title="Select Roster Page" ><img src="images/img_2.png" /></a></div>
			     </div>
			</div><!-- col-md-4 -->
			
			<div class="col-md-4" style="margin-top:100px">
				<div class="img_box">
		        <div class="img_box_strip">
		        <div class="title">Report</div>
		        </div>
		        <div class="icons"><a href="reports" title="Select the Reports" ><img src="images/img_3.png" /></a></div>
		        </div>
			</div><!-- col-md-4 -->
			
			<div class="col-md-4" style="margin-top:50px">
				<div class="img_box">
			        <div class="img_box_strip">
			        <div class="title">Settings</div>
			        </div>
			        <div class="icons"><a href="setting" title="Select Setting Section (Income center & Staff mangement)" ><img src="images/img_4.png" /></a></div>
			      </div>
			</div><!-- col-md-4 -->
			
			<div class="col-md-4" style="margin-top:50px; margin-bottom:50px;">
				<div class="img_box">
			        <div class="img_box_strip">
			        <div class="title">Event</div>
			        </div>
			        <div class="icons"><a href="events" title="Select the Manage Event, here we can view all events and can manage" ><img src="images/image-event.png"/></a></div>
			     </div>
			</div><!-- col-md-4 -->
			
			
			
		</div><!-- row -->
	</div><!-- container -->


<footer class="footer">

</footer>
</body>
</html>
