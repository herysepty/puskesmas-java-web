<%-- 
    Document   : member
    Created on : May 1, 2014, 1:43:17 PM
    Author     : HERY
--%>

            <%
            if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
            %>
            <a href="index.jsp">Please Login</a>
            <%
            }else {
                if(session.getAttribute("username")=="Admin"){
                    %>
                   <jsp:include page="../page/registrasi.jsp" flush="true"></jsp:include>
                     <%
                }else{
                     %>
                Welcome <%=session.getAttribute("username")%>
                <a href='process/logout.jsp'>Log out</a>
                     <%
            }
        }
        %>

