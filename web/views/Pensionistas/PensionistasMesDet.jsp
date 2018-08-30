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
        <%            String id_pensionista = request.getParameter("f_id_pensionista");
            String nombres = request.getParameter("f_nombre");
        %>

        <div class="table-responsive">
            <table class="table table-condensed">
                <tr>
                    <td>

                        <div class="box box-solid box-info">
                            <div class="box-header">
                                <h2 class="box-title"><b>S/</b></h2>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-condensed">
                                    <%
                                        String monto_pensionista = "";
                                        String consumo_pensionista = "";
                                        String saldo_pensionista = "";
                                        String deuda = "";
                                        String color = "";
                                        String danger = "#E74C3C";
                                        String info = "#00c0ef";

                                        COMANDO = "SELECT p.idPENSIONISTA, CONCAT(pe.Nombres, ' ', pe.Apellidos) as Nombres,  p.monto, "
                                                + "(consDesa+consAlmu+consCena) as ConsTotal, "
                                                + "(p.monto-(consDesa+consAlmu+consCena)) as saldo, "
                                                + "CASE "
                                                + "WHEN (p.monto-(consDesa+consAlmu+consCena)) < 0 THEN 'Deuda' "
                                                + "WHEN (p.monto-(consDesa+consAlmu+consCena)) >= 0 THEN 'Activo' "
                                                + "ELSE '' "
                                                + "END as deuda  "
                                                + "FROM pensionista p "
                                                + "LEFT JOIN persona pe ON (p.idPERSONA = pe.idPERSONA) "
                                                + "LEFT JOIN (SELECT idPENSIONISTA, SUM(cantidad) as cantDesa, SUM(monto) as consDesa FROM "
                                                + "desayuno WHERE DATE_FORMAT(fecha_d,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') GROUP BY idPENSIONISTA) d "
                                                + "ON p.idPENSIONISTA = d.idPENSIONISTA LEFT JOIN (SELECT idPENSIONISTA, "
                                                + "SUM(cantidad) as cantAlmu, SUM(monto) as consAlmu FROM almuerzo "
                                                + "WHERE DATE_FORMAT(fecha_a,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') "
                                                + "GROUP BY idPENSIONISTA) a ON p.idPENSIONISTA = a.idPENSIONISTA "
                                                + "LEFT JOIN (SELECT idPENSIONISTA, SUM(cantidad) as cantCena, SUM(monto) as consCena "
                                                + "FROM cena WHERE DATE_FORMAT(fecha_c,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') "
                                                + "GROUP BY idPENSIONISTA) c ON p.idPENSIONISTA = c.idPENSIONISTA "
                                                + "WHERE DATE_FORMAT(fecha_ingreso,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') AND p.idPENSIONISTA = '" + id_pensionista + "' ";

                                        rset = stmt.executeQuery(COMANDO);
                                        //out.print(COMANDO);
                                        if (rset.next()) {
                                            monto_pensionista = rset.getString("monto");
                                            consumo_pensionista = rset.getString("ConsTotal");
                                            saldo_pensionista = rset.getString("saldo");
                                            deuda = rset.getString("deuda");

                                            if (deuda.equals("Deuda")) {
                                                color = danger;
                                            }
                                            if (deuda.equals("Activo")) {
                                                color = info;
                                            }

                                    %>
                                    <%}%>
                                    <thead>
                                        <tr>
                                            <th>Monto</th>
                                            <th><span style="font-size: 15px; text-align: center;" class="badge bg-green">S/&nbsp;<%=monto_pensionista%></span></th>
                                        </tr>
                                        <tr>
                                            <th>Consumo</th>
                                            <th><span style="font-size: 15px; text-align: center;" class="badge bg-yellow">S/&nbsp;<%=consumo_pensionista%></span></th>
                                        </tr>
                                        <tr>
                                            <th>Saldo</th>
                                            <th><span style="font-size: 15px; text-align: center;" class="badge bg-aqua-active">S/&nbsp;<%=saldo_pensionista%></span></th> 
                                        </tr>
                                        <tr bgcolor="<%=color%>">
                                            <th style="text-align: center; color: #FFF;" colspan="2"><%=deuda%></th>
                                        </tr>
                                    </thead>

                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </td>

                    <td>
                        <div class="box box-solid box-primary">
                            <%
                                String mombre_pensionista = "";
                                COMANDO = "SELECT p.idPENSIONISTA, CONCAT(pe.Nombres, ' ', pe.Apellidos) as Nombres "
                                        + "FROM pensionista p "
                                        + "LEFT JOIN persona pe ON (p.idPERSONA = pe.idPERSONA) "
                                        + "WHERE DATE_FORMAT(fecha_ingreso,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') "
                                        + "AND p.idPENSIONISTA = '" + id_pensionista + "' ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.print(COMANDO);
                                if (rset.next()) {
                                    mombre_pensionista = rset.getString("Nombres");

                            %>
                            <%}%>
                            <div class="box-header">
                                <h3 class="box-title fa fa-male">&nbsp;&nbsp;<%=mombre_pensionista%></h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-bordered table-condensed table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;" colspan="2">Desayunos</th>
                                            <th style="text-align: center;" colspan="2">Almuerzos</th>
                                            <th style="text-align: center;" colspan="2">Cenas</th>
                                            <th style="text-align: center;" colspan="2">Total</th>
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
                                        <%

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
                            <!-- /.box-body -->
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
<!--%=formateador2.format()%-->