package com.example.iwebproyecto.dtos;

import java.util.ArrayList;
import java.util.HashMap;

public class DashboardDTO {
    private ArrayList<String> AlberguesDonacion;
    private ArrayList<Integer>  CantidadesTotalesDonacionAlbergue;
    private ArrayList<String> UsuariosDonacion;
    private ArrayList<Integer>  CantidadesTotalesDonacionUsuario;/*TOP 10*/

    private ArrayList<String> MesesMascotaPerdida;
    private ArrayList<Integer>  CantidadesTotalesMesMascotaPerdida;

    /*private HashMap<String, Integer> MesYCantidadMascotasPerdidas;*/

    private int UsuarioActivos;
    private int UsuariosDesactivados;
    private HashMap<Integer, Integer> DiccionarioMesyRegistrados;
    private ArrayList<String> MesesMascotaEncontrada;
    private ArrayList<Integer>  CantidadesTotalesMesMascotaEncontrada;

    public ArrayList<String> getAlberguesDonacion() {
        return AlberguesDonacion;
    }

    public void setAlberguesDonacion(ArrayList<String> alberguesDonacion) {
        AlberguesDonacion = alberguesDonacion;
    }

    public ArrayList<Integer> getCantidadesTotalesDonacionAlbergue() {
        return CantidadesTotalesDonacionAlbergue;
    }

    public void setCantidadesTotalesDonacionAlbergue(ArrayList<Integer> cantidadesTotalesDonacionAlbergue) {
        CantidadesTotalesDonacionAlbergue = cantidadesTotalesDonacionAlbergue;
    }

    public ArrayList<String> getUsuariosDonacion() {
        return UsuariosDonacion;
    }

    public void setUsuariosDonacion(ArrayList<String> usuariosDonacion) {
        UsuariosDonacion = usuariosDonacion;
    }

    public ArrayList<Integer> getCantidadesTotalesDonacionUsuario() {
        return CantidadesTotalesDonacionUsuario;
    }

    public void setCantidadesTotalesDonacionUsuario(ArrayList<Integer> cantidadesTotalesDonacionUsuario) {
        CantidadesTotalesDonacionUsuario = cantidadesTotalesDonacionUsuario;
    }

    public ArrayList<String> getMesesMascotaPerdida() {
        return MesesMascotaPerdida;
    }

    public void setMesesMascotaPerdida(ArrayList<String> mesesMascotaPerdida) {
        MesesMascotaPerdida = mesesMascotaPerdida;
    }

    public ArrayList<Integer> getCantidadesTotalesMesMascotaPerdida() {
        return CantidadesTotalesMesMascotaPerdida;
    }

    public void setCantidadesTotalesMesMascotaPerdida(ArrayList<Integer> cantidadesTotalesMesMascotaPerdida) {
        CantidadesTotalesMesMascotaPerdida = cantidadesTotalesMesMascotaPerdida;
    }

    public int getUsuarioActivos() {
        return UsuarioActivos;
    }

    public void setUsuarioActivos(int usuarioActivos) {
        UsuarioActivos = usuarioActivos;
    }

    public int getUsuariosDesactivados() {
        return UsuariosDesactivados;
    }

    public void setUsuariosDesactivados(int usuariosDesactivados) {
        UsuariosDesactivados = usuariosDesactivados;
    }

    public HashMap<Integer, Integer> getDiccionarioMesyRegistrados() {
        return DiccionarioMesyRegistrados;
    }

    public void setDiccionarioMesyRegistrados(HashMap<Integer, Integer> diccionarioMesyRegistrados) {
        DiccionarioMesyRegistrados = diccionarioMesyRegistrados;
    }

    public ArrayList<String> getMesesMascotaEncontrada() {
        return MesesMascotaEncontrada;
    }

    public void setMesesMascotaEncontrada(ArrayList<String> mesesMascotaEncontrada) {
        MesesMascotaEncontrada = mesesMascotaEncontrada;
    }

    public ArrayList<Integer> getCantidadesTotalesMesMascotaEncontrada() {
        return CantidadesTotalesMesMascotaEncontrada;
    }

    public void setCantidadesTotalesMesMascotaEncontrada(ArrayList<Integer> cantidadesTotalesMesMascotaEncontrada) {
        CantidadesTotalesMesMascotaEncontrada = cantidadesTotalesMesMascotaEncontrada;
    }
}
