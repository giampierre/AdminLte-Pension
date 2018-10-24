<%-- 
 
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%      
    String idCena = request.getParameter("idcena");
    String nomb = request.getParameter("idpensionista");
    String estad = request.getParameter("estado");
    String fecha = request.getParameter("fecha");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double monto = Double.parseDouble(request.getParameter("monto"));

    int rsetx = 0;
    COMANDO = "UPDATE cena SET idpensionista = '" + nomb + "', "
            + " estado = '" + estad + "', "
            + " fecha_c = '" + fecha + "', monto = '" + monto + "', cantidad = '" + cantidad + "' WHERE idCena= '" + idCena + "'";
       out.print(COMANDO);
    rsetx = stmt.executeUpdate(COMANDO);

//response.sendRedirect("ListPerson.jsp");

%>