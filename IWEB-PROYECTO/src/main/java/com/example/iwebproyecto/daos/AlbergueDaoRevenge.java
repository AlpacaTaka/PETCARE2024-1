package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

public class AlbergueDaoRevenge extends BaseDao {
    /*
    // Mtodo para obtener todos los albergues
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

    // Mtodo para insertar un nuevo albergue
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

    // M
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

    public MascotasAdopcion obtenerMascotasAdopcionPorID(int id) {
        MascotasAdopcion mascotasAdopcion = new MascotasAdopcion();
        String sql = "select * from mascotasadopcion where idAdopcion = ?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
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
                /*mascotasAdopcion.setFechaAdoptado(rs.getString(14));*/
                mascotasAdopcion.setEliminado(rs.getBoolean(14));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mascotasAdopcion;
    }

    public ArrayList<MascotasAdopcion> listarMascotasAdopcion() {
        String sql = "select * from mascotasadopcion where albergueID=? and eliminado=0 order by idAdopcion desc;";
        ArrayList<MascotasAdopcion> listaMascotasAdopcion = new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            int albergueID = 6;
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
                /*mascotasAdopcion.setFechaAdoptado(rs.getString(14));*/
                mascotasAdopcion.setEliminado(rs.getBoolean(14));
                listaMascotasAdopcion.add(mascotasAdopcion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaMascotasAdopcion;
    }

    public void crearMascotaAdopcion(MascotasAdopcion mascotasAdopcion) {
        String sql = "INSERT INTO mascotasadopcion (nombreMascota, especieMascota, raza, distritoID, direccionHallazgo, edadAprox, sexo, descripcionGeneral, fotoID, seEncuentraTemporal, condicionesAdopcion, albergueID, eliminado) VALUE (?,?,?,?,?,?,?,?,?,?,?,?,?);";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, mascotasAdopcion.getNombreMascota());
            pstmt.setString(2,mascotasAdopcion.getEspecie());
            pstmt.setString(3,mascotasAdopcion.getRaza());
            pstmt.setInt(4,mascotasAdopcion.getDistrito().getDistritoID());
            pstmt.setString(5,mascotasAdopcion.getDireccionHallazgo());
            pstmt.setInt(6,mascotasAdopcion.getEdadAprox());
            pstmt.setString(7,mascotasAdopcion.getSexo());
            pstmt.setString(8,mascotasAdopcion.getDescripcionGeneral());
            pstmt.setInt(9,mascotasAdopcion.getFoto().getFotoID());
            pstmt.setBoolean(10,mascotasAdopcion.isSeEncuentraTemporal());
            pstmt.setString(11,mascotasAdopcion.getCondicionesAdopcion());
            pstmt.setInt(12,mascotasAdopcion.getAlbergue().getAlbergueID());
            pstmt.setBoolean(13,mascotasAdopcion.isEliminado());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void borrarMascotaAdopcion(int idMascota) {
        String sql="UPDATE mascotasadopcion set eliminado=1 where idAdopcion=?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idMascota);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editarMascotaAdopcion(MascotasAdopcion mascotasAdopcion){
        String sql="UPDATE mascotasadopcion set nombreMascota=?,especieMascota=?,raza=?,distritoID=?,direccionHallazgo=?"+
                ",edadAprox=?,sexo=?,descripcionGeneral=?,fotoID=?,seEncuentraTemporal=?,condicionesAdopcion=?,albergueID=? where idAdopcion=?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, mascotasAdopcion.getNombreMascota());
            pstmt.setString(2,mascotasAdopcion.getEspecie());
            pstmt.setString(3,mascotasAdopcion.getRaza());
            pstmt.setInt(4,mascotasAdopcion.getDistrito().getDistritoID());
            pstmt.setString(5,mascotasAdopcion.getDireccionHallazgo());
            pstmt.setInt(6,mascotasAdopcion.getEdadAprox());
            pstmt.setString(7,mascotasAdopcion.getSexo());
            pstmt.setString(8,mascotasAdopcion.getDescripcionGeneral());
            pstmt.setInt(9,mascotasAdopcion.getFoto().getFotoID());
            pstmt.setBoolean(10,mascotasAdopcion.isSeEncuentraTemporal());
            pstmt.setString(11,mascotasAdopcion.getCondicionesAdopcion());
            pstmt.setInt(12,mascotasAdopcion.getAlbergue().getAlbergueID());
            pstmt.setInt(13,mascotasAdopcion.getIdAdopcion());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public DonacionSuministros obtenerDonacionSuministrosPorID(int id) {
        DonacionSuministros donacionSuministros = new DonacionSuministros();
        String sql = "select * from donacionsuministros where donacionSuministrosID = ?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                donacionSuministros.setDonacionSuministrosID(rs.getInt(1));
                donacionSuministros.setTituloAvisoDonacion(rs.getString(2));
                donacionSuministros.setCorreoElectronicoDonacion(rs.getString(3));
                donacionSuministros.setTipoSuministro(rs.getString(4));
                donacionSuministros.setNombreSuministro(rs.getString(5));
                donacionSuministros.setCantidadDonacionesTotales(rs.getInt(6));
                donacionSuministros.setMarcaSuministro(rs.getString(7));
                AlbergueDaoRevenge albergueDaoRevenge =new AlbergueDaoRevenge();
                Distrito distrito = albergueDaoRevenge.obtenerDistritoPorID(rs.getInt(8));
                donacionSuministros.setDistrito(distrito);
                AlbergueDao albergueDao = new AlbergueDao();
                Albergue albergue = albergueDao.obtenerAlberguePorID(rs.getInt(9));
                donacionSuministros.setAlbergue(albergue);
                donacionSuministros.setFechaInicioRecepcion(rs.getString(10));
                donacionSuministros.setFechaFinRecepcion(rs.getString(11));
                donacionSuministros.setHoraInicioRecepcion(rs.getString(12));
                donacionSuministros.setHoraFinRecepcion(rs.getString(13));
                donacionSuministros.setMensajeParaDonantes(rs.getString(14));
                Foto foto = new Foto();
                foto.setFotoID(rs.getInt(15));
                donacionSuministros.setFoto(foto);
                donacionSuministros.setEliminado(rs.getBoolean(16));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return donacionSuministros;
    }

    public ArrayList<DonacionSuministros> listarDonacionSuministros() {
        String sql = "select d.*,i.nombreDistrito,a.direccionDonaciones from donacionsuministros d, distrito i,albergue a where i.distritoID=d.distritoID and a.albergueID=d.albergueID and a.albergueID=? and d.eliminado=0 order by d.donacionSuministrosID desc;";
        ArrayList<DonacionSuministros> listaDonacionSuministros = new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            int albergueID = 6;
            pstmt.setInt(1, albergueID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                DonacionSuministros donacionSuministros = new DonacionSuministros();
                donacionSuministros.setDonacionSuministrosID(rs.getInt(1));
                donacionSuministros.setTituloAvisoDonacion(rs.getString(2));
                donacionSuministros.setCorreoElectronicoDonacion(rs.getString(3));
                donacionSuministros.setTipoSuministro(rs.getString(4));
                donacionSuministros.setNombreSuministro(rs.getString(5));
                donacionSuministros.setCantidadDonacionesTotales(rs.getInt(6));
                donacionSuministros.setMarcaSuministro(rs.getString(7));
                Distrito distrito = new Distrito();
                distrito.setDistritoID(rs.getInt(8));
                distrito.setNombreDistrito(rs.getString(18));
                donacionSuministros.setDistrito(distrito);
                Albergue albergue = new Albergue();
                albergue.setAlbergueID(rs.getInt(9));
                albergue.setDireccionDonaciones(rs.getString(19));
                donacionSuministros.setAlbergue(albergue);
                donacionSuministros.setFechaInicioRecepcion(rs.getString(10));
                donacionSuministros.setFechaFinRecepcion(rs.getString(11));
                donacionSuministros.setHoraInicioRecepcion(rs.getString(12));
                donacionSuministros.setHoraFinRecepcion(rs.getString(13));
                donacionSuministros.setMensajeParaDonantes(rs.getString(14));
                Foto foto = new Foto();
                foto.setFotoID(rs.getInt(15));
                donacionSuministros.setFoto(foto);
                donacionSuministros.setEliminado(rs.getBoolean(16));
                listaDonacionSuministros.add(donacionSuministros);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaDonacionSuministros;
    }

    public void crearDonacionSuministros(DonacionSuministros donacionSuministros) {
        String sql = "INSERT INTO donacionsuministros (tituloAvisoDonacion, correoElectronicoDonacion, tipoSuministro, nombreSuministro, cantidadDonacionesTotales, marcaSuministro, distritoID, albergueID, fechaInicioRecepcion, fechaFinRecepcion, horaInicioRecepcion, horaFinRecepcion, mensajeParaDonantes, fotoID, eliminado, eventoAlbergueID)  VALUE (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,null);";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, donacionSuministros.getTituloAvisoDonacion());
            pstmt.setString(2, donacionSuministros.getCorreoElectronicoDonacion());
            pstmt.setString(3, donacionSuministros.getTipoSuministro());
            pstmt.setString(4, donacionSuministros.getNombreSuministro());
            pstmt.setInt(5, donacionSuministros.getCantidadDonacionesTotales());
            pstmt.setString(6, donacionSuministros.getMarcaSuministro());
            pstmt.setInt(7, donacionSuministros.getDistrito().getDistritoID());
            pstmt.setInt(8, donacionSuministros.getAlbergue().getAlbergueID());
            pstmt.setString(9, donacionSuministros.getFechaInicioRecepcion());
            pstmt.setString(10, donacionSuministros.getFechaFinRecepcion());
            pstmt.setString(11, donacionSuministros.getHoraInicioRecepcion());
            pstmt.setString(12, donacionSuministros.getHoraFinRecepcion());
            pstmt.setString(13, donacionSuministros.getMensajeParaDonantes());
            pstmt.setInt(14, donacionSuministros.getFoto().getFotoID());
            pstmt.setBoolean(15, donacionSuministros.isEliminado());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void borrarDonacionSuministros(int idDonacion) {
        String sql="UPDATE donacionsuministros set eliminado=1 where donacionSuministrosID=?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idDonacion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editarDonacionSuministros(DonacionSuministros donacionSuministros){
        String sql="UPDATE donacionsuministros set tituloAvisoDonacion=?, correoElectronicoDonacion=?, tipoSuministro=?, nombreSuministro=?,"+
                " cantidadDonacionesTotales=?, marcaSuministro=?, distritoID=?, albergueID=?, fechaInicioRecepcion=?,"+
                " fechaFinRecepcion=?, horaInicioRecepcion=?, horaFinRecepcion=?, mensajeParaDonantes=?, fotoID=?, eliminado=?,"+
                " eventoAlbergueID=null where donacionSuministrosID=?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, donacionSuministros.getTituloAvisoDonacion());
            pstmt.setString(2, donacionSuministros.getCorreoElectronicoDonacion());
            pstmt.setString(3, donacionSuministros.getTipoSuministro());
            pstmt.setString(4, donacionSuministros.getNombreSuministro());
            pstmt.setInt(5, donacionSuministros.getCantidadDonacionesTotales());
            pstmt.setString(6, donacionSuministros.getMarcaSuministro());
            pstmt.setInt(7, donacionSuministros.getDistrito().getDistritoID());
            pstmt.setInt(8, donacionSuministros.getAlbergue().getAlbergueID());
            pstmt.setString(9, donacionSuministros.getFechaInicioRecepcion());
            pstmt.setString(10, donacionSuministros.getFechaFinRecepcion());
            pstmt.setString(11, donacionSuministros.getHoraInicioRecepcion());
            pstmt.setString(12, donacionSuministros.getHoraFinRecepcion());
            pstmt.setString(13, donacionSuministros.getMensajeParaDonantes());
            pstmt.setInt(14, donacionSuministros.getFoto().getFotoID());
            pstmt.setBoolean(15, donacionSuministros.isEliminado());
            pstmt.setInt(16, donacionSuministros.getDonacionSuministrosID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Distrito obtenerDistritoPorID(int id) {
        String sql = "select * from distrito where distritoID=?;";
        Distrito distrito = new Distrito();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {

                Zona zona = new Zona();
                distrito.setDistritoID(id);
                distrito.setNombreDistrito(rs.getString(2));
                zona.setZonaID(rs.getInt(3));
                distrito.setZona(zona);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return distrito;
    }

    public ArrayList<SolicitudTemporal> listaDeHogaresTemporales() {
        String sql = "select * from solicitudtemporal where aprobadoCoordinador=1 and desactivadoAdministrador=0;";
        ArrayList<SolicitudTemporal> listaHogaresTemporales = new ArrayList<>();
        UsuarioDao usuarioDao = new UsuarioDao();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                SolicitudTemporal solicitudTemporal = new SolicitudTemporal();
                solicitudTemporal.setSolicitudID(rs.getInt(1));
                Usuario usuario = usuarioDao.obtenerUsuarioPorID(rs.getInt(2));
                Distrito distrito=obtenerDistritoPorID(usuario.getDistrito().getDistritoID());
                usuario.setDistrito(distrito);
                solicitudTemporal.setUsuario(usuario);
                solicitudTemporal.setCelular(rs.getString(5));
                solicitudTemporal.setTiempoTemporal(rs.getInt(16));
                String ini = rs.getString(17);
                String fin = rs.getString(18);
                LocalDate localDate = LocalDate.now();
                boolean flag = localDate.isAfter(LocalDate.parse(ini)) && localDate.isBefore(LocalDate.parse(fin));
                if(flag){
                    solicitudTemporal.setInicioTemporal(ini);
                    solicitudTemporal.setFinTemporal(fin);
                    listaHogaresTemporales.add(solicitudTemporal);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaHogaresTemporales;
    }

    public ArrayList<UsuarioAdopcion> listaUsuarioAdopcion(int albergueID) {
        String sql = "select u.*,a.albergueID from usuarioadopcion u, mascotasadopcion m, albergue a where m.idAdopcion=u.idAdopcion and a.albergueID=m.albergueID and m.albergueID=?;";
        ArrayList<UsuarioAdopcion> listaUsuarioAdopcion = new ArrayList<>();
        UsuarioDao usuarioDao = new UsuarioDao();
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, albergueID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                UsuarioAdopcion usuarioAdopcion = new UsuarioAdopcion();
                usuarioAdopcion.setUsuarioAdopcionID(rs.getInt(1));
                Usuario usuario = usuarioDao.obtenerUsuarioPorID(rs.getInt(2));
                usuarioAdopcion.setUsuario(usuario);
                MascotasAdopcion mascotasAdopcion = albergueDaoRevenge.obtenerMascotasAdopcionPorID(rs.getInt(3));
                usuarioAdopcion.setMascotasAdopcion(mascotasAdopcion);
                usuarioAdopcion.setAprobado(rs.getBoolean(4));
                usuarioAdopcion.setFechaAdoptado(rs.getString(5));
                listaUsuarioAdopcion.add(usuarioAdopcion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaUsuarioAdopcion;
    }
}