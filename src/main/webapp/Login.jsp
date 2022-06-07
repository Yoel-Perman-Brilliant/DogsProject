<%@ page language="java" contentType="text/html; charset=windows-1255"
         pageEncoding="windows-1255" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="db.ForDataBase" %>
<jsp:useBean id="dogs" class="db.ForDataBase"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
    <title>Log in</title>

    <script>
        /**
         * Alerts the user that they have entered either their username or password incorrectly.
         */
        function wrong() {
            alert("One or more entries is incorrect");
        }
    </script>
</head>
<body bgcolor="D6AC91" style="margin-left: 200px; margin-right: 200px;">
<jsp:include page="Menu.jsp"></jsp:include>
<center><font size="5" face="Calibri"><b><br>log in</b>
    <%
        request.setCharacterEncoding("windows-1255");
        response.setCharacterEncoding("windows-1255");
    %>

    <%
        //Initially sets the status to guest.
        session.setAttribute("status", "guest");
        String[][] result = null;
        if (request.getMethod().equals("POST")) {
            //Saves the form fields as variables and sets the user and password attributes to the given inputs.
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            session.setAttribute("user", user);
            session.setAttribute("password", password);

            //If the inputs given are the ones of an admin, sets the status to admin, and sets the email attribute to
            //the admin's email (gets the email from the table, as it is the email of the user who had the correct
            //username and password).
            if (user.equals("admin") && password.equals("goodjobyotam")) {
                session.setAttribute("status", "admin");
                String email = dogs.select("select email from users where username=\""+user+"\"")[0][0];
                session.setAttribute("email", email);
            //If there is a member whose username and password are the one's given, it changes the status to member, and
            //the email attribute to the user's email, using the table.
            } else {
                result = dogs.select("select * from users where username='" + user + "'&& password='" + password + "'");
                if (result.length > 0) {
                    session.setAttribute("status", "member");
                    String email = dogs.select("select email from users where username=\""+user+"\"")[0][0];
                    session.setAttribute("email", email);
                }
            }
        }
    %>

    <table>
        <form action="Login.jsp" method="post">
            <tr>
                <td>
                    username:
                </td>
                <td>
                    <input type="text" id="user" name="user"><br>
                </td>
            </tr>
            <tr>
                <td>
                    password:
                </td>
                <td>
                    <input type="password" id="password" name="password">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="log in"> <input type="reset" value="clear">
                </td>
            </tr>
        </form>
    </table>

    <%
        if (request.getMethod().equals("POST")) {
            /**
             * If the user is still a guess, it means they entered the wrong username or the wrong password. So, the
             * wrong() function is called, which alerts that they entered something incorrect.
             */
            if (session.getAttribute("status") != null && session.getAttribute("status").equals("guest")) { %>
                <script>wrong()</script>
    <%
    }

        /**
         * If the user is now a member or an admin, it means the log-in has been completed successfully, and the
         * user is redirected to the home page.
         */
        if (session.getAttribute("status") != null && session.getAttribute("status").equals("admin")) {
                response.sendRedirect("Home.jsp");

    %>

    <%
        }
        if (session.getAttribute("status") != null && session.getAttribute("status").equals("member")) {
            response.sendRedirect("Home.jsp");

    %>

    <%
            }
        }
    %>
</font>
</center>
</body>
</html>

