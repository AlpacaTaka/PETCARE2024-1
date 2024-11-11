package com.example.iwebproyecto.beans;

public class DenunciaMaltrato {
    private int denunciaID;

    private Usuario usuario;

    private String tamanio;
    private String raza;
    private String tipoMaltrato;
    private String nombreApellidoMaltratador;
    private String direccion;
    private int realizoDenuncia;
    private String especie;
    private String fecha;

    private Foto foto;

    // Constructor vacío
    public DenunciaMaltrato() {}

    // Constructor con todos los campos



    public DenunciaMaltrato(int denunciaID, Usuario usuario, String tamanio, String raza, String tipoMaltrato, String nombreApellidoMaltratador, String direccion, int realizoDenuncia, String especie, String fecha, Foto foto) {
        this.denunciaID = denunciaID;
        this.usuario = usuario;

        this.tamanio = tamanio;
        this.raza = raza;
        this.tipoMaltrato = tipoMaltrato;
        this.nombreApellidoMaltratador = nombreApellidoMaltratador;
        this.direccion = direccion;
        this.realizoDenuncia = realizoDenuncia;
        this.especie = especie;
        this.fecha = fecha;

        this.foto = foto;
    }


    //Getter and Setter
    public int getDenunciaID() {
        return denunciaID;
    }

    public void setDenunciaID(int denunciaID) {
        this.denunciaID = denunciaID;
    }

    public String getTamanio() {
        return tamanio;
    }

    public void setTamanio(String tamanio) {
        this.tamanio = tamanio;
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

    public int getRealizoDenuncia() {
        return realizoDenuncia;
    }

    public void setRealizoDenuncia(int realizoDenuncia) {
        this.realizoDenuncia = realizoDenuncia;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
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

    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;
    }

}
