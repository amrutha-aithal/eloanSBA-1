<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user home</title>
</head>
<body>
	<!-- write the html code to display hyperlinks for user functionalities -->
	<jsp:include page="header.jsp"/>
	<hr/>
	<nav>
		<a href="userhome1.jsp">Home</a>
		<span>|</span>
		<a href="application.jsp">Apply Loan</a>
		<span>|</span>
		<a href="editloan.jsp">Edit Loan</a>
		<span>|</span>
		<a href="trackloan.jsp">Track Loan</a>
		<div align="right"><a href="index.jsp">Logout</a></div>
	</nav>
	<hr/>
	<jsp:include page="footer.jsp"/>

</body>
</html>