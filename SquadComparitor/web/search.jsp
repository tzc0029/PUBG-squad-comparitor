<%-- 
    Document   : JSP Assignment2
    Created on : 19-Apr-2018
    Author     : Tianshi Che
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="pstyles.css" rel="stylesheet" type="text/css"/>
        <title>Search</title>
    </head>
    <body>

        <p style="text-align:center; font-size: 50px; color: #FFA500">

        </p>

        <div id="wrap">
            <%
                //check if session we created exists or not
                if (session.getAttribute("username") != null) {
            %>
            <p style="text-align: right; font-size: 30px">
                <a href="logout.jsp" style="text-decoration: none; "> Logout </a> <br>  
                <a href="userprofile.jsp" style="text-decoration: none; ">Go Back</a>
            </p>
            <%
                }
            %>
            <%
                //check if session we created exists or not
                if (session.getAttribute("username") != null) {
            %>
            <p style="font-size: 30px">Hello, <%=session.getAttribute("username")%> </p>
            <%  } else {
            %>
            <p style= "font-size: 30px">Hello, guest </p>
            <p style="text-align: right; font-size: 30px">
                <a href="Login.jsp" style="text-decoration: none;"> Sign in </a> <br>
               
            </p> 


            <%                }
            %>


            </br></br><p style="text-align:center; font-size: 30px">Results of the most recent game</p>
            <table border="1" cellpadding="5" align="center" width = "800px">
                <br><br>
                <thead >
                    <tr style="background-color: #FFA500">
                        <th>PUBG name</th>
                        <th>Kills</th>
                        <th>DBNOs</th>
                        <th>Damage</th>
                        <th>Place</th>
                    </tr>
                </thead>
                <tbody>
                    <tr bgcolor="#FFEBCD">

                        <% if (session.getAttribute("searchedName") != null) {
                        %>
                        <td><%= session.getAttribute("searchedName")%></td>
                        <td><%= session.getAttribute("searchedKills")%></td>

                        <td><%= session.getAttribute("searchedDBNOs")%></td>
                        <td><%= session.getAttribute("searchedDamage")%></td>
                        <td><%= session.getAttribute("searchedPlace")%></td>



                        <% } else {
                        %>
                        <td>Player does not exist or has not played in this season</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>

                        <% }
                        %>
                </tbody>

                <%--
                                }
                            }
                        }
                    }
                --%>
            </table>
            </br></br><p style="text-align:center; font-size: 30px">Start a new search</p></br></br>
            <form method='post' action='SearchServlet' align="center">
                <input type='text' name='searchedPlayer'/>
                <input type='submit' value='search' style="background-color: #FFA500; color:azure; border-radius: 8px; "/>
            </form>
        </div>
    </body>
</html>