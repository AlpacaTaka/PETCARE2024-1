package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Foto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class FotoDao extends BaseDao {

    public int guardarFoto(Foto foto) {
        String sql = "INSERT INTO fotos (rutaFoto) VALUES (?)";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, foto.getRutaFoto());
            stmt.executeUpdate();

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    System.err.println("Error: No se obtuvo el ID de la foto recién creada.");
                    return 0; // Indica error
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al guardar la foto: " + e.getMessage());
            e.printStackTrace(); // Reemplaza con un manejo de errores más robusto
            return 0; // Indica error
        }
    }

    public boolean actualizarFoto(Foto foto) {
        String sql = "UPDATE fotos SET rutaFoto = ? WHERE fotoID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, foto.getRutaFoto());
            stmt.setInt(2, foto.getFotoID());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error al actualizar la foto: " + e.getMessage());
            e.printStackTrace(); // Reemplaza con un manejo de errores más robusto
            return false;
        }
    }

    public Foto obtenerFotoPorId(int fotoId) {
        String sql = "SELECT * FROM fotos WHERE fotoID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, fotoId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Foto foto = new Foto();
                    foto.setFotoID(rs.getInt("fotoID"));
                    foto.setRutaFoto(rs.getString("rutaFoto"));
                    return foto;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener la foto: " + e.getMessage());
            e.printStackTrace(); // Reemplaza con un manejo de errores más robusto
            return null;
        }
        return null;
    }
}