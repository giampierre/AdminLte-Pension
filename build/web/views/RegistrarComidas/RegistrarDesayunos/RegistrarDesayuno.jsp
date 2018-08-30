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
                        document.all.salida.innerHTML = "<b>" + ajax.responseText + "</b>";
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
    </head>
    <body onload="acceso.dni.focus()">
        <br>
        <br>
        <div class="col-md-6 col-md-offset-3">

            <div class="box box-solid box-warning">
                <div class="box-header">
                    <h2><p class="text-center"><b>DESAYUNOS</b>&nbsp;</p></h2>
                    <center><h3 style="font-size: 100px;" class="fa fa-coffee"></h3></center>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">


                    <table class="table table-condensed">

                        <tr align="center">
                            <td>
                                <span style="font-size: 35px; color: #4d8a43;" id="salida"></span>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <h1>CODIGO:</h1>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <input class="form-control" style=" padding: 4%; width: 35%; text-align: center; font-size: 250%;" type="text" name="dni" id="entrada" size="400" maxlength="8" onkeypress="tufuncion(event);funLimpiar(event)" required><br>
                            </td>

                        </tr>

                    </table>


                </div>
                <!-- /.box-body -->
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
        </div>





    </body>
</html>
