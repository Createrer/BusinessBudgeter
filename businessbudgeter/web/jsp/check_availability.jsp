<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<%@ include file="/jsp/common/taglib.jsp"%> 
</head>
<script type="text/javascript">
 $(document).ready(function(){
 	$("#check-availabilty-page").hide();
 });
</script>
<body>
<div id="header-wrap">
 <div id ="check-availabilty-page"></div>  
<header class="header" id="Header">

		<div><img src="images/bb-logo.png" alt="Business Budgeter" width="300" height="29" title="Business Budgeter"/></div>
		

</header>
</div>
	 <div class="wrapper" style="width:93%;">
<div class="mainwrapper">
		
		 <div class="login_container">
        	<div class="signinTitle">Reset Password</div>
             <form   method="post" id="check-username-availablity" name="check-username-availablity">
			<c:forEach items="${error}" var="error">
	          		<table>
						<tr><td colspan="2" style="color:#dd0000">${error}</td></tr>
					</table>				
			</c:forEach>
			<table>
			  <tr>  
			              
					<td style="width: 144px top-margin:40px; text-align: left"> User Name* :  </td> 
					<td> 
						<input type="text" name="user_name" id="user_name" value="" placeholder ="abc_123" style="width: 157px; ">
					</td>
				</tr>
				<tr>		     
					<td style="width: 144px; text-align: left"> Email Id* :  </td> 
					<td>				
						<input  type="text"  name="email_id" id="email_id" value="" placeholder ="abc_12@xyz.com" style="width: 159px; ">
					</td>
				</tr>
					 
			</table>
		<%-- <div class="reset"><button class="button" onclick="checkAvailability(${user_Name} ${email_Id});">Submit</button></div>--%>
			<div class="reset"><button class="button" onclick="checkAvailability();">Submit</button></div>
			</form>
        </div>
		<div class="clear"></div>
	</div>
</div>
<footer class="footer">

</footer>
</body>
</html>
