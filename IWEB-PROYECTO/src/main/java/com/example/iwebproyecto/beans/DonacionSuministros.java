package com.example.iwebproyecto.beans;

public class DonacionSuministros {
    private int donacionSuministrosID;
    private Usuario usuario;
    private Albergue albergue;
    private String fechaRecepcion;
    private String nombreSuministro;
    private String marcaSuministro;
    private String horaRecepcion;
    private String fecha;
    private Foto foto;

    public DonacionSuministros() {}



    public int getDonacionSuministrosID() {
        return donacionSuministrosID;
    }

    public void setDonacionSuministrosID(int donacionSuministrosID) {
        this.donacionSuministrosID = donacionSuministrosID;
    }

    public DonacionSuministros(int donacionSuministrosID, Usuario usuario, Albergue albergue, String fechaRecepcion, String nombreSuministro, String marcaSuministro, String horaRecepcion, String fecha, Foto foto) {
        this.donacionSuministrosID = donacionSuministrosID;
        this.usuario = usuario;
        this.albergue = albergue;
        this.fechaRecepcion = fechaRecepcion;
        this.nombreSuministro = nombreSuministro;
        this.marcaSuministro = marcaSuministro;
        this.horaRecepcion = horaRecepcion;
        this.fecha = fecha;
        this.foto = foto;
    }

    public String getFechaRecepcion() {
        return fechaRecepcion;
    }

    public void setFechaRecepcion(String fechaRecepcion) {
        this.fechaRecepcion = fechaRecepcion;
    }

    public String getNombreSuministro() {
        return nombreSuministro;
    }

    public void setNombreSuministro(String nombreSuministro) {
        this.nombreSuministro = nombreSuministro;
    }

    public String getMarcaSuministro() {
        return marcaSuministro;
    }

    public void setMarcaSuministro(String marcaSuministro) {
        this.marcaSuministro = marcaSuministro;
    }

    public String getHoraRecepcion() {
        return horaRecepcion;
    }

    public void setHoraRecepcion(String horaRecepcion) {
        this.horaRecepcion = horaRecepcion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
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
