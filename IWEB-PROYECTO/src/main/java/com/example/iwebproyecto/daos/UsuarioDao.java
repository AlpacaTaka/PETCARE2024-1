package daos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import beans.Usuario;


public class UsuarioDao {
    private Connection connection;

    public UsuarioDao(Connection connection) {
        this.connection = connection;
    }

    //Metodo para insertar un nuevo usuario
    public void insertarUsuario(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO usuario (nombre, apellido, dni, direccion, correoelectronico, contrasenia, estado, distritoID, fotos_fotoID, flag) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getDni());
            statement.setString(4, usuario.getDireccion());
            statement.setString(5, usuario.getCorreoElectronico());
            statement.setString(6, usuario.getContrasenia());
            statement.setString(7, usuario.getEstado());
            statement.setInt(8, usuario.getDistritoID());
            statement.setInt(9, usuario.getFotosFotoID());
            statement.setInt(10, usuario.getFlag());

            statement.executeUpdate();
        }
    }

    //Metodo para obtener un usuario por ID
    public Usuario obtenerUsuarioPorID(int usuarioID) throws SQLException {
        String sql = "SELECT * FROM usuario WHERE usuarioID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, usuarioID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return mapearUsuario(resultSet);
            }
        }
        return null;
    }

    // Metodo para actualizar un usuario
    public void actualizarUsuario(Usuario usuario) throws SQLException {
        String sql = "UPDATE usuario SET nombre = ?, apellido = ?, dni = ?, direccion = ?, correoelectronico = ?, contrasenia = ?, " +
                "estado = ?, distritoID = ?, fotos_fotoID = ?, flag = ? WHERE usuarioID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getDni());
            statement.setString(4, usuario.getDireccion());
            statement.setString(5, usuario.getCorreoElectronico());
            statement.setString(6, usuario.getContrasenia());
            statement.setString(7, usuario.getEstado());
            statement.setInt(8, usuario.getDistritoID());
            statement.setInt(9, usuario.getFotosFotoID());
            statement.setInt(10, usuario.getFlag());
            statement.setInt(11, usuario.getUsuarioID());

            statement.executeUpdate();
        }
    }

    // Metodo para eliminar un usuario
    public void eliminarUsuario(int usuarioID) throws SQLException {
        String sql = "DELETE FROM usuario WHERE usuarioID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, usuarioID);
            statement.executeUpdate();
        }
    }

    // Metodo para obtener todos los usuarios
    public List<Usuario> obtenerTodosLosUsuarios() throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                usuarios.add(mapearUsuario(resultSet));
            }
        }
        return usuarios;
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
        usuario.setContrasenia(resultSet.getString("contrasenia"));
        usuario.setEstado(resultSet.getString("estado"));
        usuario.setDistritoID(resultSet.getInt("distritoID"));
        usuario.setFotosFotoID(resultSet.getInt("fotos_fotoID"));
        usuario.setFlag(resultSet.getInt("flag"));
        return usuario;
    }
}
