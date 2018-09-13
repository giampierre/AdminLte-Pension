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
        <script src="dist/js/buscador.js" type="text/javascript"></script>      
        <script src="dist/js/bootbox.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <script>

            function myModalAdd() {
                $('#detalle').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                $('#detalle').load('mantenimiento/persona/AddFormPerson.jsp');

            }
            function myModalEdit(id) {
                $('#EditPerson').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                $('#EditPerson').load('mantenimiento/persona/EditFormPerson.jsp?f_id=' + id);

            }
        </script>
        <script>
            $(document).ready(function () { 
            $(document).on("click", ".ejecuta", function () {
                var id = $(this).data("id");
                bootbox.confirm({
                    message: "¿Seguro que desea eliminar?",
                    buttons: {
                        cancel: {
                            label: 'Si',
                            className: 'btn-success'
                        },
                        confirm: {
                            label: 'No',
                            className: 'btn-danger'
                        }

                    },
                    callback: function (result) {
                        if (result === false) {
                            $.get("mantenimiento/persona/DeletePerson.jsp", "f_idpersona=" + id, function () {
                                var dialog = bootbox.dialog({
                                    message: '<p class="text-center">Se Actualizo con Exito</p>',
                                    closeButton: false
                                });
                                setTimeout(function () {
                                    dialog.modal('hide');
                                    //location.reload();
                                }, 3000);
                                //location.reload();
                            });
                        } else {
                            var dialog = bootbox.dialog({
                                message: '<p class="text-center">Se cancelo la solicitud</p>',
                                closeButton: false
                            });
                            setTimeout(function () {
                                dialog.modal('hide');
                                /* location.reload();*/
                            }, 3000);
                        }
                    }
                });

            });
            });
        </script>
    </head>
    <body>
        <%            String s_mes_ini = request.getParameter("f_mes_ini");
            String s_anio_ini = request.getParameter("f_anio_ini");
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
            <table class="table table-bordered table-condensed table-hover" >
                <thead> 
                    <tr>
                        <th>#</th>
                        <!--<th>ID</th>-->
                        <th>Nombres</th>
                        <th>DNI</th>
                        <th>Dirección</th>
                        <th>Celular</th>
                        <th>Estado</th>
                        <th>Fecha Ing.</th>
                        <th>Codigo</th>
                        <th>Observación</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody id="datos">
                    <%                                // Seleccionando los pacientes que actualmente se están atendiendo en emergencia
                        int id = 0;
                        String nombres = "";
                        String apellidos = "";
                        String dni = "";
                        String direccion = "";
                        String celular = "";
                        String estado = "";
                        String fecha_ingreso = "";
                        String codigo = "";
                        String observacion = "";
                        int i = 0;
                        String color = "";
                        String activa = "#E8F8F5";
                        String inactiva = "#FDEDEC";

                        COMANDO = " SELECT idPERSONA, CONCAT(Nombres, ' ', Apellidos)nombres, dni, "
                                + " direccion, celular, CASE estado WHEN 1 THEN 'Activo' ELSE 'Inactivo' END estado, "
                                + " DATE_FORMAT(fecha_ingres, '%d-%m-%Y')fecha_inges, codigo, observacion "
                                + " FROM PERSONA ";
                        //+ " WHERE DATE_FORMAT(fecha_ingres,'%Y%m') = '" + s_anio_ini + s_mes_ini + "' ";
                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);
                        while (rset.next()) {
                            i++;
                            id = rset.getInt("idPersona");
                            nombres = rset.getString("nombres");
                            dni = rset.getString("dni");
                            direccion = rset.getString("direccion");
                            celular = rset.getString("celular");
                            estado = rset.getString("estado");
                            fecha_ingreso = rset.getString("fecha_inges");
                            codigo = rset.getString("codigo");
                            observacion = rset.getString("observacion");


                    %>

                    <tr>        
                        <!--<td><%=i%></td>-->
                        <td><%=id%></td>
                        <td><%=nombres%></td>                 
                        <td><%=dni%></td>                    
                        <td><%=direccion%></td>                    
                        <td><%=celular%></td>                    
                        <td><%=estado%></td>                    
                        <td><%=fecha_ingreso%></td>                    
                        <td><%=codigo%></td>                    
                        <td><%=observacion%></td> 
                        <td>
                            <div class="btn-group">
                                <a title="Editar"  data-toggle="modal" onclick="myModalEdit('<%=id%>')" data-target="#myModalEdit"><button class="btn btn-warning btn-xs glyphicon glyphicon-edit"></button></a>
                                <a title="Eliminar" class="ejecuta" data-id="<%=id%>" ><button class="btn btn-danger btn-xs glyphicon glyphicon-trash"></button></a>
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
                        out.println("No existes Registros");
                    }
                %>

            </p>
        </div>
        <div id="myModalAdd" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        Registrar Persona
                        <button style="opacity: 10!important;" class="close glyphicon glyphicon-remove-sign text-red" data-dismiss="modal"></button> 
                    </div>
                    <div class="modal-body">
                        <div id="detalle">

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
                        <button style="opacity: 10!important;" class="close glyphicon glyphicon-remove-sign text-red" data-dismiss="modal"></button> 
                    </div>
                    <div class="modal-body">
                        <div id="EditPerson">

                        </div>

                    </div>
                </div>
            </div>    
        </div>
    </body>
</html>



