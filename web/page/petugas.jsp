<%-- 
    Document   : admin
    Created on : May 1, 2014, 5:18:24 PM
    Author     : HERY
--%>
<%@page import="jdbc.Manipulasi" %>
<form  ACTION="index.jsp?id=simpan" METHOD="POST">
        <table border="0">
            <tr>
                <%
                Manipulasi manData = new Manipulasi();
                %>
                    <td>Kode Petugas</td>
                    <td><input type="text" name="txtKdPetugas" value="<%=manData.generateKdPetugas()%>"><input type="submit" value="Cari" name="cmdPetugas"/></td>
           </tr>
           <tr>
                    <td>Nama Petugas</td>
                    <td><input type="text" name="txtNmPetugas"></td>
           </tr>
           <tr>
                    <td>Alamat</td>
                    <td><input type="text" name="txtAlamatPetugas"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Simpan" name="cmdPetugas"/>
                    <input type="submit" value="Ubah" name="cmdPetugas"/>
                    <input type="submit" value="Hapus" name="cmdPetugas"/>
                    <input type="reset" value="Batal"/>
                </td>
            </tr>
        </table>
</form>
          