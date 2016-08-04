<%-- 
    Document   : logout
    Created on : May 1, 2014, 1:56:44 PM
    Author     : HERY
--%>
<%
session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("../index.jsp");
%>
