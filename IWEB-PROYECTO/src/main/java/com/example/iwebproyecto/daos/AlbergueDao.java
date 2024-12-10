package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.Foto;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class AlbergueDao extends BaseDao {

    // Método para obtener todos los albergues activos y aprobados
    public ArrayList<Albergue> listarAlberguesActivosAprobados() {
        ArrayList<Albergue> listaAlbergues = new ArrayList<>();
        String sql = "SELECT * FROM albergue WHERE aprobado=1 AND eliminado=0";

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
        String sql = "INSERT INTO albergue (nombreAlbergue, nombreEncargado, apellidoEncargado, espaciosDisponibles, " +
                "fechaCreacion, correoElectronico, cantidadAnimales, urlFacebook, urlInstagram, direccion, distritoID, " +
                "puntoAcopioDonaciones, direccionDonaciones, nombreContactoDonaciones, numeroContactoDonaciones, " +
                "numeroYape, numeroPlin, codigoQR, aprobado, fotoID, eliminado, fechaRegistrado, descripcion) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setString(1, albergue.getNombreAlbergue());
            statement.setString(2, albergue.getNombreEncargado());
            statement.setString(3, albergue.getApellidoEncargado());
            statement.setInt(4, albergue.getEspaciosDisponibles());
            statement.setDate(5, Date.valueOf(albergue.getFechaCreacion()));
            statement.setString(6, albergue.getCorreoElectronico());
            statement.setInt(7, albergue.getCantidadAnimales());
            statement.setString(8, albergue.getUrlFacebook());
            statement.setString(9, albergue.getUrlInstagram());
            statement.setString(10, albergue.getDireccion());
            statement.setInt(11, albergue.getDistrito().getDistritoID());
            statement.setString(12, albergue.getPuntoAcopioDonaciones());
            statement.setString(13, albergue.getDireccionDonaciones());
            statement.setString(14, albergue.getNombreContactoDonaciones());
            statement.setString(15, albergue.getNumeroContactoDonaciones());
            statement.setString(16, albergue.getNumeroYape());
            statement.setString(17, albergue.getNumeroPlin());
            statement.setString(18, albergue.getCodigoQR());
            statement.setBoolean(19, albergue.isAprobado());
            statement.setInt(20, albergue.getFoto().getFotoID());
            statement.setBoolean(21, albergue.isEliminado());
            statement.setDate(22, Date.valueOf(albergue.getFechaRegistrado()));
            statement.setString(23, albergue.getDescripcion());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para obtener un albergue por ID
    public Albergue obtenerAlberguePorID(int albergueID) {
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

    // Método para mapear un ResultSet a un objeto Albergue
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

    // Método para actualizar un albergue
    public void actualizarAlbergue(Albergue albergue) {
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

    // Método para eliminar un albergue (marcar como eliminado)
    public void eliminarAlbergue(int albergueID) {
        String sql = "UPDATE albergue SET eliminado = 1 WHERE albergueID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, albergueID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}