<!DOCTYPE html>
<html>
<head>
<title>Business Budgeter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<%@ include file="/jsp/common/taglib.jsp"%> 
</head>
<script>
	$(function(){
        $("#confirm_pass").keyup(function(){
        $(".error").hide();
        var hasError = false;
        var passwordVal = $("#new_pass").val();
        var checkVal = $("#confirm_pass").val();
        if (passwordVal == '') {
            $("#new_pass").after('<span class="error">Please enter a password.</span>');
            hasError = true;
        } else if (checkVal == '') {
            $("#confirm_pass").after('<span class="error">Please re-enter your password.</span>');
            hasError = true;
        } else if (passwordVal != checkVal ) {
            $("#confirm_pass").after('<span class="error">Passwords do not match.</span>');
            hasError = true;
        }
        if(hasError == true) {return false;}
    });
});

$(document).ready(function(){
 	$("#reset_old-password").hide();
 });
</script>
 
<body>
<div id="header-wrap">
<div id ="reset_old-password"></div>
<header class="header" id="Header">

		<div><img src="images/bb-logo.png" alt="Business Budgeter" width="300" height="29" title="Business Budgeter"/></div>
		

</header>
</div>
	 <div class="wrapper" style="width:93%;">
<div class="mainwrapper">
		
		 <div class="login_container">
        	<div class="signinTitle">Reset Password</div>
             <form method="post" id="rest-old-password" name="rest-old-password">
			<table class=>
			  <tr>		     
			<td style="width: 144px; text-align: left">  User Name*  </td> 		
			<td>
			     
				  ${userData.userName } 
		</tr>
		<tr>	
          	 <td style="width: 144px; text-align: left"> Email Id* </td> 
			    <td>
			      ${userData.emailID } 
				</td>
		</tr>
		<tr>		     
			<td style="width: 144px; text-align: left"> New Password* </td> 
			<td>				
				<input  type="password"  name="new_pass" id="new_pass" value="" style="width: 152px; ">
			</td>
		</tr>
		<tr>
			<td style="text-align: left; width: 144px">Re-Enter* &nbsp;</td>
			<td>
				<input type="password" class="input-serch" name="confirm_pass" id="confirm_pass" value=""  onkeyup="checkPassword();" style="width: 145px; height: 19px"/> 
			</td>				
		</tr>	
					 
			</table>
			<div class="reset"><button class="button" onclick="resetLoginPassword(${userData.userName },${userData.password });">Submit</button></div>
			</form>
        </div>
		<div class="clear"></div>
	</div>
</div>
<footer class="footer">

</footer>
</body>
</html>
