<%-- 
    Document   : EditUser
    Created on : 21-jul-2018, 16:37:53
    Author     : Elvis
--%>

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
    String idUsuario = request.getParameter("iduser");
    String idPersona = request.getParameter("persona");
    String usuario = request.getParameter("usuario");
    String pass = request.getParameter("pass");

    s = conexion.createStatement();
    sql = "UPDATE usuario SET idPersona = '"+idPersona+"', usuario = '"+usuario+"', "
            + " pass = '"+pass+"' WHERE idUsuario = '"+idUsuario+"'";
    //s.executeUpdate(sql);
    out.println(sql);
    //response.sendRedirect("ListPerson.jsp");
%>

