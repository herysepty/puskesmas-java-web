<%-- 
    Document   : simpan
    Created on : May 15, 2014, 2:00:42 PM
    Author     : HERY
--%>
<%@page import="jdbc.Manipulasi"%>
<%@page import="jdbc.koneksi" %>
<%@page import="java.sql.*" %>

<%  String kdPasien=request.getParameter("txtKdPasien");
    String nmPasien=request.getParameter("txtNama");
    String jenkel=request.getParameter("jenkel");
    String tmp_lahir=request.getParameter("txtTmp_lahir");
    String tgl_lahir=request.getParameter("txtTgl_lahir");
    String umur=request.getParameter("txtUmur");
    String alamat=request.getParameter("txtAlamat");
    String noHp=request.getParameter("txtNo_tlp");
    String tmpPekerjaan=request.getParameter("kerja");
    String kdDokter=request.getParameter("txtKdDokter");
    String kdRuangan=request.getParameter("txtKdRuangan");
    String nmRuang=request.getParameter("txtNmRuang");
    String gedung=request.getParameter("txtGedung");
    String kdPetugas=request.getParameter("txtKdPetugas");
    String NmPetugas=request.getParameter("txtNmPetugas");
    String alamatPetugas=request.getParameter("txtAlamatPetugas");
    String nmDokter=request.getParameter("txtNmDokter");
    String alamatDokter=request.getParameter("txtAlamatDokter");
    String spesialis=request.getParameter("txtSpesialis");
    String dapat=request.getParameter("cmdsimpan");
    String cmdPasien=request.getParameter("cmdpasien");
    String cmdCariDokter=request.getParameter("cmdcaridokter");
    String cmdRuang=request.getParameter("cmdRuang");
    String cmdPetugas=request.getParameter("cmdPetugas");
    String cmdDokter=request.getParameter("cmdDokter");
    
    
    if(cmdPasien != null){
        if(cmdPasien.toString().equals("Simpan")){
            try{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement stm = conn.createStatement();
                String jenisKel="";
                String vKerja="";
                    if(jenkel.toString().equals("P")){
                        jenisKel="P";
                    }else if(jenkel.toString().equals("W")){
                        jenisKel="W";
                    }
                String sql = "insert into registrasi_pasien values('"+kdPasien+"','"+nmPasien+"','"+jenisKel+"','"+tmp_lahir+"','"+tgl_lahir+"','"+umur+"','"+alamat+"','"+noHp+"','"+tmpPekerjaan+"','"+kdDokter+"','"+kdRuangan+"')";
                stm.executeUpdate(sql);
                conn.close();
                out.print("<h4 class='warning'>Data Berhasil Di Simpan <a href='index.jsp'>Back To Homepage</a></h4>");
            }catch(Exception e){
                out.print(e);
            }
        }else if(cmdPasien.toString().equals("Ubah")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String jenisKel="";
            String vKerja="";
                if(jenkel.toString().equals("P")){
                    jenisKel="P";
                }else{
                    jenisKel="W";
                }
                
            String sql = "update registrasi_pasien set nm_pasien='"+nmPasien+"',jenkel='"+jenisKel+"',tmp_lahir='"+tmp_lahir+"',tgl_lahir='"+tgl_lahir+"',umur='"+umur+"',alamat='"+alamat+"',no_hp='"+noHp+"',pekerjaan='"+tmpPekerjaan+"',kd_dokter='"+kdDokter+"',kd_ruang='"+kdRuangan+"' where no_pasien='"+kdPasien+"'";
            stm.executeUpdate(sql);
            conn.close();
            out.print("<h4 class='warning'>Data Berhasil Di Ubah<a href='index.jsp'>Back To Homepage</a></h4>");
            }catch(Exception e){
                out.print(e);
            }
        }else if(cmdPasien.toString().equals("Cari")){
            try{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement stm = conn.createStatement();
                String sql = "select * from registrasi_pasien where no_pasien='"+kdPasien+"'";
                ResultSet res = stm.executeQuery(sql);
                String jenisKel="";
                String jenisKelW="";
                String kerja1="";
                String kerja2="";
                String kerja3="";
                if(res.next()){
                %>
                <form  ACTION="index.jsp?id=simpan" METHOD="POST" name="frmParent">
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
                                </select>
                            </td>
                            </tr>
                            <tr>
                               <td>Kode Dokter</td>
                               <td><input type="text" name="txtKdDokter" value="<%=res.getString(10) %>"><input type="button" value="Cari" name="cmdcaridokter" 
                                                                     onClick='javascript:window.open("page/popup/criDokter.jsp","Ratting","menubar=no,width=550,height=170,left=150,top=200,toolbar=1,status=1,");'/></td>
                            </tr>
                            <tr>
                                <td>Kode Ruangan</td>
                                <td><input type="text" name="txtKdRuangan" value="<%=res.getString(11) %>"><input type="button" value="Cari" name="cmdsimpan" 
                                                                                                                  onClick='javascript:window.open("page/popup/criRuang.jsp","Ratting","menubar=no,width=550,height=170,left=150,top=200,toolbar=1,status=1,");'/></td>
                            </tr>      
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Simpan" name="cmdpasien"/>
                                    <input type="submit" value="Ubah" name="cmdpasien"/>
                                    <input type="submit" value="Hapus21" name="cmdpasien"/>
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
        }else if(cmdPasien.toString().equals("Hapus")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql1 = "delete from registrasi_pasien where no_pasien='"+kdPasien+"'";
            stm.executeUpdate(sql1);
            conn.close();
            out.print("<h4 class='warning'>Data Berhasil Di Hapus <a href='index.jsp'>Back To Homepage</a></h4>");
            }catch(Exception e){
                out.print(e);
            }
        }
    }
    if(cmdCariDokter != null){
        if(cmdCariDokter.toString().equals("Cari1")){
            try{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement stm = conn.createStatement();
                String sql = "select * from dokter where nip='"+kdDokter+"'";
                ResultSet res = stm.executeQuery(sql);
                if(res.next()){
                    %>
                    <form  ACTION="index.jsp?id=simpan" METHOD="POST">
                            <table border="0">

                                  <tr>
                                        <td>No Pasien</td>
                                        <td><input type="text" name="txtKdPasien" value="<%=request.getParameter("txtKdPasien")%>"></td>
                               </tr>  
                               <tr>
                                        <td>Nama Lengkap</td>
                                        <td><input type="text" name="txtNama" value="<%=request.getParameter("txtNama")%>"></td>
                               </tr>
                                <tr>
                                        <td>Jenis Kelamin </td>

                                        <td><input type="radio" name="jenkel" value="P">Laki-Laki
                                            <input type="radio" name="jenkel" value="W">Perempuan</td>
                                </tr>
                                <tr>
                                        <td>Tempat Lahir </td>
                                        <td><input type="text" name="txtTmp_lahir" value="<%=request.getParameter("txtTmp_lahir")%>"></td>
                                </tr>
                                <tr>
                                        <td>Tanggal Lahir </td>
                                        <td><input type="text" name="txtTgl_lahir" value="<%=request.getParameter("txtTgl_lahir")%>"></td>
                                </tr>
                                <tr>
                                        <td>umur </td>
                                        <td><input type="text" name="txtUmur" value="<%=request.getParameter("txtUmur")%>"></td>
                                </tr>
                                <tr>
                                        <td>alamat </td>
                                        <td><textarea cols="15" rows="3" name="txtAlamat"></textarea></td>
                                </tr>
                                <tr>
                                        <td>No TLP/HP </td>
                                        <td><input type="text" name="txtNo_tlp" value="<%=request.getParameter("txtNo_tlp")%>"></td>
                                </tr>
                                <tr>
                                        <td>Pekerjaan </td>
                                        <td><select name="kerja">

                                                            <option value="karyawan">Karyawan</option>
                                                            <option value="wirausaha">Wirausaha</option>
                                                            <option value="pengusaha">Pengusaha</option>
                                                    </select></td>
                                </tr>
                                <tr>
                                        <td>Kode Dokter</td>
                                        <td><input type="text" name="txtKdDokter" value="<%=res.getString(1) %>"><button value="Cari" onclick="bukawindow('http://google','browse','width=300,height=300,top=100,left=500')">Cari</button></td>
                               </tr>
                               <tr>
                                        <td>Kode Ruangan</td>
                                        <td><input type="text" name="txtKdRuangan" value="<%=res.getString(2) %>"><input type="submit" value="Cari Ruangan" name="cmdsimpan"/></td>
                               </tr>      
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Simpan" name="cmdpasien"/>
                                        <input type="submit" value="Ubah" name="cmdpasien"/>
                                        <input type="submit" value="Hapus21" name="cmdpasien"/>
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
    }
    if(cmdRuang != null){
        if(cmdRuang.toString().equals("Simpan")){
    try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            Manipulasi manData = new Manipulasi();
            String sql = "insert into ruangan "
                    + "values('"+kdRuangan+"','"+nmRuang+"','"+gedung+"')";
        stm.executeUpdate(sql);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Simpan <a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
            }
        
    }else if(cmdRuang.toString().equals("Cari")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from ruangan where kd_ruang='"+kdRuangan+"'";
            ResultSet res = stm.executeQuery(sql);
            
            if(res.next()){
                %>
                <form  ACTION="index.jsp?id=simpan" METHOD="POST">
        <table border="0">
            <tr>
                    <td>Kode Ruangan</td>
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
    }else if(cmdRuang.toString().equals("Ubah")){
    try{
        koneksi konek = new koneksi();
        Connection conn = konek.bukaKoneksi();
        Statement stm = conn.createStatement();
        String sql1 = "update ruangan set nm_ruang='"+nmRuang+"',gedung='"+gedung+"' where kd_ruang='"+kdRuangan+"'";
        stm.executeUpdate(sql1);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Ubah<a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
        }
    }else if(cmdRuang.toString().equals("Hapus")){
    try{
        koneksi konek = new koneksi();
        Connection conn = konek.bukaKoneksi();
        Statement stm = conn.createStatement();
        String sql1 = "delete from ruangan where kd_ruang='"+kdRuangan+"'";
        stm.executeUpdate(sql1);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Hapus <a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
        }
    }
    } if(cmdPetugas != null){
    
    if(cmdPetugas.toString().equals("Simpan")){
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
        
    }else if(cmdPetugas.toString().equals("Ubah")){
    try{
        koneksi konek = new koneksi();
        Connection conn = konek.bukaKoneksi();
        Statement stm = conn.createStatement();
        String sql1 = "update petugas set nm_petugas='"+NmPetugas+"',alamat='"+alamatPetugas+"' where kd_petugas='"+kdPetugas+"'";
        stm.executeUpdate(sql1);
        conn.close();
        out.print("<h4 class='warning'>Data Berhasil Di Ubah <a href='index.jsp'>Back To Homepage</a></h4>");
        }catch(Exception e){
            out.print(e);
        }
    }else if(cmdPetugas.toString().equals("Hapus")){
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
    }else if(cmdPetugas.toString().equals("Cari")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from petugas where kd_petugas='"+kdPetugas+"'";
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
                out.print("<h4 class='warning'>Data Tidak Ada<a href='index.jsp?id=frmMahasiswa'>Back To Mahasiswa</a></h4>");
            }
        }catch(Exception e){
            out.print(e);
        }
    }
    }if(cmdDokter != null){
        if(cmdDokter.toString().equals("Simpan")){
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

        }else if(cmdDokter.toString().equals("Ubah")){
        try{
            koneksi konek = new koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql1 = "update dokter set nm_dokter='"+nmDokter+"',alamat='"+alamatDokter+"',alamat='"+spesialis+"' where nip='"+kdDokter+"'";
            stm.executeUpdate(sql1);
            conn.close();
           out.print("<h4 class='warning'>Data Berhasil Di Ubah <a href='index.jsp'>Back To Homepage</a></h4>");
             }catch(Exception e){
                out.print(e);
            }
        }else if(cmdDokter.toString().equals("Hapus")){
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
        }else if(cmdDokter.toString().equals("Cari")){
            try{
                koneksi konek = new koneksi();
                Connection conn = konek.bukaKoneksi();
                Statement stm = conn.createStatement();
                String sql = "select * from dokter where nip='"+kdDokter+"'";
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
                    <td>
                        <input type="submit" value="Ubah" name="cmdDokter"/>
                        <input type="submit" value="Hapus" name="cmdDokter"/>
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
    }
    %>
