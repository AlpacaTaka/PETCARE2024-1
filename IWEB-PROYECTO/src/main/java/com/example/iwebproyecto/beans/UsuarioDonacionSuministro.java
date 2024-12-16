package com.example.iwebproyecto.beans;

import java.time.LocalDate;

public class UsuarioDonacionSuministro {

    private int usuarioDonacionSuministrosID;
    private Usuario usuario; // Relación con el bean Usuario
    private DonacionSuministros donacionSuministros; // Relación con el bean DonacionSuministros
    private int cantidadSuministro;
    private LocalDate fechaDonacion;
    private String tipoDonacion;// Campo adicional para el tipo de donación
    private String rutaFoto; //ESTO SOLO SE TOMA PARA CUESTIONES PRACTICAS Y NO ESTA NE LA BASE DE DATOS PERO NO HAY PROBLEMA
    private String tituloAvisoDonacion; //same here
    private String nombreAlbergue;
    // Constructor vacío
    public UsuarioDonacionSuministro() {
    }

    // Constructor completo
    public UsuarioDonacionSuministro(int usuarioDonacionSuministrosID, Usuario usuario, DonacionSuministros donacionSuministros,
                                      int cantidadSuministro, LocalDate fechaDonacion, String tipoDonacion) {
        this.usuarioDonacionSuministrosID = usuarioDonacionSuministrosID;
        this.usuario = usuario;
        this.donacionSuministros = donacionSuministros;
        this.cantidadSuministro = cantidadSuministro;
        this.fechaDonacion = fechaDonacion;
        this.tipoDonacion = tipoDonacion;
    }

    // Getters y Setters

    public String getNombreAlbergue() {
        return nombreAlbergue;
    }

    public void setNombreAlbergue(String nombreAlbergue) {
        this.nombreAlbergue = nombreAlbergue;
    }

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

    public LocalDate getFechaDonacion() {
        return fechaDonacion;
    }

    public void setFechaDonacion(LocalDate fechaDonacion) {
        this.fechaDonacion = fechaDonacion;
    }

    public String getTipoDonacion() {
        return tipoDonacion;
    }

    public void setTipoDonacion(String tipoDonacion) {
        this.tipoDonacion = tipoDonacion;
    }

    public String getRutaFoto() {
        return rutaFoto;
    }

    public void setRutaFoto(String rutaFoto) {
        this.rutaFoto = rutaFoto;
    }

    public String getTituloAvisoDonacion() {
        return tituloAvisoDonacion;
    }

    public void setTituloAvisoDonacion(String tituloAvisoDonacion) {
        this.tituloAvisoDonacion = tituloAvisoDonacion;
    }

    @Override
    public String toString() {
        return "UsuarioDonacionSuministros{" +
                "usuarioDonacionSuministrosID=" + usuarioDonacionSuministrosID +
                ", usuario=" + usuario +
                ", donacionSuministros=" + donacionSuministros +
                ", cantidadSuministro=" + cantidadSuministro +
                ", fechaDonacion=" + fechaDonacion +
                ", tipoDonacion='" + tipoDonacion + '\'' +
                '}';
    }
}
