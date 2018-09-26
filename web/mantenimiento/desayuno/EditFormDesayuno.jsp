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
                        url: "mantenimiento/pensionista/EditPensionista.jsp",
                        type: "post",
                        data: {
                            idpersona: $('#idpersona').val(),
                            estado: $('#estado').val(),
                            fechaingreso: $('#fechaingreso').val(),
                            tipo: $('#tipo').val(),
                            monto: $('#monto').val(),
                            idpensionista: $('#idpensionista').val(),
                            success: function (data) {
                                //alert("Registro Exitoso");
                                //location.reload("");
                                //document.location.reload();
                            }

                        }
                    });
                    $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                    $("#contenido").load("mantenimiento/pensionista/MainPensionista.jsp");
                });



            });
        </script>
    </head>
    <body>

        <%            
            int i = 0;
            String idPensionista = request.getParameter("f_id");
            String idpersona = "";
            String nomb = "";
            String est = "";
            String estado = "";
            String fecha_ing = "";
            String tipo = "";
            String tipoVal = "";
            String monto = "";

            COMANDO = "SELECT idpersona, nombre(idpersona) nomb_perso, "
                    + " estado, IF(estado=0, 'Sin Cancelar', 'Cancelado') as nom_estado, fecha_ingreso, "
                    + " tipo, IF(tipo=0, 'General', 'Ejecutivo') as nom_tipo, monto "
                    + " FROM PENSIONISTA WHERE idPensionista = '" + idPensionista + "' ";

            //out.print(COMANDO);
            rset = stmt.executeQuery(COMANDO);
            while (rset.next()) {
                i++;
                idpersona = rset.getString("idpersona");
                nomb = rset.getString("nomb_perso");    
                est = rset.getString("nom_estado");
                estado = rset.getString("estado");
                fecha_ing = rset.getString("fecha_ingreso");
                tipo = rset.getString("nom_tipo");
                tipoVal = rset.getString("tipo");
                monto = rset.getString("monto");
            }

        %>
        <%
           String a_tipo[][] = {{"0", "General"}, {"1", "Ejecutivo"}};
           String s_tipo = "";
           COMANDO = "Select "
                   + "distinct tipo as  tipo "
                   + "from pensionista "
                   + "order by tipo desc ";
           rset = stmt.executeQuery(COMANDO);
           rset.next();
           s_tipo = rset.getString("tipo");
        %>


        <form>
            <div class="panel-body">
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <label for="nombres">Nombres</label>
                        <select class="form-control" name="idpersona" id="idpersona">
                            <option value="<%=idpersona%>" selected><%=nomb%></option>
                            <%COMANDO = "select idpersona, nombre(idpersona) nombres "
                                        + "from persona "
                                        + "order by nombres asc ";
                                rset = stmt.executeQuery(COMANDO);
                                while (rset.next()) {%>
                            <option value="<%=rset.getString("idpersona")%>"><%=rset.getString("nombres")%></option>
                            <%}%>
                        </select> 
                    </div>
                    <div class="form-group col-md-2">
                        <label for="monto">S/ Monto</label>
                        <input type="text" class="form-control input-number" value="<%=monto%>" id="monto" name="monto" placeholder="Ingrese monto" maxlength="4" required>
                    </div>
                </div>         
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="estado">Estado</label>
                        <select class="form-control" id="estado" name="estado">
                            <option value="<%=estado%>" selected><%=est%></option>
                            <%if (estado.equals("1")) {%>
                            <option value="0">Sin Cancelar</option>
                            <%} else {%>
                            <option value="1">Cancelado</option>	
                            <%}%>
                        </select>
                        <!--<input type="text" class="form-control" id="estado" name="estado" placeholder="Ingese Estado" required>-->
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaingreso">Fecha de registro</label>
                        <input type="text" value="<%=fecha_ing%>" class="form-control" id="fechaingreso" name="fechaingreso">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="estado">Tipo</label>
                         <select class="form-control" id="tipo" name="tipo">
                            <option value="<%=tipoVal%>" selected><%=tipo%></option>
                            <%if (tipoVal.equals("1")) {%>
                            <option value="0">General</option>
                            <%} else {%>
                            <option value="1">Ejecutivo</option>	
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-row" align="right">
                    <div class="form-group col-md-12">

                        <button type="button" class="btn btn-warning" id="save_data" data-dismiss="modal">Editar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        <input type="hidden" id="idpensionista" name="idpensionista" value="<%=idPensionista%>">
                    </div>
                </div>           
            </div>
        </form>

    </body>
</html>
