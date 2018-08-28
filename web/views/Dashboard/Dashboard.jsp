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
        <script src="dist/js/modalDet.js" type="text/javascript"></script>
        <link href="dist/css/styleDashboard.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div>

                <div class="col-md-4">
                    <!-- Info Boxes Style 2 -->
                    <div class="info-box bg-yellow">
                        <span class="info-box-icon"><i class="fa fa-coffee"></i></span>         
                        <div class="info-box-content">
                            <span class="info-box-text">Desayunos</span>
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
                    <div class="info-box bg-yellow">
                        <span class="info-box-icon"><i class="fa fa-cutlery"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Almuerzos</span>
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
                    <div class="info-box bg-yellow">
                        <span class="info-box-icon"><i class="fa fa-glass"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Cenas</span>
                            <span  class="info-box-number"  ></span>

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
                    <div class="info-box bg-green">
                        <span class="info-box-icon"><i class="fa fa-bed"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span  class="info-box-number" data ></span>


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
                    <div class="info-box bg-green">
                        <span class="info-box-icon"><i class="fa fa-bed"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number" ></span>


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
                    <div class="info-box bg-green">
                        <span class="info-box-icon"><i class="fa fa-bed"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span  class="info-box-number" ></span>


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
                    <div class="info-box bg-red">
                        <span class="info-box-icon"><i class="fa fa-ban"></i></span>

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
                    <div class="info-box bg-red">
                        <span class="info-box-icon"><i class="fa fa-dot-circle-o"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number" ></span>

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
                    <div class="info-box bg-red">
                        <span class="info-box-icon"><i class="fa fa-user-md"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">???????</span>
                            <span class="info-box-number" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description" >
                                ???????
                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-aqua">
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
                    <div class="info-box bg-aqua">
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
                    <div class="info-box bg-aqua">
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
                    <div class="info-box bg-purple">
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
                    <div class="info-box bg-purple">
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
                    <div class="info-box bg-purple">
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
                    <div class="info-box bg-purple">
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
