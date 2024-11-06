package com.example.iwebproyecto.beans;

public class DenunciaMaltrato {
    private int denunciaID;
    private int usuarioID;
    private String tamanio;
    private String raza;
    private String tipoMaltrato;
    private String nombreApellidoMaltratador;
    private String direccion;
    private int realizoDenuncia;
    private String especie;
    private String fecha;
    private int fotoID;

    // Constructor vacío
    public DenunciaMaltrato() {}

    // Constructor con todos los campos
    public DenunciaMaltrato(int denunciaID, int usuarioID, String tamanio, String raza, String tipoMaltrato,
                            String nombreApellidoMaltratador, String direccion, int realizoDenuncia, String especie,
                            String fecha, int fotoID){
        this.denunciaID = denunciaID;
        this.usuarioID = usuarioID;
        this.tamanio = tamanio;
        this.raza = raza;
        this.tipoMaltrato = tipoMaltrato;
        this.nombreApellidoMaltratador = nombreApellidoMaltratador;
        this.direccion = direccion;
        this.realizoDenuncia = realizoDenuncia;
        this.especie = especie;
        this.fecha = fecha;
        this.fotoID = fotoID;
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

    public int getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(int usuarioID) {
        this.usuarioID = usuarioID;
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

    public int getFotoID() {
        return fotoID;
    }

    public void setFotoID(int fotoID) {
        this.fotoID = fotoID;
    }

    @Override
    public String toString() {
        return "DenunciaMaltrato{" +
                "denunciaID=" + denunciaID+
                ", usuarioID='" + usuarioID + '\'' +
                ", tamanio='" + tamanio + '\'' +
                ", raza='" + raza + '\'' +
                ", tipoMaltrato='" + tipoMaltrato + '\'' +
                ", nombreApellidoMaltratador='" + nombreApellidoMaltratador + '\'' +
                ", direccion='" + direccion + '\'' +
                ", realizoDenuncia=" + realizoDenuncia + '\'' +
                ", especie='" + especie + '\'' +
                ", fecha='" + fecha + '\'' +
                ", fotoID=" + fotoID +
                '}';
    }

}
