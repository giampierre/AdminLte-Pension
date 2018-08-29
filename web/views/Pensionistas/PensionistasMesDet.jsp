<%-- 
    Document   : PensionistasMesDet
    Created on : 29/08/2018, 10:19:29 AM
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
                        <th style="vertical-align: middle; text-align: center;" rowspan="2">Nombres</th>
                        <th colspan="2">Desayunos</th>
                        <th colspan="2">Almuerzos</th>
                        <th colspan="2">Cenas</th>
                        <th colspan="2">Total</th>
                    </tr>
                    <tr>
                        <th> Cantidad </th>
                        <th> Consumo </th>
                        <th> Cantidad </th>
                        <th> Consumo </th>
                        <th> Cantidad </th>
                        <th> Consumo  </th>
                        <th> Cantidad </th>
                        <th> Consumo </th>
                    </tr>
                </thead>
                <tbody>
                    <%                    String id_pensionista = request.getParameter("f_id_pensionista");
                        String nombres = "";
                        String cantDesa = "";
                        String consDesa = "";
                        String cantAlmu = "";
                        String consAlmu = "";
                        String cantCena = "";
                        String consCena = "";
                        String totalCantidad = "";
                        String totalConsumo = "";
                        int i = 0;

                        COMANDO = "SELECT p.idPENSIONISTA, CONCAT(pe.Nombres, ' ', pe.Apellidos) as Nombres,"
                                + "cantDesa, consDesa, cantAlmu, consAlmu, cantCena, consCena, "
                                + "(cantDesa+cantAlmu+cantCena) as CantTotal, (consDesa+consAlmu+consCena) as ConsTotal "
                                + "FROM pensionista p "
                                + "LEFT JOIN persona pe ON (p.idPERSONA = pe.idPERSONA) "
                                + "LEFT JOIN "
                                + "(SELECT idPENSIONISTA, SUM(cantidad) as cantDesa,"
                                + " SUM(monto) as   consDesa "
                                + "FROM desayuno WHERE DATE_FORMAT(fecha_d,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') "
                                + "GROUP BY idPENSIONISTA) d "
                                + "ON p.idPENSIONISTA = d.idPENSIONISTA "
                                + "LEFT JOIN "
                                + "(SELECT idPENSIONISTA, SUM(cantidad) as cantAlmu, SUM(monto) as consAlmu "
                                + "FROM almuerzo WHERE DATE_FORMAT(fecha_a,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') "
                                + "GROUP BY idPENSIONISTA) a "
                                + "ON p.idPENSIONISTA = a.idPENSIONISTA "
                                + "LEFT JOIN "
                                + "(SELECT idPENSIONISTA, SUM(cantidad) as cantCena, SUM(monto) as consCena "
                                + "FROM cena WHERE DATE_FORMAT(fecha_c,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') "
                                + "GROUP BY idPENSIONISTA) c "
                                + "ON p.idPENSIONISTA = c.idPENSIONISTA "
                                + "WHERE DATE_FORMAT(fecha_ingreso,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') "
                                + "AND p.idPENSIONISTA = '" + id_pensionista + "'";

                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);

                        while (rset.next()) {
                            i++;
                            nombres = rset.getString("Nombres");
                            cantDesa = rset.getString("cantDesa");
                            consDesa = rset.getString("consDesa");
                            cantAlmu = rset.getString("cantAlmu");
                            consAlmu = rset.getString("consAlmu");
                            cantCena = rset.getString("cantCena");
                            consCena = rset.getString("consCena");
                            totalCantidad = rset.getString("CantTotal");
                            totalConsumo = rset.getString("ConsTotal");


                    %>
                    <tr>
                        <td><%=nombres%></td>
                        <td bgcolor="#ffeeba"><%=cantDesa%></td>
                        <td bgcolor="#ffeeba">S/&nbsp;<%=consDesa%></td>
                        <td bgcolor="#c3e6cb"><%=cantAlmu%></td>
                        <td bgcolor="#c3e6cb">S/&nbsp;<%=consAlmu%></td>
                        <td bgcolor="#b8daff"><%=cantCena%></td>
                        <td bgcolor="#b8daff">S/&nbsp;<%=consCena%></td>
                        <td style="color: blue;" bgcolor="#dee2e6"><%=totalCantidad%></td>
                        <td style="color: blue;" bgcolor="#dee2e6">S/&nbsp;<%=totalConsumo%></td>

                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
<!--%=formateador2.format()%-->