/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import MatchData.MatchDataSet;
import PlayerData.PlayerDataSet;
import java.util.List;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import static javax.servlet.SessionTrackingMode.URL;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import javax.servlet.http.HttpSession;

/**
 *
 * @author allen
 */
public class APIGetServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //set up API data retrieval information
            String apikey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxOTE0ZGRiMC0yYTEwLTAxMzYtNWZmMy0wYzlkNmY1NjljYWYiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTI0NTg5NzM3LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6InN0YXR1cy1zZWFyY2hpbmctc3lzdGVtIiwic2NvcGUiOiJjb21tdW5pdHkiLCJsaW1pdCI6MTB9.vl7NJCyAx0nqMwANdq9ituqNTpE1N_G771btO5Brozo";
            String playerUrl = "https://api.playbattlegrounds.com/shards/pc-na/players?filter[playerNames]=";
            String matchUrl = "https://api.playbattlegrounds.com/shards/pc-na/matches/";
            int i = 0;
            int j = 0;
            try
            {
                java.sql.Connection dbconn = null;
                java.sql.ResultSet rs = null;
                java.sql.Statement st = null;
                String query = "";
                String[] playersTracked;
                
                //connect to database
                Class.forName("com.mysql.jdbc.Driver");
                dbconn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/pubg_db", "root", "1q2w3e4r");
                st = dbconn.createStatement();
                
                HttpSession session = request.getSession();
                //used to test without login page
                //session.setAttribute("uname", "amu0007");
                
                if(session.getAttribute("username") != null)
                {
                    //get user information from database
                    query = "SELECT * FROM users WHERE username='" + session.getAttribute("username") + "'";
                    rs = st.executeQuery(query);
                    rs.next();

                    //set information into a parsable list
                    playersTracked = new String[]{rs.getString("character_name"), rs.getString("Favorite1"), rs.getString("Favorite2"), rs.getString("Favorite3")};
                }
                else
                {
                    playersTracked = new String[]{"", "", "", ""};
                    //send to login
                }
                //Get Player Data
                URL url = new URL(playerUrl+rs.getString("character_name"));
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Authorization","Bearer " + apikey);
                conn.setRequestProperty("Accept", "application/vnd.api+json");

                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String playerJson;
                String playerJsonData = "";

                //Read in the player JSON data
                while((playerJson = br.readLine()) != null)
                {
                    playerJsonData += playerJson;
                }
                br.close();

                //parse player JSON data
                PlayerDataSet playerData = new Gson().fromJson(playerJsonData, PlayerDataSet.class);
                ////pull the "last played" match ID (API limitation forces this matchID to be random currently.
                matchUrl = matchUrl + playerData.data[0].relationships.matches.data[1].id;

                //get Match Data
                URL mUrl = new URL(matchUrl);
                HttpURLConnection mconn = (HttpURLConnection) mUrl.openConnection();
                mconn.setRequestMethod("GET");
                mconn.setRequestProperty("Authorization","Bearer " + apikey);
                mconn.setRequestProperty("Accept", "application/vnd.api+json");

                BufferedReader mbr = new BufferedReader(new InputStreamReader(mconn.getInputStream()));
                String matchJson;
                String matchJsonData = "";

                //Read in the match JSON data
                while((matchJson = mbr.readLine()) != null)
                {
                    matchJsonData += matchJson;
                }
                mbr.close();

                //parse mnatch JSON data
                MatchDataSet matchData = new Gson().fromJson(matchJsonData, MatchDataSet.class);
                int includesLength = matchData.included.length;
                int trackedLength = playersTracked.length;
                Boolean playerCheck = false;
                //find all player's information
                for(i = 0; i < includesLength-1; i++)
                {
                    playerCheck = false;
                    try
                    {
                        for(j = 0; j < trackedLength-1; j++)
                        {
                            if(playersTracked[j] != null && matchData.included[i].attributes.stats.name != null)
                            {
                                playerCheck = matchData.included[i].attributes.stats.name.equals(playersTracked[j]);
                            }

                            if(playerCheck)
                            {
                                session.setAttribute("character" + j + "Name", matchData.included[i].attributes.stats.name);
                                //out.println("Name: " + session.getAttribute("character" + j + "Name"));
                                //out.println("<br/>");
                                session.setAttribute("character" + j + "Kills", matchData.included[i].attributes.stats.kills);
                                //out.println("Kills: " + session.getAttribute("character" + j + "Kills"));
                                //out.println("<br/>");
                                session.setAttribute("character" + j + "DBNOs", matchData.included[i].attributes.stats.DBNOs);
                                //out.println("DBNOs: " + session.getAttribute("character" + j + "DBNOs"));
                                //out.println("<br/>");
                                session.setAttribute("character" + j + "Damage", matchData.included[i].attributes.stats.damageDealt);
                                //out.println("Damage: " + session.getAttribute("character" + j + "Damage"));
                                //out.println("<br/>");
                                session.setAttribute("character" + j + "Place", matchData.included[i].attributes.stats.winPlace);
                                //out.println("Place: " + session.getAttribute("character" + j + "Place"));
                                //out.println("<br/>");
                                //out.println("<br/>");
                                break;
                            }
                        }
                    }
                    catch(Exception e)
                    {
                        //skip the invalid entry
                    }
                }
                
            }
            catch(Exception e)
            {
                out.println(e);
            }
            RequestDispatcher rd = request.getRequestDispatcher("userprofile.jsp");
            rd.forward(request, response);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}