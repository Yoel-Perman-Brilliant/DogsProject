<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log out</title>
</head>
<body bgcolor="D6AC91" style="margin-left: 200px; margin-right: 200px;">
    <%
        session.invalidate();
        response.sendRedirect("Home.jsp");
    %>
</body>
</html>