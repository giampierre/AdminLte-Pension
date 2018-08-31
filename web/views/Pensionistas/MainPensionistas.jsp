<%-- 
    Document   : MainPensionistas
    Created on : 31/08/2018, 11:39:51 AM
    Author     : TIC-32
--%>
<%@include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            $(document).ready(function (e) {
                $('#enviar').addClass('inpusubmit');
                $('select').addClass('inputext5');
                $('#enviar').click(enviar);
                
            })
            function enviar() {
                $("iframe").remove();
                var url = 'views/Pensionistas/Pensionistas.jsp';


                if ($(this).hasClass("disabled"))
                {
                    $(this).removeClass("disabled in-progress").attr('value', 'Visualizar')
                } else
                {
                    $(this).addClass("disabled in-progress").attr('value', 'Espere...')
                }

                $('#detalle').load(url, $('#datos').serialize(), function () {
                    $('.disabled').removeClass("disabled in-progress").attr('value', 'Visualizar')
                });
            }

        </script>
    </head>
    <body>
        <%            String a_mes[][] = {{"01", "Enero"}, {"02", "Febrero"}, {"03", "Marzo"}, {"04", "Abril"}, {"05", "Mayo"}, {"06", "Junio"}, {"07", "Julio"}, {"08", "Agosto"}, {"09", "Setiembre"}, {"10", "Octubre"}, {"11", "Noviembre"}, {"12", "Diciembre"}};
            String s_mes = "";
            COMANDO = "Select "
                    + "date_format(sysdate(),'%M') mes "
                    + "from dual ";
            rset = stmt.executeQuery(COMANDO);
            rset.next();
            s_mes = rset.getString("mes");
        %>

        <form name="datos" target="view" id="datos" action="views/Pensionistas/Pensionistas.jsp">
       
            <table>
                <tr>		
                    <th align ="center" class="titulo" height="20" colspan="3">PENSIONISTAS</th>
                </tr>
                <tr>
                    <td width="220px">
                        <b>Periodo: </b>
                        <select name="f_mes_ini" id="f_mes_ini">
                            <%
                                for (int x = 0; x < a_mes.length; x++) {%>
                            <option value="<%=a_mes[x][0]%>" <% if (a_mes[x][0].equals(s_mes)) {
                                    out.print("selected");
                                }%>><%=a_mes[x][1]%></option>
                            <%						}	%>
                        </select>
                        <select name="f_anio_ini" id="f_anio_ini">
                            <%COMANDO = "select distinct date_format(fecha_ingreso,'%Y') anio "
                                        + "from pensionista "
                                        + "order by anio desc ";
                                rset = stmt.executeQuery(COMANDO);
                                while (rset.next()) {%>
                            <option value="<%=rset.getString("anio")%>"><%=rset.getString("anio")%></option>
                            <%}%>
                        </select>
                    </td>           
                    <td>
                        <input type="button" value="Visualizar" id="enviar" class="butoncito">                    
                    </td>
                </tr>	
                <tr>
                    <td colspan="3">
                        <div id="detalle"><br/>
                        </div>
                    </td>
                </tr>
                <br>
                <tr>
                    <td colspan="3">
                        <div id="cargando2" style="text-align:center;display:none"><img src="../../images/loading.gif" width="20px" height="20px"/></div>

                    </td>
                </tr>
            </table> 
        </form>
    </body>
</html>
