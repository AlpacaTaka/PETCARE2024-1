package com.example.iwebproyecto.beans;

public class LugarEvento {
    private int lugarID;
    private String nombreLugar;
    private String direccionLugar;
    private int aforoMax;
    private int administradorID;
    private int fotoID;

    public LugarEvento() {}

    public LugarEvento(int lugarID, String nombreLugar, String direccionLugar, int aforoMax, int administradorID, int fotoID) {
        this.lugarID = lugarID;
        this.nombreLugar = nombreLugar;
        this.direccionLugar = direccionLugar;
        this.aforoMax = aforoMax;
        this.administradorID = administradorID;
        this.fotoID = fotoID;
    }

    public int getLugarID() {
        return lugarID;
    }

    public void setLugarID(int lugarID) {
        this.lugarID = lugarID;
    }

    public String getNombreLugar() {
        return nombreLugar;
    }

    public void setNombreLugar(String nombreLugar) {
        this.nombreLugar = nombreLugar;
    }

    public String getDireccionLugar() {
        return direccionLugar;
    }

    public void setDireccionLugar(String direccionLugar) {
        this.direccionLugar = direccionLugar;
    }

    public int getAforoMax() {
        return aforoMax;
    }

    public void setAforoMax(int aforoMax) {
        this.aforoMax = aforoMax;
    }

    public int getAdministradorID() {
        return administradorID;
    }

    public void setAdministradorID(int administradorID) {
        this.administradorID = administradorID;
    }

    public int getFotoID() {
        return fotoID;
    }

    public void setFotoID(int fotoID) {
        this.fotoID = fotoID;
    }

}
