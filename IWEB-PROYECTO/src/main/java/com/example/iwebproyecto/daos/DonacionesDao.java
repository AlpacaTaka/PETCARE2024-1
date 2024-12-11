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


}
