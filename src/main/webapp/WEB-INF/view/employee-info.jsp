<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ruste
  Date: 23.03.2022
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${pageTitle}</title>
</head>
<body>
<header class="header">
    <h1 class="header-text">${pageTitle}</h1>
</header>

    <div class="container">
        <form:form cssClass="form" action="save" modelAttribute="employee">
            <form:hidden path="id"/>

            <label>Name</label> <form:input path="name"/>
            <br>
            <label>Email</label> <form:input path="email"/>
            <br>
            <label>Department</label> <form:input path="department"/>
            <br>
            <input type="submit" value="OK">
        </form:form>
    </div>

<style>
    <%@include file="style/employee-info.css" %>
</style>
</body>
</html>