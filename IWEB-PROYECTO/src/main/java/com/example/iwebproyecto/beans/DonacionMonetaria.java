package com.example.iwebproyecto.beans;

public class DonacionMonetaria {
    private int donacionMonetariaID;
    private int usuarioID;
    private int albergueID;
    private String tipoDonacion;/*Monetaria*/
    private int cantidadMonetaria;
    private String fechaRecepcion;
    private String horaRecepcion;
    private String fecha;
    private int fotos_FotoID;

    public DonacionMonetaria() {}

    public DonacionMonetaria(int donacionMonetariaID, int usuarioID, int albergueID, String tipoDonacion,
                             String cantidadMonetaria, String fechaRecepcion, String horaRecepcion, String fecha, int fotos_FotoID) {
        this.donacionMonetariaID = donacionMonetariaID;
        this.usuarioID = usuarioID;
        this.albergueID = albergueID;
        this.tipoDonacion = tipoDonacion;
        this.cantidadMonetaria = Integer.parseInt(cantidadMonetaria);
        this.fechaRecepcion = fechaRecepcion;
        this.horaRecepcion = horaRecepcion;
        this.fecha = fecha;
        this.fotos_FotoID = fotos_FotoID;
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

    public int getAlbergueID() {
        return albergueID;
    }

    public void setAlbergueID(int albergueID) {
        this.albergueID = albergueID;
    }

    public int getCantidadMonetaria() {
        return cantidadMonetaria;
    }

    public void setCantidadMonetaria(int cantidadMonetaria) {
        this.cantidadMonetaria = cantidadMonetaria;
    }

    public String getTipoDonacion() {
        return tipoDonacion;
    }

    public void setTipoDonacion(String tipoDonacion) {
        this.tipoDonacion = tipoDonacion;
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

    public int getFotos_FotoID() {
        return fotos_FotoID;
    }

    public void setFotos_FotoID(int fotos_FotoID) {
        this.fotos_FotoID = fotos_FotoID;
    }


}
