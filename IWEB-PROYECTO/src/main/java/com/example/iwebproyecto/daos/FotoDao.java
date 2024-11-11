package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.Zona;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FotoDao extends BaseDao {
    //Metodo para obtener un usuario por ID

    public Foto obtenerFotoPorId(int fotoId) throws SQLException {
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("select * from fotos where fotoId=?")) {

            pstmt.setInt(1, fotoId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Foto foto = new Foto();

                foto.setFotoID(rs.getInt("fotoId"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                foto.setUbicacion(rs.getString("ubicacion"));

                return foto;
            }
        }
        return null;
    }
}
