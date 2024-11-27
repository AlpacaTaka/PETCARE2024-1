package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LugarHabilitadoDao extends BaseDao{

    public void crearLugarHabilitado(LugarEvento lugar){
        String sql = "insert into lugarevento (nombreLugar, direccionLugar, aforoMax, administradorID, fotoID, eliminado, distritoID) value (?,?,?, ?, ?, ?, ?);";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, lugar.getNombreLugar());
            pstmt.setString(2, lugar.getDireccionLugar());
            pstmt.setInt(3, lugar.getAforoMax());
            pstmt.setInt(4,lugar.getAdministrador().getAdministradorID());
            pstmt.setInt(5,lugar.getFoto().getFotoID());
            pstmt.setBoolean(6,lugar.isEliminado());
            pstmt.setInt(7, lugar.getDistrito().getDistritoID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
        e.printStackTrace();
    }
    }

    public void editarLugarHabilitado(LugarEvento lugar){
        String sql = "update lugarevento set nombreLugar=?, direccionLugar = ?, aforoMax = ?, administradorID = ?, eliminado = ?, distritoID = ? where lugarID=?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, lugar.getNombreLugar());
            pstmt.setString(2, lugar.getDireccionLugar());
            pstmt.setInt(3, lugar.getAforoMax());
            pstmt.setInt(4,lugar.getAdministrador().getAdministradorID());
            pstmt.setBoolean(5,lugar.isEliminado());
            pstmt.setInt(6, lugar.getDistrito().getDistritoID());
            pstmt.setInt(7, lugar.getLugarID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public LugarEvento buscarLugarPorID(int id){
        String sql = "select * from lugarevento where lugarID = ?;";
        LugarEvento lugar = new LugarEvento();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                lugar.setLugarID(rs.getInt(1));
                lugar.setNombreLugar(rs.getString(2));
                lugar.setDireccionLugar(rs.getString(3));
                lugar.setAforoMax(rs.getInt(4));
                AdministradorDao administradorDao = new AdministradorDao();
                Administrador administrador = administradorDao.obtenerAdministradorPorID(rs.getInt(5));
                lugar.setAdministrador(administrador);
                Foto foto = new Foto();
                foto.setFotoID(rs.getInt(6));
                lugar.setEliminado(rs.getBoolean(7));
                AlbergueDaoRevenge albergueDao = new AlbergueDaoRevenge();
                Distrito distrito = albergueDao.obtenerDistritoPorID(rs.getInt(8));
                lugar.setDistrito(distrito);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return lugar;
    }

}
