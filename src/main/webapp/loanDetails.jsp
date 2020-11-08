<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Status</title>
</head>
<body>
	<!-- write the code to display the loan status information 
	     received from usercontrollers' displaystatus method
	-->
	<h3>Loan Status for the Application #</h3>
		<form action="user" method="POST">
			<div>
				<label for ="applno">Application Number:</label> ${LoanInfo.applno }			
			</div>
			<div>
				<label for ="purpose">Loan Name:   </label> ${LoanInfo.purpose }			
			</div>
			<div>
				<label for ="amtrequest">Loan Amount Requested</label> ${LoanInfo.amtrequest }				
			</div>
			<div>
				<label for="doa">Loan Application Date: </label> ${LoanInfo.doa }				
			</div>
			<div>
				<label for="bstructure">Business Structure: </label> ${LoanInfo.bstructure }
			</div>
			<div>
				<label for="bindicator">Billing Indicator: </label> ${LoanInfo.bindicator }
			</div>
			<div>
				<label for="tindicator">Tax Indicator: </label> ${LoanInfo.tindicator }
			</div>
			<div>
				<label for="address">Address: </label> ${LoanInfo.address }			
			</div>
			<div>
				<label for="emailid">Email ID: </label> ${LoanInfo.email }			
			</div>
			<div>
				<label for="mobile">Mobile Number:</label> ${LoanInfo.mobile }
			</div>
			<div>
				<label for="status">Current Status:</label> ${LoanInfo.status }
				<input type="hidden" name="action" value="displaystatus"/>
			</div>		
			
		</form>


<hr/>
	<jsp:include page="footer.jsp"/>

</body>
</html>