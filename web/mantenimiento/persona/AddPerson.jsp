<%-- 
    Document   : addPerson
    Created on : 15-jul-2018, 16:19:50
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
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/bd_pension", "root", "");
    Statement s = null;
    String nomb = request.getParameter("nombres");
    String apell = request.getParameter("apellidos");
    String dni = request.getParameter("dni");
    String cell = request.getParameter("celular");
    String dir = request.getParameter("direccion");
    String estad = request.getParameter("estado");
    String fech = request.getParameter("fechaingreso");
    String codig = request.getParameter("codigo");
    String observ = request.getParameter("observacion");

    s = conexion.createStatement();
    sql = "INSERT INTO PERSONA (idPERSONA, Nombres, Apellidos, dni, celular, "
            + "direccion, estado, fecha_ingres, codigo, observacion) "
            + " VALUES (null,'" + nomb + "', '" + apell + "', '" + dni + "', '" + cell + "', "
            + " '" + dir + "', '" + estad + "', '" + fech + "', '" + codig + "', '" + observ + "')";
    s.executeUpdate(sql);
    out.println(sql);
    response.sendRedirect("ListPerson.jsp");
%>