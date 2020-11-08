<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display All Loans</title>
</head>
<body>
	<!-- write code to display all the loan details 
             which are received from the admin controllers' listall method
	--> 
	<jsp:include page="header.jsp"/>
		
	<h3>All Loans</h3>
	<form action="admin" method="post">	
	<c:choose>
			<c:when test="${loanInfo==null || loanInfo.isEmpty() }">
				<p>No Records Fetched</p>
			</c:when>
			<c:otherwise >
				<table>
					<thead>
						<tr>
							<th>Applicant#</th>
							<th>Loan Type</th>
							<th>Requested Amount</th>
							<th>Loan Applied Date</th>
							<th>Business Structure</th>
							<th>Billing Indicator</th>
							<th>Tax Indicator</th>
							<th>Address</th>
							<th>Email ID</th>
							<th>Mobile</th>
							<th>Status</th>							
					</thead>
					<tbody>
						<c:forEach var="c" items="${loanInfo }">
							<tr>
								<td>${c.applno }</td>
								<td>${c.purpose }</td>
								<td>${c.amtrequest }</td>
								<td>${c.doa }</td>
								<td>${c.bstructure }</td>
								<td>${c.bindicator }</td>
								<td>${c.address }</td>
								<td>${c.email }</td>
								<td>${c.address }</td>
								<td>${c.email }</td>
								<td>${c.mobile }</td>
								<td>${c.status }</td>								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
			
		</c:choose>
	<jsp:include page="footer.jsp"/>
	</form>
</body>
</html>