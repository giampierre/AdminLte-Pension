<%-- 
    Document   : EditPerson
    Created on : 15-jul-2018, 22:21:37
    Author     : Elvis
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%      
    String idPerson = request.getParameter("idpersona");
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String dni = request.getParameter("dni");
    String celular = request.getParameter("celular");
    String direccion = request.getParameter("direccion");
    String estado = request.getParameter("estado");
    String fecha_ingres = request.getParameter("fecha_ingres");
    String codigo = request.getParameter("codigo");
    String observacion = request.getParameter("observacion");

    int rsetx = 0;
    COMANDO = "UPDATE persona SET Nombres = '" + nombres + "', Apellidos = '" + apellidos + "', "
            + " dni = '" + dni + "', celular = '" + celular + "', direccion = '" + direccion + "', estado = '" + estado + "', "
            + " fecha_ingres = '" + fecha_ingres + "', codigo = '" + codigo + "', observacion = '" + observacion + "' WHERE idPersona = '" + idPerson + "'";
       //out.print(COMANDO);
    rsetx = stmt.executeUpdate(COMANDO);

//response.sendRedirect("ListPerson.jsp");

%>