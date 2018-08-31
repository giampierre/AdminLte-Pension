<%-- 
    Document   : DesaDiaDet
    Created on : 28/08/2018, 12:33:28 PM
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

                        COMANDO = "SELECT d.idCENA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Cenó','No Cenó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_c "
                                        + " FROM persona p, pensionista pp, cena d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND DATE_FORMAT(d.fecha_c,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y') "
                                        + "ORDER BY d.fecha_c DESC";
                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);

                        while (rset.next()) {
                            i++;
                            nombres = rset.getString("Nombres");
                            fecha = rset.getString("fecha_c");
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
                        out.println("No se registraron cenas el día de hoy");
                    }
                %>

            </p>

        </div>
    </body>
</html>
