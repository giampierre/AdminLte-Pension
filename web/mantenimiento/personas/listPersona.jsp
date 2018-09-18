<%-- 
    Document   : CRUDpersona
    Created on : 18/09/2018, 08:39:47 AM
    Author     : TIC-32
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="dist/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <form><br><br>
                Nombres :<input type="text" name="nombres" id="nombres"/><br><br>
                Apellidos :<input type="text" name="apellidos" id="apellidos"/><br><br>
                DNI :<input type="text" name="dni" id="dni" /><br><br>
                Celular :<input type="text" name="celular" id="celular"/><br><br>
                Direccion :<input type="text" name="direccion" id="direccion"/><br><br>
                Estado :<input type="text" name="estado" id="estado"/><br><br>
                Fecha :<input type="text" name="fecha_ingres" id="fecha_ingres"/><br><br>
                Codigo :<input type="text" name="codigo" id="codigo"/><br><br>
                Nota :<input type="text" name="observacion" id="observacion"/><br><br>
                <input type="button" value="submit" id="save_data"/>
            </form>
        </div>
        <script>

            $(document).ready(function () {
                $("#save_data").click(function () {
                    //alert("succeess");
                    $.ajax({
                        url: "mantenimiento/personas/savePersona.jsp",
                        type: "post",
                        data: {
                            nombres: $('#nombres').val(),
                            apellidos: $('#apellidos').val(),
                            dni: $('#dni').val(),
                            celular: $('#celular').val(),
                            direccion: $('#direccion').val(),
                            estado: $('#estado').val(),
                            fecha_ingres: $('#fecha_ingres').val(),
                            codigo: $('#codigo').val(),
                            observacion: $('#observacion').val(),

                        }
                    });
                });
            });
        </script>
        <br>
        <table class="table table-bordered table-condensed table-hover" >
            <thead> 
                <tr>
                    <th>#</th>
                    <!--<th>ID</th>-->
                    <th>Nombres</th>
                    <th>DNI</th>
                    <th>Dirección</th>
                    <th>Celular</th>
                    <th>Estado</th>
                    <th>Fecha Ing.</th>
                    <th>Codigo</th>
                    <th>Observación</th>
                    <th>Options</th>
                </tr>
            </thead>
            <tbody id="datos">
                <%                                // Seleccionando los pacientes que actualmente se están atendiendo en emergencia
                    int id = 0;
                    String nombres = "";
                    String apellidos = "";
                    String dni = "";
                    String direccion = "";
                    String celular = "";
                    String estado = "";
                    String fecha_ingreso = "";
                    String codigo = "";
                    String observacion = "";
                    int i = 0;
                    String color = "";
                    String activa = "#E8F8F5";
                    String inactiva = "#FDEDEC";

                    COMANDO = " SELECT idPERSONA, CONCAT(Nombres, ' ', Apellidos)nombres, dni, "
                            + " direccion, celular, CASE estado WHEN 1 THEN 'Activo' ELSE 'Inactivo' END estado, "
                            + " DATE_FORMAT(fecha_ingres, '%d-%m-%Y')fecha_ingres, codigo, observacion "
                            + " FROM PERSONA ";
                    //+ " WHERE DATE_FORMAT(fecha_ingres,'%Y%m') = '" + s_anio_ini + s_mes_ini + "' ";
                    rset = stmt.executeQuery(COMANDO);
                    //out.println(COMANDO);
                    while (rset.next()) {
                        i++;
                        id = rset.getInt("idPersona");
                        nombres = rset.getString("nombres");
                        dni = rset.getString("dni");
                        direccion = rset.getString("direccion");
                        celular = rset.getString("celular");
                        estado = rset.getString("estado");
                        fecha_ingreso = rset.getString("fecha_ingres");
                        codigo = rset.getString("codigo");
                        observacion = rset.getString("observacion");


                %>

                <tr>        
                    <!--<td><%=i%></td>-->
                    <td><%=id%></td>
                    <td><%=nombres%></td>                 
                    <td><%=dni%></td>                    
                    <td><%=direccion%></td>                    
                    <td><%=celular%></td>                    
                    <td><%=estado%></td>                    
                    <td><%=fecha_ingreso%></td>                    
                    <td><%=codigo%></td>                    
                    <td><%=observacion%></td> 
                    <td>
                        <div class="btn-group">
                            <a title="Editar"  data-toggle="modal" onclick="myModalEdit('<%=id%>')" data-target="#myModalEdit"><button class="btn btn-warning btn-xs glyphicon glyphicon-edit"></button></a>
                            <a title="Eliminar" class="ejecuta" data-id="<%=id%>" ><button class="btn btn-danger btn-xs glyphicon glyphicon-trash"></button></a>
                        </div>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
