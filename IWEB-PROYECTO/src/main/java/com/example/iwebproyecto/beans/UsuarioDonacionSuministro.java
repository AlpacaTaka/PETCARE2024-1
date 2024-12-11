package com.example.iwebproyecto.beans;


import java.util.Date;

public class UsuarioDonacionSuministro {

    private int usuarioDonacionSuministrosID;
    private Usuario usuario; // Relación con el bean Usuario
    private DonacionSuministros donacionSuministros; // Relación con el bean DonacionSuministros
    private int cantidadSuministro;
    private Date fechaDonacion;

    // Constructor vacío
    public UsuarioDonacionSuministro() {
    }

    // Constructor completo
    public UsuarioDonacionSuministro(int usuarioDonacionSuministrosID, Usuario usuario, DonacionSuministros donacionSuministros, int cantidadSuministro, Date fechaDonacion) {
        this.usuarioDonacionSuministrosID = usuarioDonacionSuministrosID;
        this.usuario = usuario;
        this.donacionSuministros = donacionSuministros;
        this.cantidadSuministro = cantidadSuministro;
        this.fechaDonacion = fechaDonacion;
    }

    // Getters y Setters
    public int getUsuarioDonacionSuministrosID() {
        return usuarioDonacionSuministrosID;
    }

    public void setUsuarioDonacionSuministrosID(int usuarioDonacionSuministrosID) {
        this.usuarioDonacionSuministrosID = usuarioDonacionSuministrosID;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public DonacionSuministros getDonacionSuministros() {
        return donacionSuministros;
    }

    public void setDonacionSuministros(DonacionSuministros donacionSuministros) {
        this.donacionSuministros = donacionSuministros;
    }

    public int getCantidadSuministro() {
        return cantidadSuministro;
    }

    public void setCantidadSuministro(int cantidadSuministro) {
        this.cantidadSuministro = cantidadSuministro;
    }

    public Date getFechaDonacion() {
        return fechaDonacion;
    }

    public void setFechaDonacion(Date fechaDonacion) {
        this.fechaDonacion = fechaDonacion;
    }

    @Override
    public String toString() {
        return "UsuarioDonacionSuministros{" +
                "usuarioDonacionSuministrosID=" + usuarioDonacionSuministrosID +
                ", usuario=" + usuario +
                ", donacionSuministros=" + donacionSuministros +
                ", cantidadSuministro=" + cantidadSuministro +
                ", fechaDonacion=" + fechaDonacion +
                '}';
    }
}
