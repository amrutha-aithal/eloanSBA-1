<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eLoan system</title>
</head>
<body>
	<!-- write the html code to read user credentials and send it to validateservlet
	    to validate and user servlet's registernewuser method if create new user
	    account is selected
	-->
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
		<div>
			<!-- <div><input type="submit" name="action" value="validate"> </div>-->
			<input type="submit" value="Log In"/> 
			<input type="hidden" name="action" value="validate"/>
		</div>
		<!-- <a href="user?action=registerNewUser">New User? register here</a>-->
		<h3>New User?<a href="register.jsp">Register here</a></h3>
	</form>
	</div>
	
<hr/>

</body>
</html>