<%-- 
    Document   : RegistrarAlmuerzo
    Created on : 29/10/2018, 06:16:52 PM
    Author     : TIC-32
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="dist/css/style_input.css" rel="stylesheet" type="text/css"/>
        <script src="dist/js/AjaxRegistrarAlmuerzo.js" type="text/javascript"></script>
        <script src="dist/js/ValidarNumeric.js" type="text/javascript"></script>
        <script src="dist/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="dist/js/Ajaxjquery.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <style>

            table tr td {
                border: inset 0pt !important;
            }

        </style>
        <script>
        </script>    
    </head>
    <body onload="acceso.dni.focus()">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div>
                    <!-- /.box-header -->
                    <div style="background-image: url('dist/img/almuerzo.jpg');  width: 100%; height: 82vh;" >

                        <div class="table-responsive">
                            <table class="table table-condensed">

                                <tr align="center">
                                    <td>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <div style="width: 50%;"  class="alert alert-warning">
                                            <p style="font-size: 35px;" class="text-center fa fa-cutlery"><b>&nbsp;&nbsp;ALMUERZOS</b>&nbsp;</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr align="center">                                 
                                    <td>
                                        <div style="width: 50%; font-size: 20px;"  class="alert alert-success message salida" id="salida">Ingrese su código para registrar su almuerzo</div>
                                    </td>                             
                                </tr>
                                <!--tr align="center">
                                    <td>
                                        <h1 style="color: #fff;">CODIGO:</h1>
                                    </td>
                                </tr-->
                                <tr>
                                    <td align="center">
                                <center><h3 style="font-size: 100px; color: #D7DBDD;" class="fa fa-user"></h3></center>     
                                <input class="form-control input-number" style=" padding: 2%; width: 22%; text-align: center; font-size: 300%; font-weight: bold; color: #2E4053;" type="text" name="dni" id="entrada" size="400" maxlength="8" onkeypress="tufuncion(event);funLimpiar(event);" required><br>
                                <!--input class="checkbox center" type="checkbox" value="1" id="estado" checked=""-->
                                <div class="form-inline">
                                    <div class="form-group">
                                        <select class="form-control" name="cantidad" id="cantidad">
                                            <option value="1" selected>Cantidad</option>
                                            <option value="2">Dos</option>
                                            <option value="3">Tres</option>
                                            <option value="4">Cuatro</option>
                                            <option value="5">Cinco</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-control" name="estado" id="estado">
                                            <option value="0" selected>Almorcé en la pensión</option>
                                            <option value="1">Almuerzo para llevar</option>
                                        </select>
                                    </div>
                                </div>
                                <!--div style="color: #fff;" class="help-block text-center">
                                    Ingrese su código para registrar su desayuno                        
                                </div-->
                                </td>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
