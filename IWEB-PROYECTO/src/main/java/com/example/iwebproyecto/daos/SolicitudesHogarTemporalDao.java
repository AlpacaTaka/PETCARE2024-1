
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
                "inner join fotos f on f.fotoID=u.fotoID\n" +
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
                "inner join fotos f on f.fotoID=u.fotoID\n" +
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

        String sql = "SELECT s.*, u.nombre, u.dni , u.direccion , u.apellido, d.nombreDistrito, u.correoElectronico, z.nombreZona, f.rutaFoto as 'rutaFoto',f2.rutaFoto as 'rutaFoto2',f3.rutaFoto as 'rutaFoto3' \n" +
                "FROM solicitudtemporal s\n" +
                "INNER JOIN usuario u ON u.usuarioID = s.usuarioID inner join distrito d ON d.distritoID = u.distritoID inner join zona z ON z.zonaID = d.zonaID inner join fotos f on f.fotoID = s.fotoID inner join fotos f2 on f2.fotoID = s.fotoID2 inner join fotos f3 on f3.fotoID = s.fotoID3\n" +
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
                foto.setRutaFoto(rs.getString("rutaFoto"));
                sol.setFoto(foto);

                Foto foto2 = new Foto();
                foto2.setFotoID(rs.getInt("fotoID2"));
                foto2.setRutaFoto(rs.getString("rutaFoto2"));
                sol.setFoto2(foto2);

                Foto foto3 = new Foto();
                foto3.setFotoID(rs.getInt("fotoID3"));
                foto3.setRutaFoto(rs.getString("rutaFoto3"));
                sol.setFoto3(foto3);


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


    public boolean guardarSolicitudTemporal(SolicitudTemporal solicitud) {
        String sql = "INSERT INTO solicitudtemporal (usuarioID, edad, genero, celular, cantidadCuartos, " +
                "metrajeVivienda, tieneHijos, viveSolo, trabajaRemoto, tieneMascotas, cantidadMascota, " +
                "nombrePersonaReferencia, numeroContactoPR, fotoID, fotoID2, fotoID3, tiempoTemporal, inicioTemporal, " +
                "finTemporal, fechaFormulario, estadoTemporal, comentarioCoordinador, numeroRechazosConsecutivos) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Mapear los valores de la solicitud a la consulta SQL
            pstmt.setInt(1, solicitud.getUsuario().getUsuarioID());
            pstmt.setInt(2, solicitud.getEdad());
            pstmt.setString(3, solicitud.getGenero());
            pstmt.setString(4, solicitud.getCelular());
            pstmt.setInt(5, solicitud.getCantidadCuartos());
            pstmt.setInt(6, solicitud.getMetrajeVivienda());
            pstmt.setInt(7, solicitud.getTieneHijos());
            pstmt.setInt(8, solicitud.getViveSolo());
            pstmt.setInt(9, solicitud.getTrabajaRemoto());
            pstmt.setInt(10, solicitud.getTieneMascotas());
            pstmt.setObject(11, solicitud.getCantidadMascota(), java.sql.Types.INTEGER); // Puede ser NULL
            pstmt.setString(12, solicitud.getTipoMascota());
            pstmt.setString(13, solicitud.getNombrePersonaReferencia());
            pstmt.setString(14, solicitud.getNumeroContactoPR());
            pstmt.setInt(15, solicitud.getFoto().getFotoID());
            pstmt.setInt(16, solicitud.getFoto2().getFotoID());
            pstmt.setInt(17, solicitud.getFoto3().getFotoID());
            pstmt.setInt(18, solicitud.getTiempoTemporal());
            pstmt.setDate(19, java.sql.Date.valueOf(solicitud.getInicioTemporal()));
            pstmt.setDate(20, java.sql.Date.valueOf(solicitud.getFinTemporal()));
            pstmt.setString(21, solicitud.getEstado());
            pstmt.setDate(22, java.sql.Date.valueOf(solicitud.getFecha()));
            pstmt.setString(23, solicitud.getEstadoTemporal());
            pstmt.setString(24, solicitud.getComentario());
            pstmt.setInt(25, solicitud.getNumeroRechazos());

            // Ejecutar la consulta
            int filasAfectadas = pstmt.executeUpdate();

            return filasAfectadas > 0; // Devuelve true si se insertó con éxito

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}

