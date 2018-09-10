<%-- 
    Document   : EditFormPerson
    Created on : 15-jul-2018, 22:20:59
    Author     : Elvis
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css1/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../css1/jquery-3.3.1.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = null;
            String  sql = "";
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/bd_pension", "root", "root");
            int i = 0;
            String idPerson = request.getParameter("idPersona");
            String nomb = "";
            String apell = "";
            String dn= "";
            String direc = "";
            String cel = "";
            String est = "";
            String fecha_ing = "";
            String cod = "";
            String observ = "";

            Statement Estamento = conexion.createStatement();
            sql = "SELECT Nombres, Apellidos, dni, direccion, "+
                    " celular, estado, DATE_FORMAT(fecha_ingres,  '%d/%l/%Y %H:%i')fecha_ingres, codigo, observacion "+
                    " FROM PERSONA WHERE idPersona = '"+idPerson+"' ";
            ResultSet rs = Estamento.executeQuery(sql);
            out.println(sql);
            while (rs.next()) {
                i++;
                nomb = rs.getString("Nombres");
                apell = rs.getString("Apellidos");
                dn = rs.getString("dni");
                direc = rs.getString("direccion");
                cel = rs.getString("celular");
                est = rs.getString("estado");
                fecha_ing = rs.getString("fecha_ingres");
                cod= rs.getString("codigo");
                observ = rs.getString("observacion");
            }
        %>
        <form action="EditPerson.jsp" method="POST">
            <div class="panel panel-default" style="margin-left: 22%; margin-right: 22%; margin-top: 20px;" >
                <div class="panel-heading">
                    <h5><a href="ListPerson.jsp" align="left" title="Regresar" class="glyphicon glyphicon-arrow-left"></a>
                        <b align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Editar <span>Persona</span></b></h5>
                </div>
                <div class="panel-body">
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="nombres">Nombres</label>
                            <input type="text" class="form-control" id="nombres" name="nombres" value="<%=nomb%>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="apellidos">Apellidos</label>
                            <input type="text" class="form-control" id="apellidos" name="apell" value="<%=apell%>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="dni">DNI</label>
                            <input type="text" class="form-control" id="dni" name="dn" value="<%=dn%>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="celular">Celular</label>
                            <input type="text" class="form-control" id="cel" name="cel" value="<%=cel%>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="direccion">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direc" value="<%=direc%>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="estado">Estado</label>
                            <input type="text" class="form-control" id="estado" name="est" value="<%=est%>">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="fechaingreso">FechaIng</label>
                            <input type="datetime-local" class="form-control" id="fechaingreso" name="fecha_ing" value="<%=fecha_ing%>">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="codigo">Codigo</label>
                            <input type="text" class="form-control" id="codigo" name="cod" value="<%=cod%>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="observacion">Observación</label>
                            <textarea class="form-control" id="observacion" name="observ"><%=observ%></textarea>
                        </div>
                    </div>
                    <div class="form-row" align="center">
                        <div class="form-group col-md-12">
                            <input type="submit" name="" id="" class="btn btn-success" value="Editar">
                            <input type="hidden" name="idper" value="<%=idPerson%>">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
