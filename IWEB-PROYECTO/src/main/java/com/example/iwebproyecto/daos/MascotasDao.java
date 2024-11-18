package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class MascotasDao extends BaseDao {



    public ArrayList<MascotasAdopcion> listarMascotasActivasAdopcion() {
        ArrayList<MascotasAdopcion> listaMascAdopActivas = new ArrayList<>();

        String sql = "select * from mascotasadopcion where eliminado=0";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MascotasAdopcion mascotaAdopcion = mapearMascotaAdopcion(rs);
                listaMascAdopActivas.add(mascotaAdopcion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaMascAdopActivas;
    }
    public ArrayList<MascotasAdopcion> listarMascotasActivasAdopcion8() {
        ArrayList<MascotasAdopcion> listaMascAdopActivas = new ArrayList<>();

        String sql = "SELECT * FROM mascotasadopcion WHERE eliminado=0 ORDER BY RAND() LIMIT 8";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MascotasAdopcion mascotaAdopcion = mapearMascotaAdopcion(rs);
                listaMascAdopActivas.add(mascotaAdopcion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaMascAdopActivas;
    }




    public MascotasAdopcion getMascotasAdopcionPorId(int idAdopcion) {

        String sql = "SELECT * FROM mascotasadopcion WHERE idAdopcion = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idAdopcion);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return mapearMascotaAdopcion(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    private MascotasAdopcion mapearMascotaAdopcion(ResultSet rs) throws SQLException {
        MascotasAdopcion mascotaAdopcion = new MascotasAdopcion();
        mascotaAdopcion.setIdAdopcion(Integer.parseInt(rs.getString("idAdopcion")));
        mascotaAdopcion.setNombreMascota(rs.getString("nombreMascota"));
        mascotaAdopcion.setEspecie(rs.getString("especieMascota"));
        mascotaAdopcion.setRaza(rs.getString("raza"));
        mascotaAdopcion.setDireccionHallazgo(rs.getString("direccionHallazgo"));
        mascotaAdopcion.setEdadAprox(Integer.parseInt(rs.getString("edadAprox")));
        mascotaAdopcion.setSexo(rs.getString("sexo"));
        mascotaAdopcion.setDescripcionGeneral(rs.getString("descripcionGeneral"));
        mascotaAdopcion.setSeEncuentraTemporal(rs.getBoolean("seEncuentraTemporal"));
        mascotaAdopcion.setCondicionesAdopcion(rs.getString("condicionesAdopcion"));
        System.out.println(rs.getString("especieMascota"));
        mascotaAdopcion.setEliminado(rs.getBoolean("eliminado"));

        DistritoDao distritoDao = new DistritoDao();
        Distrito distrito =distritoDao.obtenerDistritoPorId(rs.getInt("distritoID"));

        mascotaAdopcion.setDistrito(distrito);

        FotoDao fotoDao = new FotoDao();
        Foto foto = fotoDao.obtenerFotoPorId(rs.getInt("fotoID"));
        mascotaAdopcion.setFoto(foto);

        AlbergueDao albergueDao = new AlbergueDao();
        Albergue Albergue = albergueDao.obtenerAlberguePorID(rs.getInt("albergueID"));
        mascotaAdopcion.setAlbergue(Albergue);

        return mascotaAdopcion;
    }

    public ArrayList<PublicacionMascotaPerdida> listarNoEncontradasYAprobadas() {
        ArrayList<PublicacionMascotaPerdida> lista = new ArrayList<>();

        String sql = """
            SELECT * WHERE p.mascotaEncontrada = 0 AND p.aprobadoCoordinador = 1;
        """;

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                PublicacionMascotaPerdida publicacion = new PublicacionMascotaPerdida();

                publicacion =mapearMascotasPerdidas(resultSet);

                // Agregar la publicación a la lista
                lista.add(publicacion);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<PublicacionMascotaPerdida> listarNoEncontradasYAprobadasMasDiasPerdido() {
        ArrayList<PublicacionMascotaPerdida> lista = new ArrayList<>();

        String sql = "SELECT p.*" +
                "FROM publicacionmascotaperdida p " +
                "WHERE p.mascotaEncontrada = 0 AND p.aprobadoCoordinador = 1 " +
                "ORDER BY DATEDIFF(CURDATE(), p.fechaPerdida) DESC";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                PublicacionMascotaPerdida publicacion = new PublicacionMascotaPerdida();

                publicacion =mapearMascotasPerdidas(resultSet);

                // Agregar la publicación a la lista
                lista.add(publicacion);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
    public ArrayList<PublicacionMascotaPerdida> listarNoEncontradasYAprobadasMasDiasPerdido5() {
        ArrayList<PublicacionMascotaPerdida> lista = new ArrayList<>();

        String sql = "SELECT p.*" +
                "FROM publicacionmascotaperdida p " +
                "WHERE p.mascotaEncontrada = 0 AND p.aprobadoCoordinador = 1 " +
                "ORDER BY DATEDIFF(CURDATE(), p.fechaPerdida) DESC LIMIT 5";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                PublicacionMascotaPerdida publicacion = new PublicacionMascotaPerdida();

                publicacion =mapearMascotasPerdidas(resultSet);

                // Agregar la publicación a la lista
                lista.add(publicacion);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    private PublicacionMascotaPerdida mapearMascotasPerdidas(ResultSet rs) throws SQLException {
        PublicacionMascotaPerdida publicacion = new PublicacionMascotaPerdida();

        publicacion.setPublicacionMascotaPerdidaID(rs.getInt("publicacionMascotaPerdidaID"));
        publicacion.setDescripcion(rs.getString("descripcion"));
        publicacion.setNombreMascota(rs.getString("nombreMascota"));
        publicacion.setDistintivo(rs.getString("distintivo"));
        publicacion.setEdadMascota(rs.getInt("edadMascota"));
        publicacion.setTamanio(rs.getString("tamanio"));
        publicacion.setEspecie(rs.getString("especie"));
        publicacion.setRaza(rs.getString("raza"));
        publicacion.setDescripcionAdicional(rs.getString("descripcionAdicional"));
        publicacion.setLugarPerdida(rs.getString("lugarPerdida"));
        publicacion.setFechaPerdida(rs.getDate("fechaPerdida").toLocalDate());
        publicacion.setHoraPerdida(rs.getTime("horaPerdida").toLocalTime());
        publicacion.setNombreContacto(rs.getString("nombreContacto"));
        publicacion.setTelefonoContacto(rs.getString("telefonoContacto"));
        publicacion.setAniadirRecompensa(rs.getBoolean("aniadirRecompensa"));
        publicacion.setMontoRecompensa(rs.getInt("montoRecompensa"));
        publicacion.setMascotaEncontrada(rs.getBoolean("mascotaEncontrada"));
        publicacion.setFechaFormulario(rs.getDate("fechaFormulario").toLocalDate());

        // Obtener y setear Foto desde FotoDAO
        int fotoID = rs.getInt("fotoID");
        FotoDao fotoDao = new FotoDao();
        Foto foto = fotoDao.obtenerFotoPorId(fotoID);
        publicacion.setFoto(foto);

        // Obtener y setear Usuario desde UsuarioDAO
        int usuarioID = rs.getInt("usuarioID");
        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario usuario = usuarioDao.obtenerUsuarioPorID(usuarioID);
        publicacion.setUsuario(usuario);

        return publicacion;
    }


}
