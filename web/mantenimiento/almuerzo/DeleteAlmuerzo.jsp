<%-- 
    Document   : DeletePerson
    Created on : 26-set-2018, 21:46:23
    Author     : Andy7
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%    
    String idAlmuerzo = request.getParameter("idalmuerzo");

    int rsetx = 0;
    COMANDO = "DELETE FROM ALMUERZO WHERE idAlmuerzo = '" + idAlmuerzo + "' ";
    //out.print(COMANDO);
    rsetx = stmt.executeUpdate(COMANDO);

//response.sendRedirect("ListPerson.jsp");

%>
