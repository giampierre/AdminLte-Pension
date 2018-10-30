<%-- 
    Document   : AddCena
    Created on : 30/10/2018, 10:00:48 AM
    Author     : TIC-32
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
            String s_estado = request.getParameter("estado");
            int s_cantidad = Integer.parseInt(request.getParameter("cantidad"));

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_pension",
                    "root", "");
            Statement st = con.createStatement();
            ResultSet rs;

            int idpersona = 0;
            int idpensionista = 0;
            String nombres = "";
            String tipo_pensionista = "";
            rs = st.executeQuery("SELECT p.idPERSONA, pe.idPENSIONISTA, CONCAT(p.Nombres, ' ', p.Apellidos) as Nombres, pe.tipo,"
                    + " p.dni FROM persona p, pensionista pe "
                    + "WHERE p.idPERSONA = pe.idPERSONA "
                    + "AND p.dni='" + s_dni + "' "
                    + "AND DATE_FORMAT(pe.fecha_ingreso,'%Y%m') = DATE_FORMAT(sysdate(), '%Y%m') ");
            if (rs.next()) {

                idpersona = rs.getInt("idpersona");
                idpensionista = rs.getInt("idpensionista");
                nombres = rs.getString("Nombres");
                tipo_pensionista = rs.getString("tipo");

                session.setAttribute("s_dni", s_dni);

                if (tipo_pensionista.equals("0") & s_estado.equals("1")) {
                    //Insert 
                    Statement Estamento = con.createStatement();
                    int rs2 = Estamento.executeUpdate("INSERT INTO cena (idCENA, idPENSIONISTA, titulo, estado, fecha_c, monto, cantidad) VALUES "
                            + "(NULL, '" + idpensionista + "', 'CENA', '" + s_estado + "'"
                            + ", sysdate(), '3.5', '"+ s_cantidad +"');");

                } else if(tipo_pensionista.equals("0") & s_estado.equals("0")) {

                    Statement Estamento = con.createStatement();
                    int rs2 = Estamento.executeUpdate("INSERT INTO cena (idCENA, idPENSIONISTA, titulo, estado, fecha_c, monto, cantidad) VALUES "
                            + "(NULL, '" + idpensionista + "', 'CENA', '" + s_estado + "'"
                            + ", sysdate(), '3', '"+ s_cantidad +"');");

                }else if(tipo_pensionista.equals("1") & s_estado.equals("1")){
                
                     //Insert 
                    Statement Estamento = con.createStatement();
                    int rs2 = Estamento.executeUpdate("INSERT INTO cena (idCENA, idPENSIONISTA, titulo, estado, fecha_c, monto, cantidad) VALUES "
                            + "(NULL, '" + idpensionista + "', 'CENA', '" + s_estado + "'"
                            + ", sysdate(), '4.5', '"+ s_cantidad +"');");
                    
                }else if(tipo_pensionista.equals("1") & s_estado.equals("0")){
                    
                        //Insert 
                    Statement Estamento = con.createStatement();
                    int rs2 = Estamento.executeUpdate("INSERT INTO cena (idCENA, idPENSIONISTA, titulo, estado, fecha_c, monto, cantidad) VALUES "
                            + "(NULL, '" + idpensionista + "', 'CENA', '" + s_estado + "'"
                            + ", sysdate(), '4', '"+ s_cantidad +"');");
                    
                }
                        

                if (s_dni.equals(s_dni)) {
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