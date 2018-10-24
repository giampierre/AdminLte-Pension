<%-- 
    Document   : EditFormPerson
    Created on : 26-jul-2018, 22:20:59
    Author     : Andy7
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
                        url: "mantenimiento/almuerzo/DeleteAlmuerzo.jsp",
                        type: "post",
                        data: {
                            idalmuerzo: $('#idalmuerzo').val(),
                            success: function (data) {
                            }

                        }
                    });
                    $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                    $("#contenido").load("mantenimiento/almuerzo/MainAlmuerzo.jsp");
                });



            });
        </script>
    </head>
    <body>

        <%            String idAlmuerzo = request.getParameter("f_id");
        %>

        <form>
            <div class="panel-body">
                <div class="form-row" align="right">
                    <div class="form-group col-md-12">                 
                        <button type="button" class="btn btn-primary" id="save_data" data-dismiss="modal">Eliminar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        <input type="hidden" id="idalmuerzo" name="idalmuerzo" value="<%=idAlmuerzo%>">
                    </div>
                </div>
            </div>
        </form>

    </body>
</html>
