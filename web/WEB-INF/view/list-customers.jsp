<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ykris
  Date: 25-04-2022
  Time: 09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>List Customers</title>
</head>
<body>
<h1>List of customers</h1>
<div id = "wrapper">
    <div id = "header">
        <h2> CRM - Customer Relationship Manager</h2>
    </div>
</div>
<div id = "container">
    <div id = "content">
        <input type = "button" value = "Add Customer"
        onclick="window.location.href='addCustomer'; return false;" class = "add-button"/>
        <table>

            <tr>
                <th> First Name</th>
                <th> Last Name</th>
                <th>Email</th>

            </tr>
            <c:forEach var = "tempCustomer" items = "${customers}">
                <c:url var = "updateLink" value="/customer/showFormForUpdate">
                <c:param name = "customerId" value ="${tempCustomer.id}"/>
                </c:url>
                <c:url var = "deleteLink" value="/customer/delete">
                <c:param name = "customerId" value ="${tempCustomer.id}"/>
                </c:url>
<tr>
    <td>${tempCustomer.firstName}</td>
    <td>${tempCustomer.lastName}</td>
    <td>${tempCustomer.email}</td>
    <td>
        <!-- display the update link -->
        <a href="${updateLink}">Update</a>
        |
        <a href="${deleteLink}"
           onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
    </td>
</tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
