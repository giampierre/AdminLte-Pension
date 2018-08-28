<%-- 
    Document   : Pensionistas
    Created on : 27/08/2018, 04:22:04 PM
    Author     : TIC-32
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="dist/js/buscador.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="box-header">
            <h3 class="box-title"><button class="btn btn-primary btn-xs fa fa-user-plus"></button>&nbsp; Lista de Pensionistas </h3>

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
            <table class="table table-bordered table-condensed table-hover" >
                <thead> 
                    <tr>
                        <th>N°</th>
                        <th>Nombres</th>
                        <th>DNI</th>
                        <th>Celular</th>
                        <th>Dirección</th>
                        <th>Nota</th>
                        <th>Registrado</th>
                        <th>S/</th>
                        <!--th>Actual</th-->
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody id="datos">
                    <%                        // Seleccionando los pacientes que actualmente se están atendiendo en emergencia
                        String nombres = "";
                        String dni = "";
                        String celular = "";
                        String direccion = "";
                        String nota = "";
                        String estado = "";
                        String fecha_ingreso = "";
                        String mes_actual = "";
                        double monto = 0.0;
                        int i = 0;
                        String color = "";
                        String azul = "#AED6F1";
                        String blanco = "#fff";

                        COMANDO = "SELECT CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                + "p.dni, p.celular, p.direccion, p.observacion,"
                                + "IF(pe.estado=1, 'Activo', 'Inactivo') AS estado, pe.fecha_ingreso, pe.monto, "
                                + "CASE "
                                + "WHEN DATE_FORMAT(pe.fecha_ingreso,'%Y%m') = DATE_FORMAT(sysdate(), '%Y%m') THEN '1' "
                                + "WHEN DATE_FORMAT(pe.fecha_ingreso,'%Y%m') = DATE_FORMAT(pe.fecha_ingreso,'%Y%m') THEN '0' "
                                + "ELSE '' "
                                + "END as mes_actual "
                                + "FROM persona p, pensionista pe "
                                + "WHERE p.idPERSONA = pe.idPERSONA "
                                + "order by DATE_FORMAT(pe.fecha_ingreso,'%Y%m') desc";
                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);
                        while (rset.next()) {
                            i++;
                            nombres = rset.getString("Nombres");
                            dni = rset.getString("dni");
                            celular = rset.getString("celular");
                            direccion = rset.getString("direccion");
                            nota = rset.getString("observacion");
                            estado = rset.getString("estado");
                            fecha_ingreso = rset.getString("fecha_ingreso");
                            monto = rset.getDouble("monto");
                            mes_actual = rset.getString("mes_actual");

                            if (mes_actual.equals("1")) {
                                color = azul;
                            }
                            if (mes_actual.equals("0")) {
                                color = blanco;
                            }

                    %>

                    <tr bgcolor="<%=color%>" >        
                        <td><%=i%></td>
                        <td><%=nombres%></td>  
                        <td><%=dni%></td> 
                        <td><%=celular%></td> 
                        <td><%=direccion%></td> 
                        <td><%=nota%></td> 
                        <!--td><%=estado%></td--> 
                        <td><%=fecha_ingreso%></td> 
                        <td><%=monto%></td> 
                        <!--td><%=mes_actual%></td--> 
                        <td>
                            <div class="btn-group">
                                <button class="btn btn-warning btn-xs glyphicon glyphicon-edit"></button>
                                <button class="btn btn-danger btn-xs glyphicon glyphicon-trash"></button>
                            </div>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
