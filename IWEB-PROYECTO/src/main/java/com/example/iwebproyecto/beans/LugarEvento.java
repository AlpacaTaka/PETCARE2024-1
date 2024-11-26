package com.example.iwebproyecto.beans;

public class LugarEvento {
    private int lugarID;
    private String nombreLugar;
    private String direccionLugar;
    private int aforoMax;
    private Administrador administrador;
    private Foto foto;  // Asumiendo que Foto es otro bean
    private boolean eliminado;
    private Distrito distrito;

    // Constructor vacío
    public LugarEvento() {}

    // Constructor con parámetros
    public LugarEvento(int lugarID, String nombreLugar, String direccionLugar, int aforoMax,
                       Administrador administrador, Foto foto, boolean eliminado) {
        this.lugarID = lugarID;
        this.nombreLugar = nombreLugar;
        this.direccionLugar = direccionLugar;
        this.aforoMax = aforoMax;
        this.administrador = administrador;
        this.foto = foto;
        this.eliminado = eliminado;
    }

    // Getters y setters
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

    public Administrador getAdministrador() {
        return administrador;
    }

    public void setAdministrador(Administrador administrador) {
        this.administrador = administrador;
    }

    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;
    }

    public boolean isEliminado() {
        return eliminado;
    }

    public void setEliminado(boolean eliminado) {
        this.eliminado = eliminado;
    }

    public Distrito getDistrito() {
        return distrito;
    }

    public void setDistrito(Distrito distrito) {
        this.distrito = distrito;
    }
}
