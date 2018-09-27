<%-- 
 
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%      
    String idDesayuno = request.getParameter("iddesayuno");
    String nomb = request.getParameter("idpensionista");
    String estad = request.getParameter("estado");
    String fecha = request.getParameter("fecha");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double monto = Double.parseDouble(request.getParameter("monto"));

    int rsetx = 0;
    COMANDO = "UPDATE desayuno SET idpensionista = '" + nomb + "', "
            + " estado = '" + estad + "', "
            + " fecha_d = '" + fecha + "', monto = '" + monto + "', cantidad = '" + cantidad + "' WHERE idDesayuno= '" + idDesayuno + "'";
       out.print(COMANDO);
    rsetx = stmt.executeUpdate(COMANDO);

//response.sendRedirect("ListPerson.jsp");

%>