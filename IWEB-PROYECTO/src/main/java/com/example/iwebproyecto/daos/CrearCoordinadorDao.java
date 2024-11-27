package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.CoordinadorZona;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.Zona;

import java.sql.*;

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

    public void editarCoordinadorZona (CoordinadorZona coordinadorZona){
        String sql = "update coordinadorzona set nombre = ?, apellido = ?, dni = ?, correoElectronico = ?, celular = ? , fechaNacimiento = ?, fotoID = ?, activo = ?, zonaID = ?, eliminado = ? where coordinadorID = ?;";
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
            pstmt.setInt(11, coordinadorZona.getCoordinadorID());
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public CoordinadorZona buscarCoordinadorPorID(int id){
        String sql = "select * from coordinadorzona where coordinadorID = ?";
        CoordinadorZona coordinadorZona = new CoordinadorZona();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                coordinadorZona.setCoordinadorID(rs.getInt(1));
                coordinadorZona.setNombre(rs.getString(2));
                coordinadorZona.setApellido(rs.getString(3));
                coordinadorZona.setDni(rs.getString(4));
                coordinadorZona.setCorreoElectronico(rs.getString(5));
                coordinadorZona.setCelular(rs.getString(6));
                coordinadorZona.setFechaNacimiento(rs.getString(7));
                Foto foto = new Foto();
                foto.setFotoID(rs.getInt(8));
                coordinadorZona.setFoto(foto);
                coordinadorZona.setEstado(rs.getString(9));
                ZonaDao zonaDao = new ZonaDao();
                Zona zona = zonaDao.obtenerZonaPorId(rs.getInt(10));
                coordinadorZona.setZona(zona);
                coordinadorZona.setFlag(rs.getBoolean(11));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return coordinadorZona;
    }
}
