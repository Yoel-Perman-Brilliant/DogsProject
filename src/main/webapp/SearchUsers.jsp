<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="db.ForDataBase.*" %>
<jsp:useBean id="dogs" class="db.ForDataBase"/>
<html>
<head>
    <script language="JavaScript">
        function reload() {
            location.href="Home.jsp";
            location.href="SearchUsers.jsp"
        }
    </script>
<meta charset="ISO-8859-1">
<title>Search Users</title>
</head>
<body bgcolor="D6AC91" style="margin-left: 200px; margin-right: 200px;">
<jsp:include page="Menu.jsp"></jsp:include>
<% if (session.getAttribute("status") != null && session.getAttribute("status").equals("admin")) { %>
<font face="calibri">
<form action="SearchUsers.jsp" method="post">
        Search user: <input type="text" name="name" id="name"> <br>
        <input type="submit" value="Search"> <input type="reset" value="Clear">
</form>
<table>
    <tr>
        <td>
            Username
        </td>
        <td>
            Password
        </td>
        <td>
            Email
        </td>
        <td>
            Day of birth
        </td>
        <td>
            Month of birth
        </td>
        <td>
            Year of birth
        </td>
    </tr>

    <%
        String[][] result = null;
        if (request.getMethod().equals("POST")) {
            String name = request.getParameter("name");


            result = dogs.select("select * from users where username='" + name + "'");
        } else {
            result = dogs.select("select * from users");
        }
        int j, i;
        for (i = 0; i < result.length; i++) {
            out.println("<tr>");
            for (j = 0; j < result[i].length; j++) {
                out.println("<td>" + result[i][j] + "</td>");
            }
            out.println("</tr>");
        }
    %>
    </table>
    <button onclick="reload()">Reset Table</button>
</font>
<%
    } else {
        out.print("<center> <h1> Don't even think about it. <br> You're dealing with powers beyond your imagination" +
                "<br> <a href=\"Home.jsp\">Home Page</a> </h1> </center>");
    }
%>
</body>
</html>
