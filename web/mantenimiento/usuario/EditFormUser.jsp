<%-- 
    Document   : EdirFormUser
    Created on : 21-jul-2018, 15:51:39
    Author     : Elvis
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = null;
    String sql = "";
    int i = 0;
    conexion = DriverManager.getConnection("jdbc:mysql://localhost/bd_pension", "root", "root");
    Statement s = null;
    s = conexion.createStatement();
    ResultSet rs;
    int id = 0;
    String nomb = "";

    String idUser = request.getParameter("iduser");
    String persona = "";
    String user = "";
    String pass = "";

    sql = "SELECT * "
            + " FROM usuario where idUSUARIO = '" + idUser + "' ";
    //out.println(sql);
    rs = s.executeQuery(sql);
    while (rs.next()) {
        i++;
        persona = rs.getString("idPersona");
        user = rs.getString("usuario");
        pass = rs.getString("pass");
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet" />
        <title>Edit User</title>
        <script type="text/javascript">
            $('.selectpicker').picker();
        </script> 
    </head>
    <body>
        <form action="EditUser.jsp" method="POST">
            <div class="panel panel-default" style="margin-left: 22%; margin-right: 22%; margin-top: 20px;" >
                <div class="panel-heading">
                    <h5><a href="ListUser.jsp" align="left" title="Regresar" class="glyphicon glyphicon-arrow-left"></a>
                        <b align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ediar <span>Usuario</span></b></h5>
                </div>
                <div class="panel-body">
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="person">Persona</label>

                            <select id="lunchBegins" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" title="Seleccione Persona" name="id">
                                <%    sql = "SELECT idPersona, CONCAT(Nombres, ' ', Apellidos)nomb "
                                            + " FROM persona order by nomb asc ";
                                    rs = s.executeQuery(sql);
                                    out.println(sql);
                                    while (rs.next()) {
                                        i++;
                                        nomb = rs.getString("nomb");
                                        id = rs.getInt("idPersona");
                                %>
                                <option value="<%=idUser%>"><%=nomb%></option>
                                <%}%>
                            </select>

                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="usuario">Usuario</label>
                            <input type="text" class="form-control" id="usuario" name="usuario" value="<%=user %>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="clave">Clave</label>
                            <input type="password" class="form-control" id="clave" name="clave" value="<%=pass %>">
                        </div>
                    </div>
                    <div class="form-row" align="center">
                        <div class="form-group col-md-12">
                            <input type="submit" class="btn btn-success" value="Editar">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>

