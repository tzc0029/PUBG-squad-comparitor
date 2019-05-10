package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <style>\n");
      out.write("            h1{color: #ffff00; font-family:verdana;}\n");
      out.write("            pre{color: #ffff00; font-family:verdana;}\n");
      out.write("            t1{color: #ffff00; font-family:verdana;}\n");
      out.write("            body{background-color: #000000}\n");
      out.write("        </style>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>HomePage</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1 align='center'>PUBG Squad Comparitor</h1>\n");
      out.write("        \n");
      out.write("        <img src=\"images/PUBG.jpg\" alt='PUBG Logo'/>\n");
      out.write("        <table align='center'>\n");
      out.write("            <thead><t1>Welcome to the PlayerUnkown's Battleground Squad Comparitor</t1></thead>\n");
      out.write("            <tbody>\n");
      out.write("                <pre>\n");
      out.write("                     This application will allow users to create an online  \n");
      out.write("                     account which will allow them to search for other  \n");
      out.write("                     players and view their statistics, as well as create a  \n");
      out.write("                     personalized page where they can compare other user’s     \n");
      out.write("                     statistics. The personal page will give users the  \n");
      out.write("                     ability to easily compare their stats with the people  \n");
      out.write("                     they play with the most. Login or Sign up to get started!\n");
      out.write("                </pre>\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("        <form name=\"login\" method=\"POST\" action=\"Login.jsp\">\n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><input type=\"submit\" name=\"login\" value=\"Login/Sign up\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                </table>\n");
      out.write("        </form>\n");
      out.write("        <form name=\"search\" method=\"POST\" action=\"search.jsp?x\">\n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <t1>PUBG Character Name:</t1>\n");
      out.write("                        <td><input type=\"text\" name=\"character_name\" /></td>\n");
      out.write("                        <td href='search.jsp?x=$character_name'><input type=\"submit\" name=\"x\" value=\"Search\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                </table>\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
