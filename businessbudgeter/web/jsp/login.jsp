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
<%@ include file="/jsp/common/taglib.jsp"%> 

<script type="text/javascript">
        $(function() {
            $("#j_username").focus();
        });    
        
 </script>

  <style type="text/css">
    input:-webkit-autofill {
    border:0px !important;
    -webkit-box-shadow: 0 0 0px 1000px #fdfdfd inset;
    
	}
  </style>

</head>
<body>
<div id="header-wrap">
	<header class="header" id="Header">
			<div><img src="images/bb-logo.png" alt="Business Budgeter" width="300" height="29" title="Business Budgeter"/></div>
	</header>
</div>
	 <div class="wrapper" style="width:93%;">
<div class="mainwrapper">
		 <div class="login_container">
        	<div class="signinTitle">Sign In</div>
            <div>Sign in using your registered account:</div>
            <form action="${pageContext.request.contextPath}/j_spring_security_check" method="post" id="loginform">
	          	<c:forEach items="${errors}" var="error">
	          		<table>
						<tr><td colspan="2" style="color:#dd0000">${error}</td></tr>
					</table>				
					</c:forEach>
	            <div class="username"><input type="text" name="username"  value="prashant" placeholder="Username" /></div>
	            <div class="password"><input type="password" name="password" value="admin" placeholder="Password" /></div>
	            <!-- <div class="keepmesignin"><input name="" type="checkbox" value=""> <b>Keep me signed in</b> <button class="button">Sign In</button></div>
	            <div class="signup">Don't have an account? <a href="javascript:void(0)">Sign Up</a> <br/> Remind <a href="javascript:void(0)">Reset Password </a> </div> -->
	            <div class="signin"><input type="submit" value="SignUp"/></div>
	            <div class="reset">
	            	<!-- <input type="hidden" name="userid" id="userid" value="${userObject.UserId}"> -->
	            	<!-- <a href=""  onclick="resetLoginPassword();" >Reset Password </a> --> 
	            	<a href="" onclick="initCheckAvailability()"  >Reset Password </a>
	            </div> 
            </form>
        </div>
		<div class="clear"></div>
	</div>
</div>
<footer class="footer">

</footer>
</body>
</html>
