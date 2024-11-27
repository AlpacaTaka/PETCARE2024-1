package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class AdminCuentasDao extends BaseDao {
    public ArrayList<Albergue> listarAlbergues() {
        ArrayList<Albergue> listaAlbergues = new ArrayList<>();
        String sql = "SELECT * FROM albergue";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Albergue albergue = mapearAlbergue(rs);
                listaAlbergues.add(albergue);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaAlbergues;
    }
    private Albergue mapearAlbergue(ResultSet rs) throws SQLException {
        Albergue albergue = new Albergue();
        albergue.setAlbergueID(rs.getInt("albergueID"));
        albergue.setNombreAlbergue(rs.getString("nombreAlbergue"));
        albergue.setNombreEncargado(rs.getString("nombreEncargado"));
        albergue.setApellidoEncargado(rs.getString("apellidoEncargado"));
        albergue.setEspaciosDisponibles(rs.getInt("espaciosDisponibles"));
        albergue.setFechaCreacion(rs.getDate("fechaCreacion").toString());
        albergue.setCorreoElectronico(rs.getString("correoElectronico"));
        albergue.setCantidadAnimales(rs.getInt("cantidadAnimales"));
        albergue.setUrlFacebook(rs.getString("urlFacebook"));
        albergue.setUrlInstagram(rs.getString("urlInstagram"));
        albergue.setDireccion(rs.getString("direccion"));

        // Obtener Distrito
        DistritoDao distritoDao = new DistritoDao();
        Distrito distrito = distritoDao.obtenerDistritoPorId(rs.getInt("distritoID"));
        albergue.setDistrito(distrito);

        albergue.setPuntoAcopioDonaciones(rs.getString("puntoAcopioDonaciones"));
        albergue.setDireccionDonaciones(rs.getString("direccionDonaciones"));
        albergue.setNombreContactoDonaciones(rs.getString("nombreContactoDonaciones"));
        albergue.setNumeroContactoDonaciones(rs.getString("numeroContactoDonaciones"));
        albergue.setNumeroYape(rs.getString("numeroYape"));
        albergue.setNumeroPlin(rs.getString("numeroPlin"));
        albergue.setCodigoQR(rs.getString("codigoQR"));
        albergue.setAprobado(rs.getBoolean("aprobado"));

        // Obtener Foto
        FotoDao fotoDao = new FotoDao();
        Foto foto = fotoDao.obtenerFotoPorId(rs.getInt("fotoID"));
        albergue.setFoto(foto);

        albergue.setEliminado(rs.getBoolean("eliminado"));
        albergue.setFechaRegistrado(rs.getDate("fechaRegistrado").toString());
        albergue.setDescripcion(rs.getString("descripcion"));

        return albergue;
    }

    public ArrayList<Usuario> listarUsuarios() {
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setDni(rs.getString(4));
                usuario.setDireccion(rs.getString(5));
                usuario.setCorreoElectronico(rs.getString(6));
                usuario.setActivo(rs.getBoolean(7));
                Distrito distrito = obtenerDistritoPorID(rs.getInt(8));
                usuario.setDistrito(distrito);
                Foto foto = new Foto();
                foto.setFotoID(rs.getInt(9));
                usuario.setFoto(foto);
                usuario.setEliminado(rs.getBoolean(10));
                usuario.setFechaRegistrado(LocalDate.parse(rs.getString(11)));
                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaUsuarios;
    }

    public ArrayList<CoordinadorZona> listarCoordinadores() {
        ArrayList<CoordinadorZona> listaCoordinador = new ArrayList<>();
        String sql = "SELECT * FROM coordinadorzona";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                CoordinadorZona coordinadorZona = new CoordinadorZona();
                coordinadorZona.setCoordinadorID(rs.getInt(1));
                coordinadorZona.setNombre(rs.getString(2));
                coordinadorZona.setApellido(rs.getString(3));
                coordinadorZona.setDni(rs.getString(4));
                coordinadorZona.setCorreoElectronico(rs.getString(5));
                coordinadorZona.setCelular(rs.getString(6));
                coordinadorZona.setFechaNacimiento(rs.getString(7));
                Foto foto = new Foto();
                foto.setFotoID(rs.getInt(8));
                coordinadorZona.setFoto(foto);
                coordinadorZona.setEstado(rs.getString(9));
                ZonaDao zonaDao = new ZonaDao();
                Zona zona = zonaDao.obtenerZonaPorId(rs.getInt(10));
                coordinadorZona.setZona(zona);
                coordinadorZona.setFlag(rs.getBoolean(11));
                listaCoordinador.add(coordinadorZona);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaCoordinador;
    }

    public ArrayList<LugarEvento> listarLugaresHabilitados() {
        ArrayList<LugarEvento> listaLugares = new ArrayList<>();
        String sql = "SELECT * FROM lugarevento";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                LugarEvento lugar = new LugarEvento();
                lugar.setLugarID(rs.getInt(1));
                lugar.setNombreLugar(rs.getString(2));
                lugar.setDireccionLugar(rs.getString(3));
                lugar.setAforoMax(rs.getInt(4));
                AdministradorDao administradorDao = new AdministradorDao();
                Administrador administrador = administradorDao.obtenerAdministradorPorID(rs.getInt(5));
                lugar.setAdministrador(administrador);
                Foto foto = new Foto();
                foto.setFotoID(rs.getInt(6));
                lugar.setEliminado(rs.getBoolean(7));
                AlbergueDaoRevenge albergueDao = new AlbergueDaoRevenge();
                Distrito distrito = albergueDao.obtenerDistritoPorID(rs.getInt(8));
                lugar.setDistrito(distrito);
                listaLugares.add(lugar);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaLugares;
    }

    public Distrito obtenerDistritoPorID(int id) {
        String sql = "select * from distrito where distritoID=?;";
        Distrito distrito = new Distrito();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {

                Zona zona = new Zona();
                distrito.setDistritoID(id);
                distrito.setNombreDistrito(rs.getString(2));
                zona.setZonaID(rs.getInt(3));
                distrito.setZona(zona);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return distrito;
    }
}
