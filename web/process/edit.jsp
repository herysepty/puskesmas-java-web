<%-- 
    Document   : edit-dokter
    Created on : May 15, 2014, 7:31:53 PM
    Author     : HERY
--%>

    <%@page import="java.sql.*"%>
    <%@page import="jdbc.koneksi"%>
            <%
            
            String var = request.getParameter("var");
            String edit = request.getParameter("edit");
           if(edit.equals("dokter")){
            try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from dokter where nip='"+var+"'";
            ResultSet res = stm.executeQuery(sql);
            if(res.next()){
            %>
            <form  ACTION="index.jsp?id=simpan" METHOD="POST">
            <table border="0">
            <tr>
                    <td>Kode Dokter</td>
                    <td><input type="text" name="txtKdDokter" value="<%=res.getString(1)%>"><input type="submit" value="Cari" name="cmdDokter"/></td>
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
                <td><input type="submit" value="Ubah" name="cmdDokter"/>
                    <input type="submit" value="Hapus" name="cmdDokter"/>
                    <input type="reset" value="Batal"/>
                </td>
            </tr>
        </table>
            </form>
            <%  
            }
            }catch(Exception e){
            out.print(e);
            }
             }else if(edit.equals("petugas")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from petugas where kd_petugas='"+var+"'";
            ResultSet res = stm.executeQuery(sql);
            
            if(res.next()){
                %>
               <form  ACTION="index.jsp?id=simpan" METHOD="POST">
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
                    <input type="submit" value="Ubah" name="cmdPetugas"/>
                    <input type="submit" value="Hapus" name="cmdPetugas"/>
                    <input type="reset" value="Batal"/>
                </td>
            </tr>
        </table>
</form>
        
           <%
            }else{
               out.print(" <div id='content-head'><h3></h3></div>");
               out.print("<div id='content-main'><h4 class='warning'>Data Tidak Ada<a href='index.jsp?id=frmMahasiswa'>Back To Mahasiswa</a></h4></div>");
            }
        }catch(Exception e){
            out.print(e);
        }
    }else if(edit.toString().equals("ruangan")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from ruangan where kd_ruang='"+var+"'";
            ResultSet res = stm.executeQuery(sql);
            
            if(res.next()){
                %>
                <form  ACTION="index.jsp?id=simpan" METHOD="POST">
        <table border="0">
            <tr>
                    <td>Id Ruangan</td>
                    <td><input type="text" name="txtKdRuangan" value="<%=res.getString(1)%>"></td>
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
                <td><input type="submit" value="Ubah" name="cmdRuang"/>
                    <input type="submit" value="Hapus" name="cmdRuang"/>
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
    }else if(edit.toString().equals("pasien")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from registrasi_pasien where no_pasien='"+var+"'";
            ResultSet res = stm.executeQuery(sql);
            String jenisKel="";
            String jenisKelW="";
            String kerja1="";
            String kerja2="";
            String kerja3="";
            if(res.next()){
                %>
<form  ACTION="index.jsp?id=simpan" METHOD="POST" name='frmParent'>
        <table border="0">
            
              <tr>
                    <td>No Pasien</td>
                    <td><input type="text" name="txtKdPasien" value="<%=res.getString(1)%>"></td>
           </tr>  
           <tr>
                    <td>Nama Lengkap</td>
                    <td><input type="text" name="txtNama" value="<%=res.getString(2)%>"></td>
           </tr>
            <tr>
                    <td>Jenis Kelamin </td>
                    <%
                        if(res.getString(3).equals("P")){
                        jenisKel="checked";
                        }else if(res.getString(3).equals("W")){
                        jenisKelW="checked";
                    }
                    %>
                    <td><input type="radio" name="jenkel" value="P" <%=jenisKel%>>Laki-Laki
                        <input type="radio" name="jenkel" value="W" <%=jenisKelW%>>Perempuan</td>
            </tr>
            <tr>
                    <td>Tempat Lahir </td>
                    <td><input type="text" name="txtTmp_lahir" value="<%=res.getString(4)%>"></td>
            </tr>
            <tr>
                    <td>Tanggal Lahir </td>
                    <td><input type="text" name="txtTgl_lahir" value="<%=res.getString(5)%>"></td>
            </tr>
            <tr>
                    <td>umur </td>
                    <td><input type="text" name="txtUmur" value="<%=res.getString(6)%>"></td>
            </tr>
            <tr>
                    <td>alamat </td>
                    <td><textarea cols="15" rows="3" name="txtAlamat"><%=res.getString(7)%></textarea></td>
            </tr>
            <tr>
                    <td>No TLP/HP </td>
                    <td><input type="text" name="txtNo_tlp" value="<%=res.getString(8)%>"></td>
            </tr>
            <tr>
                    <td>Pekerjaan </td>
                    <td><select name="kerja">
                            <%
                            if(res.getString(9).equals("Karyawan")){
                                kerja1="selected";
                            }else if(res.getString(9).equals("Wirausaha")){
                                kerja2="selected";
                            }else if(res.getString(9).equals("Pengusaha")){
                                 kerja3="selected";
                            }
                            %>
                                        <option value="karyawan" <%=kerja1%>>Karyawan</option>
                                        <option value="wirausaha" <%=kerja2%>>Wirausaha</option>
                                        <option value="pengusaha" <%=kerja3%>>Pengusaha</option>
                                </select></td>
            </tr>
            <tr>
                               <td>Kode Dokter</td>
                               <td><input type="text" name="txtKdDokter" value="<%=res.getString(10) %>"><input type="button" value="Cari" name="cmdcaridokter" 
                                                                     onClick='javascript:window.open("page/popup/criDokter.jsp","Ratting","menubar=no,width=550,height=170,left=150,top=200,toolbar=1,status=1,");'/></td>
           </tr>
           <tr>
                 <td>Kode Ruangan</td>
                 <td><input type="text" name="txtKdRuangan" value="<%=res.getString(11)%>"><input type="button" value="Cari" name="cmdsimpan" 
                                                                                                                onClick='javascript:window.open("page/popup/criRuang.jsp","Ratting","menubar=no,width=550,height=170,left=150,top=200,toolbar=1,status=1,");'/></td>
           </tr>       
            <tr>
                <td></td>
                <td><input type="submit" value="Ubah" name="cmdpasien"/>
                    <input type="submit" value="Hapus" name="cmdpasien"/>
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