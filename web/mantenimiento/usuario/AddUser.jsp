<%-- 
    Document   : AddUser
    Created on : 21-jul-2018, 15:24:51
    Author     : Elvis
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = null;
    String sql = "";
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/bd_pension", "root", "root");
    Statement s = null;
    String id = request.getParameter("id");
    String user = request.getParameter("usuario");
    String pass = request.getParameter("clave");

    s = conexion.createStatement();
    sql = "INSERT INTO usuario (idUSUARIO, idPERSONA, usuario, pass) "
            + " VALUES (null,'" + id + "', '" + user + "', '" + pass + "')";
    s.executeUpdate(sql);
    //out.println(sql);
    response.sendRedirect("ListUser.jsp");
%>
