<%-- 
    Document   : process
    Created on : May 1, 2014, 12:32:49 AM
    Author     : HERY
--%>


<%@page import="jdbc.koneksi" %>
<%@page import="jdbc.Manipulasi" %>
<%@page import="java.sql.*" %>
<% 
    String kdPetugas=request.getParameter("txtKdPetugas");
    String NmPetugas=request.getParameter("txtNmPetugas");
    String alamatPetugas=request.getParameter("txtAlamatPetugas");
    String dapat=request.getParameter("cmdsimpan");
    if(dapat.toString().equals("Simpan")){
    try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            Manipulasi manData = new Manipulasi();
            String sql = "insert into petugas "
                    + "values('"+kdPetugas+"','"+NmPetugas+"','"+alamatPetugas+"')";
        stm.executeUpdate(sql);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Simpan <a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
            }
        
    }else if(dapat.toString().equals("Ubah")){
    try{
        koneksi konek = new koneksi();
        Connection conn = konek.bukaKoneksi();
        Statement stm = conn.createStatement();
        String sql1 = "update petugas set nm_petugas='"+NmPetugas+"',alamat='"+alamatPetugas+"' where kd_petugas='"+kdPetugas+"'";
        stm.executeUpdate(sql1);
        conn.close();
        out.print(" <div id='content-head'><h3></h3></div>");
        out.print("<div id='content-main'><h4>Data Berhasil Di Ubah<a href='index.jsp'>Back To Homepage</a></h4></div>");
        }catch(Exception e){
            out.print(e);
        }
    }else if(dapat.toString().equals("Hapus")){
    try{
        koneksi konek = new koneksi();
        Connection conn = konek.bukaKoneksi();
        Statement stm = conn.createStatement();
        String sql1 = "delete from petugas where kd_petugas='"+kdPetugas+"'";
        stm.executeUpdate(sql1);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Hapus <a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
        }
    }else if(dapat.toString().equals("Cari")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from petugas where kd_petugas='"+kdPetugas+"'";
            ResultSet res = stm.executeQuery(sql);
            
            if(res.next()){
                %>
               <form  ACTION="index.jsp?id=simpan_petugas" METHOD="POST">
        <table border="0">
            <tr>
                    <td>Kode Petugas</td>
                    <td><input type="text" name="txtKdPetugas" value="<%=res.getString(1)%>"></td>
           </tr>
           <tr>
                    <td>Nama Petugas</td>
                    <td><input type="text" name="txtNmPetugas" value="<%=res.getString(2)%>"></td>
           </tr>
           <tr>
                    <td>Alamat</td>
                    <td><input type="text" name="txtAlamatPetugas" value="<%=res.getString(3)%>"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Ubah" name="cmdsimpan"/>
                    <input type="submit" value="Hapus" name="cmdsimpan"/>
                    <input type="reset" value="Batal"/>
                </td>
            </tr>
        </table>
</form>
        
           <%
            }else{
                out.print("<h4 class='warning'>Data Tidak Ada<a href='index.jsp?id=frmMahasiswa'>Back To Mahasiswa</a></h4>");
            }
        }catch(Exception e){
            out.print(e);
        }
    }
    %>