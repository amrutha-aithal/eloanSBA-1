<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>
<div align=center>
	<h2>eLoan Login</h2>
	<form action="user" method="post">
		<div>
			<div><label for="loginid">Enter login Id</label> </div>
			<div><input type="text" id="loginid" name="loginid"> </div>
		</div>
		<div>
			<div><label for="password">Enter password</label> </div>
			<div><input type="password" id="pwd" name="password"> </div>
		</div>
		<!-- <div>
			<div><label for="confirmpassword">Re-Enter password</label> </div>
			<div><input type="password" id="confirmPwd" name="confirmPassword"> </div>
		</div>-->
		<div>
			<input type="submit" value="Register"/> 
			<input type="hidden" name="action" value="registernewuser"/> 
		</div>
		<!-- <a action="user?action=registerNewUser" >New User? register here</a>-->
	</form>
	</div>
	</div>
<hr/>
<jsp:include page="footer.jsp"/>
</body>
</html>