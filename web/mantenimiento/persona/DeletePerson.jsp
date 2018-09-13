<%-- 
    Document   : DeletePerson
    Created on : 15-jul-2018, 21:46:23
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
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/bd_pension", "root", "");
    Statement s = null;
    String idPerson = ""; 
    idPerson = request.getParameter("f_idpersona");

    s = conexion.createStatement();
    sql = "DELETE FROM persona WHERE idPersona = '"+idPerson+"' ";
    s.executeUpdate(sql);
    
    out.println(sql);
    //response.sendRedirect("ListPerson.jsp");
%>
