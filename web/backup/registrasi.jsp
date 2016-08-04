<%-- 
    Document   : registrasi
    Created on : May 1, 2014, 12:23:34 AM
    Author     : HERY
--%>
<form  ACTION="index.jsp?id=simpan" METHOD="POST">
        <table border="0">
           <tr>
                    <td>Nama Lengkap</td>
                    <td><input type="text" name="txtNama"></td>
           </tr>
           <tr>
                    <td>Username </td>
                    <td><input type="text" name="txtUsername"></td>
            </tr>
            <tr>
                    <td>Password </td>
                    <td><input type="password" name="txtPass"></td>
            </tr>
            <tr>
                    <td>Jenis Kelamin </td>
                    <td><input type="radio" name="jenkel" value="pria" checked="">Laki-Laki
                    <input type="radio" name="jenkel" value="perempuan">Perempuan</td>
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
                    <td>Email</td>
                    <td><input type="text" name="txtEmail"></td>
            </tr>
            <tr>
                    <td>Pekerjaan </td>
                    <td><input type="text" name="txtPekerjaan"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Simpan" name="cmdsimpan"/>
                    <input type="reset" value="Batal"/>
                </td>
            </tr>
        </table>
</form>
           
    