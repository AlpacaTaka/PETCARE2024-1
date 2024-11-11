package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Zona;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ZonaDao extends BaseDao{

    //Metodo para obtener un zona por ID
    public Zona obtenerZonaPorId(int zonaId) throws SQLException {
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("select * from zona where zonaId=?")) {

            pstmt.setInt(1, zonaId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Zona zona = new Zona();

                zona.setZonaID(rs.getInt("zonaId"));
                zona.setNombreZona(rs.getString("nombreZona"));

                return zona;
            }
        }
        return null;
    }
}
