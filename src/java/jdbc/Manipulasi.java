package jdbc;
import java.sql.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import jdbc.koneksi;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

public class Manipulasi {
    koneksi koneksi;
    Connection conn;
    Statement stt;
    
    public Manipulasi(){
        koneksi = new koneksi();
    }
    
    public boolean QUERY(String SQL){
        try{
            
            conn = koneksi.bukaKoneksi();
            stt = conn.createStatement();
            stt.executeUpdate(SQL);
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
        public String generateKdPas(){
        String kode="";
        int h,i;
        try{
            conn = koneksi.bukaKoneksi();
            stt = conn.createStatement();
            String SQL = "SELECT no_pasien FROM registrasi_pasien ORDER BY no_pasien DESC";
            ResultSet resultSet = stt.executeQuery(SQL);
            if(resultSet.next()){
                kode=resultSet.getString("no_pasien");
                kode = kode.substring(1);
                i = Integer.parseInt(kode)+1;
                h = String.valueOf(i).length();
                switch(h){
                    case 1:
                        kode = "P000"+i;
                                break;
                        case 2:
                        kode = "P00"+i;
                                break;
                            case 3:
                        kode = "P0"+i;
                                break;
                                case 4:
                        kode = "P"+i;
                                break;            
                }
            }else{
                kode = "P0001";
            }
        }catch (Exception e){
            
        }
        return kode;
    }
        public String generateKdDokter(){
        String kode="";
        int h,i;
        try{
            conn = koneksi.bukaKoneksi();
            stt = conn.createStatement();
            String SQL = "SELECT nip FROM dokter ORDER BY nip DESC";
            ResultSet resultSet = stt.executeQuery(SQL);
            if(resultSet.next()){
                kode=resultSet.getString("nip");
                kode = kode.substring(1);
                i = Integer.parseInt(kode)+1;
                h = String.valueOf(i).length();
                switch(h){
                    case 1:
                        kode = "D000"+i;
                                break;
                        case 2:
                        kode = "D00"+i;
                                break;
                        case 3:
                        kode = "D0"+i;
                                break;
                        case 4:
                        kode = "D"+i;
                                break;            
                }
            }else{
                kode = "D0001";
            }
        }catch (Exception e){
            
        }
        return kode;
    }
    public String generateKdRuangan(){
        String kode="";
        int h,i;
        try{
            conn = koneksi.bukaKoneksi();
            stt = conn.createStatement();
            String SQL = "SELECT kd_ruang FROM ruangan ORDER BY kd_ruang DESC";
            ResultSet resultSet = stt.executeQuery(SQL);
            if(resultSet.next()){
                kode=resultSet.getString("kd_ruang");
                kode = kode.substring(1);
                i = Integer.parseInt(kode)+1;
                h = String.valueOf(i).length();
                switch(h){
                    case 1:
                        kode = "R000"+i;
                                break;
                        case 2:
                        kode = "R00"+i;
                                break;
                        case 3:
                        kode = "R0"+i;
                                break;
                        case 4:
                        kode = "R"+i;
                                break;            
                }
            }else{
                kode = "R0001";
            }
        }catch (Exception e){
            
        }
        return kode;
    }
    public String generateKdPetugas(){
        String kode="";
        int h,i;
        try{
            conn = koneksi.bukaKoneksi();
            stt = conn.createStatement();
            String SQL = "SELECT kd_petugas FROM petugas ORDER BY kd_petugas DESC";
            ResultSet resultSet = stt.executeQuery(SQL);
            if(resultSet.next()){
                kode=resultSet.getString("kd_petugas");
                kode = kode.substring(1);
                i = Integer.parseInt(kode)+1;
                h = String.valueOf(i).length();
                switch(h){
                    case 1:
                        kode = "P000"+i;
                                break;
                        case 2:
                        kode = "P00"+i;
                                break;
                        case 3:
                        kode = "P0"+i;
                                break;
                        case 4:
                        kode = "P"+i;
                                break;            
                }
            }else{
                kode = "P0001";
            }
        }catch (Exception e){
            
        }
        return kode;
    }
}
        
  