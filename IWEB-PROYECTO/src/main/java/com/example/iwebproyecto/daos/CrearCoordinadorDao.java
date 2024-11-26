package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.CoordinadorZona;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CrearCoordinadorDao extends BaseDao{

    public void CrearCoordinadorZona(CoordinadorZona coordinadorZona){
        String sql = "insert into coordinadorzona (nombre, apellido, dni, correoElectronico, celular, fechaNacimiento, fotoID, activo, zonaID, eliminado) value (?,?,?,?,?,?,?,?,?,?);";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             pstmt.setString(1, coordinadorZona.getNombre());
             pstmt.setString(2, coordinadorZona.getApellido());
             pstmt.setString(3, coordinadorZona.getDni());
             pstmt.setString(4, coordinadorZona.getCorreoElectronico());
             pstmt.setString(5, coordinadorZona.getCelular());
             pstmt.setDate(6, Date.valueOf(coordinadorZona.getFechaNacimiento()));
             pstmt.setInt(7, coordinadorZona.getFoto().getFotoID());
             pstmt.setBoolean(8, coordinadorZona.getEstado().equals("activo"));
             pstmt.setInt(9, coordinadorZona.getZona().getZonaID());
             pstmt.setBoolean(10,coordinadorZona.isFlag());
             pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
