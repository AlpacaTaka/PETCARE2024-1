package com.example.iwebproyecto.beans;

public class DonacionSuministros {
    private int donacionSuministrosID;
    private String tituloAvisoDonacion;
    private String correoElectronicoDonacion;
    private String tipoSuministro;
    private String nombreSuministro;
    private int cantidadDonacionesTotales;

    private String marcaSuministro;

    private Distrito distrito;

    private Albergue albergue;

    private String fechaInicioRecepcion;
    private String fechaFinRecepcion;
    private String horaInicioRecepcion;
    private String horaFinRecepcion;
    private Foto foto;

    private String mensajeParaDonantes;
    private boolean eliminado;

    public boolean isEliminado() {
        return eliminado;
    }

    public void setEliminado(boolean eliminado) {
        this.eliminado = eliminado;
    }

    public DonacionSuministros() {}



    public int getDonacionSuministrosID() {
        return donacionSuministrosID;
    }

    public void setDonacionSuministrosID(int donacionSuministrosID) {
        this.donacionSuministrosID = donacionSuministrosID;
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


    public String getTituloAvisoDonacion() {
        return tituloAvisoDonacion;
    }

    public void setTituloAvisoDonacion(String tituloAvisoDonacion) {
        this.tituloAvisoDonacion = tituloAvisoDonacion;
    }

    public String getCorreoElectronicoDonacion() {
        return correoElectronicoDonacion;
    }

    public void setCorreoElectronicoDonacion(String correoElectronicoDonacion) {
        this.correoElectronicoDonacion = correoElectronicoDonacion;
    }

    public String getTipoSuministro() {
        return tipoSuministro;
    }

    public void setTipoSuministro(String tipoSuministro) {
        this.tipoSuministro = tipoSuministro;
    }

    public int getCantidadDonacionesTotales() {
        return cantidadDonacionesTotales;
    }

    public void setCantidadDonacionesTotales(int cantidadDonacionesTotales) {
        this.cantidadDonacionesTotales = cantidadDonacionesTotales;
    }

    public Distrito getDistrito() {
        return distrito;
    }

    public void setDistrito(Distrito distrito) {
        this.distrito = distrito;
    }

    public String getFechaInicioRecepcion() {
        return fechaInicioRecepcion;
    }

    public void setFechaInicioRecepcion(String fechaInicioRecepcion) {
        this.fechaInicioRecepcion = fechaInicioRecepcion;
    }

    public String getFechaFinRecepcion() {
        return fechaFinRecepcion;
    }

    public void setFechaFinRecepcion(String fechaFinRecepcion) {
        this.fechaFinRecepcion = fechaFinRecepcion;
    }

    public String getHoraInicioRecepcion() {
        return horaInicioRecepcion;
    }

    public void setHoraInicioRecepcion(String horaInicioRecepcion) {
        this.horaInicioRecepcion = horaInicioRecepcion;
    }

    public String getHoraFinRecepcion() {
        return horaFinRecepcion;
    }

    public void setHoraFinRecepcion(String horaFinRecepcion) {
        this.horaFinRecepcion = horaFinRecepcion;
    }

    public String getMensajeParaDonantes() {
        return mensajeParaDonantes;
    }

    public void setMensajeParaDonantes(String mensajeParaDonantes) {
        this.mensajeParaDonantes = mensajeParaDonantes;
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
