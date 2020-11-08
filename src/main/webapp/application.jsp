<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Application Form</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body onload="myFunction()">

<!--
	write the html code to accept laon info from user and send to placeloan servlet
-->
<jsp:include page="header.jsp"/>
<hr/>
<!--  <h3> Loan Information</h3>
		<form action="${isNew?'application1':'placeloan' }" method="POST">-->
<h3>Loan Apply Form</h3>
		<form action="user" method="POST">
			<div>
				<label for ="applno">Application Number:</label> ${LoanInfo.applno }			
			</div>
			<div>
				<label>Loan Name:   </label>
				<input type="text" name="purpose" value="${LoanInfo.purpose }" 
				 required />
			</div>
			<div>
				<label>Loan Amount Requested</label>
				<input type="text" name="amtrequest" value="${LoanInfo.amtrequest }" 
				 required />
			</div>
			<div>
				<label for="doa">Loan Application Date: </label>
				<%=LocalDate.now() %>
			</div>
			<div>
				<label>Business Structure: </label>
				<input type="text" name="bstructure" value="${LoanInfo.bstructure }" 
				 required />
			</div>
			<div>
				<label>Billing Indicator: </label>
				<input type="text" name="bindicator" value="${LoanInfo.bindicator }" 
				 required />
			</div>
			<div>
				<label>Tax Indicator: </label>
				<input type="text" name="tindicator" value="${LoanInfo.tindicator }" 
				 required />
			</div>
			<div>
				<label>Address: </label>
				<input type="text" name="address" value="${LoanInfo.address }" 
				 required />			
			</div>
			<div>
				<label>Email ID: </label>
				<input type="text" name="email" value="${LoanInfo.email }" 
				 required />			
			</div>
			<div>
				<label>Mobile Number:</label>
				<input type="text" name="mobile" value="${LoanInfo.mobile }" 
				 required pattern="[1-9][0-9]{9}"/>
			</div>
			<div>
				<label>Status:</label>
				<input type="text" name="status" value="${LoanInfo.status }" 
				 />
			</div>		
			<div>
				<input type="submit" value="Apply"/>
				<input type="hidden" name="action" value="placeloan"/>	
			</div>
		</form>

</script>
<hr/>
	<jsp:include page="footer.jsp"/>



</body>
</html>