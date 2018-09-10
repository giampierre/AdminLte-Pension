<%-- 
    Document   : EditPerson
    Created on : 15-jul-2018, 22:21:37
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
    String idPerson = request.getParameter("idper");
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apell");
    String dni = request.getParameter("dn");
    String celular = request.getParameter("cel");
    String direccion = request.getParameter("direc");
    String estado = request.getParameter("est");
    String fecha = request.getParameter("fecha_ing");
    String codigo = request.getParameter("cod");
    String observacion = request.getParameter("observ");

    s = conexion.createStatement();
    sql = "UPDATE persona SET Nombres = '"+nombres+"', Apellidos = '"+apellidos+"', "
            + " dni = '"+dni+"', celular = '"+celular+"', direccion = '"+direccion+"', estado = '"+estado+"', "
            + " fecha_ingres = '"+fecha+"', codigo = '"+codigo+"', observacion = '"+observacion+"' WHERE idPersona = '"+idPerson+"'";
    s.executeUpdate(sql);
    out.println(sql);
    response.sendRedirect("ListPerson.jsp");
%>
