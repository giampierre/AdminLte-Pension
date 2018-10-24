<%-- 
 
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%      
    String idAlmuerzo = request.getParameter("idalmuerzo");
    String nomb = request.getParameter("idpensionista");
    String estad = request.getParameter("estado");
    String fecha = request.getParameter("fecha");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double monto = Double.parseDouble(request.getParameter("monto"));

    int rsetx = 0;
    COMANDO = "UPDATE almuerzo SET idpensionista = '" + nomb + "', "
            + " estado = '" + estad + "', "
            + " fecha_a = '" + fecha + "', monto = '" + monto + "', cantidad = '" + cantidad + "' WHERE idAlmuerzo= '" + idAlmuerzo + "'";
       out.print(COMANDO);
    rsetx = stmt.executeUpdate(COMANDO);

//response.sendRedirect("ListPerson.jsp");

%>