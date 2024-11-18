package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Administrador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdministradorDao extends BaseDao{

    public Administrador obtenerAdministradorPorID(int administradorID) throws SQLException {

        String sql = "SELECT * FROM administrador WHERE administradorID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {


            pstmt.setInt(1, administradorID);


            ResultSet rs = pstmt.executeQuery();


            if (rs.next()) {
                return mapearAdministrador(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Si no se encuentra el administrador, retornamos null
        return null;

    }

    private Administrador mapearAdministrador(ResultSet rs) throws SQLException {
        int administradorID = rs.getInt("administradorID");
        String nombreUsuario = rs.getString("nombreUsuario");


        return new Administrador(administradorID, nombreUsuario);
    }
}
