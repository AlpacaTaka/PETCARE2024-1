package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.DonacionSuministros;
import com.example.iwebproyecto.beans.Foto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DonacionesDao extends BaseDao {


    public ArrayList<DonacionSuministros> listarDonacionesSuministrosNoEliminados(){
        ArrayList<DonacionSuministros> donacionesSuministros = new ArrayList<>();

        String sql = "SELECT * FROM donacionsuministros WHERE eliminado = 0 " +
                "ORDER BY fechaInicioRecepcion ASC, horaInicioRecepcion ASC";

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

        String sql = "SELECT * FROM donacionsuministros";

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




    public DonacionSuministros obtenerSolicitudesDonacionSuministrosPorId(int donacionSuministroId) throws SQLException {
        String sql = "select * from donacionsuministros where donacionSuministrosID=?;";

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


}
