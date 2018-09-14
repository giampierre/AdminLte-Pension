<%-- 
    Document   : addPerson
    Created on : 15-jul-2018, 16:08:48
    Author     : Elvis
--%>

<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <script src="dist/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="dist/js/ValidarNumeric.js" type="text/javascript"></script>
        <title>AddPerson</title>

        <script>
            $(document).ready(function () {
                $("#btnclose").click(function () {     
                    //alert("funciona"); 
                    });
            });
        </script>
    </head>
    <body>
        <%            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
            String fechaActual = ft.format(dNow);
        %>

        <form action="mantenimiento/persona/AddPerson.jsp" method="POST">
            <div class="panel-body">
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="nombres">Nombres</label>
                        <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Ingrese Nombres" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="apellidos">Apellidos</label>
                        <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Ingrese Apellidos" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="dni">DNI</label>
                        <input type="text" class="form-control input-number" id="dni" name="dni" placeholder="Ingrese DNI" maxlength="8" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="celular">Celular</label>
                        <input type="text" class="form-control input-number" id="celular" name="celular" placeholder="Ingrese Celular" maxlength="9" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="direccion">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Ingrese Dirección" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="estado">Estado</label>
                        <select name="estado" id="esatdo" class="form-control">
                            <option value="" selected>Seleccione Estado</option>
                            <option value="1" selected>Activo</option>
                            <option value="0">Inactivo</option>
                        </select>
                        <!--<input type="text" class="form-control" id="estado" name="estado" placeholder="Ingese Estado" required>-->
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaingreso">Fecha de registro</label>
                        <input type="text" value="<%=fechaActual%>" class="form-control" id="fechaingreso" name="fechaingreso" readonly="">
                        <!--<input type="datetime-local"  placeholder="Ingrese Fecha">-->
                    </div>
                    <div class="form-group col-md-4">
                        <label for="codigo">Codigo</label>
                        <input type="text" class="form-control input-number" id="codigo" name="codigo" placeholder="Ingrese Codigo" maxlength="4" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="observacion">Observación</label>
                        <textarea class="form-control" id="observacion" name="observacion" placeholder="Ingrese Observación" maxlength="450" ></textarea>
                    </div>
                </div>
                <div class="form-row" align="right">
                    <div class="form-group col-md-12">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Registrar">
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>


