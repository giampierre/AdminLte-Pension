<%-- 
    Document   : DesaDiaDet
    Created on : 28/08/2018, 12:33:28 PM
    Author     : TIC-32
--%>
<%@include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="table-responsive">
            <table class="table table-bordered table-condensed table-hover">
                <thead>     
                    <tr>
                        <th>N°</th>
                        <th>Nombres</th>
                        <th>Nota</th>
                        <th>Fecha</th>
                        <th>Cantidad</th>
                        <th>Monto</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        String id_pensionista = request.getParameter("f_id_pensionista");
                        String nombres = "";
                        int cantidad = 0;
                        double monto = 0.0;
                        String fecha = "";
                        String nota = "";
                        int i = 0;
                        double monto_real = 0.0;
                        int sumar_cantidad = 0;
                        double sumar_monto = 0;

                        COMANDO = "SELECT pp.idPENSIONISTA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Para llevar','Almorzó') AS ESTADO, "
                                + "d.monto as monto_c, d.cantidad as cantidad, "
                                + "DATE_FORMAT(d.fecha_a, '%d-%m-%Y %H:%i:%s') as fecha_a "
                                + "FROM persona p, pensionista pp, almuerzo d "
                                + "WHERE p.idpersona = pp.idpersona "
                                + "AND pp.idpensionista = d.idpensionista "
                                + "AND DATE_FORMAT(d.fecha_a,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') "
                                + "AND pp.idPENSIONISTA = '" + id_pensionista + "' "
                                + "ORDER BY d.fecha_a DESC";
                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);

                        while (rset.next()) {
                            i++;
                            nombres = rset.getString("Nombres");
                            nota = rset.getString("ESTADO");
                            fecha = rset.getString("fecha_a");
                            cantidad = rset.getInt("cantidad");
                            monto = rset.getDouble("monto_c");
                            monto_real = cantidad * monto;
                            sumar_cantidad += cantidad;
                            sumar_monto += monto_real;


                    %>

                    <tr>        
                        <td><%=i%></td>
                        <td><%=nombres%></td>
                        <td><%=nota%></td>
                        <td><%=fecha%></td> 
                        <td><%=cantidad%></td> 
                        <td><%=monto_real%></td> 

                    </tr>
                    <%}%>
                </tbody>
                <tfoot>
                    <tr><th colspan="4">Total</th>
                        <th><%=sumar_cantidad%></th>
                        <th><%=sumar_monto%></th>
                        <th><br></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </body>
</html>
