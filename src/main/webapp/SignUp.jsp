<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@ page import="db.ForDataBase.*" %>
<jsp:useBean id="dogs" class="db.ForDataBase"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Sign Up</title>

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
</head>
<body bgcolor="D6AC91" style="margin-left: 200px; margin-right: 200px;">
<jsp:include page="Menu.jsp"></jsp:include>
<center>
    <font face="Calibri">
        <form name="form" method="POST" action="SignUp.jsp" onsubmit="return validate();">
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
                        Password:
                    </td>
                    <td>
                        <input type="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td>
                        Repeat password:
                    </td>
                    <td>
                        <input type="password" name="repeatPassword">
                    </td>
                </tr>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <input type="email" name="email">
                    </td>
                </tr>
                <tr>
                    <td>
                        Date of birth:
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>day </b>
                        <select name="day">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                        </select>
                    </td>
                    <td>
                        <b>month </b>
                        <select name="month">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                    </td>
                    <td>
                        <b>year </b>
                        <select name="year">
                            <option value="2022">2022</option>
                            <option value="2021">2021</option>
                            <option value="2020">2020</option>
                            <option value="2019">2019</option>
                            <option value="2018">2018</option>
                            <option value="2017">2017</option>
                            <option value="2016">2016</option>
                            <option value="2015">2015</option>
                            <option value="2014">2014</option>
                            <option value="2013">2013</option>
                            <option value="2012">2012</option>
                            <option value="2011">2011</option>
                            <option value="2010">2010</option>
                            <option value="2009">2009</option>
                            <option value="2008">2008</option>
                            <option value="2007">2007</option>
                            <option value="2006">2006</option>
                            <option value="2005">2005</option>
                            <option value="2004">2004</option>
                            <option value="2003">2003</option>
                            <option value="2002">2002</option>
                            <option value="2001">2001</option>
                            <option value="2000">2000</option>
                            <option value="1999">1999</option>
                            <option value="1998">1998</option>
                            <option value="1997">1997</option>
                            <option value="1996">1996</option>
                            <option value="1995">1995</option>
                            <option value="1994">1994</option>
                            <option value="1993">1993</option>
                            <option value="1992">1992</option>
                            <option value="1991">1991</option>
                            <option value="1990">1990</option>
                            <option value="1989">1989</option>
                            <option value="1988">1988</option>
                            <option value="1987">1987</option>
                            <option value="1986">1986</option>
                            <option value="1985">1985</option>
                            <option value="1984">1984</option>
                            <option value="1983">1983</option>
                            <option value="1982">1982</option>
                            <option value="1981">1981</option>
                            <option value="1980">1980</option>
                            <option value="1979">1979</option>
                            <option value="1978">1978</option>
                            <option value="1977">1977</option>
                            <option value="1976">1976</option>
                            <option value="1975">1975</option>
                            <option value="1974">1974</option>
                            <option value="1973">1973</option>
                            <option value="1972">1972</option>
                            <option value="1971">1971</option>
                            <option value="1970">1970</option>
                            <option value="1969">1969</option>
                            <option value="1968">1968</option>
                            <option value="1967">1967</option>
                            <option value="1966">1966</option>
                            <option value="1965">1965</option>
                            <option value="1964">1964</option>
                            <option value="1963">1963</option>
                            <option value="1962">1962</option>
                            <option value="1961">1961</option>
                            <option value="1960">1960</option>
                            <option value="1959">1959</option>
                            <option value="1958">1958</option>
                            <option value="1957">1957</option>
                            <option value="1956">1956</option>
                            <option value="1955">1955</option>
                            <option value="1954">1954</option>
                            <option value="1953">1953</option>
                            <option value="1952">1952</option>
                            <option value="1951">1951</option>
                            <option value="1950">1950</option>
                            <option value="1949">1949</option>
                            <option value="1948">1948</option>
                            <option value="1947">1947</option>
                            <option value="1946">1946</option>
                            <option value="1945">1945</option>
                            <option value="1944">1944</option>
                            <option value="1943">1943</option>
                            <option value="1942">1942</option>
                            <option value="1941">1941</option>
                            <option value="1940">1940</option>
                            <option value="1939">1939</option>
                            <option value="1938">1938</option>
                            <option value="1937">1937</option>
                            <option value="1936">1936</option>
                            <option value="1935">1935</option>
                            <option value="1934">1934</option>
                            <option value="1933">1933</option>
                            <option value="1932">1932</option>
                            <option value="1931">1931</option>
                            <option value="1930">1930</option>
                            <option value="1929">1929</option>
                            <option value="1928">1928</option>
                            <option value="1927">1927</option>
                            <option value="1926">1926</option>
                            <option value="1925">1925</option>
                            <option value="1924">1924</option>
                            <option value="1923">1923</option>
                            <option value="1922">1922</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="reset" name="reset" value="clear form">
                        <input type="submit" name="submit" value="sign up">
                    </td>
                </tr>
            </table>
        </form>
        <%
            //Saves the form inputs as variables and inserts them into the table "users" in the database "dogs".
            if (request.getMethod().equals("POST")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String day = request.getParameter("day");
                String month = request.getParameter("month");
                String year = request.getParameter("year");
               dogs.insertUpdateDelete("insert into users values('"+username+"', '"+password+"', '"+email+"', '"+day+"', '"+month+"', '"+year+"');");
            }
        %>

    </font>
</center>
</body>
</html>