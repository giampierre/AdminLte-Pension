<%-- 
    Document   : List
    Created on : 15-jul-2018, 15:19:39
    Author     : Elvis
--%>

<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="dist/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="dist/js/buscador.js" type="text/javascript"></script>      
        <title>JSP Page</title>
        <script>

            function myModalAdd() {
                $('#insertar').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                $('#insertar').load('mantenimiento/desayuno/AddFormDesayuno.jsp');

            }
            function myModalEdit(id) {
                $('#editar').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                $('#editar').load('mantenimiento/desayuno/EditFormDesayuno.jsp?f_id=' + id);

            }
            function myModalElim(id) {
                $('#eliminar').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                $('#eliminar').load('mantenimiento/desayuno/DeleteFormDesayuno.jsp?f_id=' + id);

            }
        </script>
    </head>
    <body>
        <%            
            String s_mes_ini = request.getParameter("f_mes_ini");
            String s_anio_ini = request.getParameter("f_anio_ini");
            String s_tipo = request.getParameter("f_tipo");
        %>

        <!--div class="panel-heading" style="color:#0D5458"> <h5>Lista de Personas</h5></div-->
        <div class="box-header">
            <h3 class="box-title">
                <a data-toggle="modal" onclick="myModalAdd()" data-target="#myModalAdd">
                    <button class="btn btn-primary btn-xs fa fa-user-plus"></button>&nbsp;
                </a></h3>

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
            <table class="table table-bordered table-condensed table-hover">
                <thead>     
                    <tr>
                        <th>N°</th>
                        <th>Nombres</th>
                        <th>Tipo</th>
                        <th>Estado</th>
                        <th>Fecha</th>
                        <th>Cantidad</th>
                        <th>Monto</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody id="datos">
                    <%                       
                        String id = "";
                        String nombres = "";
                        String tipo = "";
                        String estado = "";
                        String fecha = "";
                        int cantidad = 0;
                        double monto = 0.0;
                        int i = 0;
         

                        COMANDO = "SELECT iddesayuno, nom_pen(d.idpensionista) AS Nombres, p.tipo, IF(p.tipo=0, 'General', 'Ejecutivo') as nom_tipo, "
                                + "d.estado, IF(d.estado=0, 'Desayunó', 'Para llevar') AS nom_estado, "
                                + "fecha_d, cantidad, d.monto "
                                + "FROM desayuno d "
                                + "INNER JOIN  pensionista p "
                                + "ON (d.idPENSIONISTA = p.idPENSIONISTA) "
                                + "WHERE DATE_FORMAT(d.fecha_d,'%Y%m') = '" + s_anio_ini + s_mes_ini + "' "
                                + "AND p.tipo = '" + s_tipo + "' ";
                        
                        rset = stmt.executeQuery(COMANDO);
                             //out.println(COMANDO);

                        while (rset.next()) {
                            i++;
                            id = rset.getString("iddesayuno");
                            nombres = rset.getString("Nombres");
                            tipo = rset.getString("nom_tipo");
                            estado = rset.getString("nom_estado");
                            fecha = rset.getString("fecha_d");
                            cantidad = rset.getInt("cantidad");
                            monto = rset.getDouble("monto");
  


                    %>

                    <tr>        
                        <td><%=i%></td>
                        <td><%=nombres%></td>
                        <td><%=tipo%></td> 
                        <td><%=estado%></td> 
                        <td><%=fecha%></td> 
                        <td><%=cantidad%></td> 
                        <td><%=monto%></td>                   
                        <td>
                            <div class="btn-group">
                                <a title="Editar"  data-toggle="modal" onclick="myModalEdit('<%=id%>')" data-target="#myModalEdit"><button class="btn btn-warning btn-xs glyphicon glyphicon-edit"></button></a>
                                <a title="Eliminar"  data-toggle="modal" onclick="myModalElim('<%=id%>')" data-target="#myModalElim"><button class="btn btn-danger btn-xs glyphicon glyphicon-trash"></button></a>
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
                        out.println("No existen registros en este periodo.");
                    }
                %>

            </p>
        </div>
        <div id="myModalAdd" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        Registrar Pensionista
                        <!--button style="opacity: 10!important;" class="close glyphicon glyphicon-remove-sign text-red" data-dismiss="modal"></button-->
                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                    </div>
                    <div class="modal-body">
                        <div id="insertar">

                        </div>

                    </div>
                </div>
            </div>    
        </div>
        <div id="myModalEdit" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        Editar
                        <!--button style="opacity: 10!important;" class="close glyphicon glyphicon-remove-sign text-red" data-dismiss="modal"></button--> 
                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                    </div>
                    <div class="modal-body">
                        <div id="editar">

                        </div>

                    </div>
                </div>
            </div>    
        </div>
        <div id="myModalElim" class="modal fade" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        ¿Seguro que desea eliminar el registro?
                        <!--button style="opacity: 10!important;" class="close glyphicon glyphicon-remove-sign text-red" data-dismiss="modal"></button--> 
                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                    </div>
                    <div class="modal-body">
                        <div id="eliminar">

                        </div>

                    </div>
                </div>
            </div>    
        </div>

    </body>
</html>



