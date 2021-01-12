<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>



<html>
<head>
    <title>Welcome</title>
</head>
<body>

<h2>Hello user, welcome to home page!</h2>
<br>

<security:authorize access="hasRole('ROLE_ADMIN')">
<input type="button" value="ShowAll"
       onclick="window.location.href = '/admin/getAll'">
<br><br>
</security:authorize>

<security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
<input type="button" value="ShowMyInfo"
       onclick="window.location.href = '/user'">
</security:authorize>
<hr>
    <input type="button" value="Login"
           onclick="window.location.href = '/login'">

    <input type="button" value="Logout"
           onclick="window.location.href = '/logout'">
</body>
</html>
