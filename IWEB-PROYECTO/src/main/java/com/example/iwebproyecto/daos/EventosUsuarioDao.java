package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.EventoBenefico;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EventosUsuarioDao extends BaseDao{

    public void borrarInscripcion(int usuarioID, int eventoID){
        String sql = "DELETE FROM inscripcionevento WHERE usuarioID = ? AND eventoID = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, usuarioID);
            pstmt.setInt(2, eventoID);

            pstmt.executeUpdate(); // Ejecuta la eliminación

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isAlreadyRegistered(int userId, int eventoId) {
        String query = "SELECT COUNT(*) FROM inscripcionevento WHERE usuarioID = ? AND eventoID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.setInt(2, eventoId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1) > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean registerToEvent(int userId, int eventoId){
        String query = "INSERT INTO inscripcionevento (usuarioID, eventoID) VALUES (?, ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.setInt(2, eventoId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    // Metodo para verificar si un evento se solapa con otro
    // Metodo para verificar si un evento se solapa con otro
    public boolean verificarSolapamiento(int usuarioID, int eventoID) {
        String query = """
            SELECT COUNT(*) AS solapados
            FROM inscripcionevento ie
            INNER JOIN eventobenefico eb1 ON ie.eventoID = eb1.eventoAlbergueID
            INNER JOIN eventobenefico eb2 ON eb2.eventoAlbergueID = ?
            WHERE ie.usuarioID = ?
              AND eb1.fechaEvento = eb2.fechaEvento
              AND (
                  (eb1.horaInicio < eb2.horaFin AND eb1.horaFin > eb2.horaInicio)
              );
        """;

        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, eventoID);
            ps.setInt(2, usuarioID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int solapados = rs.getInt("solapados");
                    return solapados > 0; // Retorna true si hay eventos solapados
                }
            }
        } catch (SQLException e) {
            // Puedes registrar el error o manejarlo adecuadamente
            e.printStackTrace();  // O loguear el error usando un sistema de log
            return false; // Retorna false si ocurre algún error durante la consulta
        }
        return false; // No hay eventos solapados
    }

    // Metodo para verificar el aforo de un evento
    public boolean verificarAforo(int eventoID){
        String query = """
            SELECT le.aforoMax, 
                   COUNT(ie.inscripcionID) AS inscritos
            FROM lugarevento le
            INNER JOIN eventobenefico eb ON le.lugarID = eb.lugarID
            LEFT JOIN inscripcionevento ie ON eb.eventoAlbergueID = ie.eventoID
            WHERE eb.eventoAlbergueID = ?
            GROUP BY le.aforoMax;
        """;

        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, eventoID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int aforoMax = rs.getInt("aforoMax");
                    int inscritos = rs.getInt("inscritos");

                    // Verifica si el número de inscritos ha alcanzado el aforo máximo
                    return inscritos < aforoMax;
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Si no se encuentra el evento, se considera que no hay cupos disponibles
    }




}
