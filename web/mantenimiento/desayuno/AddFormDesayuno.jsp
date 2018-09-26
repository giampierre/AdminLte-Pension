<%-- 
    Document   : addPerson
    Created on : 15-jul-2018, 16:08:48
    Author     : Elvis
--%>

<%@include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <script src="dist/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="dist/js/Ajaxjquery.min.js" type="text/javascript"></script>
        <script src="dist/js/ValidarNumeric.js" type="text/javascript"></script>
        <title>AddPerson</title>
        <script>
            $(document).ready(function () {
                $("#save_data").click(function () {
                    //alert("succeess");
                    $.ajax({
                        url: "mantenimiento/desayuno/AddDesayuno.jsp",
                        type: "post",
                        data: {
                            nombres: $('#nombres').val(),
                            estado: $('#estado').val(),
                            fecha: $('#fecha').val(),
                            cantidad: $('#cantidad').val(),
                            monto: $('#monto').val(),
                            success: function (data) {

                            }

                        }
                    });
                    $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                    $("#contenido").load("mantenimiento/desayuno/MainDesayuno.jsp");
                });



            });
        </script>

    </head>
    <body>
        <%            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
            String fechaActual = ft.format(dNow);
        %>

        <form>
            <div class="panel-body">
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <label for="nombres">Nombres</label>
                        <select class="form-control" name="nombres" id="nombres">
                            <option value="" selected>seleccionar nombres del pensionista</option>
                            <%COMANDO = "select idpensionista, nombre(idpensionista) nombres "
                                        + "from pensionista "
                                        + "order by nombres asc ";
                                rset = stmt.executeQuery(COMANDO);
                                while (rset.next()) {%>
                            <option value="<%=rset.getString("idpensionista")%>"><%=rset.getString("nombres")%></option>
                            <%}%>
                        </select> 
                    </div>                   
                    <div class="form-group col-md-2">
                        <label for="fecha">Fecha</label>
                        <input type="text" value="<%=fechaActual%>" class="form-control" id="fecha" name="fecha" readonly="">
                    </div>
                </div>         
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="estado">Estado</label>
                        <select name="estado" id="estado" class="form-control" maxlength="1">
                            <option value="0" selected>Desayunó</option>
                            <option value="1">Para llevar</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="cantidad">Cantidad</label>
                        <input type="text" class="form-control input-number" value="0" id="cantidad" name="cantidad" placeholder="Ingrese cantidad" maxlength="4" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="monto">S/ Monto</label>
                        <input type="text" class="form-control input-number" value="0" id="monto" name="monto" placeholder="Ingrese monto" maxlength="4" required>
                    </div>

                </div>
                <div class="form-row">          
                    <div class="form-row" align="right">
                        <div class="form-group col-md-12">          
                            <button type="button" class="btn btn-primary" id="save_data" data-dismiss="modal">Guardar</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>             
            </div>
        </form>
    </body>
</html>


