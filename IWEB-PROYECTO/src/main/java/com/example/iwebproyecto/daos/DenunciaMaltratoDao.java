package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.DenunciaMaltrato;

import java.sql.*;

public class DenunciaMaltratoDao extends BaseDao {

    public void RegistrarDenunciaMaltrato(DenunciaMaltrato denuncia) {

        String sql = "INSERT INTO denunciamaltrato (usuarioID, tamanio, especie, raza, tipoMaltrato, " +
                "nombreApellidoMaltratador, direccion, fotoID, realizoDenuncia, eliminado, fechaFormulario) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try(Connection conn = this.getConnection();


            PreparedStatement pstmt = conn.prepareStatement(sql);) {


            pstmt.setInt(1, denuncia.getUsuario().getUsuarioID()); // Obtenemos el ID del Usuario
            pstmt.setString(2, denuncia.getTamanio());
            pstmt.setString(3, denuncia.getEspecie());
            pstmt.setString(4, denuncia.getRaza());
            pstmt.setString(5, denuncia.getTipoMaltrato());
            pstmt.setString(6, denuncia.getNombreApellidoMaltratador()); // Puede ser null
            pstmt.setString(7, denuncia.getDireccion());
            pstmt.setInt(8, denuncia.getFoto().getFotoID()); // Obtenemos el ID de la Foto
            pstmt.setBoolean(9, denuncia.isRealizoDenuncia());
            pstmt.setBoolean(10, denuncia.isEliminado());
            pstmt.setDate(11, java.sql.Date.valueOf(denuncia.getFechaFormulario())); // LocalDate a java.sql.Date



            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
