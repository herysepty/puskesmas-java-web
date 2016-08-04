<%-- 
    Document   : process
    Created on : May 1, 2014, 12:32:49 AM
    Author     : HERY
--%>


<%@page import="jdbc.koneksi" %>
<%@page import="jdbc.Manipulasi" %>
<%@page import="java.sql.*" %>
<% 
    String KdRuang=request.getParameter("txtKdRuang");
    String nmRuang=request.getParameter("txtNmRuang");
    String gedung=request.getParameter("txtGedung");
    String dapat=request.getParameter("cmdsimpan");
   if(dapat.toString().equals("Simpan")){
    try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            Manipulasi manData = new Manipulasi();
            String sql = "insert into ruangan "
                    + "values('"+KdRuang+"','"+nmRuang+"','"+gedung+"')";
        stm.executeUpdate(sql);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Simpan <a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
            }
        
    }else if(dapat.toString().equals("Cari")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from ruangan where kd_ruang='"+KdRuang+"'";
            ResultSet res = stm.executeQuery(sql);
            
            if(res.next()){
                %>
                <form  ACTION="index.jsp?id=simpan-ruangan" METHOD="POST">
        <table border="0">
            <tr>
                    <td>Kode Ruangan</td>
                    <td><input type="text" name="IdRuang" value="<%=res.getString(1)%>"></td>
           </tr>
           <tr>
                    <td>Nama Ruangan</td>
                    <td><input type="text" name="txtNmRuang" value="<%=res.getString(2)%>"></td>
           </tr>
           <tr>
                    <td>Gedung</td>
                    <td><input type="text" name="txtGedung" value="<%=res.getString(3)%>"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Ubah" name="cmdsimpan"/>
                    <input type="submit" value="Hapus" name="cmdsimpan"/>
                    <input type="reset" value="Batal"/>
                </td>
            </tr>
        </table>
</form>
           <%
            }else{
                out.print("<h4 class='warning'>Data Tidak Ada<a href='index.jsp?id=frmMahasiswa'>Back To Mahasiswa</a></h4></div>");
            }
        }catch(Exception e){
            out.print(e);
        }
    }else if(dapat.toString().equals("Ubah")){
    try{
        koneksi konek = new koneksi();
        Connection conn = konek.bukaKoneksi();
        Statement stm = conn.createStatement();
        String sql1 = "update ruangan set nm_ruang='"+nmRuang+"',gedung='"+gedung+"' where kd_ruang='"+KdRuang+"'";
        stm.executeUpdate(sql1);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Ubah<a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
        }
    }else if(dapat.toString().equals("Hapus")){
    try{
        koneksi konek = new koneksi();
        Connection conn = konek.bukaKoneksi();
        Statement stm = conn.createStatement();
        String sql1 = "delete from ruangan where kd_ruang='"+KdRuang+"'";
        stm.executeUpdate(sql1);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Hapus <a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
        }
    }
    %>