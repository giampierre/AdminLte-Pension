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
                                        double monto_pensionista = 0.0;
                                        double consumo_pensionista = 0.0;
                                        double saldo_pensionista = 0.0;
                                        String deuda = "";
                                        String color = "";
                                        String danger = "#E74C3C";
                                        String info = "#00c0ef";

                                         COMANDO = "SELECT p.idPENSIONISTA, CONCAT(pe.Nombres, ' ', pe.Apellidos) as Nombres, p.monto, "
                                                    + "IFNULL(consDesa, 0) as consDesa, "
                                                    + "IFNULL(consAlmu, 0) as consAlmu, "
                                                    + "IFNULL(consCena, 0) as consCena "
                                                    + "FROM pensionista p "
                                                    + "LEFT JOIN persona pe ON (p.idPERSONA = pe.idPERSONA) "
                                                    + "LEFT JOIN "
                                                    + "(SELECT idPENSIONISTA, SUM(cantidad) as cantDesa,"
                                                    + " SUM(monto) as   consDesa "
                                                    + "FROM desayuno "
                                                    + "GROUP BY idPENSIONISTA) d "
                                                    + "ON p.idPENSIONISTA = d.idPENSIONISTA "
                                                    + "LEFT JOIN "
                                                    + "(SELECT idPENSIONISTA, SUM(cantidad) as cantAlmu, SUM(monto) as consAlmu "
                                                    + "FROM almuerzo "
                                                    + "GROUP BY idPENSIONISTA) a "
                                                    + "ON p.idPENSIONISTA = a.idPENSIONISTA "
                                                    + "LEFT JOIN "
                                                    + "(SELECT idPENSIONISTA, SUM(cantidad) as cantCena, SUM(monto) as consCena "
                                                    + "FROM cena "
                                                    + "GROUP BY idPENSIONISTA) c "
                                                    + "ON p.idPENSIONISTA = c.idPENSIONISTA "
                                                    + "WHERE p.idPENSIONISTA = '" + id_pensionista + "'";
                                         

                                        rset = stmt.executeQuery(COMANDO);
                                        //out.print(COMANDO);
                                        if (rset.next()) {
                                            monto_pensionista = rset.getDouble("monto");
                                            consumo_pensionista = rset.getDouble("consDesa") + rset.getDouble("consAlmu") + rset.getDouble("consCena");
                                            saldo_pensionista = monto_pensionista - consumo_pensionista;
                
                                            if (saldo_pensionista < 0) {
                                                //out.println("deuda");
                                                color = danger;
                                            }
                                            if (saldo_pensionista >= 0) {
                                                //out.println("Activo");
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
                                            <th style="text-align: center; color: #FFF;" colspan="2"><% if(saldo_pensionista < 0){out.println("Deuda");} else { out.println("Activo"); }%></th>
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
                                        + " WHERE p.idPENSIONISTA = '" + id_pensionista + "' ";

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

                                            int cantDesa = 0;
                                            double consDesa = 0.0;
                                            int cantAlmu = 0;
                                            double consAlmu = 0.0;
                                            int cantCena = 0;
                                            double consCena = 0.0;
                                            int totalCantidad = 0;
                                            double totalConsumo = 0.0;
                                            int i = 0;

                                            COMANDO = "SELECT p.idPENSIONISTA, CONCAT(pe.Nombres, ' ', pe.Apellidos) as Nombres, "
                                                    + "IFNULL(cantDesa, 0) as cantDesa,IFNULL(consDesa, 0) as consDesa,IFNULL(cantAlmu, 0) as cantAlmu, "
                                                    + "IFNULL(consAlmu, 0) as consAlmu, IFNULL(cantCena, 0) as cantCena,IFNULL(consCena, 0) as consCena "
                                                    + "FROM pensionista p "
                                                    + "LEFT JOIN persona pe ON (p.idPERSONA = pe.idPERSONA) "
                                                    + "LEFT JOIN "
                                                    + "(SELECT idPENSIONISTA, SUM(cantidad) as cantDesa,"
                                                    + " SUM(monto) as   consDesa "
                                                    + "FROM desayuno "
                                                    + "GROUP BY idPENSIONISTA) d "
                                                    + "ON p.idPENSIONISTA = d.idPENSIONISTA "
                                                    + "LEFT JOIN "
                                                    + "(SELECT idPENSIONISTA, SUM(cantidad) as cantAlmu, SUM(monto) as consAlmu "
                                                    + "FROM almuerzo "
                                                    + "GROUP BY idPENSIONISTA) a "
                                                    + "ON p.idPENSIONISTA = a.idPENSIONISTA "
                                                    + "LEFT JOIN "
                                                    + "(SELECT idPENSIONISTA, SUM(cantidad) as cantCena, SUM(monto) as consCena "
                                                    + "FROM cena "
                                                    + "GROUP BY idPENSIONISTA) c "
                                                    + "ON p.idPENSIONISTA = c.idPENSIONISTA "
                                                    + "WHERE p.idPENSIONISTA = '" + id_pensionista + "'";

                                            rset = stmt.executeQuery(COMANDO);
                                            //out.println(COMANDO);

                                            while (rset.next()) {
                                                i++;
                                                cantDesa = rset.getInt("cantDesa");
                                                consDesa = rset.getDouble("consDesa");
                                                cantAlmu = rset.getInt("cantAlmu");
                                                consAlmu = rset.getDouble("consAlmu");
                                                cantCena = rset.getInt("cantCena");
                                                consCena = rset.getDouble("consCena");
                                                totalCantidad = rset.getInt("cantDesa") + rset.getInt("cantAlmu") + rset.getInt("cantCena");
                                                totalConsumo = rset.getDouble("consDesa") + rset.getDouble("consAlmu") + rset.getDouble("consCena");


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