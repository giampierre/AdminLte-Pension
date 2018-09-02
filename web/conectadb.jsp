<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.sql.*, javax.naming.*" %>



<%
    //Inicio de la conexión a Mysql

    Statement stmt = null;
    Statement stmt2 = null;
    ResultSet rset = null;
    ResultSet rset2 = null;
    PreparedStatement pstmt = null;

    Date dt = new Date();

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/bd_pension", "root", "");

    stmt = conn.createStatement();
    stmt2 = conn.createStatement();

    String COMANDO = "";
    String COMANDO2 = "";
    DecimalFormat formateador = new DecimalFormat("##########0.00 ; (-###0.00)");
    DecimalFormat formateador1 = new DecimalFormat("##########0.00");
    DecimalFormat formateador2 = new DecimalFormat("#####,###,##0.00");

    NumberFormat nf = NumberFormat.getInstance();


    //fin de la conexión

%>
