package com.example.iwebproyecto.daos;



import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.Zona;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DistritoDao extends BaseDao {

    //Metodo para obtener un usuario por ID
    public Distrito obtenerDistritoPorId(int distritoId) throws SQLException {
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("select * from distrito where distritoID=?")) {

            pstmt.setInt(1, distritoId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Distrito distrito = new Distrito();

                distrito.setDistritoID(rs.getInt("distritoId"));
                distrito.setNombreDistrito(rs.getString("nombreDistrito"));

                ZonaDao zonaDao = new ZonaDao();
                Zona zona;
                zona=zonaDao.obtenerZonaPorId(rs.getInt("zonaId"));

                distrito.setZona(zona);

                return distrito;
            }
        }
        return null;
    }
}
