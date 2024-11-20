package com.example.iwebproyecto.daos;
import com.example.iwebproyecto.beans.*;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class PublicacionMascotaPerdidaDao extends BaseDao {
    public ArrayList<PublicacionMascotaPerdida> listarPublicacionMascotaPerdida() {
        ArrayList<PublicacionMascotaPerdida> listaPublicacionMascotaPerdida = new ArrayList<>();

        String sql = "SELECT * FROM publicacionmascotaperdida"; // Completa el SQL para seleccionar todos los registros
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

        String sql = "SELECT * FROM publicacionmascotaperdida p where p.aprobadoCoordinador is null"; // Completa el SQL para seleccionar todos los registros
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

        String sql = "SELECT * FROM publicacionmascotaperdida p where p.aprobadoCoordinador is null and p.publicacionMascotaPerdidaID="+id+";"; // Completa el SQL para seleccionar todos los registros
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
}

