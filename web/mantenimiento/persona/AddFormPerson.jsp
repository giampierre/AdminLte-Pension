<%-- 
    Document   : addPerson
    Created on : 15-jul-2018, 16:08:48
    Author     : Elvis
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css1/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css1/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../css1/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../../css1/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="../../css1/jquery.dataTables.min.js" type="text/javascript"></script>
        <title>AddPerson</title>
    </head>
    <body>
        <form action="AddPerson.jsp" method="POST">
            <div class="panel panel-default" style="margin-left: 22%; margin-right: 22%; margin-top: 20px;" >
                <div class="panel-heading">
                    <h5><a href="ListPerson.jsp" align="left" title="Regresar" class="glyphicon glyphicon-arrow-left"></a>
                        <b align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Registro de <span>Persona</span></b></h5>
                </div>
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
                            <input type="text" class="form-control" id="dni" name="dni" placeholder="Ingese DNI" required>
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
                            <input type="text" class="form-control" id="estado" name="estado" placeholder="Ingese Estado" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="fechaingreso">FechaIng</label>
                            <input type="datetime-local" class="form-control" id="fechaingreso" name="fechaingreso" placeholder="Ingrese Fecha">
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
                            <input type="submit"  class="btn btn-primary" value="Registrar">
                            
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>


