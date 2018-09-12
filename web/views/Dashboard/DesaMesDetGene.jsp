<%-- 
    Document   : DesaMesDetGene
    Created on : 10/09/2018, 05:00:41 PM
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
                        <th>Cantidad</th>
                        <!--th>Monto</th-->
                    </tr>
                </thead>
                <tbody>
                    <%                        String nombres = "";
                        String cantidad = "";
                        String monto = "";
                        String fecha = "";
                        int totalCantidad = 0;
                        int i = 0;

                        COMANDO = "SELECT d.idDESAYUNO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Desayunó','No Desayunó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_d "
                                        + "FROM persona p, pensionista pp, desayuno d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND pp.tipo = '0' "
                                        + "AND DATE_FORMAT(d.fecha_d,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') ";

                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);

                        while (rset.next()) {
                            i++;
                            nombres = rset.getString("Nombres");
                            fecha = rset.getString("fecha_d");
                            cantidad = rset.getString("cantidad");
                            monto = rset.getString("monto_c");
                            totalCantidad += rset.getInt("cantidad");


                    %>

                    <tr>        
                        <td><%=i%></td>
                        <td><%=nombres%></td>
                        <td><%=fecha%></td> 
                        <td><%=cantidad%></td> 
                        <!--td><!--%=monto%></td--> 

                    </tr>
                    <%}%>
                </tbody>
                <!--tfoot>
                    <tr>
                        <th align="center" colspan="3">cantidad de desayunos del mes</th>
                        <th><!--%=totalCantidad%></th>
                    </tr>
                </tfoot-->

            </table>
            <!--Si hay registros -->
            <p style="text-align: center;">
                <%
                    if (i == 0) {
                        out.println("No se registraron desayunos generales en el mes");
                    }
                %>

            </p>
        </div>
    </body>
</html>
