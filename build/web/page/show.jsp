<%-- 
    Document   : admin
    Created on : May 1, 2014, 10:53:21 PM
    Author     : HERY
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.koneksi"%>
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
                       out.print("<tr>");
                       out.print("<td>"+rs.getString(1)+"</td>");
                       out.print("<td>"+rs.getString(2)+"</td>");
                       out.print("<td>"+rs.getString(3)+"</td>");
                       out.print("<td>"+rs.getString(4)+"</td>");
                       out.print("<td><a href='index.jsp?id=edit&edit=dokter&var="+rs.getString(1)+"'><center>Edit</center></a>");
                      // out.print("<td><a href='index.jsp?id=simpan'><center>Lihat</center></a></td>");
                       out.print("</tr>");
                    }
                    rs.close();
                    conn.close();
                    }
                    catch(Exception e){
                        out.print(e);
                }
                %>
        </table>
        <table border='1px'>
             <tr bgcolor='blue'>
        <th colspan="5" style="text-align: center">Ruangan</th>
        </tr>
            <tr bgcolor='greentellow'>
                <th>Kode Ruangan</th>
                <th>Nama Ruangan</th>
                <th>Gedung</th>
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
                       out.print("<tr>");
                       out.print("<td>"+rs.getString(1)+"</td>");
                       out.print("<td>"+rs.getString(2)+"</td>");
                       out.print("<td>"+rs.getString(3)+"</td>");
                       out.print("<td><a href='index.jsp?id=edit&edit=ruangan&var="+rs.getString(1)+"'><center>Edit</center></a>");
                       out.print("</tr>");
                    }
                    rs.close();
                    conn.close();
                    }
                    catch(Exception e){
                        out.print(e);
                }
                %>
        </table>
        <table border='1px'>
             <tr bgcolor='blue'>
        <th colspan="5" style="text-align: center">Petugas</th>
    </tr>
            <tr bgcolor='greentellow'>
                <th>Kode Petugas</th>
                <th>NamaPetugas</th>
                <th>Alamat</th>
                <th>Keterangan</th>
            </tr>
            <%
                try{
                    koneksi konek = new koneksi();
                    Connection conn = konek.bukaKoneksi();
                    Statement stm = conn.createStatement();
                    String query="select * from petugas";
                    ResultSet rs = stm.executeQuery(query);
                    String var="";
                    while(rs.next()){
                       out.print("<tr>");
                       out.print("<td>"+rs.getString(1)+"</td>");
                       out.print("<td>"+rs.getString(2)+"</td>");
                       out.print("<td>"+rs.getString(3)+"</td>");
                       out.print("<td><a href='index.jsp?id=edit&edit=petugas&var="+rs.getString(1)+"'><center>Edit</center></a>");
                       out.print("</tr>");
                    }
                    rs.close();
                    conn.close();
                    }
                    catch(Exception e){
                        out.print(e);
                }
                %>
        </table>
        <table border='1px'>
             <tr bgcolor='blue'>
        <th colspan="12" style="text-align: center">Pasien</th>
    </tr>
            <tr bgcolor='greentellow'>
                <th>No Pasien</th>
                <th>Nama Pasien</th>
                <th>Jenis Kelamin</th>
                <th>Tempat Lahir</th>
                <th>Tanggal Lahir</th>
                <th>umur</th>
                <th>Alamat</th>
                <th>No Hp</th>
                <th>Pekerjaan</th>
                <th>Kode Dokter</th>
                <th>Kode Ruangan</th>
                <th>Keterangan</th>
                
            </tr>
            <%
                try{
                    koneksi konek = new koneksi();
                    Connection conn = konek.bukaKoneksi();
                    Statement stm = conn.createStatement();
                    String query="select * from registrasi_pasien";
                    ResultSet rs = stm.executeQuery(query);
                    String var="" ;
                    String jenkel="";
                    while(rs.next()){
                       if(rs.getString(3).equals("W")){
                           jenkel="Perempuan";
                       }else{
                           jenkel="Laki-laki";
                       }
                       out.print("<tr>");
                       out.print("<td>"+rs.getString(1)+"</td>");
                       out.print("<td>"+rs.getString(2)+"</td>");
                       out.print("<td>"+jenkel+"</td>");
                       out.print("<td>"+rs.getString(4)+"</td>");
                       out.print("<td>"+rs.getString(5)+"</td>");
                       out.print("<td>"+rs.getString(6)+"</td>");
                       out.print("<td>"+rs.getString(7)+"</td>");
                       out.print("<td>"+rs.getString(8)+"</td>");
                       out.print("<td>"+rs.getString(9)+"</td>");
                       out.print("<td>"+rs.getString(10)+"</td>");
                       out.print("<td>"+rs.getString(11)+"</td>");
                       out.print("<td><a href='index.jsp?id=edit&edit=pasien&var="+rs.getString(1)+"'><center>Edit</center></a>");
                       out.print("</tr>");
                    }
                    rs.close();
                    conn.close();
                    }
                    catch(Exception e){
                        out.print(e);
                }
                %>
        </table>

