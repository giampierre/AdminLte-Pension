<%-- 
    Document   : savePersona
    Created on : 18/09/2018, 08:39:59 AM
    Author     : TIC-32
--%>
<%@ include file="../../conectadb.jsp" %>


<%            
    String nomb = request.getParameter("nombres");
    String estad = request.getParameter("estado");
    //String fech = request.getParameter("fecha");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double monto = Double.parseDouble(request.getParameter("monto"));

    int rset01 = 0;

    COMANDO = "INSERT INTO ALMUERZO (idALMUERZO, idPENSIONISTA, "
            + " estado, fecha_A, cantidad, monto) "
            + " VALUES (null,'" + nomb + "', "
            + " '" + estad + "', sysdate(), '" + cantidad + "', '" + monto + "') ";
    out.print(COMANDO);
    rset01 = stmt.executeUpdate(COMANDO);
                    

%>	



