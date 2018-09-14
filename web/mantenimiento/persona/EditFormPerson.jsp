<%-- 
    Document   : EditFormPerson
    Created on : 15-jul-2018, 22:20:59
    Author     : Elvis
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="dist/js/ValidarNumeric.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
    
        <%
            int i = 0;
            String idPerson = request.getParameter("f_id");
            String nomb = "";
            String apell = "";
            String dn = "";
            String direc = "";
            String cel = "";
            String est = "";
            String fecha_ing = "";
            String cod = "";
            String observ = "";
            
            COMANDO = "SELECT Nombres, Apellidos, dni, direccion, "
                    + " celular, estado, fecha_ingres, codigo, observacion "
                    + " FROM PERSONA WHERE idPersona = '" + idPerson + "' ";
            
            //out.print(COMANDO);
            rset = stmt.executeQuery(COMANDO);
            while  (rset.next()) {
                i++;
                nomb = rset.getString("Nombres");
                apell = rset.getString("Apellidos");
                dn = rset.getString("dni");
                direc = rset.getString("direccion");
                cel = rset.getString("celular");
                est = rset.getString("estado");
                fecha_ing = rset.getString("fecha_ingres");
                cod = rset.getString("codigo");
                observ = rset.getString("observacion");
            }

        %>

        <form action="mantenimiento/persona/EditPerson.jsp" method="POST">
            <div class="panel-body">
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="nombres">Nombres</label>
                        <input type="text" class="form-control" id="nombres" name="nombres" value="<%=nomb%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="apellidos">Apellidos</label>
                        <input type="text" class="form-control"  id="apellidos" name="apell" value="<%=apell%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="dni">DNI</label>
                        <input type="text" class="form-control input-number" id="dni" name="dn" value="<%=dn%>" maxlength="8" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="celular">Celular</label>
                        <input type="text" class="form-control input-number" id="cel" name="cel" value="<%=cel%>" maxlength="9" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="direccion">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direc" value="<%=direc%>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="estado">Estado</label>
                        <input type="text" class="form-control" id="estado" name="est" value="<%=est%>">
                        <!--<input type="text" class="form-control" id="estado" name="estado" placeholder="Ingese Estado" required>-->
                    </div>
                    <div class="form-group col-md-4">
                        <label for="fechaingreso">Fecha de registro</label>
                        <input type="text" class="form-control" id="fechaingreso" name="fecha_ing" value="<%=fecha_ing%>">
                        <!--<input type="datetime-local"  placeholder="Ingrese Fecha">-->
                    </div>
                    <div class="form-group col-md-4">
                        <label for="codigo">Codigo</label>
                        <input type="text" class="form-control input-number" id="codigo" name="cod" value="<%=cod%>" maxlength="4" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="observacion">Observación</label>
                        <textarea class="form-control" id="observacion" name="observ"  maxlength="450"><%=observ%></textarea>
                    </div>
                </div>
                <div class="form-row" align="right">
                    <div class="form-group col-md-12">
                        <input type="submit" name="" id="" class="btn btn-warning btn-lg btn-block" value="Editar">
                        <input type="hidden" name="idper" value="<%=idPerson%>">
                    </div>
                </div>
            </div>
        </form>

    </body>
</html>
