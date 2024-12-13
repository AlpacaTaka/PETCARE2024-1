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
        String sql = "SELECT * FROM albergue where eliminado = 0";

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

    public void borrarAlbergue(int idAlbergue){
        String sql = "UPDATE albergue set eliminado = 1 where albergueID = ?";
        try (Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idAlbergue);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public ArrayList<Usuario> listarUsuarios() {
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario where eliminado = 0";

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

    public void borrarUsuario(int idUsuario){
        String sql = "UPDATE usuario set eliminado = 1 where usuarioID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idUsuario);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public ArrayList<CoordinadorZona> listarCoordinadores() {
        ArrayList<CoordinadorZona> listaCoordinador = new ArrayList<>();
        String sql = "SELECT * FROM coordinadorzona where eliminado = 0";

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

    public void borrarCoordinador(int idCoordinador){
        String sql = "UPDATE coordinadorzona set eliminado = 1 where coordinadorID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idCoordinador);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public ArrayList<LugarEvento> listarLugaresHabilitados() {
        ArrayList<LugarEvento> listaLugares = new ArrayList<>();
        String sql = "SELECT * FROM lugarevento where eliminado = 0";

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

    public void borrarLugarHabilitado(int idLugar){
        String sql = "UPDATE lugarevento set eliminado = 1 where lugarID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idLugar);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
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

    public Usuario obtenerUsuarioPorID(int usuarioID){
        Usuario usuario = new Usuario();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * from usuario WHERE usuarioID = ?")) {

            pstmt.setInt(1, usuarioID);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {

                usuario.setUsuarioID(rs.getInt("usuarioID"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setDni(rs.getString("dni"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setCorreoElectronico(rs.getString("correoelectronico"));
                usuario.setActivo(rs.getBoolean("activo"));
                usuario.setEliminado(rs.getBoolean("eliminado"));

                FotoDao fotoDao = new FotoDao();
                DistritoDao distritoDao = new DistritoDao();

                Foto foto =fotoDao.obtenerFotoPorId(rs.getInt("fotoID"));
                usuario.setFoto(foto);

                Distrito distrito= distritoDao.obtenerDistritoPorId(rs.getInt("distritoID"));
                usuario.setDistrito(distrito);

            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public void editarUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET nombre = ?, apellido = ?, dni = ?, direccion = ?, correoelectronico = ?, activo = ?, distritoID = ?, fotoID = ?, eliminado = ?, fechaRegistrado = ? WHERE usuarioID = ?";
        try (Connection conn = this.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1, usuario.getNombre());
            pstmt.setString(2, usuario.getApellido());
            pstmt.setString(3, usuario.getDni());
            pstmt.setString(4, usuario.getDireccion());
            pstmt.setString(5, usuario.getCorreoElectronico());
            pstmt.setBoolean(6, usuario.isActivo());
            pstmt.setInt(7, usuario.getDistrito().getDistritoID());
            pstmt.setInt(8, usuario.getFoto().getFotoID());
            pstmt.setBoolean(9, usuario.isEliminado());
            pstmt.setInt(11, usuario.getUsuarioID());
            pstmt.setDate(10, Date.valueOf(usuario.getFechaRegistrado()));
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Albergue obtenerAlberguePorID (int albergueID) {
        String sql = "SELECT * FROM albergue WHERE albergueID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, albergueID);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapearAlbergue(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
        albergue.setFechaRegistrado(String.valueOf(LocalDate.parse(rs.getDate("fechaRegistrado").toString())));
        albergue.setDescripcion(rs.getString("descripcion"));

        return albergue;
    }


    public void editarAlbergue(Albergue albergue) {
        String sql = "UPDATE albergue SET nombreAlbergue = ?, nombreEncargado = ?, apellidoEncargado = ?, " +
                "espaciosDisponibles = ?, fechaCreacion = ?, correoElectronico = ?, cantidadAnimales = ?, " +
                "urlFacebook = ?, urlInstagram = ?, direccion = ?, distritoID = ?, puntoAcopioDonaciones = ?, " +
                "direccionDonaciones = ?, nombreContactoDonaciones = ?, numeroContactoDonaciones = ?, " +
                "numeroYape = ?, numeroPlin = ?, codigoQR = ?, aprobado = ?, fotoID = ?, " +
                "eliminado = ?, fechaRegistrado = ?, descripcion = ? WHERE albergueID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, albergue.getNombreAlbergue());
            pstmt.setString(2, albergue.getNombreEncargado());
            pstmt.setString(3, albergue.getApellidoEncargado());
            pstmt.setInt(4, albergue.getEspaciosDisponibles());
            pstmt.setDate(5, Date.valueOf(albergue.getFechaCreacion()));
            pstmt.setString(6, albergue.getCorreoElectronico());
            pstmt.setInt(7, albergue.getCantidadAnimales());
            pstmt.setString(8, albergue.getUrlFacebook());
            pstmt.setString(9, albergue.getUrlInstagram());
            pstmt.setString(10, albergue.getDireccion());
            pstmt.setInt(11, albergue.getDistrito().getDistritoID());
            pstmt.setString(12, albergue.getPuntoAcopioDonaciones());
            pstmt.setString(13, albergue.getDireccionDonaciones());
            pstmt.setString(14, albergue.getNombreContactoDonaciones());
            pstmt.setString(15, albergue.getNumeroContactoDonaciones());
            pstmt.setString(16, albergue.getNumeroYape());
            pstmt.setString(17, albergue.getNumeroPlin());
            pstmt.setString(18, albergue.getCodigoQR());
            pstmt.setBoolean(19, albergue.isAprobado());
            pstmt.setInt(20, albergue.getFoto().getFotoID());
            pstmt.setBoolean(21, albergue.isEliminado());
            pstmt.setDate(22, Date.valueOf(albergue.getFechaRegistrado()));
            pstmt.setString(23, albergue.getDescripcion());
            pstmt.setInt(24, albergue.getAlbergueID());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}


