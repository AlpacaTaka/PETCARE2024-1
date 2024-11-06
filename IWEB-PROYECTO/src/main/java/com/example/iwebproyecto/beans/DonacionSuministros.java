package com.example.iwebproyecto.beans;

public class DonacionSuministros {
    private int donacionSuministrosID;
    private int usuarioID;
    private int albergueID;
    private String fechaRecepcion;
    private String nombreSuministro;
    private String marcaSuministro;
    private String horaRecepcion;
    private String fecha;
    private int fotoID;

    public DonacionSuministros() {}

    public DonacionSuministros(int donacionSuministrosID, int usuarioID, int albergueID, String fechaRecepcion,
                               String nombreSuministro, String marcaSuministro, String horaRecepcion, String fecha, int fotoID){
        this.donacionSuministrosID = donacionSuministrosID;
        this.usuarioID = usuarioID;
        this.albergueID = albergueID;
        this.fechaRecepcion = fechaRecepcion;
        this.nombreSuministro = nombreSuministro;
        this.marcaSuministro = marcaSuministro;
        this.horaRecepcion = horaRecepcion;
        this.fecha = fecha;
        this.fotoID = fotoID;
    }

    public int getDonacionSuministrosID() {
        return donacionSuministrosID;
    }

    public void setDonacionSuministrosID(int donacionSuministrosID) {
        this.donacionSuministrosID = donacionSuministrosID;
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

    public int getFotoID() {
        return fotoID;
    }

    public void setFotoID(int fotoID) {
        this.fotoID = fotoID;
    }
}
