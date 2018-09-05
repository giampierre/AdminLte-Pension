<%-- 
    Document   : ValidateUser
    Created on : 28/06/2016, 03:28:14 PM
    Author     : Elvis
--%>

<%@page import="java.sql.Connection"%>
 <%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    String userid = request.getParameter("usuario");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_pension",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from usuario where usuario='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
     
        session.setAttribute("usuario", rs.getString("usuario"));
        
         response.sendRedirect("index.jsp");
    } else {
       response.sendRedirect("falla_Login.jsp");
    }
%>
    </body>
   
</html>
