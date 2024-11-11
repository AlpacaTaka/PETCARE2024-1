package com.example.iwebproyecto.beans;

public class Distrito {
    private int distritoID;
    private String nombreDistrito;

    private Zona zona;

    public Distrito() {}

    public Distrito(int distritoID, String nombreDistrito, Zona zona) {
        this.distritoID = distritoID;
        this.nombreDistrito = nombreDistrito;
        this.zona = zona;

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


    public Zona getZona() {
        return zona;
    }

    public void setZona(Zona zona) {
        this.zona = zona;

    }
}
