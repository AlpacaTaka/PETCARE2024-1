package com.example.iwebproyecto.beans;

public class DonacionMonetaria {
    private int donacionMonetariaID;
    private Usuario usuario; // Bean relacionado
    private Albergue albergue; // Bean relacionado
    private int cantidadMonetaria;
    private Integer eventoAlbergueID; // Puede ser NULL
    private Integer donacionSuministrosID; // Puede ser NULL
    private String fechaDonacionMonetaria;
    private String donacionSuministrosTitulo; // Nuevo: Título de la causa específica


    // Constructor vacío
    public DonacionMonetaria() {
    }

    // Constructor completo
    public DonacionMonetaria(int usuarioDonacionMonetariaID, Usuario usuario, Albergue albergue,
                                    int cantidadMonetaria, Integer eventoAlbergueID,
                                    Integer donacionSuministrosID, String fechaDonacionMonetaria) {
        this.donacionMonetariaID = usuarioDonacionMonetariaID;
        this.usuario = usuario;
        this.albergue = albergue;
        this.cantidadMonetaria = cantidadMonetaria;
        this.eventoAlbergueID = eventoAlbergueID;
        this.donacionSuministrosID = donacionSuministrosID;
        this.fechaDonacionMonetaria = fechaDonacionMonetaria;
    }

    public int getDonacionMonetariaID() {
        return donacionMonetariaID;
    }

    public void setDonacionMonetariaID(int donacionMonetariaID) {
        this.donacionMonetariaID = donacionMonetariaID;
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

    public int getCantidadMonetaria() {
        return cantidadMonetaria;
    }

    public void setCantidadMonetaria(int cantidadMonetaria) {
        this.cantidadMonetaria = cantidadMonetaria;
    }

    public Integer getEventoAlbergueID() {
        return eventoAlbergueID;
    }

    public void setEventoAlbergueID(Integer eventoAlbergueID) {
        this.eventoAlbergueID = eventoAlbergueID;
    }

    public Integer getDonacionSuministrosID() {
        return donacionSuministrosID;
    }

    public void setDonacionSuministrosID(Integer donacionSuministrosID) {
        this.donacionSuministrosID = donacionSuministrosID;
    }

    public String getFechaDonacionMonetaria() {
        return fechaDonacionMonetaria;
    }

    public void setFechaDonacionMonetaria(String fechaDonacionMonetaria) {
        this.fechaDonacionMonetaria = fechaDonacionMonetaria;
    }

    public String getDonacionSuministrosTitulo() {
        return donacionSuministrosTitulo;
    }

    public void setDonacionSuministrosTitulo(String donacionSuministrosTitulo) {
        this.donacionSuministrosTitulo = donacionSuministrosTitulo;
    }
}
