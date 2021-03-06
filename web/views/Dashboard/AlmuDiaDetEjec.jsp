<%-- 
    Document   : AlmuDiaDetEjec
    Created on : 11/09/2018, 08:15:35 AM
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
        <div class="table-responsive">
            <table class="table table-bordered table-condensed table-hover">
                <thead>     
                    <tr>
                        <th>N°</th>
                        <th>Nombres</th>
                        <th>Fecha</th>
                        <!--th>Cantidad</th>
                        <th>Monto</th-->
                    </tr>
                </thead>
                <tbody>
                    <%                        
                        String nombres = "";
                        String cantidad = "";
                        String monto = "";
                        String fecha = "";
                        int i = 0;

                        COMANDO = "SELECT d.idALMUERZO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Almorzó','No Almorzó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_a "
                                        + " FROM persona p, pensionista pp, almuerzo d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND pp.tipo = '1' "
                                        + " AND DATE_FORMAT(d.fecha_a,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y') ";
                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);

                        while (rset.next()) {
                            i++;
                            nombres = rset.getString("Nombres");
                            fecha = rset.getString("fecha_a");
                            cantidad = rset.getString("cantidad");
                            monto = rset.getString("monto_c");


                    %>

                    <tr>        
                        <td><%=i%></td>
                        <td><%=nombres%></td>
                        <td><%=fecha%></td> 
                        <!--td><!--%=cantidad%></td> 
                        <td><!--%=monto%></td-->                       
                    </tr>
                    <%}%>


                </tbody>


            </table>
                    <!--Si hay registros -->
            <p style="text-align: center;">
                <%
                    if (i == 0) {
                        out.println("No se registraron almuerzos ejecutivos el día de hoy");
                    }
                %>

            </p>

        </div>
    </body>
</html>

