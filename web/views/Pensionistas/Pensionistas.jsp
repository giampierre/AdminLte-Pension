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
        <script>

            function myModal(s_id_pensionista) {
                $('#detalle').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                $('#detalle').load('views/Pensionistas/PensionistasDet.jsp?f_id_pensionista=' + s_id_pensionista);

            }

        </script>
    </head>
    <body>
        <%            
            String s_mes_ini = request.getParameter("f_mes_ini");
            String s_anio_ini = request.getParameter("f_anio_ini");
            String s_tipo = request.getParameter("f_tipo");

        %>
        <div class="box-header">
            <h3 class="box-title"><button class="btn btn-primary btn-xs fa fa-user-plus"></button>&nbsp;</h3>

            <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                    <input id="buscar"  type="text" onkeyup="buscarDatos()" class="form-control pull-right" placeholder="Buscar...">

                    <div class="input-group-btn">
                        <button  class="btn btn-default"><i class="fa fa-search"></i></button>
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
                    <%                        
                        String nombres = "";
                        String dni = "";
                        String celular = "";
                        String direccion = "";
                        String nota = "";
                        String estado = "";
                        String fecha_ingreso = "";
                        String mes_actual = "";
                        int s_id_pensionista = 0;
                        double monto = 0.0;
                        int i = 0;
                        String color = "";
                        String danger = "#f5c6cb";
                        String blanco = "#fff";
                        String verde = "#c3e6cb";

                        COMANDO = "SELECT pe.idpensionista, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                + "p.dni, p.celular, p.direccion, p.observacion,"
                                + "pe.estado, DATE_FORMAT(pe.fecha_ingreso,'%d/%m/%Y') as fecha_ingreso, pe.monto, "
                                + "CASE "
                                + "WHEN DATE_FORMAT(pe.fecha_ingreso,'%Y%m') = DATE_FORMAT(sysdate(), '%Y%m') THEN '1' "
                                + "WHEN DATE_FORMAT(pe.fecha_ingreso,'%Y%m') = DATE_FORMAT(pe.fecha_ingreso,'%Y%m') THEN '0' "
                                + "ELSE '' "
                                + "END as mes_actual "
                                + "FROM persona p, pensionista pe "
                                + "WHERE p.idPERSONA = pe.idPERSONA "
                                + "AND DATE_FORMAT(pe.fecha_ingreso,'%Y%m') = '" + s_anio_ini + s_mes_ini + "' "
                                + "AND pe.tipo = '" + s_tipo + "' "
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
                            s_id_pensionista = rset.getInt("idpensionista");

                            if (mes_actual.equals("0")) {
                                color = danger;
                            }
                            if (mes_actual.equals("1")) {
                                color = blanco;
                            }
                            if (estado.equals("1")) {
                                color = verde;
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
                                <a><button class="btn btn-warning btn-xs glyphicon glyphicon-edit"></button></a>
                                <a><button class="btn btn-danger btn-xs glyphicon glyphicon-trash"></button></a>
                                <a id="modal_desaUno" data-toggle="modal" onclick="myModal('<%=s_id_pensionista%>')" data-target="#myModal"><button class="btn btn-info btn-xs glyphicon glyphicon-eye-open"></button></a>
                                <a href="views/Pensionistas/CambiarEstadoPago.jsp?f_idpensionista=<%=s_id_pensionista%>"><button class="btn btn-success btn-xs glyphicon glyphicon-refresh"></button></a>
                                <%if(estado.equals("1")){%>
                                 <a class=" glyphicon glyphicon-ok"></a>
                                <%}else{%>
                                 <a class=" glyphicon glyphicon-remove"></a>
                                 <%}%>
                            </div>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <!--Si hay registros -->
            <p style="text-align: center;">
                <%
                    if (i == 0) {
                        out.println("No se registraron pensionistas en este perido");
                    }
                %>

            </p>
        </div>
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        Detalle consumo 
                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                    </div>
                    <div class="modal-body">
                        <div id="detalle">

                        </div>

                    </div>
                </div>
            </div>    
        </div>
    </body>
</html>
