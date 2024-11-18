package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Administrador;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.LugarEvento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LugarEventoDao extends BaseDao{

    public LugarEvento obtenerLugarHabilitadosPorID(int lugarID){

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM lugarevento WHERE lugarID = ?")) {

            pstmt.setInt(1, lugarID);

            ResultSet rs = pstmt.executeQuery();


            if (rs.next()) {
                return mapearLugar(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public ArrayList<LugarEvento> obtenerTodosLugaresNoEliminados() {
        ArrayList<LugarEvento> lugares = new ArrayList<>();

        String query = "SELECT * FROM lugarevento WHERE eliminado = 0";  // Filtra los lugares no eliminados

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {


            ResultSet rs = pstmt.executeQuery();


            while (rs.next()) {
                LugarEvento lugar = mapearLugar(rs);
                lugares.add(lugar);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lugares;
    }



    private LugarEvento mapearLugar(ResultSet rs) throws SQLException {
        int lugarID = rs.getInt("lugarID");
        String nombreLugar = rs.getString("nombreLugar");
        String direccionLugar = rs.getString("direccionLugar");
        int aforoMax = rs.getInt("aforoMax");
        int administradorID = rs.getInt("administradorID");
        int fotoID = rs.getInt("fotoID");
        boolean eliminado = rs.getBoolean("eliminado");

        LugarEvento lugar = new LugarEvento();

        lugar.setLugarID(lugarID);
        lugar.setNombreLugar(nombreLugar);
        lugar.setDireccionLugar(direccionLugar);
        lugar.setAforoMax(aforoMax);
        lugar.setEliminado(eliminado);


        AdministradorDao administradorDAO = new AdministradorDao();
        FotoDao fotoDAO = new FotoDao();

        Administrador administrador = administradorDAO.obtenerAdministradorPorID(administradorID);
        Foto foto = fotoDAO.obtenerFotoPorId(fotoID);

        lugar.setAdministrador(administrador);
        lugar.setFoto(foto);

        return lugar;
    }


}
