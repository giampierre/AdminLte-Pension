<%-- 
    Document   : savePersona
    Created on : 18/09/2018, 08:39:59 AM
    Author     : TIC-32
--%>
<%@ include file="../../conectadb.jsp" %>


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

  

%>	
