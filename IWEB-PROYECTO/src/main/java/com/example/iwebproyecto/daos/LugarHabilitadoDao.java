package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.LugarEvento;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

}
