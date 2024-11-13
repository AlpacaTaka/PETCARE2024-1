package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.DonacionSuministros;
import com.example.iwebproyecto.beans.Foto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DonacionesDao extends BaseDao {



    public DonacionSuministros obtenerSolicitudesDonacionSuministrosPorId(int donacionSuministroId) throws SQLException {
        String sql = "select * from donacionsuministros where donacionSuministro=?;";

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

        donacionSuministros.setDonacionSuministrosID(rs.getInt("donacionSuministro"));
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
        donacionSuministros.setMensajeParaDonantes(rs.getString("mensajeParaDonante"));

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
