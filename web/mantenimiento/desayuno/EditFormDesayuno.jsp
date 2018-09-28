<%-- 

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
                        url: "mantenimiento/desayuno/EditDesayuno.jsp",
                        type: "post",
                        data: {
                            nombres: $('#nombres').val(),
                            estado: $('#estado').val(),
                            fecha: $('#fecha').val(),
                            cantidad: $('#cantidad').val(),
                            monto: $('#monto').val(),
                            iddesayuno: $('#iddesayuno').val(),
                            idpensionista: $('#idpensionista').val(),
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

        <%            
            String idDesayuno = request.getParameter("f_id");
            String id = "";
            String idpensionista = "";
            String nombres = "";
            String tipo = "";
            String estado = "";
            String estadoVal = "";
            String fecha = "";
            int cantidad = 0;
            double monto = 0.0;
            int i = 0;

            COMANDO = "SELECT d.iddesayuno, p.idpensionista, nom_pen(d.idpensionista) AS Nombres, p.tipo, IF(p.tipo=0, 'General', 'Ejecutivo') as nom_tipo, "
                    + "d.estado, IF(d.estado=0, 'Desayunó', 'Para llevar') AS nom_estado, "
                    + "fecha_d, cantidad, d.monto "
                    + "FROM desayuno d "
                    + "INNER JOIN  pensionista p "
                    + "ON (d.idPENSIONISTA = p.idPENSIONISTA) "
                    + "WHERE d.iddesayuno = '" + idDesayuno + "' ";

            rset = stmt.executeQuery(COMANDO);
            //out.println(COMANDO);

            while (rset.next()) {
                i++;
                id = rset.getString("iddesayuno");
                idpensionista = rset.getString("idpensionista");
                nombres = rset.getString("Nombres");
                tipo = rset.getString("nom_tipo");
                estado = rset.getString("nom_estado");
                estadoVal = rset.getString("estado");
                fecha = rset.getString("fecha_d");
                cantidad = rset.getInt("cantidad");
                monto = rset.getDouble("monto");
            }


        %>

        <form>
            <div class="panel-body">
                <div class="form-row">
                    <div class="form-group col-md-9">
                        <label for="nombres">Nombres</label>
                        <select class="form-control" name="idpensionista" id="idpensionista">
                            <option value="<%=idpensionista%>" selected><%=nombres%></option>
                            <%COMANDO = "select idpensionista, nom_pen(idpensionista) nombres "
                                        + "from pensionista "
                                        + "order by nombres asc ";
                                rset = stmt.executeQuery(COMANDO);
                                while (rset.next()) {%>
                            <option value="<%=rset.getString("idpensionista")%>"><%=rset.getString("nombres")%></option>
                            <%}%>
                        </select> 
                    </div>
                    <div class="form-group col-md-3">
                        <label for="fecha">Fecha</label>
                        <input type="text" value="<%=fecha%>" class="form-control" id="fecha" name="fecha">
                    </div>
                </div>         
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="estado">Estado</label>
                         <select class="form-control" id="estado" name="estado">
                            <option value="<%=estadoVal%>" selected><%=estado%></option>
                            <%if (estadoVal.equals("1")) {%>
                            <option value="0">Desayunó</option>
                            <%} else {%>
                            <option value="1">Para llevar</option>	
                            <%}%>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="cantidad">Cantidad</label>
                        <input type="text" class="form-control input-number" value="<%=cantidad%>" id="cantidad" name="cantidad" placeholder="Ingrese cantidad" maxlength="4" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="monto">S/ Monto</label>
                        <input type="text" class="form-control input-number" value="<%=monto%>" id="monto" name="monto" placeholder="Ingrese monto" maxlength="4" required>
                    </div>

                </div>
                <div class="form-row" align="right">
                    <div class="form-group col-md-12">

                        <button type="button" class="btn btn-warning" id="save_data" data-dismiss="modal">Editar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        <input type="hidden" id="iddesayuno" name="iddesayuno" value="<%=idDesayuno%>">
                    </div>
                </div>           
            </div>
        </form>

    </body>
</html>
