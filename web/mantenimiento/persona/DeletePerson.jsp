<%-- 
    Document   : DeletePerson
    Created on : 15-jul-2018, 21:46:23
    Author     : Elvis
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%    
    String idPerson = request.getParameter("idpersona");

    int rsetx = 0;
    COMANDO = "DELETE FROM persona WHERE idPersona = '" + idPerson + "' ";
    //out.print(COMANDO);
    rsetx = stmt.executeUpdate(COMANDO);

//response.sendRedirect("ListPerson.jsp");

%>
