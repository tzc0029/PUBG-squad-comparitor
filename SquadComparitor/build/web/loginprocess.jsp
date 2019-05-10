<%-- 
    Document   : loginprocess
    Created on : Apr 17, 2018, 11:43:42 AM
    Author     : Andre
--%>

<%
    java.sql.Connection conn;                 
    java.sql.ResultSet rs;                   
    java.sql.Statement st;                   

    Class.forName("com.mysql.jdbc.Driver"); 
    conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/pubg_db", "root", "1q2w3e4r"); //need to insert DB name, user, pass
    st = conn.createStatement();
    
    //get parameter value by using the 'name' of the field
    String username = request.getParameter("username");     
    String password = request.getParameter("password");

    String qr = "SELECT username FROM users WHERE username = '"+username+"' and password = '"+password+"'";    
    rs = st.executeQuery(qr);
    if(rs.next())                       
    {
       
        session.setAttribute("username", username);
        response.sendRedirect("APIGetServlet");
    }
    else
    {
       
        response.sendRedirect("Login.jsp?c");
    }
%>
