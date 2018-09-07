<%-- 
    Document   : Dashboard
    Created on : 24/08/2018, 11:19:33 AM
    Author     : TIC-32
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="dist/js/modalDetDashboard.js" type="text/javascript"></script>
        <link href="dist/css/styleDashboard.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div>

                <div class="col-md-4">
                    <!-- Info Boxes Style 2 -->
                    <div class="info-box bg-yellow-active">
                        <span class="info-box-icon"><i class="fa fa-coffee"></i></span>         
                        <div class="info-box-content">
                            <span class="info-box-text">Desayunos</span>
                            <%                                
                                String CantDesaDia = "";

                                COMANDO = "SELECT COUNT(idDESAYUNO) as CantDesaDia "
                                        + "FROM (SELECT d.idDESAYUNO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Desayunó','No Desayunó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_d "
                                        + " FROM persona p, pensionista pp, desayuno d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND DATE_FORMAT(d.fecha_d,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y')) a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantDesaDia = rset.getString("CantDesaDia");
                                }
                            %>  
                            <span class="info-box-number"><a id="modal_uno" data-toggle="modal" data-target="#myModal"><%=CantDesaDia%></a></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                String CantDesaMes = "";
                                COMANDO = "SELECT COUNT(idDESAYUNO) as CantDesaMes "
                                        + "FROM (SELECT d.idDESAYUNO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Desayunó','No Desayunó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_d "
                                        + "FROM persona p, pensionista pp, desayuno d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND DATE_FORMAT(d.fecha_d,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y')) as a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantDesaMes = rset.getString("CantDesaMes");
                                }
                            %>
                            <span class="progress-description"><a id="modal_dos" data-toggle="modal" data-target="#myModal"><%=CantDesaMes%></a></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <div class="col-md-4">
                    <div class="info-box bg-yellow-active">
                        <span class="info-box-icon"><i class="fa fa-cutlery"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Almuerzos</span>
                            <%
                                String CantAlmuDia = "";

                                COMANDO = "SELECT COUNT(idALMUERZO) as CantAlmuDia "
                                        + "FROM (SELECT d.idALMUERZO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Almorzó','No Almorzó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_a "
                                        + " FROM persona p, pensionista pp, almuerzo d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND DATE_FORMAT(d.fecha_a,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y')) a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantAlmuDia = rset.getString("CantAlmuDia");
                                }
                            %> 
                            <span class="info-box-number"><a id="modal_tres" data-toggle="modal" data-target="#myModal"><%=CantAlmuDia%></a></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                String CantAlmuMes = "";
                                COMANDO = "SELECT COUNT(idALMUERZO) as CantAlmuMes "
                                        + "FROM (SELECT d.idALMUERZO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Almorzó','No Almorzó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_a "
                                        + "FROM persona p, pensionista pp, almuerzo d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND DATE_FORMAT(d.fecha_a,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y')) as a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantAlmuMes = rset.getString("CantAlmuMes");
                                }
                            %>
                            <span class="progress-description" ><a id="modal_cuatro" data-toggle="modal" data-target="#myModal"><%=CantAlmuMes%></a></span>

                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <div class="col-md-4">
                    <div class="info-box bg-yellow-active">
                        <span class="info-box-icon"><i class="fa fa-glass"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Cenas</span>
                            <%
                                String CantCenaDia = "";

                                COMANDO = "SELECT COUNT(idCENA) as CantCenaDia "
                                        + "FROM (SELECT d.idCENA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Cenó','No Cenó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_c "
                                        + " FROM persona p, pensionista pp, cena d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND DATE_FORMAT(d.fecha_c,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y')) a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantCenaDia = rset.getString("CantCenaDia");
                                }
                            %>  
                            <span  class="info-box-number"><a id="modal_cinco" data-toggle="modal" data-target="#myModal"><%=CantCenaDia%></a></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                String CantCenaMes = "";
                                COMANDO = "SELECT COUNT(idCENA) as CantCenaMes "
                                        + "FROM (SELECT d.idCENA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Cenó','No Cenó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_c "
                                        + "FROM persona p, pensionista pp, cena d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND DATE_FORMAT(d.fecha_c,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y')) as a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantCenaMes = rset.getString("CantCenaMes");
                                }
                            %>
                            <span class="progress-description" ><a id="modal_seis" data-toggle="modal" data-target="#myModal"><%=CantCenaMes%></a></span>

                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-green">
                        <span class="info-box-icon"><i class="fa fa-coffee"><span style="font-size: 25px;">G</span></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Desayunos General</span>
                            <%
                                String CantDesaDiaGene = "";

                                COMANDO = "SELECT COUNT(idDESAYUNO) as CantDesaDia "
                                        + "FROM (SELECT d.idDESAYUNO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Desayunó','No Desayunó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_d "
                                        + " FROM persona p, pensionista pp, desayuno d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND pp.tipo = '0' "
                                        + " AND DATE_FORMAT(d.fecha_d,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y')) a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantDesaDiaGene = rset.getString("CantDesaDia");
                                }
                            %> 
                            <span  class="info-box-number" data ><%=CantDesaDiaGene%></span>


                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                String CantDesaMesGene = "";
                                COMANDO = "SELECT COUNT(idDESAYUNO) as CantDesaMes "
                                        + "FROM (SELECT d.idDESAYUNO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Desayunó','No Desayunó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_d "
                                        + "FROM persona p, pensionista pp, desayuno d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND pp.tipo = '0' "
                                        + "AND DATE_FORMAT(d.fecha_d,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y')) as a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantDesaMesGene = rset.getString("CantDesaMes");
                                }
                            %>
                            <span class="progress-description"><%=CantDesaMesGene%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-green">
                        <span class="info-box-icon"><i class="fa fa-cutlery"><span style="font-size: 25px;">&nbsp;G</span></i></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Almuerzos General</span>
                                 <%
                                String CantAlmuDiaGene = "";

                                COMANDO = "SELECT COUNT(idALMUERZO) as CantAlmuDia "
                                        + "FROM (SELECT d.idALMUERZO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Almorzó','No Almorzó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_a "
                                        + " FROM persona p, pensionista pp, almuerzo d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND pp.tipo = '0' "
                                        + " AND DATE_FORMAT(d.fecha_a,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y')) a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantAlmuDiaGene = rset.getString("CantAlmuDia");
                                }
                            %> 
                            <span class="info-box-number" ><%=CantAlmuDiaGene%></span>


                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                String CantAlmuMesGene = "";
                                COMANDO = "SELECT COUNT(idALMUERZO) as CantAlmuMes "
                                        + "FROM (SELECT d.idALMUERZO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Almorzó','No Almorzó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_a "
                                        + "FROM persona p, pensionista pp, almuerzo d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND pp.tipo = '0' "
                                        + "AND DATE_FORMAT(d.fecha_a,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y')) as a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantAlmuMesGene = rset.getString("CantAlmuMes");
                                }
                            %>
                            <span class="progress-description"><%=CantAlmuMesGene%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-green">
                        <span class="info-box-icon"><i class="fa fa-glass"><span style="font-size: 25px;">G</span></i></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Cenas General</span>
                            <%
                                String CantCenaDiaGene = "";

                                COMANDO = "SELECT COUNT(idCENA) as CantCenaDia "
                                        + "FROM (SELECT d.idCENA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Cenó','No Cenó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_c "
                                        + " FROM persona p, pensionista pp, cena d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND pp.tipo = '0' "
                                        + " AND DATE_FORMAT(d.fecha_c,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y')) a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantCenaDiaGene = rset.getString("CantCenaDia");
                                }
                            %>  
                            <span  class="info-box-number" ><%=CantCenaDiaGene%></span>


                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                String CantCenaMesGene = "";
                                COMANDO = "SELECT COUNT(idCENA) as CantCenaMes "
                                        + "FROM (SELECT d.idCENA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Cenó','No Cenó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_c "
                                        + "FROM persona p, pensionista pp, cena d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND pp.tipo = '0' "
                                        + "AND DATE_FORMAT(d.fecha_c,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y')) as a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantCenaMesGene = rset.getString("CantCenaMes");
                                }
                            %>
                            <span class="progress-description"><%=CantCenaMesGene%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-aqua-active">
                        <span class="info-box-icon"><i class="fa fa-coffee"><span style="font-size: 25px;">E</span></i></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Desayunos Ejecutivos</span>
                            <%
                                String CantDesaDiaEjec = "";

                                COMANDO = "SELECT COUNT(idDESAYUNO) as CantDesaDia "
                                        + "FROM (SELECT d.idDESAYUNO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Desayunó','No Desayunó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_d "
                                        + " FROM persona p, pensionista pp, desayuno d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND pp.tipo = '1' "
                                        + " AND DATE_FORMAT(d.fecha_d,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y')) a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantDesaDiaEjec = rset.getString("CantDesaDia");
                                }
                            %> 
                            <span class="info-box-number" ><%=CantDesaDiaEjec%></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                             <%
                                String CantDesaMesEjec = "";
                                COMANDO = "SELECT COUNT(idDESAYUNO) as CantDesaMes "
                                        + "FROM (SELECT d.idDESAYUNO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Desayunó','No Desayunó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_d "
                                        + "FROM persona p, pensionista pp, desayuno d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND pp.tipo = '1' "
                                        + "AND DATE_FORMAT(d.fecha_d,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y')) as a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantDesaMesEjec = rset.getString("CantDesaMes");
                                }
                            %>
                            <span class="progress-description" ><%=CantDesaMesEjec%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-aqua-active">
                        <span class="info-box-icon"><i class="fa fa-cutlery"><span style="font-size: 25px;">&nbsp;E</span></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Almuerzos Ejecutivos</span>
                            <%
                                String CantAlmuDiaEjec = "";

                                COMANDO = "SELECT COUNT(idALMUERZO) as CantAlmuDia "
                                        + "FROM (SELECT d.idALMUERZO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Almorzó','No Almorzó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_a "
                                        + " FROM persona p, pensionista pp, almuerzo d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND pp.tipo = '1' "
                                        + " AND DATE_FORMAT(d.fecha_a,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y')) a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantAlmuDiaEjec = rset.getString("CantAlmuDia");
                                }
                            %> 
                            <span class="info-box-number" ><%=CantAlmuDiaEjec%></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                String CantAlmuMesEjec = "";
                                COMANDO = "SELECT COUNT(idALMUERZO) as CantAlmuMes "
                                        + "FROM (SELECT d.idALMUERZO, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Almorzó','No Almorzó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_a "
                                        + "FROM persona p, pensionista pp, almuerzo d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND pp.tipo = '1' "
                                        + "AND DATE_FORMAT(d.fecha_a,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y')) as a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantAlmuMesEjec = rset.getString("CantAlmuMes");
                                }
                            %>
                            <span class="progress-description"><%=CantAlmuMesEjec%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-aqua-active">
                        <span class="info-box-icon"><i class="fa fa-glass"><span style="font-size: 25px;">E</span></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Cenas Ejecutivos</span>
                            <%
                                String CantCenaDiaEjec = "";

                                COMANDO = "SELECT COUNT(idCENA) as CantCenaDia "
                                        + "FROM (SELECT d.idCENA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                                        + " pp.monto, pp.fecha_ingreso, d.titulo,"
                                        + " if(d.estado=1,'Si Cenó','No Cenó') AS ESTADO, "
                                        + " d.monto as monto_c, d.cantidad, d.fecha_c "
                                        + " FROM persona p, pensionista pp, cena d "
                                        + " WHERE p.idpersona = pp.idpersona "
                                        + " AND pp.idpensionista = d.idpensionista "
                                        + " AND pp.tipo = '1' "
                                        + " AND DATE_FORMAT(d.fecha_c,'%d%m%Y') = DATE_FORMAT(sysdate(), '%d%m%Y')) a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantCenaDiaEjec = rset.getString("CantCenaDia");
                                }
                            %>  
                            <span class="info-box-number" ><%=CantCenaDiaEjec%></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                String CantCenaMesEjec = "";
                                COMANDO = "SELECT COUNT(idCENA) as CantCenaMes "
                                        + "FROM (SELECT d.idCENA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                        + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Si Cenó','No Cenó') AS ESTADO, "
                                        + "d.monto as monto_c, d.cantidad, d.fecha_c "
                                        + "FROM persona p, pensionista pp, cena d "
                                        + "WHERE p.idpersona = pp.idpersona "
                                        + "AND pp.idpensionista = d.idpensionista "
                                        + "AND pp.tipo = '1' "
                                        + "AND DATE_FORMAT(d.fecha_c,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y')) as a ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantCenaMesEjec = rset.getString("CantCenaMes");
                                }
                            %>
                            <span class="progress-description" ><%=CantCenaMesEjec%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-purple">
                        <span class="info-box-icon"><i class="fa fa-battery-3"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number"></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description">

                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-purple">
                        <span class="info-box-icon"><i class="fa fa-ambulance"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description" >

                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-purple">
                        <span class="info-box-icon"><i class="fa fa-stethoscope"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description" >

                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-red-active">
                        <span class="info-box-icon"><i class="fa fa-wheelchair"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number"></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description">

                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-red-active">
                        <span class="info-box-icon"><i class="fa fa-hospital-o"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description" >

                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4" style="display: none;">
                    <div class="info-box bg-red-active">
                        <span class="info-box-icon"><i class="fa fa-money"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number">???????</span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description">

                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-red-active">
                        <span class="info-box-icon"><i class="fa fa-frown-o"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number" >

                            </span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description">

                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

            </div>


            <div class="modal fade" id="modal-detalle">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"></h4>
                        </div>           
                    </div>
                    <div class="box">
                        <!-- /.box-header -->

                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->

        </div>
        <!--Modal de detalles de comidas -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                    </div>
                    <div class="modal-body">
                        <div id="detalle">

                        </div>

                    </div>
                </div>
            </div>    
        </div>
    </body>
</html>
