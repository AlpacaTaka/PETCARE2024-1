package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.Zona;

import java.sql.*;
import java.util.ArrayList;

public class AlbergueDao extends BaseDao {

    // Método para obtener todos los albergues
    public ArrayList<Albergue> listarAlberguesActivosAprobados() {
        ArrayList<Albergue> listaAlbergues = new ArrayList<>();
        String sql = "select * from albergue where aprobado=1 and eliminado=0";

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
        String sql = "INSERT INTO albergue (nombreAlbergue, nombreEncargado, apellidoEncargado, espaciosDisponibles, anioCreacion, " +
                "correoElectronico, contrasenia, cantidadAnimales, urlFacebook, urlInstagram, direccion, distritoID, " +
                "puntoAcopioDonaciones, nombreContactoDonaciones, numeroContactoDonaciones, numeroYape, numeroPlin, " +
                "codigoQR, estado, fotos_fotoID, mensaje) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setString(1, albergue.getNombreAlbergue());
            statement.setString(2, albergue.getNombreEncargado());
            statement.setString(3, albergue.getApellidoEncargado());
            statement.setInt(4, albergue.getEspaciosDisponibles());
            //statement.setString(5, albergue.getAnioCreacion());
            statement.setString(6, albergue.getCorreoElectronico());
            statement.setString(7, albergue.getContrasenia());
            statement.setInt(8, albergue.getCantidadAnimales());
            statement.setString(9, albergue.getUrlFacebook());
            statement.setString(10, albergue.getUrlInstagram());
            statement.setString(11, albergue.getDireccion());
            //statement.setInt(12, albergue.getDistritoID());
            statement.setString(13, albergue.getPuntoAcopioDonaciones());
            statement.setString(14, albergue.getNombreContactoDonaciones());
            statement.setString(15, albergue.getNumeroContactoDonaciones());
            statement.setString(16, albergue.getNumeroYape());
            statement.setString(17, albergue.getNumeroPlin());
            statement.setString(18, albergue.getCodigoQR());
            //statement.setString(19, albergue.getEstado());
            //statement.setInt(20, albergue.getFotos_FotoID());
            statement.setString(21, albergue.getMensaje());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método para obtener un albergue por ID
    public Albergue obtenerAlberguePorID(int albergueID) {
        String sql = "select * from albergue where albergueId=?;";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, albergueID);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return mapearAlbergue(rs);
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
        albergue.setFechaCreacion(rs.getString("fechaCreacion"));
        albergue.setCorreoElectronico(rs.getString("correoElectronico"));
        albergue.setContrasenia(rs.getString("contrasenia"));
        albergue.setCantidadAnimales(rs.getInt("cantidadAnimales"));
        albergue.setUrlFacebook(rs.getString("urlFacebook"));
        albergue.setUrlInstagram(rs.getString("urlInstagram"));
        albergue.setDireccion(rs.getString("direccion"));

        DistritoDao distritoDao = new DistritoDao();
        Distrito distrito= distritoDao.obtenerDistritoPorId(rs.getInt("distritoID"));
        albergue.setDistrito(distrito);


        albergue.setPuntoAcopioDonaciones(rs.getString("puntoAcopioDonaciones"));
        albergue.setNombreContactoDonaciones(rs.getString("nombreContactoDonaciones"));
        albergue.setNumeroContactoDonaciones(rs.getString("numeroContactoDonaciones"));
        albergue.setNumeroYape(rs.getString("numeroYape"));
        albergue.setNumeroPlin(rs.getString("numeroPlin"));
        albergue.setCodigoQR(rs.getString("codigoQR"));
        albergue.setAprobado(rs.getBoolean("aprobado"));

        FotoDao fotoDao = new FotoDao();
        Foto foto =fotoDao.obtenerFotoPorId(rs.getInt("fotoID"));
        albergue.setFoto(foto);

        albergue.setEliminado(rs.getBoolean("eliminado"));
        albergue.setFechaRegistrado(rs.getString("fechaRegistrado"));
        albergue.setDescripcion(rs.getString("descripcion"));
        return albergue;
    }

    // Método para actualizar un albergue
    public void actualizarAlbergue(Albergue albergue) {
        String sql = "UPDATE albergue SET nombreAlbergue = ?, nombreEncargado = ?, apellidoEncargado = ?, espaciosDisponibles = ?, anioCreacion = ?, " +
                "correoElectronico = ?, contrasenia = ?, cantidadAnimales = ?, urlFacebook = ?, urlInstagram = ?, direccion = ?, distritoID = ?, " +
                "puntoAcopioDonaciones = ?, nombreContactoDonaciones = ?, numeroContactoDonaciones = ?, numeroYape = ?, numeroPlin = ?, " +
                "codigoQR = ?, estado = ?, fotos_fotoID = ?, mensaje = ? WHERE albergueID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, albergue.getNombreAlbergue());
            pstmt.setString(2, albergue.getNombreEncargado());
            pstmt.setString(3, albergue.getApellidoEncargado());
            pstmt.setInt(4, albergue.getEspaciosDisponibles());
            //pstmt.setString(5, albergue.getAnioCreacion());
            pstmt.setString(6, albergue.getCorreoElectronico());
            pstmt.setString(7, albergue.getContrasenia());
            pstmt.setInt(8, albergue.getCantidadAnimales());
            pstmt.setString(9, albergue.getUrlFacebook());
            pstmt.setString(10, albergue.getUrlInstagram());
            pstmt.setString(11, albergue.getDireccion());
            //pstmt.setInt(12, albergue.getDistritoID());
            pstmt.setString(13, albergue.getPuntoAcopioDonaciones());
            pstmt.setString(14, albergue.getNombreContactoDonaciones());
            pstmt.setString(15, albergue.getNumeroContactoDonaciones());
            pstmt.setString(16, albergue.getNumeroYape());
            pstmt.setString(17, albergue.getNumeroPlin());
            pstmt.setString(18, albergue.getCodigoQR());
            //pstmt.setString(19, albergue.getEstado());
            //pstmt.setInt(20, albergue.getFotos_FotoID());
            pstmt.setString(21, albergue.getMensaje());
            pstmt.setInt(22, albergue.getAlbergueID());

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
    }
}
