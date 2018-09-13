<%-- 
    Document   : addPerson
    Created on : 15-jul-2018, 16:19:50
    Author     : Elvis
--%>

<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="dist/js/jquery-1.12.4.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>

    <body>

        <%            String nomb = request.getParameter("nombres");
            String apell = request.getParameter("apellidos");
            String dni = request.getParameter("dni");
            String cell = request.getParameter("celular");
            String dir = request.getParameter("direccion");
            String estad = request.getParameter("estado");
            //String fech = request.getParameter("fechaingreso");
            String codig = request.getParameter("codigo");
            String observ = request.getParameter("observacion");

            int rset01 = 0;

            COMANDO = "INSERT INTO PERSONA (idPERSONA, Nombres, Apellidos, dni, celular, "
                    + "direccion, estado, fecha_ingres, codigo, observacion) "
                    + " VALUES (null,'" + nomb + "', '" + apell + "', '" + dni + "', '" + cell + "', "
                    + " '" + dir + "', '" + estad + "', sysdate(), '" + codig + "', '" + observ + "') ";
            out.print(COMANDO);
            rset01 = stmt.executeUpdate(COMANDO);

            //response.sendRedirect("ListPerson.jsp");

        %>	 
    </body>
</html>





