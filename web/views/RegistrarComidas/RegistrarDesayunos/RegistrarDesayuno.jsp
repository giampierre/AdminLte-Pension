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
        <title>JSP Page</title>


        <script>
            function funLimpiar(e) {
                tecla = (document.all) ? e.keyCode : e.which;
                if (tecla === 13) {
                    $('input[type="text"]').val('');
                }
            }

        </script>
        <script>
            var ajax;

            function funcionCallback()
            {
                // Comprobamos si la peticion se ha completado (estado 4)
                if (ajax.readyState === 4)
                {
                    // Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
                    if (ajax.status === 200)
                    {
                        // Escribimos el resultado en la pagina HTML mediante DHTML
                        document.all.salida.innerHTML = "<p style='font-size: 20px; text-transform: uppercase;'><b>" + ajax.responseText + "</b></p>";
                    }
                }
            }

            function tufuncion(e) {
                tecla = (document.all) ? e.keyCode : e.which;
                if (tecla === 13) {
                    //Aqui haz lo que quieras que pase cuando presionen enter
                    // Creamos el control XMLHttpRequest segun el navegador en el que estemos 
                    if (window.XMLHttpRequest)
                        ajax = new XMLHttpRequest(); // No Internet Explorer
                    else
                        ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer

                    // Almacenamos en el control al funcion que se invocara cuando la peticion
                    // cambie de estado	
                    ajax.onreadystatechange = funcionCallback;

                    // Enviamos la peticion
                    ajax.open("GET", "views/RegistrarComidas/RegistrarDesayunos/AddDesayuno.jsp?dni=" + document.all.entrada.value, true);
                    ajax.send("");
                }
            }

        </script>
        <style>

            table tr td {
                border: inset 0pt !important;
            }
        </style>
    </head>
    <body onload="acceso.dni.focus()">



        <div class="col-lg-12 col-md-12">

            <div class="box">

                <!-- /.box-header -->
                <div style="background-image: url('dist/img/desayuno3.jpg');"  class="box-body no-padding">

                    <div class="table-responsive">
                        <table class="table table-condensed">

                            <tr align="center">
                                <td>
                                    <div style="width: 50%;"  class="alert alert-warning">
                                        <p style="text-align: center; font-size: 35px;" class="text-center fa fa-coffee"><b>&nbsp;&nbsp;DESAYUNOS</b>&nbsp;</p>
                                    </div>
                                </td>
                            </tr>
                            <tr align="center">
                                <td>
                                    <div style="width: 50%; font-size: 20px;"  class="alert alert-success" id="salida">Ingrese su código para registrar su desayuno</div>
                                </td>
                            </tr>
                            <!--tr align="center">
                                <td>
                                    <h1 style="color: #fff;">CODIGO:</h1>
                                </td>
                            </tr-->
                            <tr>
                                <td align="center">
                            <center><h3 style="font-size: 100px; color: #bebeac;" class="fa fa-user"></h3></center>     
                            <input class="form-control" style=" padding: 2%; width: 20%; text-align: center; font-size: 300%;" type="text" name="dni" id="entrada" size="400" maxlength="8" onkeypress="tufuncion(event);funLimpiar(event)" required><br>
                            <!--div style="color: #fff;" class="help-block text-center">
                                Ingrese su código para registrar su desayuno                        
                            </div-->
                            </td>



                            </tr>

                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>

                            <br>
                            <br>
                            <br>
                            <br>

                        </table>


                    </div>
                    <!-- /.box-body -->
                </div>

            </div>

        </div>



    </body>
</html>
