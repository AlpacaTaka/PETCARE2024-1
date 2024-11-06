package com.example.iwebproyecto.beans;

public class Distrito {
    private int distritoID;
    private String nombreDistrito;
    private int zonaID;

    public Distrito() {}

    public Distrito(int distritoID, String nombreDistrito, int zonaID) {
        this.distritoID = distritoID;
        this.nombreDistrito = nombreDistrito;
        this.zonaID = zonaID;
    }

    public int getDistritoID() {
        return distritoID;
    }

    public void setDistritoID(int distritoID) {
        this.distritoID = distritoID;
    }

    public String getNombreDistrito() {
        return nombreDistrito;
    }

    public void setNombreDistrito(String nombreDistrito) {
        this.nombreDistrito = nombreDistrito;
    }

    public int getZonaID() {
        return zonaID;
    }

    public void setZonaID(int zonaID) {
        this.zonaID = zonaID;
    }
}
