<%-- 
    Document   : DeletePerson
    Created on : 26-set-2018, 21:46:23
    Author     : Andy7
--%>
<%@ include file="../../conectadb.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%    
    String idDesayuno = request.getParameter("iddesayuno");

    int rsetx = 0;
    COMANDO = "DELETE FROM DESAYUNO WHERE idDesayuno = '" + idDesayuno + "' ";
    //out.print(COMANDO);
    rsetx = stmt.executeUpdate(COMANDO);

//response.sendRedirect("ListPerson.jsp");

%>
