<%-- 
    Document   : PensionistasMes
    Created on : 27/08/2018, 04:46:02 PM
    Author     : TIC-32
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="dist/js/buscador.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <script>

            function myModal(s_id_pensionista) {
                $('#detalle').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
                $('#detalle').load('views/Pensionistas/PensionistasMesDet.jsp?f_id_pensionista=' + s_id_pensionista);

            }

        </script>
    </head>
    <body>
        <div class="box-header">
            <%  Date FechaActual = new Date();
                //SimpleDateFormat ft = new SimpleDateFormat("EEEEEEEEE dd 'de'   MMMMM 'de' yyyy"); //formato completo
                SimpleDateFormat ft = new SimpleDateFormat("MMMMM");
                String fecha = ft.format(FechaActual);
            %>

            <h3 class="box-title">Lista de pensionistas del mes de <%=fecha%></h3>

            <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                    <input id="buscar"  type="text" onkeyup="buscarDatos()" class="form-control pull-right" placeholder="Buscar...">

                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-responsive">    
            <table class="table table-bordered table-condensed table-hover">
                <thead> 
                    <tr>
                        <th>N°</th>
                        <th>Nombres</th>
                        <th>DNI</th>
                        <th>Celular</th>
                        <th>Dirección</th>
                        <th>Nota</th>
                        <th>Registrado</th>
                        <th>S/</th>
                        <th>Detalle</th>
                    </tr>
                </thead>
                <tbody id="datos">
                    <%
                        

                        String s_nombre = "";
                        String dni = "";
                        String celular = "";
                        String direccion = "";
                        String nota = "";
                        String estado = "";
                        String fecha_ingreso = "";
                        String s_id_pensionista = "";
                        double monto = 0.0;
                        int i = 0;

                        COMANDO = "SELECT pe.idPENSIONISTA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, p.dni, p.celular, p.direccion, p.observacion, IF(pe.estado=1, 'Activo', 'Inactivo') AS estado, pe.fecha_ingreso, pe.monto "
                                + "FROM persona p, pensionista pe "
                                + "WHERE p.idPERSONA = pe.idPERSONA "
                                + "AND DATE_FORMAT(pe.fecha_ingreso,'%Y%m') = DATE_FORMAT(sysdate(), '%Y%m')";
                        rset = stmt.executeQuery(COMANDO);
                        out.println(COMANDO);
                        while (rset.next()) {
                            i++;
                            s_nombre = rset.getString("Nombres");
                            dni = rset.getString("dni");
                            celular = rset.getString("celular");
                            direccion = rset.getString("direccion");
                            nota = rset.getString("observacion");
                            estado = rset.getString("estado");
                            fecha_ingreso = rset.getString("fecha_ingreso");
                            monto = rset.getDouble("monto");
                            s_id_pensionista = rset.getString("idPENSIONISTA");

                    %>
                    <tr>        
                        <td><%=i%></td>
                        <td><%=s_nombre%></td>  
                        <td><%=dni%></td> 
                        <td><%=celular%></td> 
                        <td><%=direccion%></td> 
                        <td><%=nota%></td> 
                        <td><%=fecha_ingreso%></td> 
                        <td><%=monto%></td> 
                        <td><a id="modal_desaUno" data-toggle="modal" onclick="myModal('<%=s_id_pensionista%>')" data-target="#myModal"><button class="btn btn-success btn-sm fa fa-eye"></button></a></td> 

                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        Detalle consumo del mes de <%=fecha%>
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
