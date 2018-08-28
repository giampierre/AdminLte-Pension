<%-- 
    Document   : Desayunos
    Created on : 28/08/2018, 10:50:48 AM
    Author     : TIC-32
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%  
        String s_fecha_ini = "";
        String s_fecha_fin = "";

        COMANDO = "select DATE_FORMAT(sysdate(), '%d/%m/%Y') fecha_ini, DATE_FORMAT(sysdate(), '%d/%m/%Y') fecha_fin from dual ";
        rset = stmt.executeQuery(COMANDO);
        if (rset.next()) {

            s_fecha_ini = rset.getString("fecha_ini");
            s_fecha_fin = rset.getString("fecha_fin");

        }

    %>
    <body>
        <div class="box-header">
            <h3 class="box-title">Lista de Desayunos</h3>

            <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                    <input id="buscar"  type="text" onkeyup="buscarDatos()" class="form-control pull-right" placeholder="Buscar...">

                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-condensed table-hover">
                <thead>     
                    <tr>
                        <th>N°</th>
                        <th>Nombres</th>
                        <th>Desayunos</th>
                        <th>Fecha</th>
                        <th>Cantidad</th>
                        <th>Monto</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        // Seleccionando los pacientes que actualmente se están atendiendo en emergencia
                        String nombres = "";
                        String desayuno = "";
                        String cantidad = "";
                        String monto = "";
                        String fecha = "";
                        int i = 0;
                        int sumar_cantidad = 0;
                        int sumar_monto = 0;

                        COMANDO = "SELECT CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                + " if(d.estado=1,'Si Desayunó','No Desayunó') AS ESTADO,"
                                + " d.monto as monto_c, d.cantidad, d.fecha_d "
                                + "FROM persona p, pensionista pp, desayuno d "
                                + "WHERE p.idpersona = pp.idpersona "
                                + "AND pp.idpensionista = d.idpensionista ";
                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);

                        while (rset.next()) {
                            i++;
                            nombres = rset.getString("Nombres");
                            desayuno = rset.getString("ESTADO");
                            fecha = rset.getString("fecha_d");
                            cantidad = rset.getString("cantidad");
                            monto = rset.getString("monto_c");
                            sumar_cantidad += rset.getInt("cantidad");
                            sumar_monto += rset.getInt("monto_c");


                    %>

                    <tr>        
                        <td><%=i%></td>
                        <td><%=nombres%></td>  
                        <td><%=desayuno%></td> 
                        <td><%=fecha%></td> 
                        <td><%=cantidad%></td> 
                        <td><%=monto%></td> 

                    </tr>
                    <%}%>
                </tbody>
                <tfoot>
                    <tr><th colspan="4">Total Desayunos</th>
                        <th><%=sumar_cantidad%></th>
                        <th><%=sumar_monto%></th>
                    </tr>
                </tfoot>

            </table>
        </div>
    </body>
</html>
