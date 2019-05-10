<%-- 
    Document   : HomePage
    Created on : Apr 25, 2018, 11:11:30 AM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="home.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomePage</title>

    </head>
    <body>


        <img src="PUBG.jpg" alt='PUBG Logo' style="width: 50%; height: 50%"/>
        <table >
            <thead></thead>
            <tbody>
            <h2 align='center'>Welcome to the PlayerUnkown's Battleground Squad Comparitor</h2>
            <pre>
This application will allow users to create an online  
account which will allow them to search for other  
players and view their statistics, as well as create a  
personalized page where they can compare other user’s     
statistics. The personal page will give users the  
ability to easily compare their stats with the people  
they play with the most. Login or Sign up to get started!
            </pre>
           <h2 align='center' >
               <a href="Login.jsp"> Login/Sign up </a>
               </h2>
        </tbody>
    </table>
 </br><p style="text-align:center; font-size: 30px">Start a new search</p></br></br>
            <form method='post' action='SearchServlet' align="center">
                <input type='text' name='searchedPlayer'/>
                <input type='submit' value='search' style="background-color: #FFA500; color:azure; border-radius: 8px; "/>
            </form>
   


</body>
</html>
