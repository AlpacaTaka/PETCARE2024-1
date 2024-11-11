package com.example.iwebproyecto.beans;

public class DonacionMonetaria {
    private int donacionMonetariaID;
    private int usuarioID;

    private Albergue albergue;

    private int cantidadMonetaria;
    private String fechaRecepcion;
    private String horaRecepcion;
    private String fecha;

    private Foto foto;

    public DonacionMonetaria() {}

    public DonacionMonetaria(int donacionMonetariaID, int usuarioID, Albergue albergue, int cantidadMonetaria, String fechaRecepcion, String horaRecepcion, String fecha, Foto foto) {
        this.donacionMonetariaID = donacionMonetariaID;
        this.usuarioID = usuarioID;
        this.albergue = albergue;
        this.cantidadMonetaria = cantidadMonetaria;
        this.fechaRecepcion = fechaRecepcion;
        this.horaRecepcion = horaRecepcion;
        this.fecha = fecha;
        this.foto = foto;

    }

    public int getDonacionMonetariaID() {
        return donacionMonetariaID;
    }

    public void setDonacionMonetariaID(int donacionMonetariaID) {
        this.donacionMonetariaID = donacionMonetariaID;
    }

    public int getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(int usuarioID) {
        this.usuarioID = usuarioID;
    }



    public int getCantidadMonetaria() {
        return cantidadMonetaria;
    }

    public void setCantidadMonetaria(int cantidadMonetaria) {
        this.cantidadMonetaria = cantidadMonetaria;
    }



    public String getFechaRecepcion() {
        return fechaRecepcion;
    }

    public void setFechaRecepcion(String fechaRecepcion) {
        this.fechaRecepcion = fechaRecepcion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHoraRecepcion() {
        return horaRecepcion;
    }

    public void setHoraRecepcion(String horaRecepcion) {
        this.horaRecepcion = horaRecepcion;
    }


    public Albergue getAlbergue() {
        return albergue;
    }

    public void setAlbergue(Albergue albergue) {
        this.albergue = albergue;
    }

    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;
    }

}
