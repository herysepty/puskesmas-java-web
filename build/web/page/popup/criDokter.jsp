        <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.koneksi"%>
<html>
	<head>
            <script>
		function post_value(kdDokter){
		opener.document.frmParent.txtKdDokter.value = kdDokter;
		self.close();
		}
		</script>
                <title>Dokter</title>
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
                    <th width='90'>Spesialis</th>
                    <th width=''>Keterangan</th>
                </tr>
                <%
                    try{
                        koneksi konek = new koneksi();
                        Connection conn = konek.bukaKoneksi();
                        Statement stm = conn.createStatement();
                        String query="select * from dokter";
                        ResultSet rs = stm.executeQuery(query);
                        String var="";
                        while(rs.next()){
                            %>
                           <tr>
                           <td><%=rs.getString(1)%></td>
                           <td><%=rs.getString(2)%></td>
                           <td><%=rs.getString(3)%></td>
                           <td><%=rs.getString(4)%></td>
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