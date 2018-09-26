<%-- 
 
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%      
    String idPensionista = request.getParameter("idpensionista");
    String nombres = request.getParameter("idpersona");
    String estado = request.getParameter("estado");
    String fecha_ingres = request.getParameter("fechaingreso");
    String monto = request.getParameter("monto");
    String tipo = request.getParameter("tipo");

    int rsetx = 0;
    COMANDO = "UPDATE pensionista SET idpersona = '" + nombres + "', "
            + " estado = '" + estado + "', "
            + " fecha_ingreso = '" + fecha_ingres + "', monto = '" + monto + "', tipo = '" + tipo + "' WHERE idPensionista = '" + idPensionista + "'";
       out.print(COMANDO);
    rsetx = stmt.executeUpdate(COMANDO);

//response.sendRedirect("ListPerson.jsp");

%>