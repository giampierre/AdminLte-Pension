<%-- 
    Document   : MainPensionistas
    Created on : 31/08/2018, 11:39:51 AM
    Author     : TIC-32
--%>
<%@include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="dist/js/buscador.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <script>
            $(document).ready(function (e) {
                $('#enviar').addClass('inpusubmit');
                $('select').addClass('inputext5');
                $('#enviar').click(enviar);

            })
            function enviar() {
                var url = 'mantenimiento/persona/ListPerson.jsp';
                if ($(this).hasClass("disabled"))
                {
                    $(this).removeClass("disabled in-progress").attr('value', 'Visualizar')
                } else
                {
                    $(this).addClass("disabled in-progress").attr('value', 'Cargando...')
                }

                $('#detallelist').load(url, $('#datoslist').serialize(), function () {
                    $('.disabled').removeClass("disabled in-progress").attr('value', 'Visualizar')
                });
            }

            $(document).ready(function () {
                $("#datoslist").submit(function () {
                    var x = $("#f_mes_ini").val();
                    if (x !== "enviar") {
                        //alert("Valor introducido no válido");
                        return false;
                    } else
                        return true;
                });
            });

        </script>

        <style>
            select {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%            String a_mes[][] = {{"01", "Enero"}, {"02", "Febrero"}, {"03", "Marzo"}, {"04", "Abril"}, {"05", "Mayo"}, {"06", "Junio"}, {"07", "Julio"}, {"08", "Agosto"}, {"09", "Setiembre"}, {"10", "Octubre"}, {"11", "Noviembre"}, {"12", "Diciembre"}};
            String s_mes = "";
            COMANDO
                    = "Select "
                    + "date_format(sysdate(),'%m') mes "
                    + "from dual ";
            rset = stmt.executeQuery(COMANDO);
            rset.next();
            s_mes = rset.getString("mes");
        %>
        <form name="datoslist" target="view" id="datoslist" action="#" >

            <div class="panel panel-info" style="margin: 0 auto;">
                <div class="panel-heading" style="color:#0D5458"> <h5>Lista de Personas por periodo.</h5></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon" style="color:#0d5458; background: #eeeeee;">
                                    <li class="fa fa-calendar">&nbsp;Mes:</li>
                                </span>
                                <select class="form-control" name="f_mes_ini" id="f_mes_ini">
                                        <%for (int x = 0; x < a_mes.length; x++) {%>
                                        <option value="<%=a_mes[x][0]%>" <% if (a_mes[x][0].equals(s_mes)) {
                                                out.print("selected");
                                            }%>><%=a_mes[x][1]%></option>
                                    <%}%>
                                </select>
                            </div><!-- /input-group -->
                        </div><!-- /.col-lg-6 -->
                        <div class="col-md-3">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon" style="color:#0d5458; background: #eeeeee;">
                                    <li class="fa fa-calendar">&nbsp;Año:</li>
                                </span>
                                <select class="form-control" name="f_anio_ini" id="f_anio_ini">
                                    <%COMANDO = "select distinct date_format(fecha_ingres,'%Y') anio "
                                                + "from persona "
                                                + "order by anio desc ";
                                        rset = stmt.executeQuery(COMANDO);
                                        while (rset.next()) {%>
                                    <option value="<%=rset.getString("anio")%>"><%=rset.getString("anio")%></option>
                                    <%}%>
                                </select> 
                            </div><!-- /input-group -->
                        </div><!-- /.col-lg-6 -->                       
                        <div class="col-md-4">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon" style="color:#0d5458; background: #eeeeee;">
                                    <li class="fa fa-calendar">&nbsp;</li>
                                </span>
                                <select class="form-control" name="f_todos" id="f_todos">
                                   <option value="" selected="">Seleccionar para ver de todos los meses</option>
                                   <option value="T">Todos los meses</option>
                                </select> 
                            </div><!-- /input-group -->
                        </div><!-- /.col-lg-6 -->                       
                        <div class="col-md-2">
                            <input class="btn btn-info btn-sm" type="button" value="Visualizar" id="enviar" class="butoncito"> 
                        </div>

                    </div>
                </div>

            </div>
            <!-- muestra la lista de pensionistas -->
            <div>
                <div class="box-header with-border">
                    <div id="detallelist"><br/>

                        <center><p>No se selecionó ningún periodo</p></center>

                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
