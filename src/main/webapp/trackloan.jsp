<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- write html code to read the application number and send to usercontrollers'
             displaystatus method for displaying the information
	-->
	<jsp:include page="header.jsp"/>
	<hr/>
<div align=center>
	<h2>eLoan Track</h2>
	<form action="user" method="POST">
			<div>
				<label for ="applno">Enter Application Number:</label>
				<input type="text" name="name" value="${LoanInfo.applno }" 
				 required /> 				 		
			</div>
			<div>				
				<input type="submit" value="Check Status"/>
				<input type="hidden" name="action" value="trackloan"/>
			</div>
		</form>
		</div>
	
<hr/>
<jsp:include page="footer.jsp"/>
	

</body>
</html>