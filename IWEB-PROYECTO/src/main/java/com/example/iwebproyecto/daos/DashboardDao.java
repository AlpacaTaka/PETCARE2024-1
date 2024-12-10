package com.example.iwebproyecto.daos;

import com.example.iwebproyecto.beans.Zona;
import com.example.iwebproyecto.dtos.DashboardDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class DashboardDao extends BaseDao{
    public DashboardDTO obtenerDatosDashboard(){
        String sql = "SELECT a.nombreAlbergue,SUM(udm.cantidadMonetaria) AS total_donaciones_monetarias FROM albergue a, usuariodonacionmonetaria udm where a.albergueID = udm.albergueID GROUP BY a.nombreAlbergue;";
        DashboardDTO dashboardDTO = new DashboardDTO();
        DashboardDao dashboardDao = new DashboardDao();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ArrayList<String> albergueDTO = new ArrayList<>();
            ArrayList<Integer> total_donado = new ArrayList<>();
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                albergueDTO.add(rs.getString(1));
                total_donado.add(rs.getInt(2));
            }
            dashboardDTO.setAlberguesDonacion(albergueDTO);
            dashboardDTO.setCantidadesTotalesDonacionAlbergue(total_donado);
        }catch (SQLException e) {
            e.printStackTrace();
        }
        sql="SELECT concat(u.nombre,' ',u.apellido) as usuario, SUM(d.cantidadMonetaria) AS total_donado FROM Usuario u JOIN usuariodonacionmonetaria d ON u.usuarioID = d.usuarioID GROUP BY u.nombre, u.apellido ORDER BY total_donado DESC LIMIT 10;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ArrayList<String> NombreUsuario = new ArrayList<>();
            ArrayList<Integer> Donado_top_10 = new ArrayList<>();
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                NombreUsuario.add(rs.getString(1));
                Donado_top_10.add(rs.getInt(2));
            }
            dashboardDTO.setUsuariosDonacion(NombreUsuario);
            dashboardDTO.setCantidadesTotalesDonacionUsuario(Donado_top_10);
        }catch (SQLException e) {
            e.printStackTrace();
        }
        sql="WITH MonthData AS (SELECT MONTHNAME(fechaFormulario) AS mes, COUNT(*) AS mascotas_perdidas FROM PublicacionMascotaPerdida WHERE fechaFormulario BETWEEN DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND LAST_DAY(CURDATE()) GROUP BY MONTHNAME(fechaFormulario)) SELECT MONTHNAME(DATE_SUB(CURDATE(), INTERVAL n.n MONTH)) AS mes, COALESCE(md.mascotas_perdidas, 0) AS mascotas_perdidas FROM (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2) AS n LEFT JOIN MonthData md ON MONTHNAME(DATE_SUB(CURDATE(), INTERVAL n.n MONTH)) = md.mes ORDER BY n ASC;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ArrayList<String> meses_tres_ultimos = new ArrayList<>();
            ArrayList<Integer> cantidad_por_mes = new ArrayList<>();
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                meses_tres_ultimos.add(traduceMes(rs.getString(1)));
                cantidad_por_mes.add(rs.getInt(2));
            }
            dashboardDTO.setMesesMascotaPerdida(meses_tres_ultimos);
            dashboardDTO.setCantidadesTotalesMesMascotaPerdida(cantidad_por_mes);
        }catch (SQLException e) {
            e.printStackTrace();
        }
        sql="SELECT COUNT(*) AS total_usuarios FROM Usuario where activo=1;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                dashboardDTO.setUsuarioActivos(rs.getInt(1));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        sql="SELECT COUNT(*) AS total_usuarios FROM Usuario where activo=0;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                dashboardDTO.setUsuariosDesactivados(rs.getInt(1));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        sql="select month(fechaRegistrado),count(*) from albergue  where year(fechaRegistrado)=year(curdate()) and aprobado=1 group by month(fechaRegistrado);";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            HashMap<Integer,Integer> hashMap = new HashMap<>();
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                hashMap.put(rs.getInt(1), rs.getInt(2));
            }
            dashboardDTO.setDiccionarioMesyRegistrados(hashMap);
        }catch (SQLException e) {
            e.printStackTrace();
        }

        sql="WITH MascotasEncontrada AS (SELECT " +
                "MONTHNAME(fechaFormulario) AS mes, " +
                "COUNT(*) AS mascotas_encontradas " +
                "FROM publicacionmascotaperdida " +
                "WHERE fechaFormulario BETWEEN DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND LAST_DAY(CURDATE()) AND mascotaEncontrada=1 " +
                "GROUP BY MONTHNAME(fechaFormulario)) " +
                "SELECT " +
                "MONTHNAME(DATE_SUB(CURDATE(), INTERVAL n.n MONTH)) AS mes, " +
                "COALESCE(me.mascotas_encontradas, 0) AS mascotas_encontradas " +
                "FROM (" +
                "SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2" +
                ") AS n " +
                "LEFT JOIN MascotasEncontrada me ON MONTHNAME(DATE_SUB(CURDATE(), INTERVAL n.n MONTH)) = me.mes " +
                "ORDER BY n ASC;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ArrayList<String> encontrados_meses_tres_ultimos = new ArrayList<>();
            ArrayList<Integer> encontrados_cantidad_por_mes = new ArrayList<>();
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                encontrados_meses_tres_ultimos.add(traduceMes(rs.getString(1)));
                encontrados_cantidad_por_mes.add(rs.getInt(2));
            }
            dashboardDTO.setMesesMascotaEncontrada(encontrados_meses_tres_ultimos);
            dashboardDTO.setCantidadesTotalesMesMascotaEncontrada (encontrados_cantidad_por_mes);
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return dashboardDTO;
    }
    public String traduceMes(String mes){
        switch(mes){
            case "January":
                mes="Enero";
                break;
            case "February":
                mes="Febrero";
            break;
            case "March":
                mes="Marzo";
                break;
            case "April":
                mes="Abril";
                break;
            case "May":
                mes="Mayo";
                break;
            case "June":
                mes="Junio";
                break;
            case "July":
                mes="Julio";
                break;
            case "August":
                mes="Agosto";
                break;
            case "September":
                mes="Septiembre";
                break;
            case "October":
                mes="Octubre";
                break;
            case "November":
                mes="Noviembre";
                break;
            case "December":
                mes="Diciembre";
                break;
        }
        return mes;
    }
}
