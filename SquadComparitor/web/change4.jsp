<%-- 
    Document   : change
    Created on : Apr 29, 2018, 2:36:25 AM
    Author     : Angus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="pstyles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            java.sql.Connection conn;
            java.sql.ResultSet rs;
            java.sql.Statement st;
            session.removeAttribute("character4Name");

            Class.forName("com.mysql.jdbc.Driver");
            conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/pubg_db", "root", "1q2w3e4r"); //need to insert DB name, user, pass
            st = conn.createStatement();

            if (request.getParameter("id") != null) {
                //check the value for variable "a"

                String newcharactername = request.getParameter("newname");
                String un = request.getParameter("id");
                String sql = "UPDATE `pubg_db`.`users` SET `Favorite3`='" + newcharactername + "' WHERE `username`='" + un + "'";

                st.executeUpdate(sql);
                response.sendRedirect("APIGetServlet");
            }
        %>  
    </form>
</body>
</html>