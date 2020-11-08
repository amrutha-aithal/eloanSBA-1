<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Loan Application</title>
</head>
<body>
	<!-- read the application number to edit from user and send to 
	     user controller to edit info
	-->
	<jsp:include page="header.jsp"/>
	<hr/>
<div align=center>
	<h2>eLoan Edit</h2>
	<form action="user" method="POST">
			<div>
				<label for ="applno">Enter Application Number:</label>
				<input type="text" name="name" value="${LoanInfo.applno }" 
				 required /> 
				 			
			</div>
			<div>				
				<button>EDIT</button>
				<input type="hidden" name="action" value="editloan" />
			</div>
		</form>
		</div>
	
<hr/>
<jsp:include page="footer.jsp"/>

</body>
</html>