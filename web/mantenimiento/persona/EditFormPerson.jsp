<%-- 
    Document   : EditFormPerson
    Created on : 15-jul-2018, 22:20:59
    Author     : Elvis
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="dist/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="dist/js/Ajaxjquery.min.js" type="text/javascript"></script>
        <script src="dist/js/ValidarNumeric.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <script>
            $(document).ready(function () {
                $("#save_data").click(function () {
                    //alert("succeess");
                    $.ajax({
                        url: "mantenimiento/persona/EditPerson.jsp",
                        type: "post",
                        data: {
                            nombres: $('#nombres').val(),
                            apellidos: $('#apellidos').val(),
                            dni: $('#dni').val(),
                            celular: $('#celular').val(),
                            direccion: $('#direccion').val(),
                            estado: $('#estado').val(),
                            fecha_ingres: $('#fecha_ingres').val(),
                            codigo: $('#codigo').val(),
                            observacion: $('#observacion').val(),
                            idpersona: $('#idpersona').val(),
                            success: function (data) {
                                //alert("Registro Exitoso");
                                //location.reload("");
                                //document.location.reload();
                            }

                        }
                    });
                    $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                    $("#contenido").load("mantenimiento/persona/MainPersona.jsp");
                });



            });
        </script>
    </head>
    <body>

        <%            int i = 0;
            String idPerson = request.getParameter("f_id");
            String nomb = "";
            String apell = "";
            String dn = "";
            String direc = "";
            String cel = "";
            String est = "";
            String estado = "";
            String fecha_ing = "";
            String cod = "";
            String observ = "";

            COMANDO = "SELECT Nombres, Apellidos, dni, direccion, "
                    + " celular, estado, IF(estado=0, 'Inactivo', 'Activo') as nom_estado, fecha_ingres, codigo, observacion "
                    + " FROM PERSONA WHERE idPersona = '" + idPerson + "' ";

            //out.print(COMANDO);
            rset = stmt.executeQuery(COMANDO);
            while (rset.next()) {
                i++;
                nomb = rset.getString("Nombres");
                apell = rset.getString("Apellidos");
                dn = rset.getString("dni");
                direc = rset.getString("direccion");
                cel = rset.getString("celular");
                est = rset.getString("nom_estado");
                estado = rset.getString("estado");
                fecha_ing = rset.getString("fecha_ingres");
                cod = rset.getString("codigo");
                observ = rset.getString("observacion");
            }

        %>

        <form>
            <div class="panel-body">
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="nombres">Nombres</label>
                        <input type="text" class="form-control" id="nombres" name="nombres" value="<%=nomb%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="apellidos">Apellidos</label>
                        <input type="text" class="form-control"  id="apellidos" name="apellidos" value="<%=apell%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="dni">DNI</label>
                        <input type="text" class="form-control input-number" id="dni" name="dni" value="<%=dn%>" maxlength="8" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="celular">Celular</label>
                        <input type="text" class="form-control input-number" id="celular" name="celular" value="<%=cel%>" maxlength="9" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="direccion">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" value="<%=direc%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="estado">Estado</label>                      
                        <select class="form-control" id="estado" name="estado">
                            <option value="<%=estado%>" selected><%=est%></option>
                             <%if (estado.equals("1")) {%>
                            <option value="0">Inactivo</option>
                            <%} else {%>
                            <option value="1">Activo</option>	
                            <%}%>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaingreso">Fecha de registro</label>
                        <input type="text" class="form-control" id="fecha_ingres" name="fecha_ingres" value="<%=fecha_ing%>">
                        <!--<input type="datetime-local"  placeholder="Ingrese Fecha">-->
                    </div>
                    <div class="form-group col-md-4">
                        <label for="codigo">Codigo</label>
                        <input type="text" class="form-control input-number" id="codigo" name="codigo" value="<%=cod%>" maxlength="4" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="observacion">Observación</label>
                        <textarea class="form-control" id="observacion" name="observacion"  maxlength="450"><%=observ%></textarea>
                    </div>
                </div>
                <div class="form-row" align="right">
                    <div class="form-group col-md-12">

                        <button type="button" class="btn btn-warning" id="save_data" data-dismiss="modal">Editar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        <input type="hidden" id="idpersona" name="idpersona" value="<%=idPerson%>">
                    </div>
                </div>
            </div>
        </form>

    </body>
</html>
