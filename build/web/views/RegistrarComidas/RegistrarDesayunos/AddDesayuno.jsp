<%-- 
    Document   : add_almuerzo
    Created on : 07-jul-2018, 15:32:40
    Author     : Andy7
--%>

<%@page import="java.net.URL"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        
        <%
            
          
            String s_dni = request.getParameter("dni");
   
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_pension",
                    "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            
           
            
            int idpersona = 0;
            int idpensionista = 0;
            String nombres = "";
            rs = st.executeQuery("SELECT p.idPERSONA, pe.idPENSIONISTA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres,"
                    + " p.dni FROM persona p, pensionista pe "
                    + "WHERE p.idPERSONA = pe.idPERSONA "
                    + "AND p.dni='" + s_dni + "' "
                    + "AND DATE_FORMAT(pe.fecha_ingreso,'%Y%m') = DATE_FORMAT(sysdate(), '%Y%m') ");
            if (rs.next()) {
                
                idpersona = rs.getInt("idpersona");
                idpensionista = rs.getInt("idpensionista");
                nombres = rs.getString("Nombres");

                session.setAttribute("s_dni", s_dni);
                
               //Insert 
              Statement Estamento = con.createStatement();
              int rs2 = Estamento.executeUpdate("INSERT INTO desayuno (idDESAYUNO, idPENSIONISTA, titulo, estado, fecha_d, monto, cantidad) VALUES "
                    + "(NULL, '" + idpensionista + "', 'DESAYUNO', '0'"
                            + ", sysdate(), '3', '1');");
              
                   if( s_dni.equals(s_dni) )
	{
            //out.print("Desayuno registrado<br />");
            out.print(rs.getString("Nombres"));
	}
               
               
            } else {
                //out.print("Desayuno no registrado<br />");
                out.print("Código Incorrecto");
            }
        %>
        
      

      
    </body>
</html>
