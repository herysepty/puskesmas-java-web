<%-- 
    Document   : index
    Created on : Apr 26, 2014, 6:10:00 PM
    Author     : HERY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puskesmas Online</title>
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
            </div>
            <div id="search">
                <img src=""/>
            </div>
            <div id="menu">
                <ul>
                    <li><a href="index.jsp?id=home">Home</a></li>
                    <li><a href="index.jsp?id=profile">Profile</a></li>
                    <li><a href="index.jsp?id=layanan">Layanan</a></li>
                    <li><a href="index.jsp?id=registrasi-pasien">Registrasi Pasien</a></li>
                </ul>
                <ul class="menu-left">
                    <li><a href="index.jsp?id=login">login</a></li>
                </ul>
            </div>
            <div id="content">
                <div id="content-main">
                    <%
                                if(request.getParameter("id")==null){
                                     %>
                                        <jsp:include page="page/home.jsp" flush="true"/>
                                     <%
                                }else{
                                    String kode=request.getParameter("id");
                                    if(kode.equals("home")){
                                        %>
                                        <jsp:include page="page/home.jsp" flush="true"/>
                                        <%
                                    }else if(kode.equals("login")){
                                        %>
                                        <jsp:include page="page/login.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("simpan")){
                                        %>
                                        <jsp:include page="process/simpan.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("dokter")){
                                        %>
                                        <jsp:include page="page/dokter.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("ruangan")){
                                        %>
                                        <jsp:include page="page/ruang.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("petugas")){
                                        %>
                                        <jsp:include page="page/petugas.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("registrasi-pasien")){
                                        %>
                                        <jsp:include page="page/registrasi-pasien.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("show")){
                                        %>
                                        <jsp:include page="page/show.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("simpan-dokter")){
                                        %>
                                        <jsp:include page="process/simpan-dokter.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("simpan-petugas")){
                                        %>
                                        <jsp:include page="process/simpan-petugas.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("profile")){
                                        %>
                                        <jsp:include page="page/post/profile.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("simpan-ruangan")){
                                        %>
                                        <jsp:include page="process/simpan-ruangan.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("layanan")){
                                        %>
                                        <jsp:include page="page/post/layanan.jsp" flush="true"></jsp:include>

                                        <%      
                                    }else if(kode.equals("edit")){
                                        %>
                                        <jsp:include page="process/edit.jsp" flush="true"></jsp:include>

                                        <%      
                                    }
                                }   
                        %>
                </div>
                <div id="sidebar">
                    <div id="sidebar-main">
                        <p>Kontak kami: <br/>
                            jl. petukangan utara, Jakarta selatan <br/>
                            email: puskesmasonline@gmail.com<br/>
                            cp:02109898xxx<br/>
                       </p>
                    </div>
                </div>
                <div id="sidebar">
                    <div id="sidebar-title">
                        <h5>Menu Master</h5>
                    </div>
                    <div id="sidebar-main">
                        <ul>
                    <li><a href="index.jsp?id=dokter">Dokter</a></li>
                    <li><a href="index.jsp?id=ruangan">Ruangan</a></li>
                    <li><a href="index.jsp?id=petugas">Petugas</a></li>
                    <li><a href="index.jsp?id=show">Lihat Data</a></li>
                </ul>
                    </div>
                </div>
            </div>
                <div id="footer">
                    <p>Copyright 2014 | Design Hery Septyadi and Yanuarius Bhae Beso</p>
                </div>
        </div>
    </body>
</html>
