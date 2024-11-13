package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class AlbergueDaoRevenge extends BaseDao {
    /*
    // Método para obtener todos los albergues
    public ArrayList<Albergue> listarAlbergues() {
        ArrayList<Albergue> listaAlbergues = new ArrayList<>();
        String sql = "select * from albergue where estado='Aprobado';";

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

    // Método para insertar un nuevo albergue
    public void insertarAlbergue(Albergue albergue) {
        String sql = "INSERT INTO albergue (albergueID, nombreAlbergue, nombreEncargado, apellidoEncargado, espaciosDisponibles, fechaCreacion, " +
                "correoElectronico, contrasenia, cantidadAnimales, urlFacebook, urlInstagram, direccion, distritoID, " +
                "puntoAcopioDonaciones, direccionDonaciones, nombreContactoDonaciones, numeroContactoDonaciones, numeroYape, numeroPlin, " +
                "codigoQR, aprobado, fotoID, eliminado, fechaRegistrado, descripcion) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setInt(1, albergue.getAlbergueID());
            statement.setString(2, albergue.getNombreAlbergue());
            statement.setString(3, albergue.getNombreEncargado());
            statement.setString(4, albergue.getApellidoEncargado());
            statement.setInt(5, albergue.getEspaciosDisponibles());
            statement.setDate(6, albergue.getFechaCreacion());
            statement.setString(7, albergue.getCorreoElectronico());
            statement.setString(8, albergue.getContrasenia());
            statement.setInt(9, albergue.getCantidadAnimales());
            statement.setString(10, albergue.getUrlFacebook());
            statement.setString(11, albergue.getUrlInstagram());
            statement.setString(12, albergue.getDireccion());
            statement.setInt(13, albergue.getDistrito().getDistritoID());
            statement.setString(14, albergue.getPuntoAcopioDonaciones());
            statement.setString(15, albergue.getDireccionDonaciones());
            statement.setString(16, albergue.getNombreContactoDonaciones());
            statement.setString(17, albergue.getNumeroContactoDonaciones());
            statement.setString(18, albergue.getNumeroYape());
            statement.setString(19, albergue.getNumeroPlin());
            statement.setString(20, albergue.getCodigoQR());
            statement.setInt(21, albergue.getAprobado());
            statement.setInt(22, albergue.getFotoID());
            statement.setInt(23, albergue.getEliminado());
            statement.setString(24, albergue.getFechaRegistrado());
            statement.setString(25, albergue.getDescripcion());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public Albergue obtenerAlberguePorID(int albergueID) {
        Albergue albergue = new Albergue();
        String sql = "SELECT * FROM albergue WHERE albergueID=?;";

        try (Connection conn = this.getConnection();

             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            albergueID = 1;
            albergueID = 2;
            pstmt.setInt(1, albergueID);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                albergue.setAlbergueID(rs.getInt("albergueID"));
                albergue.setNombreAlbergue(rs.getString("nombreAlbergue"));
                albergue.setNombreEncargado(rs.getString("nombreEncargado"));
                albergue.setApellidoEncargado(rs.getString("apellidoEncargado"));
                albergue.setEspaciosDisponibles(rs.getInt("espaciosDisponibles"));
                albergue.setFechaCreacion(rs.getDate("fechaCreacion"));
                albergue.setCorreoElectronico(rs.getString("correoElectronico"));
                albergue.setContrasenia(rs.getString("contrasenia"));
                albergue.setCantidadAnimales(rs.getInt("cantidadAnimales"));
                albergue.setUrlFacebook(rs.getString("urlFacebook"));
                albergue.setUrlInstagram(rs.getString("urlInstagram"));
                albergue.setDireccion(rs.getString("direccion"));

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
                albergue.setAprobado(rs.getInt("aprobado"));
                albergue.setFotoID(rs.getInt("fotoID"));
                albergue.setEliminado(rs.getInt("eliminado"));
                albergue.setFechaRegistrado(rs.getString("fechaRegistrado"));
                albergue.setDescripcion(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return albergue;
    }

    private Albergue mapearAlbergue(ResultSet rs) throws SQLException {
        Albergue albergue = new Albergue();
        albergue.setAlbergueID(rs.getInt("albergueID"));
        albergue.setNombreAlbergue(rs.getString("nombreAlbergue"));
        albergue.setNombreEncargado(rs.getString("nombreEncargado"));
        albergue.setApellidoEncargado(rs.getString("apellidoEncargado"));
        albergue.setEspaciosDisponibles(rs.getInt("espaciosDisponibles"));
        albergue.setFechaCreacion(rs.getDate("fechaCreacion"));
        albergue.setCorreoElectronico(rs.getString("correoElectronico"));
        albergue.setContrasenia(rs.getString("contrasenia"));
        albergue.setCantidadAnimales(rs.getInt("cantidadAnimales"));
        albergue.setUrlFacebook(rs.getString("urlFacebook"));
        albergue.setUrlInstagram(rs.getString("urlInstagram"));
        albergue.setDireccion(rs.getString("direccion"));

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
        albergue.setAprobado(rs.getInt("aprobado"));
        albergue.setFotoID(rs.getInt("fotoID"));
        albergue.setEliminado(rs.getInt("eliminado"));
        albergue.setFechaRegistrado(rs.getString("fechaRegistrado"));
        albergue.setDescripcion(rs.getString("descripcion"));

        return albergue;
    }

    public void actualizarAlbergue(Albergue albergue) {
        String sql = "UPDATE albergue SET nombreAlbergue = ?, nombreEncargado = ?, apellidoEncargado = ?, espaciosDisponibles = ?, fechaCreacion = ?, " +
                "correoElectronico = ?, contrasenia = ?, cantidadAnimales = ?, urlFacebook = ?, urlInstagram = ?, direccion = ?, distritoID = ?, " +
                "puntoAcopioDonaciones = ?, direccionDonaciones = ?, nombreContactoDonaciones = ?, numeroContactoDonaciones = ?, numeroYape = ?, " +
                "numeroPlin = ?, codigoQR = ?, aprobado = ?, fotoID = ?, eliminado = ?, fechaRegistrado = ?, descripcion = ? WHERE albergueID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, albergue.getNombreAlbergue());
            pstmt.setString(2, albergue.getNombreEncargado());
            pstmt.setString(3, albergue.getApellidoEncargado());
            pstmt.setInt(4, albergue.getEspaciosDisponibles());
            pstmt.setDate(5, albergue.getFechaCreacion());
            pstmt.setString(6, albergue.getCorreoElectronico());
            pstmt.setString(7, albergue.getContrasenia());
            pstmt.setInt(8, albergue.getCantidadAnimales());
            pstmt.setString(9, albergue.getUrlFacebook());
            pstmt.setString(10, albergue.getUrlInstagram());
            pstmt.setString(11, albergue.getDireccion());
            pstmt.setInt(12, albergue.getDistrito().getDistritoID());
            pstmt.setString(13, albergue.getPuntoAcopioDonaciones());
            pstmt.setString(14, albergue.getDireccionDonaciones());
            pstmt.setString(15, albergue.getNombreContactoDonaciones());
            pstmt.setString(16, albergue.getNumeroContactoDonaciones());
            pstmt.setString(17, albergue.getNumeroYape());
            pstmt.setString(18, albergue.getNumeroPlin());
            pstmt.setString(19, albergue.getCodigoQR());
            pstmt.setInt(20, albergue.getAprobado());
            pstmt.setInt(21, albergue.getFotoID());
            pstmt.setInt(22, albergue.getEliminado());
            pstmt.setString(23, albergue.getFechaRegistrado());
            pstmt.setString(24, albergue.getDescripcion());
            pstmt.setInt(25, albergue.getAlbergueID());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para eliminar un albergue
    public void eliminarAlbergue(int albergueID) {
        String sql = "DELETE FROM albergue WHERE albergueID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, albergueID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/


    public ArrayList<MascotasAdopcion> listarMascotasAdopcion() {
        String sql = "select * from mascotasadopcion where albergueID=?;";
        ArrayList<MascotasAdopcion> listaMascotasAdopcion = new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            int albergueID = 1;
            pstmt.setInt(1, albergueID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                MascotasAdopcion mascotasAdopcion = new MascotasAdopcion();
                Distrito distrito = new Distrito();
                Foto foto = new Foto();
                Albergue albergue = new Albergue();
                mascotasAdopcion.setIdAdopcion(rs.getInt(1));
                mascotasAdopcion.setNombreMascota(rs.getString(2));
                mascotasAdopcion.setEspecie(rs.getString(3));
                mascotasAdopcion.setRaza(rs.getString(4));
                distrito.setDistritoID(rs.getInt(5));
                mascotasAdopcion.setDistrito(distrito);
                mascotasAdopcion.setDireccionHallazgo(rs.getString(6));
                mascotasAdopcion.setEdadAprox(rs.getInt(7));
                mascotasAdopcion.setSexo(rs.getString(8));
                mascotasAdopcion.setDescripcionGeneral(rs.getString(9));
                foto.setFotoID(rs.getInt(10));
                mascotasAdopcion.setFoto(foto);
                mascotasAdopcion.setSeEncuentraTemporal(rs.getBoolean(11));
                mascotasAdopcion.setCondicionesAdopcion(rs.getString(12));
                albergue.setAlbergueID(rs.getInt(13));
                mascotasAdopcion.setAlbergue(albergue);
                mascotasAdopcion.setFechaAdoptado(rs.getString(14));
                mascotasAdopcion.setEliminado(rs.getBoolean(15));
                listaMascotasAdopcion.add(mascotasAdopcion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaMascotasAdopcion;
    }
}