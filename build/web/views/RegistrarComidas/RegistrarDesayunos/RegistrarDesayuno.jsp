<%-- 
    Document   : Registrar_Desayuno
    Created on : 06-jul-2018, 23:51:37
    Author     : Andy7
--%>



<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="dist/css/style_input.css" rel="stylesheet" type="text/css"/>
        <script src="dist/js/AjaxRegistrarDesayuno.js" type="text/javascript"></script>
        <script src="dist/js/ValidarNumeric.js" type="text/javascript"></script>
        <script src="dist/js/jquery-1.12.4.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <style>

            table tr td {
                border: inset 0pt !important;
            }
        </style>
    </head>
    <body onload="acceso.dni.focus()">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div>
                    <!-- /.box-header -->
                    <div style="background-image: url('dist/img/desayuno3.jpg');  width: 100%; height: 82vh;" >

                        <div class="table-responsive">
                            <table class="table table-condensed">

                                <tr align="center">
                                    <td>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <div style="width: 50%;"  class="alert alert-warning">
                                            <p style="font-size: 35px;" class="text-center fa fa-coffee"><b>&nbsp;&nbsp;DESAYUNOS</b>&nbsp;</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td>
                                        <div style="width: 50%; font-size: 20px;"  class="alert alert-success message" id="salida">Ingrese su código para registrar su desayuno</div>
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
                                <input class="form-control input-number" style=" padding: 2%; width: 22%; text-align: center; font-size: 300%; font-weight: bold; color: #2E4053;" type="text" name="dni" id="entrada" size="400" maxlength="8" onkeypress="tufuncion(event);funLimpiar(event)" required><br>
                                <!--input class="checkbox center" type="checkbox" value="1" id="estado" checked=""-->
                                
                                    <select style="width: 13%; text-align: center;" class="form-control" name="estado" id="estado">
                                        <option value="0" selected>Desayuné aquí</option>
                                        <option value="1">Para llevar</option>
                                    </select>
                                
                                <!--div style="color: #fff;" class="help-block text-center">
                                    Ingrese su código para registrar su desayuno                        
                                </div-->
                                </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
