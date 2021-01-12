<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>User page</title>
</head>
<body>

<h2>Your space and info.</h2>
<br>
User: <security:authentication property="principal.username"/>
<br>
Your role in system: <security:authentication property="principal.roles"/>
<br>
<hr>
<table>

    <tr>
        <th>Name</th>
        <th>LastName</th>
        <th>Age</th>
        <th>Hobby</th>
        <th>Username</th>
        <th>Password</th>
    </tr>

        <tr>
            <td>${user.name}</td>
            <td>${user.lastName}</td>
            <td>${user.age}</td>
            <td>${user.hobby}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
</table>
<br>
<hr>
    <input type="button" value="Logout"
           onclick="window.location.href = '/logout'">


</body>
</html>
