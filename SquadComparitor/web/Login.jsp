<%-- 
    Document   : Login
    Created on : Apr 24, 2018, 11:09:40 PM
    Author     : Andrew Winland
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="Login.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>


        <script type="text/javascript">
            function validate() {

                var str = true;
                document.getElementById("msg").innerHTML = "";

                pass = document.signupform.password.value;
                confirm = document.signupform.confirm.value;


                if (pass == confirm) {

                } else {
                    document.getElementById("msg").innerHTML = "Passwords must match";
                    str = false;
                }

                if (document.signupform.password.value == '')
                {
                    document.getElementById("msg").innerHTML = "Enter Password";
                    str = false;
                }

                if (document.signupform.username.value == '')
                {
                    document.getElementById("msg").innerHTML = "Enter Username";
                    str = false;
                }




                return str;
            }
        </script>

    </head>
    <body>
        <div>
            <a href="index.jsp" style="text-decoration: none">
                <h1>Go back</h1>
            </a>

        </div>


        <div>
            <form name="loginform" method="POST" action="loginprocess.jsp">            
                <table border="0" cellpadding="5" align="center" width = "800px" style="margin-top:300px">
                    <br>

                    <tr>
                        <td colspan="2"><h3>Login</h3></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username" required /></td>                  
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password" required/></td>               
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /> </td>
                        <td>
                            <%
                                if (request.getParameter("c") != null) {
                                    //check the value for variable "c"
                                    out.println("Username or password is incorrect");
                                }
                                if (request.getParameter("b") != null) {
                                    //routed from user account page
                                    out.println("You must login to continue!");
                                }
                            %>
                        </td>
                    </tr>
                   
                </table>

            </form>


            <form name="signupform" method="POST" action="signupprocess.jsp" onSubmit="return validate()">           
                <table border="0" cellpadding="5" align="center" width = "800px">
                    <tr>
                        <td colspan="2"><h3>Register</h3></td>
                    </tr>
                    <tr>
                        <td>PUBG Character Name:</td>
                        <td><input type="text" name="character_name" /></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username" /></td>                  
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password" /></td>              
                    </tr>
                    <tr>
                        <td>Confirm Password:</td>
                        <td><input type="password" name="confirm" /></td>               
                    </tr>
                    <tr>
                        <td><input type="submit" name="signup" value="Sign up" /></td>
                        <td>
                            <span id="msg"> </span>                                     
                            <%                                if (request.getParameter("a") != null) {
                                    //check the value for variable "a"
                                    out.println("Username already exists");
                                }
                            %>
                        </td>                      

                    </tr>
                </table>

            </form>


        </div>          
    </body>
</html>
