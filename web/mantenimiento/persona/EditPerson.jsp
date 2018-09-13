<%-- 
    Document   : EditPerson
    Created on : 15-jul-2018, 22:21:37
    Author     : Elvis
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%      String idPerson = request.getParameter("idper");
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apell");
    String dni = request.getParameter("dn");
    String celular = request.getParameter("cel");
    String direccion = request.getParameter("direc");
    String estado = request.getParameter("est");
    String fecha = request.getParameter("fecha_ing");
    String codigo = request.getParameter("cod");
    String observacion = request.getParameter("observ");

    int rsetx = 0;
    COMANDO = "UPDATE persona SET Nombres = '" + nombres + "', Apellidos = '" + apellidos + "', "
            + " dni = '" + dni + "', celular = '" + celular + "', direccion = '" + direccion + "', estado = '" + estado + "', "
            + " fecha_ingres = '" + fecha + "', codigo = '" + codigo + "', observacion = '" + observacion + "' WHERE idPersona = '" + idPerson + "'";
       //out.print(COMANDO);
    rsetx = stmt.executeUpdate(COMANDO);

//response.sendRedirect("ListPerson.jsp");

%>