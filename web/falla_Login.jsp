<%@page import="javax.xml.ws.Response"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Tem de Tudo">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="bower_components/bootstrap/dist/css/bootstrap_1.css" rel="stylesheet" type="text/css"/>
        <link href="bower_components/bootstrap/dist/css/bootstrap.min_1.css" rel="stylesheet" type="text/css"/>
        <title>Tem de Tudo</title>
    </head>
    <body style="background: #fff;">


        <div class="modal">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h5><i class="icon-exclamation-sign"></i> Falla en autenticacion</h5>
            </div>
            <div class="modal-body">
                <p>El codigo ingresado es incorrecto!</p>
            </div>
            <div class="modal-footer">
                <script LANGUAGE='JavaScript'>
                    function redireccionar()
                    {
                        location.href = "login.html";
                    }
                    setTimeout('redireccionar()', 3000);
                </script>

            </div>
        </div>



    </body>
</html>