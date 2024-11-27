package com.example.iwebproyecto.beans;

import java.time.LocalDate;

public class Usuario {
    private int usuarioID;
    private String nombre;
    private String apellido;
    private String dni;
    private String direccion;
    private String correoElectronico;
    private boolean activo;

    private Distrito distrito;
    private Foto foto;
    private boolean eliminado;

    private LocalDate fechaRegistrado;

    public Usuario(int usuarioID, String nombre, String apellido, String dni, String direccion, String correoElectronico, String contrasenia, boolean activo, Distrito distrito, Foto foto, boolean eliminado) {

        this.usuarioID = usuarioID;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
        this.correoElectronico = correoElectronico;
        this.activo = activo;

        this.distrito = distrito;
        this.foto = foto;
        this.eliminado = eliminado;
    }

    public Usuario() {

    }


    public int getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(int usuarioID) {
        this.usuarioID = usuarioID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }



    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public boolean isEliminado() {
        return eliminado;
    }

    public void setEliminado(boolean eliminado) {
        this.eliminado = eliminado;
    }

    public Distrito getDistrito() {
        return distrito;

    }

    public void setDistrito(Distrito distrito) {
        this.distrito = distrito;
    }

    public Foto getFoto() {
        return foto;
    }


    public void setFoto(Foto foto) {
        this.foto = foto;

    }
    public LocalDate getFechaRegistrado() {
        return fechaRegistrado;
    }

    public void setFechaRegistrado(LocalDate fechaRegistrado) {
        this.fechaRegistrado = fechaRegistrado;
    }
}
