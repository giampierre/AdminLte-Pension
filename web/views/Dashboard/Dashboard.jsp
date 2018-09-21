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
        <style>
            small {
                font-weight: normal;
            }
        </style>
    </head>
    <body>
        <div style="margin-top: 10px;">
            <div >

                <div class="col-md-4">
                    <!-- Info Boxes Style 2 -->
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-coffee" style="color: #fff;"></i></span>         
                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Total de Desayunos</b></span>
                            <%                                String CantDesaDia = "";

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
                            <span class="info-box-number"><a class="label bg-yellow" id="modal_uno" data-toggle="modal" data-target="#myModal"><%=CantDesaDia%></a><small>&nbsp;Día</small></span>

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
                            <span class="progress-description"><a class="label bg-green" id="modal_dos" data-toggle="modal" data-target="#myModal"><%=CantDesaMes%></a>&nbsp;Mes</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-cutlery" style="color: #fff;"></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Total de Almuerzos</b></span>
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
                            <span class="info-box-number"><a class="label bg-yellow" id="modal_tres" data-toggle="modal" data-target="#myModal"><%=CantAlmuDia%></a><small>&nbsp;Día</small></span>

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
                            <span class="progress-description" ><a class="label bg-green" id="modal_cuatro" data-toggle="modal" data-target="#myModal"><%=CantAlmuMes%></a>&nbsp;Mes</span>

                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-glass" style="color: #fff;"></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Total de Cenas</b></span>
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
                            <span  class="info-box-number"><a class="label bg-yellow" id="modal_cinco" data-toggle="modal" data-target="#myModal"><%=CantCenaDia%></a><small>&nbsp;Día</small></span>

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
                            <span class="progress-description" ><a class="label bg-green" id="modal_seis" data-toggle="modal" data-target="#myModal"><%=CantCenaMes%></a>&nbsp;Mes</span>

                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-coffee" style="color: #fff;"><span style="font-size: 25px;">G</span></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Desayunos General</b></span>
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
                            <span  class="info-box-number" data ><a class="label bg-yellow" id="modal_siete" data-toggle="modal" data-target="#myModal"><%=CantDesaDiaGene%></a><small>&nbsp;Día</small></span>


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
                            <span class="progress-description"><a class="label bg-green" id="modal_ocho" data-toggle="modal" data-target="#myModal"><%=CantDesaMesGene%></a>&nbsp;Mes</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-cutlery" style="color: #fff;"><span style="font-size: 25px;">&nbsp;G</span></i></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Almuerzos General</b></span>
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
                            <span class="info-box-number" ><a class="label bg-yellow" id="modal_nueve" data-toggle="modal" data-target="#myModal"><%=CantAlmuDiaGene%></a><small>&nbsp;Día</small></span>


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
                            <span class="progress-description"><a class="label bg-green" id="modal_diez" data-toggle="modal" data-target="#myModal"><%=CantAlmuMesGene%></a>&nbsp;Mes</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-glass" style="color: #fff;"><span style="font-size: 25px;">G</span></i></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Cenas General</b></span>
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
                            <span  class="info-box-number" ><a class="label bg-yellow" id="modal_once" data-toggle="modal" data-target="#myModal"><%=CantCenaDiaGene%></a><small>&nbsp;Día</small></span>


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
                            <span class="progress-description"><a class="label bg-green" id="modal_doce" data-toggle="modal" data-target="#myModal"><%=CantCenaMesGene%></a>&nbsp;Mes</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-coffee" style="color: #fff;"><span style="font-size: 25px;">E</span></i></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Desayunos Ejecutivos</b></span>
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
                            <span class="info-box-number" ><a class="label bg-yellow" id="modal_trece" data-toggle="modal" data-target="#myModal"><%=CantDesaDiaEjec%></a><small>&nbsp;Día</small></span>

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
                            <span class="progress-description" ><a class="label bg-green" id="modal_catorce" data-toggle="modal" data-target="#myModal"><%=CantDesaMesEjec%></a>&nbsp;Mes</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-cutlery" style="color: #fff;"><span style="font-size: 25px;">&nbsp;E</span></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Almuerzos Ejecutivos</b></span>
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
                            <span class="info-box-number" ><a class="label bg-yellow" id="modal_quince" data-toggle="modal" data-target="#myModal"><%=CantAlmuDiaEjec%></a><small>&nbsp;Día</small></span>

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
                            <span class="progress-description"><a class="label bg-green" id="modal_dieciseis" data-toggle="modal" data-target="#myModal"><%=CantAlmuMesEjec%></a>&nbsp;Mes</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-glass" style="color: #fff;"><span style="font-size: 25px;">E</span></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Cenas Ejecutivos</b></span>
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
                            <span class="info-box-number" ><a class="label bg-yellow" id="modal_diecisiete" data-toggle="modal" data-target="#myModal"><%=CantCenaDiaEjec%></a><small>&nbsp;Día</small></span>

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
                            <span class="progress-description" ><a class="label bg-green" id="modal_dieciocho" data-toggle="modal" data-target="#myModal"><%=CantCenaMesEjec%></a>&nbsp;Mes</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-money" style="color: #fff;"></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Ganancias Desayunos</b></span>
                            <%
                                double ganan_desa_día = 0.0;

                                COMANDO = "SELECT IFNULL(sum(monto), 0) as Totalmonto "
                                        + "FROM desayuno "
                                        + "WHERE DATE_FORMAT(fecha_d,'%d%m%Y' "
                                        + ") = DATE_FORMAT(sysdate(), '%d%m%Y' "
                                        + ")";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    ganan_desa_día = rset.getDouble("Totalmonto");
                                }
                            %>  
                            <span class="info-box-number label label-warning">S/&nbsp;<%=ganan_desa_día%></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                double ganan_desa_mes = 0.0;

                                COMANDO = "SELECT IFNULL(sum(monto), 0) as Totalmonto "
                                        + "FROM desayuno "
                                        + "WHERE DATE_FORMAT(fecha_d,'%Y%m%' "
                                        + ") = DATE_FORMAT(sysdate(), '%Y%m%' "
                                        + ")";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    ganan_desa_mes = rset.getDouble("Totalmonto");
                                }
                            %> 
                            <span class="progress-description label label-success">S/&nbsp;<%=ganan_desa_mes%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-money" style="color: #fff;"></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Ganancias Almuerzos</b></span>
                              <%
                                double ganan_almu_día = 0.0;

                                COMANDO = "SELECT IFNULL(sum(monto), 0) as Totalmonto "
                                        + "FROM almuerzo "
                                        + "WHERE DATE_FORMAT(fecha_a,'%d%m%Y' "
                                        + ") = DATE_FORMAT(sysdate(), '%d%m%Y' "
                                        + ")";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    ganan_almu_día = rset.getDouble("Totalmonto");
                                }
                            %>  
                            <span class="info-box-number label label-warning" >S/&nbsp;<%=ganan_almu_día%></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                                <%
                                double ganan_almu_mes = 0.0;

                                COMANDO = "SELECT IFNULL(sum(monto), 0) as Totalmonto "
                                        + "FROM almuerzo "
                                        + "WHERE DATE_FORMAT(fecha_a,'%Y%m' "
                                        + ") = DATE_FORMAT(sysdate(), '%Y%m' "
                                        + ")";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    ganan_almu_mes = rset.getDouble("Totalmonto");
                                }
                            %> 
                            <span class="progress-description label label-success" >S/&nbsp;<%=ganan_almu_mes%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-money" style="color: #fff;"></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Ganancias Cenas</b></span>
                                <%
                                double ganan_cena_día = 0.0;

                                COMANDO = "SELECT IFNULL(sum(monto), 0) as Totalmonto "
                                        + "FROM cena "
                                        + "WHERE DATE_FORMAT(fecha_c,'%d%m%Y' "
                                        + ") = DATE_FORMAT(sysdate(), '%d%m%Y' "
                                        + ")";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    ganan_cena_día = rset.getDouble("Totalmonto");
                                }
                            %>  
                            <span class="info-box-number label label-warning" >S/&nbsp;<%=ganan_cena_día%></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                                <%
                                double ganan_cena_mes = 0.0;

                                COMANDO = "SELECT IFNULL(sum(monto), 0) as Totalmonto "
                                        + "FROM cena "
                                        + "WHERE DATE_FORMAT(fecha_c,'%Y%m' "
                                        + ") = DATE_FORMAT(sysdate(), '%Y%m' "
                                        + ")";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    ganan_cena_mes = rset.getDouble("Totalmonto");
                                }
                            %>  
                            <span class="progress-description label label-success" >S/&nbsp;<%=ganan_cena_mes%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-user-circle" style="color: #fff;"><span style="font-size: 25px;">P</span></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Personas</b></span>
                            <%
                                String CantPersonaActivas = "";

                                COMANDO = "SELECT COUNT(idPersona) as CantPersonaA "
                                        + "FROM persona "
                                        + "WHERE estado = 1 ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {

                                    CantPersonaActivas = rset.getString("CantPersonaA");
                                }
                            %>  
                            <span class="info-box-number" >Activos:&nbsp;<%=CantPersonaActivas%></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <%
                                String CantPersonaDesactiva = "";
                                COMANDO = "SELECT COUNT(idPersona) as CantPersonaD "
                                        + "FROM persona "
                                        + "WHERE estado = 0 ";

                                rset = stmt.executeQuery(COMANDO);
                                //out.println(COMANDO);
                                while (rset.next()) {
                                    CantPersonaDesactiva = rset.getString("CantPersonaD");
                                }
                            %>
                            <span class="progress-description" >Desactivos: &nbsp;<%=CantPersonaDesactiva%></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-hospital-o" style="color: #fff;"></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Usuarios</b></span>
                            <span class="info-box-number" >0</span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description" >0</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4" style="display: none;">
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-money" style="color: #fff;"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">-----</span>
                            <span class="info-box-number">12</span>

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
                    <div class="info-box bg-gray">
                        <span class="info-box-icon bg-gray-active"><i class="fa fa-frown-o" style="color: #fff;"></i></span>

                        <div class="info-box-content bg-gray-light">
                            <span class="info-box-text"><b>Pensionistas</b></span>
                            <span class="info-box-number" >0</span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description">0</span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                        <br>
        <br>

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
