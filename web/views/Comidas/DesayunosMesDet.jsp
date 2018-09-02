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
                    <%      
                        String id_pensionista = request.getParameter("f_id_pensionista");
                        String nombres = "";
                        String nota = "";
                        String cantidad = "";
                        String monto = "";
                        String fecha = "";
                        int i = 0;
                        
                        COMANDO = "SELECT pp.idPENSIONISTA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, "
                                + "pp.monto, pp.fecha_ingreso, d.titulo, if(d.estado=1,'Para llevar','Desayunó') AS ESTADO, " 
                                + "d.monto as monto_c, d.cantidad as cantidad, "
                                + "DATE_FORMAT(d.fecha_d, '%d-%m-%Y %H:%i:%s') as fecha_d " 
                                + "FROM persona p, pensionista pp, desayuno d "  
                                + "WHERE p.idpersona = pp.idpersona "  
                                + "AND pp.idpensionista = d.idpensionista "  
                                + "AND DATE_FORMAT(d.fecha_d,'%m%Y') = DATE_FORMAT(sysdate(), '%m%Y') " 
                                + "AND pp.idPENSIONISTA = '"+id_pensionista+"' "
                                + "ORDER BY d.fecha_d DESC";
                        rset = stmt.executeQuery(COMANDO);
                        //out.println(COMANDO);

                        while (rset.next()) {
                            i++;
                            nombres = rset.getString("Nombres");
                            nota = rset.getString("ESTADO");
                            fecha = rset.getString("fecha_d");
                            cantidad = rset.getString("cantidad");
                            monto = rset.getString("monto_c");


                    %>

                    <tr>        
                        <td><%=i%></td>
                        <td><%=nombres%></td>
                        <td><%=nota%></td>
                        <td><%=fecha%></td> 
                        <td><%=cantidad%></td> 
                        <td><%=monto%></td> 

                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
