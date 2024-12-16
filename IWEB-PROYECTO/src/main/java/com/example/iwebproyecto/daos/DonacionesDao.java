package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class DonacionesDao extends BaseDao {


    public ArrayList<DonacionSuministros> listarDonacionesSuministrosNoEliminados(){
        ArrayList<DonacionSuministros> donacionesSuministros = new ArrayList<>();

        String sql = "SELECT * FROM donacionsuministros WHERE eliminado = 0 " +
                "ORDER BY fechaInicioRecepcion ASC, horaInicioRecepcion ASC,donacionSuministrosID DESC";

        try (Connection conn =this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                DonacionSuministros donacion = new DonacionSuministros();
                donacion =mapearDonacionSuministros(rs);
                donacionesSuministros.add(donacion);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return donacionesSuministros;
    }



    public ArrayList<DonacionSuministros> listarInicioDonacioneaSuministros(){
        ArrayList<DonacionSuministros> donacionesSuministros = new ArrayList<>();

        String sql = "SELECT *, " +
                "       IF((CURDATE() <= `fechaFinRecepcion`) " +
                "          AND (CURDATE() >= `fechaInicioRecepcion` OR CURDATE() < `fechaInicioRecepcion`), 1, 0) AS activo " +
                "FROM donacionsuministros " +
                "WHERE `eliminado` = 0 " +
                "ORDER BY activo DESC, `fechaInicioRecepcion` ASC " +
                "LIMIT 9;";

        try (Connection conn =this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                DonacionSuministros donacion = new DonacionSuministros();
                donacion =mapearDonacionSuministros(rs);
                donacionesSuministros.add(donacion);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return donacionesSuministros;

    }


    public ArrayList<DonacionSuministros> listarDonacionesSuministros(){
        ArrayList<DonacionSuministros> donacionesSuministros = new ArrayList<>();

        String sql = "SELECT * FROM donacionsuministros where eliminado = 0 ";

        try (Connection conn =this.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                DonacionSuministros donacion = new DonacionSuministros();
                donacion =mapearDonacionSuministros(rs);
                donacionesSuministros.add(donacion);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return donacionesSuministros;
    }




    public DonacionSuministros obtenerSolicitudesDonacionSuministrosPorId(int donacionSuministroId){
        String sql = "select * from donacionsuministros where donacionSuministrosID=? AND eliminado=0;";


        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, donacionSuministroId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return mapearDonacionSuministros(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }
    private DonacionSuministros mapearDonacionSuministros(ResultSet rs) throws SQLException {
        DonacionSuministros donacionSuministros = new DonacionSuministros();


        donacionSuministros.setDonacionSuministrosID(rs.getInt("donacionSuministrosID"));
        donacionSuministros.setTituloAvisoDonacion(rs.getString("tituloAvisoDonacion"));
        donacionSuministros.setCorreoElectronicoDonacion(rs.getString("correoElectronicoDonacion"));
        donacionSuministros.setTipoSuministro(rs.getString("tipoSuministro"));
        donacionSuministros.setNombreSuministro(rs.getString("nombreSuministro"));
        donacionSuministros.setCantidadDonacionesTotales(rs.getInt("cantidadDonacionesTotales"));
        donacionSuministros.setMarcaSuministro(rs.getString("marcaSuministro"));
        donacionSuministros.setFechaInicioRecepcion(rs.getString("fechaInicioRecepcion"));
        donacionSuministros.setFechaFinRecepcion(rs.getString("fechaFinRecepcion"));
        donacionSuministros.setHoraInicioRecepcion(rs.getString("horaInicioRecepcion"));
        donacionSuministros.setHoraFinRecepcion(rs.getString("horaFinRecepcion"));
        donacionSuministros.setMensajeParaDonantes(rs.getString("mensajeParaDonantes"));
        donacionSuministros.setEliminado(rs.getBoolean("eliminado"));


        DistritoDao distritoDao = new DistritoDao();
        Distrito distrito = distritoDao.obtenerDistritoPorId(rs.getInt("distritoID"));
        donacionSuministros.setDistrito(distrito);

        AlbergueDao albergueDao = new AlbergueDao();
        Albergue albergue =albergueDao.obtenerAlberguePorID(rs.getInt("albergueID"));
        donacionSuministros.setAlbergue(albergue);

        FotoDao fotoDao = new FotoDao();
        Foto foto = fotoDao.obtenerFotoPorId(rs.getInt("fotoID"));
        donacionSuministros.setFoto(foto);

        return donacionSuministros;

    }

    public boolean insertarUsuarioDonacionSuministros(UsuarioDonacionSuministro donacion) {

        String sql = "INSERT INTO usuariodonacionsuministros (usuarioID, donacionSuministrosID, cantidadSuministro, fechaDonacion, tipoDonacion) " +
                "VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            System.out.println("UsuarioID: " + donacion.getUsuario().getUsuarioID());
            System.out.println("DonacionSuministrosID: " + donacion.getDonacionSuministros().getDonacionSuministrosID());
            System.out.println("CantidadSuministro: " + donacion.getCantidadSuministro());
            System.out.println("FechaDonacion: " + donacion.getFechaDonacion());
            System.out.println("TipoDonacion: " + donacion.getTipoDonacion());


            ps.setInt(1, donacion.getUsuario().getUsuarioID());
            ps.setInt(2, donacion.getDonacionSuministros().getDonacionSuministrosID());
            ps.setInt(3, donacion.getCantidadSuministro());
            ps.setDate(4, Date.valueOf(donacion.getFechaDonacion()));
            ps.setString(5, donacion.getTipoDonacion());

            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<DonacionSuministros> obtenerSolicitudesDonacionSuministrosPorIdActivo(int albergueId) {
        ArrayList<DonacionSuministros> donacionesSuministros = new ArrayList<>();

        String sql = "SELECT * FROM donacionsuministros WHERE albergueID = ? AND eliminado = 0 AND CURDATE() <= fechaFinRecepcion";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Configurar el parámetro albergueID
            pstmt.setInt(1, albergueId);

            // Ejecutar la consulta
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    DonacionSuministros donacion = mapearDonacionSuministros(rs);
                    donacionesSuministros.add(donacion);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener donaciones de suministros activas por ID de albergue", e);
        }

        return donacionesSuministros;
    }

    public boolean guardarDonacionMonetaria(DonacionMonetaria donacion) {
        String sql = "INSERT INTO usuariodonacionmonetaria (usuarioID, albergueID, cantidadMonetaria, donacionSuministrosID, fechaDonacionMonetaria) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, donacion.getUsuario().getUsuarioID());
            pstmt.setInt(2, donacion.getAlbergue().getAlbergueID());
            pstmt.setInt(3, donacion.getCantidadMonetaria());

            if (donacion.getDonacionSuministrosID() != null) {
                pstmt.setInt(4, donacion.getDonacionSuministrosID());
            } else {
                pstmt.setNull(4, java.sql.Types.INTEGER);
            }

            pstmt.setString(5, donacion.getFechaDonacionMonetaria());

            int filasInsertadas = pstmt.executeUpdate();
            return filasInsertadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public double obtenerTotalDonadoPorUsuario(int usuarioId) {
        String sql = "SELECT SUM(cantidadMonetaria) AS total FROM usuariodonacionmonetaria WHERE usuarioID = ?";
        double total = 0;

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, usuarioId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    total = rs.getDouble("total");
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el total donado por el usuario", e);
        }

        return total;
    }

    public ArrayList<DonacionMonetaria> listarDonacionesMonetariasPorUsuario(int usuarioId) {
        ArrayList<DonacionMonetaria> donaciones = new ArrayList<>();
        String sql = "SELECT dm.*, a.nombreAlbergue, ds.tituloAvisoDonacion " +
                "FROM usuariodonacionmonetaria dm " +
                "INNER JOIN albergue a ON dm.albergueID = a.albergueID " +
                "LEFT JOIN donacionsuministros ds ON dm.donacionSuministrosID = ds.donacionSuministrosID " +
                "WHERE dm.usuarioID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, usuarioId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    DonacionMonetaria donacion = new DonacionMonetaria();



                    donacion.setCantidadMonetaria(rs.getInt("cantidadMonetaria"));
                    donacion.setFechaDonacionMonetaria(rs.getString("fechaDonacionMonetaria"));

                    // Configurar Albergue
                    Albergue albergue = new Albergue();
                    albergue.setNombreAlbergue(rs.getString("nombreAlbergue"));
                    donacion.setAlbergue(albergue);

                    donacion.setDonacionSuministrosID(rs.getInt("donacionSuministrosID"));

                    // Asignar título de la causa (si existe)
                    String tituloCausa = rs.getString("tituloAvisoDonacion");
                    donacion.setDonacionSuministrosTitulo(tituloCausa != null ? tituloCausa : "Sin causa específica");

                    donaciones.add(donacion);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener donaciones monetarias por usuario", e);
        }
        return donaciones;
    }
    public String obtenerNombreCausaPorID(int causaID) {
        String nombreCausa = "Sin causa específica"; // Valor por defecto
        String sql = "SELECT tituloAvisoDonacion FROM donacionsuministros WHERE donacionSuministrosID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, causaID);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    nombreCausa = rs.getString("tituloAvisoDonacion");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener el nombre de la causa", e);
        }
        return nombreCausa;
    }

    public ArrayList<UsuarioDonacionSuministro> listarDonacionesPorUsuarioConAlbergue(int usuarioID) {
        ArrayList<UsuarioDonacionSuministro> listaDonaciones = new ArrayList<>();

        String sql = """
        SELECT uds.usuarioDonacionSuministrosID, uds.cantidadSuministro, uds.fechaDonacion, uds.tipoDonacion,
                                                          a.nombreAlbergue, f.rutaFoto, ds.tituloAvisoDonacion
                                                   FROM usuariodonacionsuministros uds
                                                   INNER JOIN donacionsuministros ds ON uds.donacionSuministrosID = ds.donacionSuministrosID
                                                   INNER JOIN albergue a ON ds.albergueID = a.albergueID
                                                   LEFT JOIN fotos f ON ds.fotoID = f.fotoID
                                                   WHERE uds.usuarioID = ?
                                                   ORDER BY uds.fechaDonacion DESC
    """;

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, usuarioID);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    UsuarioDonacionSuministro usuarioDonacion = new UsuarioDonacionSuministro();

                    // Mapear datos principales
                    usuarioDonacion.setUsuarioDonacionSuministrosID(rs.getInt("usuarioDonacionSuministrosID"));
                    usuarioDonacion.setCantidadSuministro(rs.getInt("cantidadSuministro"));
                    usuarioDonacion.setFechaDonacion(rs.getDate("fechaDonacion").toLocalDate());
                    usuarioDonacion.setTipoDonacion(rs.getString("tipoDonacion"));

                    // Mapear el nombre del albergue
                    Albergue albergue = new Albergue();
                    usuarioDonacion.setNombreAlbergue(rs.getString("nombreAlbergue"));
                    DonacionSuministros donacionSuministros = new DonacionSuministros();
                    donacionSuministros.setAlbergue(albergue);


                    // Obtener y asignar el título de la solicitud
                    usuarioDonacion.setTituloAvisoDonacion(rs.getString("tituloAvisoDonacion"));
                    // Obtener y asignar la ruta de la foto
                    String rutaFoto = rs.getString("rutaFoto");
                    usuarioDonacion.setRutaFoto(rutaFoto);

                    // Asignar los datos mapeados
                    usuarioDonacion.setDonacionSuministros(donacionSuministros);

                    listaDonaciones.add(usuarioDonacion);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al listar donaciones por usuario con albergue", e);
        }

        return listaDonaciones;
    }




}
