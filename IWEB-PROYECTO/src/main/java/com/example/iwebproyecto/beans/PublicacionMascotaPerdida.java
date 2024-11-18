package com.example.iwebproyecto.beans;

import java.time.LocalDate;
import java.time.LocalTime;

public class PublicacionMascotaPerdida {
    private int publicacionMascotaPerdidaID;
    private String descripcion;
    private String nombreMascota;
    private String distintivo;
    private int edadMascota;
    private String tamanio;
    private String especie;
    private String raza;
    private String descripcionAdicional;
    private String lugarPerdida;
    private LocalDate fechaPerdida;
    private LocalTime horaPerdida;
    private String nombreContacto;
    private String telefonoContacto;
    private Foto foto; // Relación con la clase Foto
    private boolean aniadirRecompensa;
    private Integer montoRecompensa; // Puede ser null
    private Usuario usuario;
    private Boolean aprobadoCoordinador; // Puede ser null
    private boolean mascotaEncontrada;
    private LocalDate fechaFormulario;

    public PublicacionMascotaPerdida() {}

    public PublicacionMascotaPerdida(int publicacionMascotaPerdidaID, String descripcion, String nombreMascota,
                                     String distintivo, int edadMascota, String tamanio, String especie, String raza,
                                     String descripcionAdicional, String lugarPerdida, LocalDate fechaPerdida,
                                     LocalTime horaPerdida, String nombreContacto, String telefonoContacto, Foto foto,
                                     boolean aniadirRecompensa, Integer montoRecompensa, Usuario usuario,
                                     Boolean aprobadoCoordinador, boolean mascotaEncontrada, LocalDate fechaFormulario) {
        this.publicacionMascotaPerdidaID = publicacionMascotaPerdidaID;
        this.descripcion = descripcion;
        this.nombreMascota = nombreMascota;
        this.distintivo = distintivo;
        this.edadMascota = edadMascota;
        this.tamanio = tamanio;
        this.especie = especie;
        this.raza = raza;
        this.descripcionAdicional = descripcionAdicional;
        this.lugarPerdida = lugarPerdida;
        this.fechaPerdida = fechaPerdida;
        this.horaPerdida = horaPerdida;
        this.nombreContacto = nombreContacto;
        this.telefonoContacto = telefonoContacto;
        this.foto = foto; // Relación con Foto
        this.aniadirRecompensa = aniadirRecompensa;
        this.montoRecompensa = montoRecompensa;
        this.usuario = usuario; // Relación con Usuario
        this.aprobadoCoordinador = aprobadoCoordinador;
        this.mascotaEncontrada = mascotaEncontrada;
        this.fechaFormulario = fechaFormulario;
    }

    public int getPublicacionMascotaPerdidaID() {
        return publicacionMascotaPerdidaID;
    }

    public void setPublicacionMascotaPerdidaID(int publicacionMascotaPerdidaID) {
        this.publicacionMascotaPerdidaID = publicacionMascotaPerdidaID;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombreMascota() {
        return nombreMascota;
    }

    public void setNombreMascota(String nombreMascota) {
        this.nombreMascota = nombreMascota;
    }

    public String getDistintivo() {
        return distintivo;
    }

    public void setDistintivo(String distintivo) {
        this.distintivo = distintivo;
    }

    public int getEdadMascota() {
        return edadMascota;
    }

    public void setEdadMascota(int edadMascota) {
        this.edadMascota = edadMascota;
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

    public String getDescripcionAdicional() {
        return descripcionAdicional;
    }

    public void setDescripcionAdicional(String descripcionAdicional) {
        this.descripcionAdicional = descripcionAdicional;
    }

    public String getLugarPerdida() {
        return lugarPerdida;
    }

    public void setLugarPerdida(String lugarPerdida) {
        this.lugarPerdida = lugarPerdida;
    }

    public LocalDate getFechaPerdida() {
        return fechaPerdida;
    }

    public void setFechaPerdida(LocalDate fechaPerdida) {
        this.fechaPerdida = fechaPerdida;
    }

    public LocalTime getHoraPerdida() {
        return horaPerdida;
    }

    public void setHoraPerdida(LocalTime horaPerdida) {
        this.horaPerdida = horaPerdida;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }

    public String getTelefonoContacto() {
        return telefonoContacto;
    }

    public void setTelefonoContacto(String telefonoContacto) {
        this.telefonoContacto = telefonoContacto;
    }

    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;
    }

    public boolean isAniadirRecompensa() {
        return aniadirRecompensa;
    }

    public void setAniadirRecompensa(boolean aniadirRecompensa) {
        this.aniadirRecompensa = aniadirRecompensa;
    }

    public Integer getMontoRecompensa() {
        return montoRecompensa;
    }

    public void setMontoRecompensa(Integer montoRecompensa) {
        this.montoRecompensa = montoRecompensa;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Boolean getAprobadoCoordinador() {
        return aprobadoCoordinador;
    }

    public void setAprobadoCoordinador(Boolean aprobadoCoordinador) {
        this.aprobadoCoordinador = aprobadoCoordinador;
    }

    public boolean isMascotaEncontrada() {
        return mascotaEncontrada;
    }

    public void setMascotaEncontrada(boolean mascotaEncontrada) {
        this.mascotaEncontrada = mascotaEncontrada;
    }

    public LocalDate getFechaFormulario() {
        return fechaFormulario;
    }

    public void setFechaFormulario(LocalDate fechaFormulario) {
        this.fechaFormulario = fechaFormulario;
    }
}
