<%-- 
    Document   : Dashboard
    Created on : 24/08/2018, 11:19:33 AM
    Author     : TIC-32
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div>

                <div class="col-md-4">
                    <!-- Info Boxes Style 2 -->
                    <div class="info-box bg-yellow">
                        <span class="info-box-icon"><i class="fa fa-heartbeat"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Hospitalizados</span>
                            <span class="info-box-number cursor"></span>

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
                    <div class="info-box bg-yellow">
                        <span class="info-box-icon"><i class="fa fa-plus"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Ingresos</span>
                            <span class="info-box-number cursor" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor" >

                            </span>

                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <div class="col-md-4">
                    <div class="info-box bg-yellow">
                        <span class="info-box-icon"><i class="fa fa-minus"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Egresos</span>
                            <span  class="info-box-number cursor"  ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor" >

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
                            <span class="info-box-text">Privadas disponibles</span>
                            <span  class="info-box-number cursor" data ></span>


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
                            <span class="info-box-text">Bipersonales disponibles</span>
                            <span class="info-box-number cursor" ></span>


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
                            <span class="info-box-text">Suites disponibles</span>
                            <span  class="info-box-number cursor" ></span>


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
                            <span class="info-box-text">Camas bloqueadas</span>
                            <span class="info-box-number cursor" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor" >

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
                            <span class="info-box-text">Mortalidad</span>
                            <span class="info-box-number cursor" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor">

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
                            <span class="info-box-text">Interconsultas sin contestar</span>
                            <span class="info-box-number cursor" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor" >
                                sin contestar del mes
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
                            <span class="info-box-text"></span>
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
                            <span class="info-box-text">Origen: Emergencia</span>
                            <span class="info-box-number cursor" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor" >

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
                            <span class="info-box-text">Origen: Ambulatorio</span>
                            <span class="info-box-number cursor" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor" >

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
                            <span class="info-box-text">Altas (Casa)</span>
                            <span class="info-box-number cursor"></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor">

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
                            <span class="info-box-text">Referencias</span>
                            <span class="info-box-number cursor" ></span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor" >

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
                            <span class="info-box-text">Monto facturado</span>
                            <span class="info-box-number">S/ 25,025.54</span>

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
                            <span class="info-box-text">Pacientes fuga</span>
                            <span class="info-box-number cursor" >

                            </span>

                            <div class="progress">
                                <div class="progress-bar" style="width: 100%"></div>
                            </div>
                            <span class="progress-description cursor">

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
    </body>
</html>
