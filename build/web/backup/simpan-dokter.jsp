<%-- 
    Document   : process
    Created on : May 1, 2014, 12:32:49 AM
    Author     : HERY
--%>


<%@page import="jdbc.koneksi" %>
<%@page import="jdbc.Manipulasi" %>
<%@page import="java.sql.*" %>
<% 
    String kdDokter=request.getParameter("txtKdDokter");
    String nmDokter=request.getParameter("txtNmDokter");
    String alamatDokter=request.getParameter("txtAlamatDokter");
    String spesialis=request.getParameter("txtSpesialis");
    String dapat=request.getParameter("cmdsimpan");
    String var=request.getParameter("var");
    String action=request.getParameter("act");
 if(dapat.toString().equals("Simpan")){
     if(kdDokter.equals("")||nmDokter.equals("")||alamatDokter.equals("")||spesialis.equals("")){
        out.print("<h4 class='warning'>Data Harus Diisi <a href='index.jsp'>Back To Homepage</a></h4>");
        }else{
    try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "insert into dokter values('"+kdDokter+"','"+nmDokter+"','"+alamatDokter+"','"+spesialis+"')";
            stm.executeUpdate(sql);
            conn.close();
            out.print("<h4 class='warning'>Data Berhasil Di Simpan <a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
            }
     }
        
    }else if(dapat.toString().equals("Ubah")){
    try{
        koneksi konek = new koneksi();
        Connection conn = konek.bukaKoneksi();
        Statement stm = conn.createStatement();
        String sql1 = "update dokter set nm_dokter='"+nmDokter+"',alamat='"+alamatDokter+"',alamat='"+spesialis+"' where nip='"+kdDokter+"'";
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
        String sql1 = "delete from dokter where nip='"+kdDokter+"'";
        stm.executeUpdate(sql1);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Hapus <a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
        }
    }else if((dapat.toString().equals("Cari"))||action.equals("remove")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from dokter where nip='"+kdDokter+"'||'"+var+"'";
            ResultSet res = stm.executeQuery(sql);
            
            if(res.next()){
                %>
                <form  ACTION="index.jsp?id=simpan-dokter" METHOD="POST">
        <table border="0">
            <tr>
                    <td>Kode Dokter</td>
                    <td><input type="text" name="txtKdDokter" value="<%=res.getString(1)%>"><input type="submit" value="Cari" name="cmdsimpan"/></td>
           </tr>
           <tr>
                    <td>Nama Dokter</td>
                    <td><input type="text" name="txtNmDokter" value="<%=res.getString(2)%>"></td>
           </tr>
           <tr>
                    <td>alamat </td>
                    <td><textarea cols="15" rows="3" name="txtAlamatDokter"><%=res.getString(3)%></textarea></td>
            </tr>
            <tr>
                    <td>spesialis </td>
                    <td><input type="text" name="txtSpesialis" value="<%=res.getString(4)%>"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit"  name="cmdsimpan" value="Simpan"/>
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
    }else if(action.equals("remove")){
  out.print("Gagal");
    }
           
 %>