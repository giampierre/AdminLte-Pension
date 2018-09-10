<%-- 
    Document   : List
    Created on : 15-jul-2018, 15:19:39
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
        <title>Lista de Personas</title>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#example').DataTable();
            });

        </script>
    </head>
    <body>
        <div >
            <h2><b>TABLE PERSONA</b></h2>
            <br>
            <br>
            <div align="center">
                <a href="AddFormPerson.jsp" title="Nuevo">
                    <img src="../../images/add.png" alt="" width="25" height="25"/>
                </a> 
            </div>
            <table  id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>DNI</th>
                        <th>Dirección</th>
                        <th>Celular</th>
                        <th>Estado</th>
                        <th>Fecha Ing.</th>
                        <th>Codigo</th>
                        <th>Observación</th>
                        <th colspan="2">Options</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Seleccionando los pacientes que actualmente se están atendiendo en emergencia

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

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/bd_pension", "root", "root");

                        Statement Estamento = conexion.createStatement();
                        ResultSet rs = Estamento.executeQuery(" SELECT * FROM PERSONA ");
                        //out.println(rs);
                        while (rs.next()) {
                            i++;
                            id = rs.getInt("idPersona");
                            nombres = rs.getString("Nombres");
                            apellidos = rs.getString("Apellidos");
                            dni = rs.getString("dni");
                            direccion = rs.getString("direccion");
                            celular = rs.getString("celular");
                            estado = rs.getString("estado");
                            fecha_ingreso = rs.getString("fecha_ingres");
                            codigo = rs.getString("codigo");
                            observacion = rs.getString("observacion");

                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=id%></td>
                        <td><%=nombres%></td>                    
                        <td><%=apellidos%></td>                    
                        <td><%=dni%></td>                    
                        <td><%=direccion%></td>                    
                        <td><%=celular%></td>                    
                        <td><%=estado%></td>                    
                        <td><%=fecha_ingreso%></td>                    
                        <td><%=codigo%></td>                    
                        <td><%=observacion%></td>                    

                        <td>
                            <a href="EditFormPerson.jsp?idPersona=<%=id%>">
                                <img src="../../images/edit.png" alt=""  width="13" height="13"/>
                            </a>
                        </td>                    
                        <td>
                            <a href="DeletePerson.jsp?idPersona=<%=id%>"><img src="../../images/delete04.png" alt=""  width="13" height="13" onclick="return confirm('Esta Seguro de Eliminar el Registro...?')"/></a>
                        </td>                    
                    </tr>
                    <%}%>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="12"></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </body>
</html>


