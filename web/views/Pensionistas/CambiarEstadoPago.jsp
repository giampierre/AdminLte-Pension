<%-- 
    Document   : CambiarEstadoPago
    Created on : 05/09/2018, 10:36:41 AM
    Author     : TIC-32
--%>
<%@include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <title>JSP Page</title>
    </head>
    <body>
        <%            
           String idPensionista = request.getParameter("idpensionista");
        

            int rsetx = 0;
            COMANDO = "update pensionista set estado = '1' where idpensionista='" + idPensionista + "' ";
            rsetx = stmt.executeUpdate(COMANDO);

        %>
    </body>
</html>
