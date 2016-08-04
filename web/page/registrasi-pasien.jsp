<%-- 
    Document   : registrasi-pasien
    Created on : May 1, 2014, 8:28:16 PM
    Author     : HERY
--%>

<%@page import="jdbc.Manipulasi"%>
<form  ACTION="index.jsp?id=simpan" METHOD="POST" name="frmParent">
        <table border="0">
             <% 
            Manipulasi manData = new Manipulasi();
             %>
              <tr>
                    <td>No Pasien</td>
                    <td><input type="text" name="txtKdPasien" value="<%=manData.generateKdPas()%>"><input type="submit" value="Cari" name="cmdpasien"/></td>
           </tr>  
           <tr>
                    <td>Nama Lengkap</td>
                    <td><input type="text" name="txtNama"></td>
           </tr>
            <tr>
                    <td>Jenis Kelamin </td>
                    <td><input type="radio" name="jenkel" value="P" checked="">Laki-Laki
                    <input type="radio" name="jenkel" value="W">Perempuan</td>
            </tr>
            <tr>
                    <td>Tempat Lahir </td>
                    <td><input type="text" name="txtTmp_lahir"></td>
            </tr>
            <tr>
                    <td>Tanggal Lahir </td>
                    <td><input type="text" name="txtTgl_lahir"></td>
            </tr>
            <tr>
                    <td>umur </td>
                    <td><input type="text" name="txtUmur"></td>
            </tr>
            <tr>
                    <td>alamat </td>
                    <td><textarea cols="15" rows="3" name="txtAlamat"></textarea></td>
            </tr>
            <tr>
                    <td>No TLP/HP </td>
                    <td><input type="text" name="txtNo_tlp"></td>
            </tr>
            <tr>
                    <td>Pekerjaan </td>
                    <td><select name="kerja">
                            <option value="karyawan" selected>Karyawan</option>
                                        <option value="wirausaha">Wirausaha</option>
                                        <option value="pengusaha" selected>Pengusaha</option>
                                </select></td>
            </tr>
           
            <tr>
                    <td>Kode Dokter</td>
                    <td><input type="text" name="txtKdDokter"><input type="button" value="Cari" name="cmdcaridokter" 
                                                                     onClick='javascript:window.open("page/popup/criDokter.jsp","Ratting","menubar=no,width=550,height=170,left=150,top=200,toolbar=1,status=1,");'/></td>
           </tr>
         
           <tr>
                    <td>Kode Ruangan</td>
                    <td><input type="text" name="txtKdRuangan"><input type="button" value="Cari" name="cmdsimpan" onClick='javascript:window.open("page/popup/criRuang.jsp","Ratting","menubar=no,width=550,height=170,left=150,top=200,toolbar=1,status=1,");'/></td>
           </tr>     
            <tr>
                <td></td>
                <td><input type="submit" value="Simpan" name="cmdpasien"/>
                    <input type="submit" value="Ubah" name="cmdpasien"/>
                    <input type="submit" value="Hapus" name="cmdpasien"/>
                    <input type="reset" value="Batal"/>
                </td>
            </tr>
        </table>
</form>
    