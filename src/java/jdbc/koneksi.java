/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package jdbc;
import java.sql.*;

/**
 *
 * @author HERY
 */
public class koneksi {
    public Connection bukaKoneksi()throws SQLException{
        Connection connect;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/jw_puskesmas","root","");
             return connect;
        }catch(Exception exc){
            
        }return null;
        
    }
    
}
