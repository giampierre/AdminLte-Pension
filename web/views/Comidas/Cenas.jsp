<%-- 
    Document   : Desayunos
    Created on : 28/08/2018, 10:50:48 AM
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
                $('#detalle').load('views/Comidas/CenasDet.jsp?f_id_pensionista=' + s_id_pensionista);

            }

        </script>
    </head>
 
    <body>
         <%            
           
            String s_mes_ini = request.getParameter("f_mes_ini");
            String s_anio_ini = request.getParameter("f_anio_ini");
            String s_tipo = request.getParameter("f_tipo");

        %>
        <div class="box-header">       

            <h3 class="box-title"></h3>

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
                <thead style="color:#fff; background: #3b6486;">     
                    <tr>
                        <th>N°</th>
                        <th>Nombres</th>
                        <th>Fecha</th>
                        <th>Cantidad</th>
                        <th>Monto</th>
                        <th>Detalle</th>
                    </tr>
                </thead>
                <tbody id="datos">
                    <%                        
                        String nombres = "";
                        String cena = "";
                        int cantidad = 0;
                        double monto = 0.0;
                        String fecha = "";
                        int i = 0;
                        int sumar_cantidad = 0;
                        double sumar_monto = 0.0;
                        String s_id_pensionista = "";

                        COMANDO = "SELECT pp.idPENSIONISTA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                + "pp.monto, pp.fecha_ingreso, d.titulo, "
                                + "SUM(d.cantidad) AS cantidad, SUM(d.monto*d.cantidad) as monto_total, "
                                + "DATE_FORMAT(d.fecha_c, '%m-%Y' ) as fecha_c "
                                + "FROM persona p, pensionista pp, cena d  "
                                + "WHERE p.idpersona = pp.idpersona "
                                + "AND pp.idpensionista = d.idpensionista "
                                + "AND DATE_FORMAT(d.fecha_c,'%Y%m') = '" + s_anio_ini + s_mes_ini + "' "
                                + "AND pp.tipo = '" + s_tipo + "' "
                                + "GROUP BY pp.idPENSIONISTA "
                                + "ORDER BY Nombres ASC ";
                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);

                        while (rset.next()) {
                            i++;
                            nombres = rset.getString("Nombres");
                            fecha = rset.getString("fecha_c");
                            cantidad = rset.getInt("cantidad");
                            monto = rset.getDouble("monto_total");
                            s_id_pensionista = rset.getString("idPENSIONISTA");
                            sumar_cantidad += rset.getInt("cantidad");
                            sumar_monto += rset.getDouble("monto_total");


                    %>

                    <tr>        
                        <td><%=i%></td>
                        <td><%=nombres%></td>  
                        <td><%=fecha%></td> 
                        <td><%=cantidad%></td> 
                        <td><%=monto%></td> 
                        <td><a id="modal_desaUno" data-toggle="modal" onclick="myModal('<%=rset.getString("idPENSIONISTA")%>')" data-target="#myModal"><button class="btn btn-info btn-sm fa fa-eye"></button></a></td> 
                    </tr>
                    <%}%>
                </tbody>
                <tfoot>
                    <tr><th colspan="3">Total Cenas</th>
                        <th><%=sumar_cantidad%></th>
                        <th><%=sumar_monto%></th>
                        <th><br></th>
                    </tr>
                </tfoot>
            </table>
        </div>

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
