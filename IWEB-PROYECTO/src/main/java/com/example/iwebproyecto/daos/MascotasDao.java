package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.MascotasAdopcion;

import java.sql.*;
import java.util.ArrayList;

public class MascotasDao extends BaseDao {

    public ArrayList<MascotasAdopcion> listarMascotasActivasAdopcion() {
        ArrayList<MascotasAdopcion> listaMascAdopActivas = new ArrayList<>();

        String sql = "select * from mascotasadopcion where eliminado=0";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MascotasAdopcion mascotaAdopcion = mapearMascotaAdopcion(rs);
                listaMascAdopActivas.add(mascotaAdopcion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaMascAdopActivas;
    }
    public ArrayList<MascotasAdopcion> listarMascotasActivasAdopcion8() {
        ArrayList<MascotasAdopcion> listaMascAdopActivas = new ArrayList<>();

        String sql = "SELECT * FROM mascotasadopcion WHERE eliminado=0 ORDER BY RAND() LIMIT 8";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MascotasAdopcion mascotaAdopcion = mapearMascotaAdopcion(rs);
                listaMascAdopActivas.add(mascotaAdopcion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaMascAdopActivas;
    }




    public MascotasAdopcion getMascotasAdopcionPorId(int idAdopcion) {

        String sql = "SELECT * FROM mascotasadopcion WHERE idAdopcion = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idAdopcion);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return mapearMascotaAdopcion(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    private MascotasAdopcion mapearMascotaAdopcion(ResultSet rs) throws SQLException {
        MascotasAdopcion mascotaAdopcion = new MascotasAdopcion();
        mascotaAdopcion.setIdAdopcion(Integer.parseInt(rs.getString("idAdopcion")));
        mascotaAdopcion.setNombreMascota(rs.getString("nombreMascota"));
        mascotaAdopcion.setEspecie(rs.getString("especieMascota"));
        mascotaAdopcion.setRaza(rs.getString("raza"));
        mascotaAdopcion.setDireccionHallazgo(rs.getString("direccionHallazgo"));
        mascotaAdopcion.setEdadAprox(Integer.parseInt(rs.getString("edadAprox")));
        mascotaAdopcion.setSexo(rs.getString("sexo"));
        mascotaAdopcion.setDescripcionGeneral(rs.getString("descripcionGeneral"));
        mascotaAdopcion.setSeEncuentraTemporal(rs.getBoolean("seEncuentraTemporal"));
        mascotaAdopcion.setCondicionesAdopcion(rs.getString("condicionesAdopcion"));
        System.out.println(rs.getString("especieMascota"));
        mascotaAdopcion.setFechaAdoptado(rs.getString("fechaAdoptado"));
        mascotaAdopcion.setEliminado(rs.getBoolean("eliminado"));

        DistritoDao distritoDao = new DistritoDao();
        Distrito distrito =distritoDao.obtenerDistritoPorId(rs.getInt("distritoID"));
        mascotaAdopcion.setDistrito(distrito);

        FotoDao fotoDao = new FotoDao();
        Foto foto = fotoDao.obtenerFotoPorId(rs.getInt("fotoID"));
        mascotaAdopcion.setFoto(foto);

        AlbergueDao albergueDao = new AlbergueDao();
        Albergue Albergue = albergueDao.obtenerAlberguePorID(rs.getInt("albergueID"));
        mascotaAdopcion.setAlbergue(Albergue);

        return mascotaAdopcion;
    }
}
