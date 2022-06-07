<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<%@page import="db.ForDataBase" %>
<jsp:useBean id="dogs" class="db.ForDataBase"/>
<html>
<head>
    <script>
        function reload() {
            location.reload();
        }

        function sure() {
            document.getElementById("sure").innerHTML = `
                <table>
                    <tr>
                        <td>
                            Are you sure?
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Yes, I'm absolutely sure, erase this user from existence!">
                        </td>
                        <td>
                            <input type="button" value="nah" onClick="reload();">

                        </td>
                    </tr>
                </table>`;
        }
    </script>
    <meta charset="ISO-8859-1">
    <title>Delete Users</title>
</head>
<body bgcolor="D6AC91" style="margin-left: 200px; margin-right: 200px;">
<% //Checks that the user is an admin
    if (session.getAttribute("status") != null && session.getAttribute("status").equals("admin")) {
%>
<jsp:include page="Menu.jsp"></jsp:include>
<font face="calibri">
    <form action="DeleteUsers.jsp" method="post">
        <h3>Delete a user</h3>
        <table>
            <tr>
                <td>
                    username:
                </td>
                <td>
                    <input type="text" id="username" name="username">
                </td>
            </tr>
            <tr>
                <td>
                    email:
                </td>
                <td>
                    <input type="text" id="email" name="email">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="Delete User" onclick="sure();">
                    <input type="reset" value="Clear">
                </td>
            </tr>
        </table>
        <div id="sure"></div>
    </form>
</font>

<% //deletes the user that has the given username and password from the table in the database
    if (request.getMethod().equals("POST")) {
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    dogs.insertUpdateDelete("delete from users where email='" + email + "'" + "and username='" + username + "'");
 %>

<table>
    <tr>
        <td>
            username
        </td>
        <td>
            email
        </td>
    </tr>
    <%
        //prints out the table after the deletion
    String[][] result = dogs.select("select username, email from users;");
    int j, i;
        for(i=0;i<result.length;i++)
        {

            out.println("<tr>");
            for(j=0;j<result[i].length;j++)
            {

                out.println("<td>"+result[i][j]+"</td>");
            }
            out.println("</tr>");
        }
        }
    %>
</table>

</body>
</html>
<%
    } else {
        //warning message for pesky non-admins trying to mess with my database
        out.print("<center> <h1> Don't even think about it. <br> You're dealing with powers beyond your imagination" +
                "<br> <a href=\"Home.jsp\">Home Page</a> </h1> </center>");
    }
%>