<%-- 
    Document   : savePersona
    Created on : 18/09/2018, 08:39:59 AM
    Author     : TIC-32
--%>
<%@ include file="../../conectadb.jsp" %>


<%            
    String nomb = request.getParameter("nombres");
    String estad = request.getParameter("estado");
    //String fech = request.getParameter("fechaingreso");
    String tipo = request.getParameter("tipo");
    double monto = Double.parseDouble(request.getParameter("monto"));

    int rset01 = 0;

    COMANDO = "INSERT INTO PENSIONISTA (idPENSIONISTA, idPERSONA, "
            + " estado, fecha_ingreso, tipo, monto) "
            + " VALUES (null,'" + nomb + "', "
            + " '" + estad + "', sysdate(), '" + tipo + "', '" + monto + "') ";
    out.print(COMANDO);
    rset01 = stmt.executeUpdate(COMANDO);

  

%>	





