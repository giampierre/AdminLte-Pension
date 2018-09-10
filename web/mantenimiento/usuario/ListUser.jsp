<%-- 
    Document   : List
    Created on : 15-jul-2018, 15:21:24
    Author     : Elvis
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css1/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css1/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../css1/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../../css1/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="../../css1/jquery.dataTables.min.js" type="text/javascript"></script>
        <title>Lista de Usuarios</title>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </head>
    <body>
        <div class="panel panel-info">
            <div class="panel-heading" style="color:#0D5458"> <h5>Lista de Usuarios</h5></div>
            <div class="panel-body">
                <h3 class="box-title">
                    <a id="modal_desaUno" data-toggle="modal" onclick="myModalAdd()" data-target="#myModalAdd">
                        <button class="btn btn-primary btn-xs fa fa-user-plus"></button>&nbsp;
                    </a>
                </h3>
                <table  id="example" class="table table-hover table-hover" style="width:100%">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Id User</th>
                            <th>Nombres y Apellidos</th>
                            <th>Usuario</th>
                            <th>Contraseña</th>
                            <th>Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int idUSUARIO = 0;
                            String nomPers = "";
                            String usuario = "";
                            String pass = "";
                            int i = 0;

                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/bd_pension", "root", "");

                            Statement Estamento = conexion.createStatement();
                            ResultSet rs = Estamento.executeQuery(" SELECT idUSUARIO, nombre(idPERSONA)nombres, usuario, pass FROM USUARIO ");
                            //out.println(rs);
                            while (rs.next()) {
                                i++;
                                idUSUARIO = rs.getInt("idUSUARIO");
                                nomPers = rs.getString("nombres");
                                usuario = rs.getString("usuario");
                                pass = rs.getString("pass");

                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=idUSUARIO%></td>
                            <td><%=nomPers%></td>                    
                            <td><%=usuario%></td>                    
                            <td><%=pass%></td>       
                            <td>
                                <div class="btn-group">
                                    <a title="Editar" id="modal_desaUno" data-toggle="modal" onclick="myModalEdit()" data-target="#myModalEdit"><button class="btn btn-warning btn-xs glyphicon glyphicon-edit"></button></a>
                                    <a href="mantenimiento/persona/DeletePerson.jsp?idPersona=" onclick="return confirm('Esta Seguro de Eliminar el Registro...?')"><button class="btn btn-danger btn-xs glyphicon glyphicon-trash"></button></a>
                                </div>
                            </td>                    
                        </tr>
                        <%}%>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="7"></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </body>
</html>


