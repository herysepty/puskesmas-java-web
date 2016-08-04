<%-- 
    Document   : criRuang
    Created on : May 17, 2014, 9:52:19 AM
    Author     : HERY
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.koneksi"%>
<html>
	<head>
            <script>
		function post_value(kdRuang){
		opener.document.frmParent.txtKdRuangan.value = kdRuang;
		self.close();
		}
		</script>
	<title>Ruangan</title>
	</head>
	<body>
            <form method=post action='' name='frmChild'>
            <table border='1px'>
        <tr bgcolor='blue'>
            <th colspan="5" style="text-align: center" >Dokter</th>
        </tr>

                <tr bgcolor='greentellow'>
                    <th width='60'>NIP</th>
                    <th width='80'>Nama</th>
                    <th width='90'>Alamat</th>
                    <th width=''>Keterangan</th>
                </tr>
                <%
                    try{
                        koneksi konek = new koneksi();
                        Connection conn = konek.bukaKoneksi();
                        Statement stm = conn.createStatement();
                        String query="select * from ruangan";
                        ResultSet rs = stm.executeQuery(query);
                        String var="";
                        while(rs.next()){
                            %>
                           <tr>
                           <td><%=rs.getString(1)%></td>
                           <td><%=rs.getString(2)%></td>
                           <td><%=rs.getString(3)%></td>
                           <td><a href='javascript:void(0);' onclick='post_value("<%=rs.getString(1)%>");'>Pilih</a></td>
                           </tr>
                        <%
                           }
                        rs.close();
                        conn.close();
                        }
                        catch(Exception e){
                            out.print(e);
                    }
                    %>
        </table>
        </form>
	</body>
</html>