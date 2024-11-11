package com.example.iwebproyecto.beans;

public class MascotasTemporal {
    private int idMascotaTemporal;
    private String estadoUsuario;

    private Usuario usuario;
    private Albergue albergue;

    private String estado;
    private String raza;
    private String especie;
    private String tamanio;
    private int peso;
    private int edad;
    private String sexo;
    private int poseeDiscapacidad;
    private int descripcionDiscapacidad;

    private Foto foto;

    private String fecha;

    public MascotasTemporal() {}

    public MascotasTemporal(int idMascotaTemporal, String estadoUsuario, Usuario usuario, Albergue albergue, String estado, String raza, String especie, String tamanio, int peso, int edad, String sexo, int poseeDiscapacidad, int descripcionDiscapacidad, Foto foto, String fecha) {
        this.idMascotaTemporal = idMascotaTemporal;
        this.estadoUsuario = estadoUsuario;
        this.usuario = usuario;
        this.albergue = albergue;

        this.estado = estado;
        this.raza = raza;
        this.especie = especie;
        this.tamanio = tamanio;
        this.peso = peso;
        this.edad = edad;
        this.sexo = sexo;
        this.poseeDiscapacidad = poseeDiscapacidad;
        this.descripcionDiscapacidad = descripcionDiscapacidad;

        this.foto = foto;

        this.fecha = fecha;
    }

    public int getIdMascotaTemporal() {
        return idMascotaTemporal;
    }

    public void setIdMascotaTemporal(int idMascotaTemporal) {
        this.idMascotaTemporal = idMascotaTemporal;
    }

    public String getEstadoUsuario() {
        return estadoUsuario;
    }

    public void setEstadoUsuario(String estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }



    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getTamanio() {
        return tamanio;
    }

    public void setTamanio(String tamanio) {
        this.tamanio = tamanio;
    }

    public int getPeso() {
        return peso;
    }

    public void setPeso(int peso) {
        this.peso = peso;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getPoseeDiscapacidad() {
        return poseeDiscapacidad;
    }

    public void setPoseeDiscapacidad(int poseeDiscapacidad) {
        this.poseeDiscapacidad = poseeDiscapacidad;
    }

    public int getDescripcionDiscapacidad() {
        return descripcionDiscapacidad;
    }

    public void setDescripcionDiscapacidad(int descripcionDiscapacidad) {
        this.descripcionDiscapacidad = descripcionDiscapacidad;
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
