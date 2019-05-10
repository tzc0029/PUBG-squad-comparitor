<%-- 
    Document   : logout
    Created on : Apr 29, 2018, 3:46:58 AM
    Author     : Angus
--%>

<%
    if (session.getAttribute("username") != null) {
        session.invalidate();
        response.sendRedirect("index.jsp");

    } else {
        response.sendRedirect("index.jsp");
    }


%>
