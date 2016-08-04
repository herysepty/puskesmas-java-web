<%-- 
    Document   : dokter
    Created on : May 1, 2014, 6:12:10 PM
    Author     : HERY
--%>
<%@page import="jdbc.Manipulasi"%>
<form  ACTION="index.jsp?id=simpan" METHOD="POST">
        <table border="0">
            <tr>
                    <% 
                    Manipulasi manData = new Manipulasi();
                    %>
                    <td>Kode Dokter</td>
                    <td><input type="text" name="txtKdDokter" value="<%=manData.generateKdDokter()%>"><input type="submit" value="Cari" name="cmdDokter"/></td>
           </tr>
           <tr>
                    <td>Nama Dokter</td>
                    <td><input type="text" name="txtNmDokter"></td>
           </tr>
           <tr>
                    <td>alamat </td>
                    <td><textarea cols="15" rows="3" name="txtAlamatDokter"></textarea></td>
            </tr>
            <tr>
                    <td>spesialis </td>
                    <td><input type="text" name="txtSpesialis"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit"  name="cmdDokter" value="Simpan"/>
                    <input type="submit" value="Ubah" name="cmdDokter"/>
                    <input type="submit" value="Hapus" name="cmdDokter"/>
                    <input type="reset" value="Batal"/>
                </td>
            </tr>
        </table>
</form>