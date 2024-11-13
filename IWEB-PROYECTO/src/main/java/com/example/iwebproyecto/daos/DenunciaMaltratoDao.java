package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.DenunciaMaltrato;

import java.sql.*;

public class DenunciaMaltratoDao extends BaseDao {

    public void RegistrarDenunciaMaltrato(DenunciaMaltrato DenunciaMaltrato) {

        String sql = "INSERT INTO denunciaMaltrato ( usuarioID, tamanio, raza, tipoMaltrato, nombreApellidoMaltratador, direccion, realizoDenuncia, especie, fecha, fotos_fotoID) \n" +
                "VALUES (1, ?, ?, ? , ?, ?, ?, ?, ?, ?);";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, DenunciaMaltrato.getTamanio());
            stmt.setString(2,DenunciaMaltrato.getRaza());
            stmt.setString(3, DenunciaMaltrato.getTipoMaltrato());
            stmt.setString(4, DenunciaMaltrato.getNombreApellidoMaltratador());
            stmt.setString(5, DenunciaMaltrato.getDireccion());
            stmt.setInt(6, DenunciaMaltrato.getRealizoDenuncia());
            stmt.setString(7, DenunciaMaltrato.getEspecie());
            stmt.setString(8, DenunciaMaltrato.getFecha());
            stmt.setInt(9, DenunciaMaltrato.getFoto().getFotoID());


            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
