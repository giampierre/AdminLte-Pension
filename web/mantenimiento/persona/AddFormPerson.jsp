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
        <title>AddPerson</title>
    </head>
    <body>
        <%            
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
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
                        <input type="text" class="form-control" id="dni" name="dni" placeholder="Ingrese DNI" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="celular">Celular</label>
                        <input type="text" class="form-control" id="celular" name="celular" placeholder="Ingrese Celular" required>
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
                        <input type="text" class="form-control" id="codigo" name="codigo" placeholder="Ingrese Codigo" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="observacion">Observación</label>
                        <textarea class="form-control" id="observacion" name="observacion" placeholder="Ingrese Observación" ></textarea>
                    </div>
                </div>
                <div class="form-row" align="center">
                    <div class="form-group col-md-12">
                        <input type="submit" class="btn btn-primary" value="Registrar">
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>


