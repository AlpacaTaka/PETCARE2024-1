package com.example.iwebproyecto.beans;

import java.time.LocalDate;

public class DenunciaMaltrato {
    private int denunciaID;
    private Usuario usuario;
    private String tamanio; // Pequenio, Mediano, Grande
    private String especie;
    private String raza;
    private String tipoMaltrato;
    private String nombreApellidoMaltratador; // Puede ser null
    private String direccion;
    private Foto foto;
    private boolean realizoDenuncia;
    private boolean eliminado;
    private LocalDate fechaFormulario;

    public DenunciaMaltrato() {}

    // Constructor con parámetros
    public DenunciaMaltrato(int denunciaID, Usuario usuario, String tamanio, String especie, String raza,
                            String tipoMaltrato, String nombreApellidoMaltratador, String direccion, Foto foto,
                            boolean realizoDenuncia, boolean eliminado, LocalDate fechaFormulario) {
        this.denunciaID = denunciaID;
        this.usuario = usuario;
        this.tamanio = tamanio;
        this.especie = especie;
        this.raza = raza;
        this.tipoMaltrato = tipoMaltrato;
        this.nombreApellidoMaltratador = nombreApellidoMaltratador;
        this.direccion = direccion;
        this.foto = foto;
        this.realizoDenuncia = realizoDenuncia;
        this.eliminado = eliminado;
        this.fechaFormulario = fechaFormulario;
    }


    public int getDenunciaID() {
        return denunciaID;
    }

    public void setDenunciaID(int denunciaID) {
        this.denunciaID = denunciaID;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getTamanio() {
        return tamanio;
    }

    public void setTamanio(String tamanio) {
        this.tamanio = tamanio;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getTipoMaltrato() {
        return tipoMaltrato;
    }

    public void setTipoMaltrato(String tipoMaltrato) {
        this.tipoMaltrato = tipoMaltrato;
    }

    public String getNombreApellidoMaltratador() {
        return nombreApellidoMaltratador;
    }

    public void setNombreApellidoMaltratador(String nombreApellidoMaltratador) {
        this.nombreApellidoMaltratador = nombreApellidoMaltratador;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;
    }

    public boolean isRealizoDenuncia() {
        return realizoDenuncia;
    }

    public void setRealizoDenuncia(boolean realizoDenuncia) {
        this.realizoDenuncia = realizoDenuncia;
    }

    public boolean isEliminado() {
        return eliminado;
    }

    public void setEliminado(boolean eliminado) {
        this.eliminado = eliminado;
    }

    public LocalDate getFechaFormulario() {
        return fechaFormulario;
    }

    public void setFechaFormulario(LocalDate fechaFormulario) {
        this.fechaFormulario = fechaFormulario;
    }
}
