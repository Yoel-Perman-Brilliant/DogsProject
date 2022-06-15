<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="db.ForDataBase" %>
<jsp:useBean id="dogs" class="db.ForDataBase"/>
<!DOCTYPE html>
<html>
<head>
    <script language="JavaScript">
        function validate() {
            var email = document.form.email.value;
            var password = document.form.password.value;
            var repeatPassword = document.form.repeatPassword.value;
            var hebrew = "אבגדהוזחטיכלמנסעפצקרשת";
            var number = "0123456789";
            var english = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            var chars = "`;:?,'~!#$%^&*(){}<>|\/ ";

            //Verifies that a username has been provided
            if (document.form.username.value == "") {
                alert("Please enter a username");
                document.form.username.focus();
                document.form.username.style.backgroundColor = "red";
                return false;
            }

            //Verifies that the username at least 3 characters long
            if (document.form.username.value.length < 3) {
                alert("Username should be at least three characters long");
                document.form.username.focus();
                document.form.username.style.backgroundColor = "red";
                return false;
            }

            //Verifies that the username only contains valid characters
            for (i = 0; i < chars.length; i++) {
                var t = chars.charAt(i);
                if (document.form.username.value.indexOf(t) > -1) {
                    alert("Username contains an invalid character");
                    document.form.username.focus()
                    document.form.username.style.backgroundColor = "red";
                    return false;
                }
            }

            //Verifies that a password has been provided
            if (document.form.password.value == "") {
                alert("Please enter a password")
                document.form.password.focus();
                document.form.password.style.backgroundColor = "red";
                return false;
            }

            //Verifies that the password at least 6 characters long
            if (document.form.password.value.length < 6) {
                alert("Password should be at least 6 letters long");
                document.form.password.focus();
                document.form.password.style.backgroundColor = "red";
                return false;
            }

            //Verifies that the password has been repeated
            if (document.form.repeatPassword.value == "") {
                alert("Please repeat the password");
                document.form.repeatPassword.focus();
                document.form.repeatPassword.style.backgroundColor = "red";
                return false;
            }

            //Verifies that both passwords provided are equal
            if (document.form.password.value != document.form.repeatPassword.value) {
                alert("Passwords do not match");
                document.form.repeatPassword.focus();
                document.form.repeatPassword.style.backgroundColor = "red";
                return false;
            }

            //Verifies that an email address has been provided
            if (document.form.email.value == "") {
                alert("Please enter an email address");
                document.form.email.focus();
                document.form.email.style.backgroundColor = "red";
                return false;
            }

            //Verifies that the email includes @ in a valid location
            if (document.form.email.value.indexOf("@") < 1) {
                alert("@ wasn't typed in the email address, or it is in the wrong location");
                document.form.email.focus();
                document.form.email.style.backgroundColor = "red";
                return false;
            }

            //Verifies that there is only one @ in the email address
            if (document.form.email.value.indexOf("@") != document.form.email.value.lastIndexOf("@")) {
                alert("More than one @ was typed");
                document.form.email.focus();
                document.form.email.style.backgroundColor = "red";
                return false;
            }

            //Verifies that the email address only contains valid characters
            for (i = 0; i < chars.length; i++) {
                var a = chars.charAt(i);
                if (document.form.email.value.indexOf(a) > -1) {
                    alert("Email address cannot contain invalid or hebrew characters");
                    document.form.email.focus();
                    document.form.email.style.backgroundColor = "red";
                    return false;
                }
            }

            //Verifies that the email address does not contain hebrew characters
            for (i = 0; i < hebrew.length; i++) {
                var a = hebrew.charAt(i);
                if (document.form.email.value.indexOf(a) > -1) {
                    alert("Email address cannot contain invalid or hebrew characters");
                    document.form.email.focus();
                    document.form.email.style.backgroundColor = "red";
                    return false;
                }
            }

            //Verifies that there is a period at least three characters after the @ in the email address, and that the
            //first period is at least three characters after the @.
            var a = document.form.email.value.split("@");
            if ((a[1]).indexOf(".") < 3) {
                alert("Either there is no period after the @, or it is in the wrong place");
                document.form.email.focus();
                document.form.email.style.backgroundColor = "red";
                return false;
            }

            //Verifies that there are at most 2 periods after the @ in the email address.
            var b = a[1].split(".");
            if (b.length > 3) {
                alert("There a more than two periods after the @");
                document.form.email.focus();
                document.form.email.style.backgroundColor = "red";
                return false;
            }

            //Verifies that if there are two periods, they are at least two characters apart.
            if (b.length == 2 && b[1].length < 2) {
                alert("The space between the periods after the @ is invalid");
                document.form.email.focus();
                document.form.email.style.backgroundColor = "red";
                return false;
            }
            return true;
        }
    </script>
    <meta charset="ISO-8859-1">
    <title>Update Users</title>
</head>
<body bgcolor="D6AC91" style="margin-left: 200px; margin-right: 200px;">
<font face="calibri">
        <% if ((session.getAttribute("status") != null && session.getAttribute("status").equals("admin"))) {

%>
            <jsp:include page="Menu.jsp"></jsp:include>
            <center>
        <font face="Calibri">
            <form name="form" method="POST" action="UpdateAdmin.jsp" onsubmit="return validate();">
                <table>
                    <tr>
                        <td>
                            Username:
                        </td>
                        <td>
                            <input type="text" name="username">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            New Password:
                        </td>
                        <td>
                            <input type="password" name="password">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Repeat New Password:
                        </td>
                        <td>
                            <input type="password" name="repeatPassword">

                        </td>
                    </tr>
                    <tr>
                        <td>
                            New Email:
                        </td>
                        <td>
                            <input type="email" name="email">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="reset" name="reset" value="clear form">
                            <input type="submit" name="submit" value="update">
                        </td>
                    </tr>
                </table>
            </form>
            <%
                if (request.getMethod().equals("POST")) {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String email = request.getParameter("email");
                    dogs.insertUpdateDelete(
                            "update users set password=\""+password+"\", email=\""+email+"\" where username=\"" +
                                    username+"\";");

            %>

            <table>
                <tr>
                    <th>
                        Username
                    </th>
                    <th>
                        Password
                    </th>
                    <th>
                        Email
                    </th>
                </tr>
                <%
                    String [][] result = dogs.select("select username, password, email from " +
                            "users where username=\""+username+"\"");
                    int j,i;
                    for(i=0;i<result.length;i++) {

                        out.println("<tr>");
                        for (j = 0; j < result[i].length; j++) {

                            out.println("<td>" + result[i][j] + "</td>");
                        }
                        out.println("</tr>");
                    }
                    }
                %>
            </table>
        </font>
            <% } else {
            out.print("<center> <h1> Don't even think about it. <br> You're dealing with powers beyond your imagination" +
            "<br> <a href=\"Home.jsp\">Home Page</a> </h1> </center>");
            }%>
</body>
</html>