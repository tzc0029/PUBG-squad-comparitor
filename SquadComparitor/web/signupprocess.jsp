<%-- 
    Document   : signupprocess
    Created on : Apr 17, 2018, 1:51:56 PM
    Author     : Andre
--%>

<%
    java.sql.Connection conn;                 
    java.sql.ResultSet rs,rs1;                  
    java.sql.Statement st,st1; 
    Class.forName("com.mysql.jdbc.Driver");
    conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/pubg_db", "root", "1q2w3e4r");  
    st = conn.createStatement();
    st1 = conn.createStatement();

    
    String character_name = request.getParameter("character_name");        
    String username = request.getParameter("username");     
    String password = request.getParameter("password");

    String qr = "SELECT username FROM users WHERE username = '"+username+"'";    
    rs = st.executeQuery(qr);
    if(rs.next())                       
    {
        response.sendRedirect("Login.jsp?a");                                   
    }
    else
    {
        String sql = "INSERT INTO users (character_name, username, password) values ('"+character_name+"', '"+username+"', '"+password+"')";   
        
        st1.executeUpdate(sql);
        String qry = "SELECT user_id FROM users WHERE username='"+username+"'";
        rs1 = st1.executeQuery(qry);
        if(rs1.next())                       
        {
            
            session.setAttribute("username", username);       
            response.sendRedirect("APIGetServlet");
        }
    }
%>
