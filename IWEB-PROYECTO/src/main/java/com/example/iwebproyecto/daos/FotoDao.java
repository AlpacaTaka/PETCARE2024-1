package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Foto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class FotoDao extends BaseDao {
    public void GuadarFoto(Foto foto) {
        String sql = "insert into fotos (rutaFoto) values (?);";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, foto.getRutaFoto());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String sql1 = "SELECT fotoID FROM fotos WHERE rutaFoto=?";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql1)
             ) {

            stmt.setString(1, foto.getRutaFoto());
            ResultSet rs = stmt.executeQuery();
            // Ejecutar la consulta y obtener el ID de la foto
            if (rs.next()) {
                int fotoID = rs.getInt("fotoID");
                foto.setFotoID(fotoID);
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
