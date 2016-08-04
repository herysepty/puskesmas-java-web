<%-- 
    Document   : login
    Created on : Apr 26, 2014, 11:19:56 PM
    Author     : HERY
--%>
<form  ACTION="index.jsp?id=simpan" METHOD="POST">
        <table border="0">
            <tr>
                    <td width="100px">username </td>
                    <td><input type="text" name="txtUserPass"></td>
           </tr>
            <tr>
                    <td>password </td>
                    <td><input type="password" name="txtPass"></td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="login" name="cmdsimpan"/>
                    <a href="index?id=register" target="_blank"><b><button >Daftar</button></b></a>
                </td>
            </tr>
        </table>
</form>
    