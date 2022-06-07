<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="db.ForDataBase" %>
<jsp:useBean id="robot" class="db.ForDataBase"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Menu</title>
</head>
<body>
<center>
    <% if (session.getAttribute("status") == null) {
        session.setAttribute("status", "guest");
    }
        if (session.getAttribute("status").equals("guest")) {
            out.print("Signed in as guest");
        } else {
            out.print("Hello " + session.getAttribute("user") + "!");
        }
    %>
    <br>
    <font face="Calibri" size="5">
        <a href="Home.jsp">Home</a>
        &nbsp;
        <a href="NewFacts.jsp">Facts About Dogs</a>
        &nbsp;
        <a href="Why.jsp">Why you should get a dog</a>
        &nbsp;
        <a href=GetADog.jsp>How to get a dog</a>
        &nbsp;
        <% if (session.getAttribute("status").equals("guest"))
            out.print("<a href=\"SignUp.jsp\">Sign Up</a> &nbsp <a href=\"Login.jsp\">Log in</a>");
        %>
        <% if (session.getAttribute("status").equals("member") || session.getAttribute("status").equals("admin")) {
            out.print("&nbsp;<a href=\"TakeCare.jsp\">How to take care of your dog</a><br>");
            out.print("<a href=\"Logout.jsp\">Log out</a>");
            out.print("&nbsp;&nbsp;<a href=\"Update.jsp\">Update Account Details</a>");
        }
        %>
        <% if (session.getAttribute("status") != null &&
                session.getAttribute("status").equals("admin")) {
            out.print("&nbsp;&nbsp;<a href=\"SearchUsers.jsp\"><font color=\"red\">Search Users</font></a>");
            out.print("&nbsp;&nbsp;<a href=\"UpdateAdmin.jsp\"><font color=\"red\">Update Users</font></a>");
            out.print("&nbsp;&nbsp;<a href=\"DeleteUsers.jsp\"><font color=\"red\">Delete Users</font></a>");
        }
        %>




    </font>
</center>
</body>
</html>