package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.Usuario;
import java.sql.*;


public class UsuarioDao extends BaseDao {
/*
    // Metodo para obtener todos los usuarios
    public ArrayList<Usuario> listarUsuarios(){
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM usuario")) {
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt(1));
                usuario.setNombreMascota(rs.getString(2));
                usuario.setApellido(rs.getString(3));

                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaUsuarios;
    }


 */

    //Metodo para insertar un nuevo usuario
    /*public void insertarUsuario(Usuario usuario){

        try (Connection conn = this.getConnection();
             PreparedStatement statement = conn.prepareStatement("INSERT INTO usuario (nombre, apellido, dni, direccion, correoelectronico, contrasenia, estado, distritoID, fotos_fotoID, flag) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
            statement.setString(1, usuario.getNombreMascota());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getDni());
            statement.setString(4, usuario.getDireccion());
            statement.setString(5, usuario.getCorreoElectronico());
            statement.setString(6, usuario.getContrasenia());
            statement.setString(7, usuario.getEstado());
            statement.setInt(8, usuario.getDistritoID());
            statement.setInt(9, usuario.getFotos_FotoID());
            statement.setInt(10, usuario.getFlag());
    } catch (SQLException e) {
            e.printStackTrace();
        }
    }
*/


    //Metodo para obtener un usuario por ID
    public Usuario obtenerUsuarioPorID(int usuarioID) throws SQLException {
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * from usuario WHERE usuarioID = ?")) {

            pstmt.setInt(1, usuarioID);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return mapearUsuario(rs);
            }
        }
        return null;
    }

    // Metodo para mapear un ResultSet a un objeto Usuario
    private Usuario mapearUsuario(ResultSet resultSet) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setUsuarioID(resultSet.getInt("usuarioID"));
        usuario.setNombre(resultSet.getString("nombre"));
        usuario.setApellido(resultSet.getString("apellido"));
        usuario.setDni(resultSet.getString("dni"));
        usuario.setDireccion(resultSet.getString("direccion"));
        usuario.setCorreoElectronico(resultSet.getString("correoelectronico"));
        usuario.setActivo(resultSet.getBoolean("activo"));
        usuario.setEliminado(resultSet.getBoolean("eliminado"));

        FotoDao fotoDao = new FotoDao();
        DistritoDao distritoDao = new DistritoDao();

        Foto foto =fotoDao.obtenerFotoPorId(resultSet.getInt("fotoID"));
        usuario.setFoto(foto);

        Distrito distrito= distritoDao.obtenerDistritoPorId(resultSet.getInt("distritoID"));
        usuario.setDistrito(distrito);



        return usuario;
    }


/*
    // Metodo para actualizar un usuario
    public void actualizarUsuario(Usuario usuario) throws SQLException {
        String sql = "UPDATE usuario SET nombre = ?, apellido = ?, dni = ?, direccion = ?, correoelectronico = ?, contrasenia = ?, " +
                "estado = ?, distritoID = ?, fotos_fotoID = ?, flag = ? WHERE usuarioID = ?";
        try (Connection conn = this.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1, usuario.getNombreMascota());
            pstmt.setString(2, usuario.getApellido());
            pstmt.setString(3, usuario.getDni());
            pstmt.setString(4, usuario.getDireccion());
            pstmt.setString(5, usuario.getCorreoElectronico());
            pstmt.setString(6, usuario.getContrasenia());
            pstmt.setString(7, usuario.getEstado());
            pstmt.setInt(8, usuario.getDistritoID());
            pstmt.setInt(9, usuario.getFotos_FotoID());
            pstmt.setInt(10, usuario.getFlag());
            pstmt.setInt(11, usuario.getUsuarioID());
            pstmt.executeUpdate();
        }
    }

    // Metodo para eliminar un usuario
    public void eliminarUsuario(int usuarioID) throws SQLException {
        String sql = "DELETE FROM usuario WHERE usuarioID = ?";
        try (Connection conn =this.getConnection();PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, usuarioID);
            pstmt.executeUpdate();
        }
        */

    }
