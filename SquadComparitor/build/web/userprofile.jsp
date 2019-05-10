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
        <title>UserProfile</title>
    </head>
    <body>

        <p style="text-align:center; font-size: 50px; color: #FFA500">

        </p>

        <div id="wrap">
            <p style="text-align: right; font-size: 30px">
                <a href="logout.jsp" style="text-decoration: none;"> Logout </a> 
                
            </p>
            <%
                //check if session we created exists or not
                if (session.getAttribute("username") != null) {
            %>
            <p style= "font-size: 30px">Hello, <%=session.getAttribute("username")%> </p>
            <%  } else {

                    response.sendRedirect("Login.jsp?b");
                } %>


            <%

                java.sql.Connection conn;
                java.sql.ResultSet rs;
                java.sql.Statement st;

                Class.forName("com.mysql.jdbc.Driver");
                conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/pubg_db", "root", "1q2w3e4r"); //need to insert DB name, user, pass
                st = conn.createStatement();

                //get parameter value by using the 'name' of the field
                String qr = "SELECT character_name, Favorite1, Favorite2, Favorite3 FROM users WHERE username = '" + session.getAttribute("username") + "'";
                rs = st.executeQuery(qr);

                while (rs.next()) {
            %>
            <table border="1" cellpadding="5" align="center" width = "800px">

                <tr>
                    <% if (rs.getString("character_name") == null) {
                    %>
                    <td>Your nickname: not yet assigned</td>

                    <% } else {%>
                    <td>Your nickname:<%=rs.getString("character_name")%></td> 
                    <% }
                    %>
                    <td>  <form method='post' action='change1.jsp?id=<%=session.getAttribute("username")%>'>
                            <input type='text' name='newname'/>
                            <input type='submit' value='change' style="background-color: #FFA500; color:azure; border-radius: 8px; ">
                        </form>   </td>



                </tr>
                <tr>
                    <% if (rs.getString("Favorite1") == null) {
                    %>
                    <td>Your favorite player 1: not yet assigned</td>

                    <% } else {%>
                    <td>Your favorite player 1:<%=rs.getString("Favorite1")%></td> 
                    <% }
                    %>
                    <td>  <form method='post' action='change2.jsp?id=<%=session.getAttribute("username")%>'>
                            <input type='text' name='newname'/>
                            <input type='submit' value='change' style="background-color: #FFA500; color:azure; border-radius: 8px; ">
                        </form>   </td>
                </tr>
                <tr>
                    <% if (rs.getString("Favorite2") == null) {
                    %>
                    <td>Your favorite player 2: not yet assigned</td>

                    <% } else {%>
                    <td>Your favorite player 2:<%=rs.getString("Favorite2")%></td> 
                    <% }
                    %>
                    <td>  <form method='post' action='change3.jsp?id=<%=session.getAttribute("username")%>'>
                            <input type='text' name='newname'/>
                            <input type='submit' value='change' style="background-color: #FFA500; color:azure; border-radius: 8px; ">
                        </form>   </td>
                </tr>
                <tr>
                    <% if (rs.getString("Favorite3") == null) {
                    %>
                    <td>Your favorite player 3: not yet assigned</td>

                    <% } else {%>
                    <td>Your favorite player 3:<%=rs.getString("Favorite3")%></td> 
                    <% }
                    %> 
                    <td>  <form method='post' action='change4.jsp?id=<%=session.getAttribute("username")%>'>
                            <input type='text' name='newname'/>
                            <input type='submit' value='change' style="background-color: #FFA500; color:azure; border-radius: 8px; ">
                        </form>   </td>
                </tr>
                </br></br>
            </table>
            <%
                }
            %>


            </br></br><p style="text-align:center; font-size: 30px">Results of most recent game</p>
            <table align="center" width = "800px">
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

                        <% if (session.getAttribute("character0Name") != null) {
                        %>
                        <td><%= session.getAttribute("character0Name")%></td>
                        <td><%= session.getAttribute("character0Kills")%></td>
                        <td><%= session.getAttribute("character0DBNOs")%></td>
                        <td><%= session.getAttribute("character0Damage")%></td>
                        <td><%= session.getAttribute("character0Place")%></td>

                    </tr>
                    <tr bgcolor="#FFEBCD">

                        <% if (session.getAttribute("character1Name") != null) {
                        %>
                        <td><%= session.getAttribute("character1Name")%></td>
                        <td><%= session.getAttribute("character1Kills")%></td>
                        <td><%= session.getAttribute("character1DBNOs")%></td>
                        <td><%= session.getAttribute("character1Damage")%></td>
                        <td><%= session.getAttribute("character1Place")%></td>
                        <% } else {
                        %>
                        <td>Player did not participate in this game</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <% }
                        %>

                    </tr>
                    <tr bgcolor="#FFEBCD">

                        <% if (session.getAttribute("character2Name") != null) {
                        %>
                        <td><%= session.getAttribute("character2Name")%></td>
                        <td><%= session.getAttribute("character2Kills")%></td>
                        <td><%= session.getAttribute("character2DBNOs")%></td>
                        <td><%= session.getAttribute("character2Damage")%></td>
                        <td><%= session.getAttribute("character2Place")%></td>
                        <% } else {
                        %>
                        <td>Player did not participate in this game</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <% }
                        %>

                    </tr>
                    <tr bgcolor="#FFEBCD">

                        <% if (session.getAttribute("character3Name") != null) {
                        %>
                        <td><%= session.getAttribute("character3Name")%></td>
                        <td><%= session.getAttribute("character3Kills")%></td>
                        <td><%= session.getAttribute("character3DBNOs")%></td>
                        <td><%= session.getAttribute("character3Damage")%></td>
                        <td><%= session.getAttribute("character3Place")%></td>
                        <% } else {
                        %>
                        <td>Player did not participate in this game</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <% }
                        %>

                    </tr>

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
