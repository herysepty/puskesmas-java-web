<%-- 
    Document   : ruang
    Created on : May 1, 2014, 7:17:56 PM
    Author     : HERY
--%>
<%@page import="jdbc.Manipulasi"%>
<form  ACTION="index.jsp?id=simpan" METHOD="POST">
        <table border="0">
            <tr>
                <%
                Manipulasi manData = new Manipulasi();
                %>
                    <td>Kode Ruangan</td>
                    <td><input type="text" name="txtKdRuangan" value="<%=manData.generateKdRuangan()%>"><input type="submit" value="Cari" name="cmdRuang"/></td>
           </tr>
           <tr>
                    <td>Nama Ruangan</td>
                    <td><input type="text" name="txtNmRuang"></td>
           </tr>
           <tr>
                    <td>Gedung</td>
                    <td><input type="text" name="txtGedung"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Simpan" name="cmdRuang"/>
                    <input type="submit" value="Ubah" name="cmdRuang"/>
                    <input type="submit" value="Hapus" name="cmdRuang"/>
                    <input type="reset" value="Batal"/>
                </td>
            </tr>
        </table>
</form>