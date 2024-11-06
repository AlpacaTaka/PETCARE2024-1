package com.example.iwebproyecto.beans;

public class Zona {
    private int zonaID;
    private String nombreZona;/*'Norte', 'Sur', 'Este', 'Oeste'*/

    public Zona() {}

    public Zona(int zonaID, String nombreZona) {
        this.zonaID = zonaID;
        this.nombreZona = nombreZona;
    }

    public int getZonaID() {
        return zonaID;
    }
    public void setZonaID(int zonaID) {
        this.zonaID = zonaID;
    }
    public String getNombreZona() {
        return nombreZona;
    }
    public void setNombreZona(String nombreZona) {
        this.nombreZona = nombreZona;
    }
}