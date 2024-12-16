package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.sql.*;

public class EventoDao extends BaseDao {

    public ArrayList<EventoBenefico> listarEventosPorAlbergue(int albergueID) {

        ArrayList<EventoBenefico> eventos = new ArrayList<>();

        String sql = "SELECT * FROM eventobenefico WHERE albergueID = ? AND eliminado = 0";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, albergueID);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    eventos.add(mapearEvento(resultSet));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return eventos;
    }

    public void guardarEvento(EventoBenefico evento) {
        String sql = "INSERT INTO eventobenefico (nombre, tipoDonacion, detalleMonetario, detalleSuministro, distritoID, fechaEvento, lugarID, horaInicio, horaFin, razonEvento, descripcionEvento, invitados, fotoID, albergueID, aprobado, eliminado) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, evento.getNombre());
            pstmt.setString(2, evento.getTipoDonacion());

            // Handle potential nulls for Integer types:
            if (evento.getDetalleMonetario() != null) {
                pstmt.setInt(3, evento.getDetalleMonetario());
            } else {
                pstmt.setNull(3, Types.INTEGER);
            }

            pstmt.setString(4, evento.getDetalleSuministro());
            pstmt.setInt(5, evento.getDistrito().getDistritoID());
            pstmt.setDate(6, Date.valueOf(evento.getFechaEvento()));
            pstmt.setInt(7, evento.getLugar().getLugarID());
            pstmt.setTime(8, Time.valueOf(evento.getHoraInicio()));
            pstmt.setTime(9, Time.valueOf(evento.getHoraFin()));
            pstmt.setString(10, evento.getRazonEvento());
            pstmt.setString(11, evento.getDescripcionEvento());
            pstmt.setString(12, evento.getInvitados());
            pstmt.setObject(13, evento.getFoto().getFotoID());
            pstmt.setInt(14, evento.getAlbergue().getAlbergueID());
            pstmt.setBoolean(15, evento.isAprobado());
            pstmt.setBoolean(16, evento.isEliminado());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarEvento(EventoBenefico evento) {
        String sql = "UPDATE eventobenefico SET nombre=?, tipoDonacion=?, detalleMonetario=?, detalleSuministro=?, distritoID=?, fechaEvento=?, lugarID=?, horaInicio=?, horaFin=?, razonEvento=?, descripcionEvento=?, invitados=?, albergueID=?, aprobado=?, eliminado=? " +
                "WHERE eventoAlbergueID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Configurar los valores para la consulta SQL
            pstmt.setString(1, evento.getNombre());
            pstmt.setString(2, evento.getTipoDonacion());

            if (evento.getDetalleMonetario() != null) {
                pstmt.setInt(3, evento.getDetalleMonetario());
            } else {
                pstmt.setNull(3, Types.INTEGER);
            }
            pstmt.setString(4, evento.getDetalleSuministro());
            pstmt.setInt(5, evento.getDistrito().getDistritoID());
            pstmt.setDate(6, Date.valueOf(evento.getFechaEvento()));
            pstmt.setInt(7, evento.getLugar().getLugarID());
            pstmt.setTime(8, Time.valueOf(evento.getHoraInicio()));
            pstmt.setTime(9, Time.valueOf(evento.getHoraFin()));
            pstmt.setString(10, evento.getRazonEvento());
            pstmt.setString(11, evento.getDescripcionEvento());
            pstmt.setString(12, evento.getInvitados());
            pstmt.setInt(13, evento.getAlbergue().getAlbergueID());
            pstmt.setBoolean(14, evento.isAprobado());
            pstmt.setBoolean(15, evento.isEliminado());
            pstmt.setInt(16, evento.getEventoAlbergueID());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error al ejecutar la consulta de actualización: " + e.getMessage(), e);
        }
    }

    public EventoBenefico obtenerEventoPorID(int eventoId) {
        String sql = "SELECT * FROM eventobenefico WHERE eventoAlbergueID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, eventoId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapearEvento(rs);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    private EventoBenefico mapearEvento(ResultSet rs) throws SQLException {
        EventoBenefico evento = new EventoBenefico();

        evento.setEventoAlbergueID(rs.getInt("eventoAlbergueID"));
        evento.setNombre(rs.getString("nombre"));
        evento.setTipoDonacion(rs.getString("tipoDonacion"));
        evento.setDetalleMonetario(rs.getInt("detalleMonetario"));
        evento.setDetalleSuministro(rs.getString("detalleSuministro"));
        evento.setFechaEvento(rs.getDate("fechaEvento").toLocalDate());
        evento.setHoraInicio(rs.getTime("horaInicio").toLocalTime());
        evento.setHoraFin(rs.getTime("horaFin").toLocalTime());
        evento.setRazonEvento(rs.getString("razonEvento"));
        evento.setDescripcionEvento(rs.getString("descripcionEvento"));
        evento.setInvitados(rs.getString("invitados"));
        evento.setAprobado(rs.getBoolean("aprobado"));
        evento.setEliminado(rs.getBoolean("eliminado"));

        // Usamos los DAOs para obtener las clases relacionadas
        int lugarID = rs.getInt("lugarID");
        LugarEventoDao lugarEventoDao = new LugarEventoDao();
        LugarEvento lugarEvento = lugarEventoDao.obtenerLugarHabilitadosPorID(lugarID);
        evento.setLugar(lugarEvento);

        int distritoID = rs.getInt("distritoID");
        DistritoDao distritoDao = new DistritoDao();
        Distrito distrito = distritoDao.obtenerDistritoPorId(distritoID);
        evento.setDistrito(distrito);

        int fotoID = rs.getInt("fotoID");
        FotoDao fotoDao = new FotoDao();
        Foto foto = fotoDao.obtenerFotoPorId(fotoID);
        evento.setFoto(foto);

        int albergueID = rs.getInt("albergueID");
        AlbergueDao albergueDao = new AlbergueDao();
        Albergue albergue = albergueDao.obtenerAlberguePorID(albergueID);
        evento.setAlbergue(albergue);


        return evento;
    }
    //Queremos solo obtener 3 elementis para la pagina de inicio.
    public ArrayList<EventoBenefico> listarEventosFuturosAleatorios3(){
        ArrayList<EventoBenefico> eventos = new ArrayList<>();

        String sql = "SELECT * FROM eventobenefico " +
                "WHERE fechaEvento > CURDATE() AND eliminado = 0 " +
                "ORDER BY RAND() " + // Ordenar aleatoriamente
                "LIMIT 3"; // Limitamos los resultados a 3


        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                EventoBenefico evento = new EventoBenefico();

                evento =mapearEvento(resultSet);


                eventos.add(evento);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return eventos;
    }

    public ArrayList<EventoBenefico> listarEventosFuturos(){
        ArrayList<EventoBenefico> eventos = new ArrayList<>();

        String sql = "SELECT * FROM eventobenefico " +
                "WHERE fechaEvento > CURDATE() AND eliminado = 0 " +
                "ORDER BY RAND()";


        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                EventoBenefico evento = new EventoBenefico();

                evento =mapearEvento(resultSet);


                eventos.add(evento);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return eventos;
    }
    public ArrayList<EventoBenefico> listarEventosFuturosPorFecha() {
        ArrayList<EventoBenefico> eventos = new ArrayList<>();

        String sql = "SELECT * FROM eventobenefico " +
                "WHERE fechaEvento > CURDATE() AND eliminado = 0 " +
                "ORDER BY fechaEvento ASC, horaInicio ASC"; // Ordenar por fecha y hora de inicio

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                EventoBenefico evento = mapearEvento(resultSet);
                eventos.add(evento);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return eventos;
    }
    public ArrayList<EventoBenefico> listarEventosPorFecha() {
        ArrayList<EventoBenefico> eventos = new ArrayList<>();

        String sql = "SELECT * FROM eventobenefico " +
                "WHERE eliminado = 0 " +
                "ORDER BY fechaEvento ASC, horaInicio ASC"; // Ordenar por fecha y hora de inicio

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                EventoBenefico evento = mapearEvento(resultSet);
                eventos.add(evento);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return eventos;
    }

    public boolean eliminarEvento(int eventoId) {
        String sql = "UPDATE eventobenefico SET eliminado = 1 WHERE eventoAlbergueID = ?"; // Soft delete con la columna correcta

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, eventoId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    //Esto es para verificar la inscripcion
    public ArrayList<EventoBenefico> listarEventosFuturosPorFechaUsuarioID(int usuarioID) {
        ArrayList<EventoBenefico> eventos = new ArrayList<>();

        String sql = """
        SELECT eb.*
        FROM eventobenefico eb
        INNER JOIN inscripcionevento ie ON eb.eventoAlbergueID = ie.eventoID
        WHERE ie.usuarioID = ?
          AND eb.fechaEvento >= CURRENT_DATE()
          AND eb.eliminado = 0
        ORDER BY eb.fechaEvento ASC, eb.horaInicio ASC;
    """; // Ordenar por fecha y hora de inicio

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioID);
            ResultSet resultSet = stmt.executeQuery();

            while (resultSet.next()) {
                EventoBenefico evento = mapearEvento(resultSet);
                eventos.add(evento);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return eventos;
    }

    //Esto es para verificar la inscripcion
    public ArrayList<EventoBenefico> listarEventosPasadosPorFechaUsuarioID(int usuarioID) {
        ArrayList<EventoBenefico> eventos = new ArrayList<>();

        String sql = """
        SELECT eb.*
        FROM eventobenefico eb
        INNER JOIN inscripcionevento ie ON eb.eventoAlbergueID = ie.eventoID
        WHERE ie.usuarioID = ?
          AND eb.fechaEvento < CURRENT_DATE()
          AND eb.eliminado = 0
        ORDER BY eb.fechaEvento ASC, eb.horaInicio ASC;
    """; // Ordenar por fecha y hora de inicio

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioID);
            ResultSet resultSet = stmt.executeQuery();

            while (resultSet.next()) {
                EventoBenefico evento = mapearEvento(resultSet);
                eventos.add(evento);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return eventos;
    }



}
