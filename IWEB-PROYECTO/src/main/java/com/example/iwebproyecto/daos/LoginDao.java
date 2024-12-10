package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Usuario;

import java.sql.*;

public class LoginDao extends BaseDao{

    public void SignInUser (Usuario usuario){

        String sql = "INSERT INTO usuario (nombre, apellido, dni, direccion, correoElectronico, activo, distritoID, fotoID, fechaRegistrado) " +
                "VALUES (?,?,?,?,?,?,?,?,?)";

        try(Connection conn = this.getConnection();


            PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1, usuario.getNombre());
            pstmt.setString(2, usuario.getApellido());
            pstmt.setString(3, usuario.getDni());
            pstmt.setString(4, usuario.getDireccion());
            pstmt.setString(5, usuario.getCorreoElectronico());
            pstmt.setBoolean(6,true);
            pstmt.setInt(7,usuario.getDistrito().getDistritoID());
            pstmt.setInt(8,usuario.getFoto().getFotoID());
            pstmt.setDate(9,java.sql.Date.valueOf(usuario.getFechaRegistrado()));

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void SignInAlbergue (Albergue albergue){
        String sql = "INSERT INTO albergue (nombreAlbergue, nombreEncargado, apellidoEncargado, espaciosDisponibles, " +
                "fechaCreacion, correoElectronico, cantidadAnimales, urlFacebook, urlInstagram, direccion, distritoID, " +
                "puntoAcopioDonaciones, direccionDonaciones, nombreContactoDonaciones, numeroContactoDonaciones, numeroYape, numeroPlin, " +
                "codigoQR, fotoID, fechaRegistrado, descripcion" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try(Connection conn = this.getConnection();


            PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1, albergue.getNombreAlbergue());
            pstmt.setString(2, albergue.getNombreEncargado());
            pstmt.setString(3, albergue.getApellidoEncargado());
            pstmt.setInt(4, albergue.getEspaciosDisponibles());
            pstmt.setString(5, albergue.getFechaCreacion());
            pstmt.setString(6, albergue.getCorreoElectronico());
            pstmt.setInt(7, albergue.getCantidadAnimales());
            pstmt.setString(8, albergue.getUrlFacebook());
            pstmt.setString(9, albergue.getUrlInstagram());
            pstmt.setString(10, albergue.getDireccion());
            pstmt.setInt(11, albergue.getDistrito().getDistritoID());
            pstmt.setString(12, albergue.getPuntoAcopioDonaciones());
            pstmt.setString(13, albergue.getDireccionDonaciones());
            pstmt.setString(14, albergue.getNombreContactoDonaciones());
            pstmt.setString(15,albergue.getNumeroContactoDonaciones());
            pstmt.setString(16, albergue.getNumeroYape());
            pstmt.setString(17, albergue.getNumeroPlin());
            pstmt.setString(18, albergue.getCodigoQR());
            pstmt.setInt(19, albergue.getFoto().getFotoID());
            pstmt.setDate(20, java.sql.Date.valueOf(albergue.getFechaRegistrado()));
            pstmt.setString(21, albergue.getDescripcion());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean Authenticate(String username, String password) {
        String[] tables = {"usuario_credenciales", "coordinador_credenciales", "albergue_credenciales", "admin_credenciales"};
        String sql = "SELECT user, password FROM %s WHERE user = ? AND password = ?";

        try (Connection conn = this.getConnection()) {
            for (String table : tables) {
                // Crear la consulta SQL para la tabla actual
                String query = String.format(sql, table);

                // Inicializar pstmt dentro del bucle
                try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);

                    ResultSet rs = pstmt.executeQuery();

                    // Verificar si se encontró el usuario
                    if (rs.next()) {
                        return true; // Usuario autenticado
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Si no se encuentra el usuario en ninguna tabla
        return false;
    }
}
