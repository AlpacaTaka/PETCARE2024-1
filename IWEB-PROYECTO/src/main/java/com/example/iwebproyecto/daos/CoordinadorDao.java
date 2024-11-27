package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class CoordinadorDao extends BaseDao {
    public CoordinadorZona ObtenerCoordinadorZona() {
        CoordinadorZona coor = new CoordinadorZona();

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT c.*, f.rutaFoto FROM coordinadorzona c inner join fotos f on c.fotoID=f.fotoID  where c.coordinadorID=6;");) {
            while (rs.next()) {
                coor.setCoordinadorID(rs.getInt("coordinadorID"));
                coor.setNombre(rs.getString("nombre"));
                coor.setApellido(rs.getString("apellido"));
                coor.setDni(rs.getString("dni"));
                coor.setCorreoElectronico(rs.getString("correoElectronico"));
                coor.setCelular(rs.getString("celular"));
                coor.setFechaNacimiento(rs.getString("fechaNacimiento"));
                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                coor.setFoto(foto);
                coor.setFlag(rs.getBoolean("activo"));
                Zona zona = new Zona();
                zona.setZonaID(rs.getInt("zonaID"));
                coor.setZona(zona);
                coor.setEstado(rs.getString("eliminado"));
                Foto foto2 = new Foto();
                foto2.setRutaFoto(rs.getString("rutaFoto"));
                coor.setFoto(foto2);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return coor;
    }
    public void guardarCoordinador(Usuario CoordinadorZona){

    }
}
