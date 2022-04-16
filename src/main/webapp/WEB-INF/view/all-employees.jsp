<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ruste
  Date: 23.03.2022
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Employee Management</title>
</head>
<body>

<header class="header">
    <h1 class="header-text">Employee Management System</h1>
</header>

<div class="container">
    <button class="button" value="New Employee"
            onclick="window.location.href = 'add'">New Employee
        <svg class="user-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="#4B00DA" d="M15.71,12.71a6,6,0,1,0-7.42,0,10,10,0,0,0-6.22,8.18,1,1,0,0,0,2,.22,8,8,0,0,1,15.9,0,1,1,0,0,0,1,.89h.11a1,1,0,0,0,.88-1.1A10,10,0,0,0,15.71,12.71ZM12,12a4,4,0,1,1,4-4A4,4,0,0,1,12,12Z"></path></svg>
    </button>
    
    <div <c:if test="${message}"/> class="message">
        ${message}
    </div>

    <table class="table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Action</th>
        </tr>
        <c:forEach var="emp" items="${allEmps}">
            <c:url var="updateButton" value="/update${emp.id}">
                <c:param name="empId" value="${emp.id}"/>
            </c:url>
            <c:url var="deleteButton" value="/delete${emp.id}">
                <c:param name="empId" value="${emp.id}"/>
            </c:url>

            <tr>
                <td>${emp.id}</td>
                <td>${emp.name}</td>
                <td>${emp.email}</td>
                <td>${emp.department}</td>
                <td>
                    <button class="button change" value="Update" onclick="window.location.href='${updateButton}'">
                        <svg class="change-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="#4B00DA" d="M22,7.24a1,1,0,0,0-.29-.71L17.47,2.29A1,1,0,0,0,16.76,2a1,1,0,0,0-.71.29L13.22,5.12h0L2.29,16.05a1,1,0,0,0-.29.71V21a1,1,0,0,0,1,1H7.24A1,1,0,0,0,8,21.71L18.87,10.78h0L21.71,8a1.19,1.19,0,0,0,.22-.33,1,1,0,0,0,0-.24.7.7,0,0,0,0-.14ZM6.83,20H4V17.17l9.93-9.93,2.83,2.83ZM18.17,8.66,15.34,5.83l1.42-1.41,2.82,2.82Z"></path></svg>
                    </button>
                    <button class="button change" value="Delete" onclick="window.location.href='${deleteButton}'">
                        <svg class="change-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="#4B00DA" d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"></path></svg>
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<style>
    <%@include file="style/all-employees.css" %>
</style>
</body>
</html>