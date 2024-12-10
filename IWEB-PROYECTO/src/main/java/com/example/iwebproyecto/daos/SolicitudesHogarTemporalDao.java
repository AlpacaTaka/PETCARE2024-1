
package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class SolicitudesHogarTemporalDao extends BaseDao{
    public ArrayList<SolicitudTemporal> listarSolicitudesHogarTemporal() {
        ArrayList<SolicitudTemporal> listaSolicitudesHogarTemporal = new ArrayList<>();

        String sql = "SELECT s.*, u.nombre,u.apellido,f.rutaFoto FROM solicitudtemporal s inner join usuario u on u.usuarioID=s.usuarioID inner join fotos f on f.fotoID=s.fotoID where s.aprobadoCoordinador is null;";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                SolicitudTemporal sol = new SolicitudTemporal();

                // Seteamos los datos de la tabla en el bean
                sol.setSolicitudID(rs.getInt("solicitudID"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                sol.setUsuario(usuario);

                sol.setEdad(rs.getInt("edad"));
                sol.setGenero(rs.getString("genero"));
                sol.setCelular(rs.getString("celular"));
                sol.setCantidadCuartos(rs.getInt("cantidadCuartos"));
                sol.setMetrajeVivienda(rs.getInt("metrajeVivienda"));
                sol.setTieneMascotas(rs.getInt("tieneMascotas"));
                sol.setCantidadMascota(rs.getInt("cantidadMascota"));
                sol.setTieneHijos(rs.getInt("tieneHijos"));
                sol.setViveSolo(rs.getInt("viveSolo"));
                sol.setTrabajaRemoto(rs.getInt("trabajaRemoto"));
                sol.setNombrePersonaReferencia(rs.getString("nombrePersonaReferencia"));
                sol.setNumeroContactoPR(rs.getString("numeroContactoPR"));
                sol.setTiempoTemporal(rs.getInt("tiempoTemporal"));

                sol.setInicioTemporal(rs.getString("inicioTemporal"));
                sol.setFinTemporal(rs.getString("finTemporal"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                sol.setFecha(rs.getString("fechaFormulario"));
                sol.setComentario(rs.getString("comentarioCoordinador"));
                sol.setNumeroRechazos(rs.getInt("numeroRechazosConsecutivos"));

                listaSolicitudesHogarTemporal.add(sol);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaSolicitudesHogarTemporal;
    }

    public ArrayList<SolicitudTemporal> listarSolicitudesHogarTemporalFiltro() {
        ArrayList<SolicitudTemporal> listaSolicitudesHogarTemporal = new ArrayList<>();

        String sql = "SELECT s.*, u.nombre,u.apellido,f.rutaFoto FROM solicitudtemporal s inner join usuario u on u.usuarioID=s.usuarioID inner join fotos f on f.fotoID=s.fotoID where s.aprobadoCoordinador is false;";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                SolicitudTemporal sol = new SolicitudTemporal();

                // Seteamos los datos de la tabla en el bean
                sol.setSolicitudID(rs.getInt("solicitudID"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                sol.setUsuario(usuario);

                sol.setEdad(rs.getInt("edad"));
                sol.setGenero(rs.getString("genero"));
                sol.setCelular(rs.getString("celular"));
                sol.setCantidadCuartos(rs.getInt("cantidadCuartos"));
                sol.setMetrajeVivienda(rs.getInt("metrajeVivienda"));
                sol.setTieneMascotas(rs.getInt("tieneMascotas"));
                sol.setCantidadMascota(rs.getInt("cantidadMascota"));
                sol.setTieneHijos(rs.getInt("tieneHijos"));
                sol.setViveSolo(rs.getInt("viveSolo"));
                sol.setTrabajaRemoto(rs.getInt("trabajaRemoto"));
                sol.setNombrePersonaReferencia(rs.getString("nombrePersonaReferencia"));
                sol.setNumeroContactoPR(rs.getString("numeroContactoPR"));
                sol.setTiempoTemporal(rs.getInt("tiempoTemporal"));

                sol.setInicioTemporal(rs.getString("inicioTemporal"));
                sol.setFinTemporal(rs.getString("finTemporal"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                sol.setFecha(rs.getString("fechaFormulario"));
                sol.setComentario(rs.getString("comentarioCoordinador"));
                sol.setNumeroRechazos(rs.getInt("numeroRechazosConsecutivos"));

                listaSolicitudesHogarTemporal.add(sol);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaSolicitudesHogarTemporal;
    }

    public ArrayList<SolicitudTemporal> listarHogarTemporal() {
        ArrayList<SolicitudTemporal> listaSolicitudesHogarTemporal = new ArrayList<>();

        String sql = "SELECT s.*, u.nombre,u.apellido, f.rutaFoto FROM solicitudtemporal s \n" +
                "inner join usuario u on u.usuarioID=s.usuarioID\n" +
                "inner join fotos f on f.fotoID=s.fotoID\n" +
                "where s.aprobadoCoordinador = 1;";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                SolicitudTemporal sol = new SolicitudTemporal();

                // Seteamos los datos de la tabla en el bean
                sol.setSolicitudID(rs.getInt("solicitudID"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                sol.setUsuario(usuario);

                sol.setEdad(rs.getInt("edad"));
                sol.setGenero(rs.getString("genero"));
                sol.setCelular(rs.getString("celular"));
                sol.setCantidadCuartos(rs.getInt("cantidadCuartos"));
                sol.setMetrajeVivienda(rs.getInt("metrajeVivienda"));
                sol.setTieneMascotas(rs.getInt("tieneMascotas"));
                sol.setCantidadMascota(rs.getInt("cantidadMascota"));
                sol.setTieneHijos(rs.getInt("tieneHijos"));
                sol.setViveSolo(rs.getInt("viveSolo"));
                sol.setTrabajaRemoto(rs.getInt("trabajaRemoto"));
                sol.setNombrePersonaReferencia(rs.getString("nombrePersonaReferencia"));
                sol.setNumeroContactoPR(rs.getString("numeroContactoPR"));
                sol.setTiempoTemporal(rs.getInt("tiempoTemporal"));

                sol.setInicioTemporal(rs.getString("inicioTemporal"));
                sol.setFinTemporal(rs.getString("finTemporal"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                sol.setFecha(rs.getString("fechaFormulario"));
                sol.setComentario(rs.getString("comentarioCoordinador"));
                sol.setNumeroRechazos(rs.getInt("numeroRechazosConsecutivos"));

                if(rs.getBoolean("desactivadoAdministrador")){
                    sol.setEstadoTemporal("Inactivo");

                }else{
                    sol.setEstadoTemporal("Activo");
                }

                listaSolicitudesHogarTemporal.add(sol);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaSolicitudesHogarTemporal;
    }



    public ArrayList<SolicitudTemporal> listarHogarTemporalFiltro(String estado) {
        ArrayList<SolicitudTemporal> listaSolicitudesHogarTemporal = new ArrayList<>();

        String sql = "SELECT s.*, u.nombre,u.apellido, f.rutaFoto FROM solicitudtemporal s \n" +
                "inner join usuario u on u.usuarioID=s.usuarioID\n" +
                "inner join fotos f on f.fotoID=s.fotoID\n" +
                "where s.aprobadoCoordinador = 1 and s.desactivadoAdministrador is " + estado + ";";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                SolicitudTemporal sol = new SolicitudTemporal();

                // Seteamos los datos de la tabla en el bean
                sol.setSolicitudID(rs.getInt("solicitudID"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                sol.setUsuario(usuario);

                sol.setEdad(rs.getInt("edad"));
                sol.setGenero(rs.getString("genero"));
                sol.setCelular(rs.getString("celular"));
                sol.setCantidadCuartos(rs.getInt("cantidadCuartos"));
                sol.setMetrajeVivienda(rs.getInt("metrajeVivienda"));
                sol.setTieneMascotas(rs.getInt("tieneMascotas"));
                sol.setCantidadMascota(rs.getInt("cantidadMascota"));
                sol.setTieneHijos(rs.getInt("tieneHijos"));
                sol.setViveSolo(rs.getInt("viveSolo"));
                sol.setTrabajaRemoto(rs.getInt("trabajaRemoto"));
                sol.setNombrePersonaReferencia(rs.getString("nombrePersonaReferencia"));
                sol.setNumeroContactoPR(rs.getString("numeroContactoPR"));
                sol.setTiempoTemporal(rs.getInt("tiempoTemporal"));

                sol.setInicioTemporal(rs.getString("inicioTemporal"));
                sol.setFinTemporal(rs.getString("finTemporal"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                sol.setFecha(rs.getString("fechaFormulario"));
                sol.setComentario(rs.getString("comentarioCoordinador"));
                sol.setNumeroRechazos(rs.getInt("numeroRechazosConsecutivos"));

                if(rs.getBoolean("desactivadoAdministrador")){
                    sol.setEstadoTemporal("Inactivo");

                }else{
                    sol.setEstadoTemporal("Activo");
                }

                listaSolicitudesHogarTemporal.add(sol);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaSolicitudesHogarTemporal;
    }

    public SolicitudTemporal listarHogarTemporalPorID(int id) {
        SolicitudTemporal sol = new SolicitudTemporal();

        String sql = "SELECT s.*, u.nombre, u.dni , u.direccion , u.apellido, d.nombreDistrito, u.correoElectronico, z.nombreZona,f.rutaFoto\n" +
                "FROM solicitudtemporal s\n" +
                "INNER JOIN usuario u ON u.usuarioID = s.usuarioID \n" +
                "inner join distrito d ON d.distritoID = u.distritoID \n" +
                "inner join zona z ON z.zonaID = d.zonaID\n" +
                "inner join fotos f on f.fotoID=u.fotoID\n" +
                "WHERE s.solicitudID= " + id + ";";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) { // Mueve el cursor a la primera fila si existe
                // Seteamos los datos de la tabla en el bean
                sol.setSolicitudID(rs.getInt("solicitudID"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setDni(rs.getString("dni"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setCorreoElectronico(rs.getString("correoElectronico"));

                Distrito distrito = new Distrito();
                distrito.setNombreDistrito(rs.getString("nombreDistrito"));
                Zona zona = new Zona();
                zona.setNombreZona(rs.getString("nombreZona"));
                distrito.setZona(zona);

                usuario.setDistrito(distrito);

                sol.setUsuario(usuario);

                sol.setEdad(rs.getInt("edad"));
                sol.setGenero(rs.getString("genero"));
                sol.setCelular(rs.getString("celular"));
                sol.setCantidadCuartos(rs.getInt("cantidadCuartos"));
                sol.setMetrajeVivienda(rs.getInt("metrajeVivienda"));
                sol.setTieneMascotas(rs.getInt("tieneMascotas"));
                sol.setCantidadMascota(rs.getInt("cantidadMascota"));
                sol.setTieneHijos(rs.getInt("tieneHijos"));
                sol.setViveSolo(rs.getInt("viveSolo"));
                sol.setTrabajaRemoto(rs.getInt("trabajaRemoto"));
                sol.setNombrePersonaReferencia(rs.getString("nombrePersonaReferencia"));
                sol.setNumeroContactoPR(rs.getString("numeroContactoPR"));
                sol.setTiempoTemporal(rs.getInt("tiempoTemporal"));

                sol.setInicioTemporal(rs.getString("inicioTemporal"));
                sol.setFinTemporal(rs.getString("finTemporal"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                sol.setFecha(rs.getString("fechaFormulario"));
                sol.setComentario(rs.getString("comentarioCoordinador"));
                sol.setNumeroRechazos(rs.getInt("numeroRechazosConsecutivos"));

                if (rs.getBoolean("desactivadoAdministrador")) {
                    sol.setEstadoTemporal("Inactivo");
                } else {
                    sol.setEstadoTemporal("Activo");
                }
                System.out.println(sol.getEstadoTemporal());
            } else {
                System.out.println("No se encontraron resultados para el ID: " + id);
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return sol;
    }


    public SolicitudTemporal listarSolicitudesHogarTemporalPorID(int id) {
        SolicitudTemporal sol = new SolicitudTemporal();

        String sql = "SELECT s.*, u.nombre, u.dni , u.direccion , u.apellido, d.nombreDistrito, u.correoElectronico, z.nombreZona\n" +
                "FROM solicitudtemporal s\n" +
                "INNER JOIN usuario u ON u.usuarioID = s.usuarioID inner join distrito d ON d.distritoID = u.distritoID inner join zona z ON z.zonaID = d.zonaID\n" +
                "WHERE s.solicitudID= "+id+";";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) { // Mueve el cursor a la primera fila si existe
                // Seteamos los datos de la tabla en el bean
                sol.setSolicitudID(rs.getInt("solicitudID"));

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(rs.getInt("usuarioID"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setDni(rs.getString("dni"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setCorreoElectronico(rs.getString("correoElectronico"));

                Distrito distrito = new Distrito();
                distrito.setNombreDistrito(rs.getString("nombreDistrito"));
                Zona zona = new Zona();
                zona.setNombreZona(rs.getString("nombreZona"));
                distrito.setZona(zona);

                usuario.setDistrito(distrito);

                sol.setUsuario(usuario);

                sol.setEdad(rs.getInt("edad"));
                sol.setGenero(rs.getString("genero"));
                sol.setCelular(rs.getString("celular"));
                sol.setCantidadCuartos(rs.getInt("cantidadCuartos"));
                sol.setMetrajeVivienda(rs.getInt("metrajeVivienda"));
                sol.setTieneMascotas(rs.getInt("tieneMascotas"));
                sol.setCantidadMascota(rs.getInt("cantidadMascota"));
                sol.setTieneHijos(rs.getInt("tieneHijos"));
                sol.setViveSolo(rs.getInt("viveSolo"));
                sol.setTrabajaRemoto(rs.getInt("trabajaRemoto"));
                sol.setNombrePersonaReferencia(rs.getString("nombrePersonaReferencia"));
                sol.setNumeroContactoPR(rs.getString("numeroContactoPR"));
                sol.setTiempoTemporal(rs.getInt("tiempoTemporal"));

                sol.setInicioTemporal(rs.getString("inicioTemporal"));
                sol.setFinTemporal(rs.getString("finTemporal"));

                Foto foto = new Foto();
                foto.setFotoID(rs.getInt("fotoID"));
                sol.setFoto(foto);

                sol.setFecha(rs.getString("fechaFormulario"));
                sol.setComentario(rs.getString("comentarioCoordinador"));
                sol.setNumeroRechazos(rs.getInt("numeroRechazosConsecutivos"));

                if (rs.getBoolean("desactivadoAdministrador")) {
                    sol.setEstadoTemporal("Inactivo");
                } else {
                    sol.setEstadoTemporal("Activo");
                }
                System.out.println(sol.getEstadoTemporal());
            } else {
                System.out.println("No se encontraron resultados para el ID: " + id);
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return sol;
    }

    public void desactivarHogarTemporalPorID(SolicitudTemporal solicitudTemporal) {
        SolicitudTemporal sol = new SolicitudTemporal();

        String sql = "UPDATE solicitudtemporal\n" +
                "SET desactivadoAdministrador = 1\n" +
                "WHERE solicitudID = ?;";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setInt(1, solicitudTemporal.getSolicitudID() );
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

        public void ARTemporalPorID(int id,int aprobado) {
        SolicitudTemporal sol = new SolicitudTemporal();

        String sql = "UPDATE solicitudtemporal\n" +
                "SET aprobadoCoordinador = "+aprobado+"\n" +
                ", desactivadoAdministrador =0 \n"+
                "WHERE solicitudID = "+id+";";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public void ARComentarioTemporalPorID(int id,String comentario) {
        SolicitudTemporal sol = new SolicitudTemporal();

        String sql = "UPDATE solicitudtemporal\n" +
                "SET comentarioCoordinador = "+" ' " + comentario+" ' " +"\n" +
                "WHERE solicitudID = "+id+";";
        try(Connection conn = this.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

