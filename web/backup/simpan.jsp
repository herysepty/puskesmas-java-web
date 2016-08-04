<%-- 
    Document   : process
    Created on : May 1, 2014, 12:32:49 AM
    Author     : HERY
--%>


<%@page import="jdbc.koneksi" %>
<%@page import="jdbc.Manipulasi" %>
<%@page import="java.sql.*" %>
<% String kdPasien=request.getParameter("txtKdPasien");
    String username=request.getParameter("txtUsername");
    String pass=request.getParameter("txtPass");
    String nama=request.getParameter("txtNama");
    String jenkel=request.getParameter("jenkel");
    String tmp_lahir=request.getParameter("txtTmp_lahir");
    String tgl_lahir=request.getParameter("txtTgl_lahir");
    String umur=request.getParameter("txtUmur");
    String alamat=request.getParameter("txtAlamat");
    String noHp=request.getParameter("txtNo_tlp");
    String Email=request.getParameter("txtEmail");
    String tmpPekerjaan=request.getParameter("txtPekerjaan");
    String userpass=request.getParameter("txtUserPass");
    String kdDokter=request.getParameter("txtKdDokter");
    String nmDokter=request.getParameter("txtNmDokter");
    String alamatDokter=request.getParameter("txtAlamatDokter");
    String spesialis=request.getParameter("txtSpesialis");
    String kdRuang=request.getParameter("txtKdRuang");
    String nmRuang=request.getParameter("txtNmRuang");
    String gedung=request.getParameter("txtGedung");
    String kdPetugas=request.getParameter("txtKdPetugas");
    String NmPetugas=request.getParameter("txtNmPetugas");
    String pekerjaan=request.getParameter("pekerjaan");
    String alamatPetugas=request.getParameter("txtAlamatPetugas");
    String dapat=request.getParameter("cmdsimpan");
    String simpanpasien=request.getParameter("cmdsimpanpasien");
    String simpanDokter=request.getParameter("cmdDokter");
    String cmdRuangan=request.getParameter("cmdRuangan");
    if(simpanpasien.toString().equals("Simpan")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            Manipulasi manData = new Manipulasi();
            String jenisKel="";
            String vKerja="";
            if(jenkel.equals("Laki-Laki")){
                jenisKel="pria";
            }else{
                jenisKel="wanita";
            }if(pekerjaan.toString().equals("wirausaha")){
                vKerja="Wirausaha";
            }else if(pekerjaan.toString().equals("pengusaha")){
                vKerja="Pengusaha";
            }else{
                vKerja="Karyawan";
            }
            String sql = "insert into registrasi_pasien "
                    + "values('"+kdPasien+"','"+nama+"','"+jenisKel+"','"+tmp_lahir+""
                    + "','"+tgl_lahir+"','"+umur+"','"+alamat+"','"+noHp+"','"+vKerja+"','"+kdDokter+"','"+kdRuang+"')";
        stm.executeUpdate(sql);
        conn.close();
        out.print(" <div id='content-head'><h3></h3></div>");
        out.print("<div id='content-main'><h4>Data Berhasil Di Simpan <a href='index.jsp'>Back To Homepage</a></h4></div>");
        }catch(Exception e){
            out.print(e);
            }
        
    }else if(dapat.toString().equals("Simpan")){
                try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            Manipulasi mandata = new Manipulasi();
            String jenisKel="";
            if(jenkel.equals("Laki-Laki")){
                jenisKel="pria";
            }else{
                jenisKel="wanita";
            }
            String sql = "insert into pasien "
                    + "values('"+mandata.generateKdPas()+"','"+username+"','"+pass+"','"+nama+"','"+jenisKel+"','"+tmp_lahir+""
                    + "','"+tgl_lahir+"','"+umur+"','"+alamat+"','"+noHp+"','"+Email+"','"+tmpPekerjaan+"')";
        stm.executeUpdate(sql);
        conn.close();
        out.print(" <div id='content-head'><h3></h3></div>");
        out.print("<div id='content-main'><h4>Data Berhasil Di Simpan <a href='index.jsp'>Back To Homepage</a></h4></div>");
        }catch(Exception e){
            out.print(e);
            }
        
    }else if(dapat.toString().equals("Cari")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from registrasi_pasien where no_pasien='"+kdDokter+"'";
            ResultSet res = stm.executeQuery(sql);
            
            if(res.next()){
                %>
                <div id='content-head'>
    <h3></h3>
</div>
<div id='content-main'>
                <form action="index.jsp?id=simpan" method="post" onsubmit="return validasi_input(this)">
                    <table border="0">
                       <tr>
                    <td width="10px">NIM: </td>
                    <td><input type="text" name="txtnim" id="nim" value="<%=res.getString(1)%>"></td>
                    <td width="20"><input type="submit" name="cmdsimpan" value="Cari"></td>
            </tr>
            <tr>
                    <td>Nama: </td>
                    <td><input type="text" name="txtnama" value="<%=res.getString(2)%>"></td>
            </tr>
            <tr>
                    <td>Alamat: </td>
                    <td><textarea name="txtalamat" rows="4" cols="10"><%=res.getString(3)%></textarea></td>
            </tr>

            <tr>
                <td colspan="3"><input type="submit" value="Simpan" name="cmdsimpan"  disabled="disabled"/>
                    <input type="submit" value="Ubah" name="cmdsimpan"/>
                <input type="submit" value="Hapus" name="cmdsimpan"/>
                 <input type="reset" value="Batal"/>
                </td>
            </tr>
                    </table>
                </form>
</div>
           <%
            }else{
               out.print(" <div id='content-head'><h3></h3></div>");
               out.print("<div id='content-main'><h4>Data Tidak Ada<a href='index.jsp?id=frmMahasiswa'>Back To Mahasiswa</a></h4></div>");
            }
        }catch(Exception e){
            out.print(e);
        }
    }else if(dapat.toString().equals("Cari Dokter")){
        %>
    <table>
            <tr bgcolor='greentellow'>
                <th width='60'>NIM</th>
                <th width='80'>Nama</th>
                <th width='90'>Alamat</th>
                <th width='50'>Keterangan</th>
            </tr>
            <%
                try{
                    koneksi konek = new koneksi();
                    Connection conn = konek.bukaKoneksi();
                    Statement stm = conn.createStatement();
                    String query="select * from dokter";
                    ResultSet rs = stm.executeQuery(query);
                    String var="";
                    while(rs.next()){
                       out.print("<tr>");
                       out.print("<td>"+rs.getString(1)+"</td>");
                       out.print("<td>"+rs.getString(2)+"</td>");
                       out.print("<td>"+rs.getString(3)+"</td>");
                       out.print("<td><a href='index.jsp?id=registrasi-pasien&&var="+rs.getString(1)+"'><center>Lihat</center></a></td>");
                      // out.print("<td><a href='index.jsp?id=simpan'><center>Lihat</center></a></td>");
                       out.print("</tr>");
                    }
                    rs.close();
                    conn.close();
                    }
                    catch(Exception e){
                        out.print(e);
                }
                %>
        </table>
        <%
    }else if(dapat.toString().equals("Cari Ruangan")){
        %>
                        <table>
            <tr bgcolor='greentellow'>
                <th width='60'>NIM</th>
                <th width='80'>Nama</th>
                <th width='90'>Alamat</th>
                <th width='50'>Keterangan</th>
            </tr>
            <%
                try{
                    koneksi konek = new koneksi();
                    Connection conn = konek.bukaKoneksi();
                    Statement stm = conn.createStatement();
                    String query="select * from ruangan";
                    ResultSet rs = stm.executeQuery(query);
                    String var="";
                    while(rs.next()){
                       out.print("<tr>");
                       out.print("<td>"+rs.getString(1)+"</td>");
                       out.print("<td>"+rs.getString(2)+"</td>");
                       out.print("<td>"+rs.getString(3)+"</td>");
                       out.print("<td><a href='index.jsp?id=registrasi-pasien&&var="+rs.getString(1)+"'><center>Lihat</center></a></td>");
                      // out.print("<td><a href='index.jsp?id=simpan'><center>Lihat</center></a></td>");
                       out.print("</tr>");
                    }
                    rs.close();
                    conn.close();
                    }
                    catch(Exception e){
                        out.print(e);
                }
                %>
        </table>
        <%
    }
    else if(dapat.toString().equals("login")){
    try{
        koneksi konek = new koneksi();
        Connection conn = konek.bukaKoneksi();
        Statement stm = conn.createStatement();
        String sql1 = "select * from pasien where (username='"+userpass+"'||email='"+userpass+"') && pass='"+pass+"'";
        ResultSet res = stm.executeQuery(sql1);
        //stm.executeUpdate(sql1);
        if(res.next()){
        session.setAttribute("username", userpass);
            if(userpass.equals("Admin")){
                    %>
                   <jsp:include page="../page/registrasi.jsp" flush="true"></jsp:include>
                     <%
                }else{
                 %>
                <jsp:include page="../page/member.jsp" flush="true"></jsp:include>
                <%
            }
       // response.sendRedirect("../page/member.jsp");
        //conn.close();
               
        }else{
        %>
        <jsp:include page="../page/login.jsp" flush="true"></jsp:include>
        <%

        }
    }catch(Exception e){
            out.print(e);
        }
    }
    %>