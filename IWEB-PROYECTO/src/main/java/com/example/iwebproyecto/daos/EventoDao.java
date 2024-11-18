package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EventoDao extends BaseDao {


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
}
