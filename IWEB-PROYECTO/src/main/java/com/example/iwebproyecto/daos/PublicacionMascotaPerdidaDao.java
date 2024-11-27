package com.example.iwebproyecto.daos;
import com.example.iwebproyecto.beans.*;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class PublicacionMascotaPerdidaDao extends BaseDao {
    public ArrayList<PublicacionMascotaPerdida> listarPublicacionMascotaPerdida() {
        ArrayList<PublicacionMascotaPerdida> listaPublicacionMascotaPerdida = new ArrayList<>();

        String sql = "SELECT p.*,f.rutaFoto FROM publicacionmascotaperdida p inner join fotos f on f.fotoID=p.fotoID where p.aprobadoCoordinador is true;"; // Completa el SQL para seleccionar todos los registros
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                PublicacionMascotaPerdida sol = new PublicacionMascotaPerdida();

                // Completar asignaciones de las columnas a los atributos del objeto
                sol.setPublicacionMascotaPerdidaID(rs.getInt("publicacionMascotaPerdidaID"));
                sol.setDescripcion(rs.getString("descripcion"));
                sol.setNombreMascota(rs.getString("nombreMascota"));
                sol.setDistintivo(rs.getString("distintivo"));
                sol.setEdadMascota(rs.getInt("edadMascota"));
                sol.setTamanio(rs.getString("tamanio"));
                sol.setEspecie(rs.getString("especie"));
                sol.setRaza(rs.getString("raza"));
                sol.setDescripcionAdicional(rs.getString("descripcionAdicional"));
                sol.setLugarPerdida(rs.getString("lugarPerdida"));
                sol.setFechaPerdida(rs.getDate("fechaPerdida").toLocalDate());
                sol.setHoraPerdida(rs.getTime("horaPerdida").toLocalTime());
                sol.setNombreContacto(rs.getString("nombreContacto"));
                sol.setTelefonoContacto(rs.getString("telefonoContacto"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                sol.setAniadirRecompensa(rs.getBoolean("aniadirRecompensa"));
                sol.setMontoRecompensa(rs.getInt("montoRecompensa"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));

                sol.setUsuario(usuario);

                sol.setAprobadoCoordinador(rs.getBoolean("aprobadoCoordinador"));
                sol.setMascotaEncontrada(rs.getBoolean("mascotaEncontrada"));
                sol.setFechaFormulario(LocalDate.parse(rs.getString("fechaFormulario")));

                listaPublicacionMascotaPerdida.add(sol);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaPublicacionMascotaPerdida;
    }

    public ArrayList<PublicacionMascotaPerdida> listarSolicitudnMascotaPerdida() {
        ArrayList<PublicacionMascotaPerdida> listaPublicacionMascotaPerdida = new ArrayList<>();

        String sql = "SELECT p.*,f.rutaFoto FROM publicacionmascotaperdida p inner join fotos f on f.fotoID=p.fotoID  where p.aprobadoCoordinador is null"; // Completa el SQL para seleccionar todos los registros
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                PublicacionMascotaPerdida sol = new PublicacionMascotaPerdida();

                // Completar asignaciones de las columnas a los atributos del objeto
                sol.setPublicacionMascotaPerdidaID(rs.getInt("publicacionMascotaPerdidaID"));
                sol.setDescripcion(rs.getString("descripcion"));
                sol.setNombreMascota(rs.getString("nombreMascota"));
                sol.setDistintivo(rs.getString("distintivo"));
                sol.setEdadMascota(rs.getInt("edadMascota"));
                sol.setTamanio(rs.getString("tamanio"));
                sol.setEspecie(rs.getString("especie"));
                sol.setRaza(rs.getString("raza"));
                sol.setDescripcionAdicional(rs.getString("descripcionAdicional"));
                sol.setLugarPerdida(rs.getString("lugarPerdida"));
                sol.setFechaPerdida(rs.getDate("fechaPerdida").toLocalDate());
                sol.setHoraPerdida(rs.getTime("horaPerdida").toLocalTime());
                sol.setNombreContacto(rs.getString("nombreContacto"));
                sol.setTelefonoContacto(rs.getString("telefonoContacto"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                sol.setAniadirRecompensa(rs.getBoolean("aniadirRecompensa"));
                sol.setMontoRecompensa(rs.getInt("montoRecompensa"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));

                sol.setUsuario(usuario);

                sol.setAprobadoCoordinador(rs.getBoolean("aprobadoCoordinador"));
                sol.setMascotaEncontrada(rs.getBoolean("mascotaEncontrada"));
                sol.setFechaFormulario(LocalDate.parse(rs.getString("fechaFormulario")));

                listaPublicacionMascotaPerdida.add(sol);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaPublicacionMascotaPerdida;
    }

    public PublicacionMascotaPerdida listarSolicitudnMascotaPerdidaPorID(int id) {
        PublicacionMascotaPerdida sol = new PublicacionMascotaPerdida();

        String sql = "SELECT p.*, f.rutaFoto FROM publicacionmascotaperdida p inner join fotos f on f.fotoID=p.fotoID where p.aprobadoCoordinador is null and p.publicacionMascotaPerdidaID="+id+";"; // Completa el SQL para seleccionar todos los registros
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {


                // Completar asignaciones de las columnas a los atributos del objeto
                sol.setPublicacionMascotaPerdidaID(rs.getInt("publicacionMascotaPerdidaID"));
                sol.setDescripcion(rs.getString("descripcion"));
                sol.setNombreMascota(rs.getString("nombreMascota"));
                sol.setDistintivo(rs.getString("distintivo"));
                sol.setEdadMascota(rs.getInt("edadMascota"));
                sol.setTamanio(rs.getString("tamanio"));
                sol.setEspecie(rs.getString("especie"));
                sol.setRaza(rs.getString("raza"));
                sol.setDescripcionAdicional(rs.getString("descripcionAdicional"));
                sol.setLugarPerdida(rs.getString("lugarPerdida"));
                sol.setFechaPerdida(rs.getDate("fechaPerdida").toLocalDate());
                sol.setHoraPerdida(rs.getTime("horaPerdida").toLocalTime());
                sol.setNombreContacto(rs.getString("nombreContacto"));
                sol.setTelefonoContacto(rs.getString("telefonoContacto"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                sol.setAniadirRecompensa(rs.getBoolean("aniadirRecompensa"));
                sol.setMontoRecompensa(rs.getInt("montoRecompensa"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));

                sol.setUsuario(usuario);


                sol.setAprobadoCoordinador(rs.getBoolean("aprobadoCoordinador"));
                sol.setMascotaEncontrada(rs.getBoolean("mascotaEncontrada"));
                sol.setFechaFormulario(LocalDate.parse(rs.getString("fechaFormulario")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sol;
    }
    public PublicacionMascotaPerdida listarPublicacionMascotaPerdidaPorID(int id) {
        PublicacionMascotaPerdida sol = new PublicacionMascotaPerdida();

        String sql = "SELECT p.*, u.correoElectronico, f.rutaFoto   FROM publicacionmascotaperdida p inner join usuario u on u.usuarioID=p.usuarioID inner join fotos f on f.fotoID=p.fotoID where p.publicacionMascotaPerdidaID="+id+";";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {


                // Completar asignaciones de las columnas a los atributos del objeto
                sol.setPublicacionMascotaPerdidaID(rs.getInt("publicacionMascotaPerdidaID"));
                sol.setDescripcion(rs.getString("descripcion"));
                sol.setNombreMascota(rs.getString("nombreMascota"));
                sol.setDistintivo(rs.getString("distintivo"));
                sol.setEdadMascota(rs.getInt("edadMascota"));
                sol.setTamanio(rs.getString("tamanio"));
                sol.setEspecie(rs.getString("especie"));
                sol.setRaza(rs.getString("raza"));
                sol.setDescripcionAdicional(rs.getString("descripcionAdicional"));
                sol.setLugarPerdida(rs.getString("lugarPerdida"));
                sol.setFechaPerdida(rs.getDate("fechaPerdida").toLocalDate());
                sol.setHoraPerdida(rs.getTime("horaPerdida").toLocalTime());
                sol.setNombreContacto(rs.getString("nombreContacto"));
                sol.setTelefonoContacto(rs.getString("telefonoContacto"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                sol.setAniadirRecompensa(rs.getBoolean("aniadirRecompensa"));
                sol.setMontoRecompensa(rs.getInt("montoRecompensa"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));
                usuario.setCorreoElectronico(rs.getString("correoElectronico"));
                sol.setUsuario(usuario);


                sol.setAprobadoCoordinador(rs.getBoolean("aprobadoCoordinador"));
                sol.setMascotaEncontrada(rs.getBoolean("mascotaEncontrada"));
                sol.setFechaFormulario(LocalDate.parse(rs.getString("fechaFormulario")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sol;
    }
    public void ARSolicitudnMascotaPerdidaPorID(int id, int aprobado) {
        PublicacionMascotaPerdida sol = new PublicacionMascotaPerdida();

        String sql = "UPDATE publicacionmascotaperdida\n" +
                "SET aprobadoCoordinador = "+aprobado+"\n" +
                "WHERE publicacionMascotaPerdidaID = "+id+";";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Comentarios> listarComentarios(int id) {
        ArrayList<Comentarios> listCom = new ArrayList<Comentarios>();

        String sql = "SELECT c.*, coo.nombre,coo.apellido FROM comentarios c inner join coordinadorzona coo on coo.coordinadorID=c.coordinadorID where c.publicacionMascotaPerdidaID="+id+";";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Comentarios com = new Comentarios();

                // Completar asignaciones de las columnas a los atributos del objeto
                com.setFecha(rs.getString("fechaComentario"));
                com.setComentarios(rs.getString("comentarios"));
                com.setIdComentarios(rs.getInt("idComentarios"));
                CoordinadorZona coord = new CoordinadorZona();
                coord.setNombre(rs.getString("nombre"));
                coord.setApellido(rs.getString("apellido"));
                com.setCoordinadorZona(coord);

                listCom.add(com);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listCom;
    }

    public void guardarComentario(Comentarios comentario, int id) {
        LocalDate hoy = LocalDate.now();


        String fechaHoy = hoy.toString();
        System.out.println(fechaHoy);

        String sql = "INSERT INTO comentarios (comentarios, coordinadorID, publicacionMascotaPerdidaID, fechaComentario)\n" +
                "VALUES (?, 7, "+id+" ,'" + fechaHoy + "' );";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, comentario.getComentarios() );
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

