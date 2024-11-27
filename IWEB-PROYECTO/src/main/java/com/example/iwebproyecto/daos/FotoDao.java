package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Foto;

import java.sql.*;


public class FotoDao extends BaseDao {
    public void GuadarFoto(Foto foto) {
        String sql = "insert into fotos (rutaFoto) values (?);";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, foto.getRutaFoto());
            stmt.executeUpdate();
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                foto.setFotoID(generatedKeys.getInt(1)); // Obtener el ID generado
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void ActualizarFoto(Foto foto,String Nuevaruta) {
        foto.setRutaFoto(Nuevaruta);
        String sql = "UPDATE fotos SET rutaFoto = ? WHERE fotoID = ?;";
        try(Connection conn1 = this.getConnection();
            PreparedStatement stmt = conn1.prepareStatement(sql)) {
            stmt.setString(1, Nuevaruta);
            stmt.setInt(2, foto.getFotoID());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public Foto obtenerFotoPorId(int fotoId) throws SQLException {
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("select * from fotos where fotoId=?")) {

            pstmt.setInt(1, fotoId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Foto foto = new Foto();

                foto.setFotoID(rs.getInt("fotoId"));
                foto.setRutaFoto(rs.getString("rutaFoto"));

                return foto;
            }
        }
        return null;
    }
}



