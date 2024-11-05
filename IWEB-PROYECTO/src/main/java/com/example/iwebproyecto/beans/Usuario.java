package com.example.iwebproyecto.beans;

public class Usuario {
    private int usuarioID;
    private String nombre;
    private String apellido;
    private String dni;
    private String direccion;
    private String correoElectronico;
    private String contrasenia;
    private String estado;
    private int distritoID;
    private int fotosFotoID;
    private int flag;/*Temporal*/

    // Constructor vacío
    public Usuario() {
    }

    // Constructor con todos los campos
    public Usuario(int usuarioID, String nombre, String apellido, String dni, String direccion, String correoElectronico,
                   String contrasenia, String estado, int distritoID, int fotosFotoID, int flag) {
        this.usuarioID = usuarioID;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
        this.correoElectronico = correoElectronico;
        this.contrasenia = contrasenia;
        this.estado = estado;
        this.distritoID = distritoID;
        this.fotosFotoID = fotosFotoID;
        this.flag = flag;
    }

    // Getters y Setters para cada campo
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

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getDistritoID() {
        return distritoID;
    }

    public void setDistritoID(int distritoID) {
        this.distritoID = distritoID;
    }

    public int getFotosFotoID() {
        return fotosFotoID;
    }

    public void setFotosFotoID(int fotosFotoID) {
        this.fotosFotoID = fotosFotoID;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    // Metodo toString para facilitar la visualización del objeto
    @Override
    public String toString() {
        return "Usuario{" +
                "usuarioID=" + usuarioID +
                ", nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", dni='" + dni + '\'' +
                ", direccion='" + direccion + '\'' +
                ", correoElectronico='" + correoElectronico + '\'' +
                ", contrasenia='" + contrasenia + '\'' +
                ", estado='" + estado + '\'' +
                ", distritoID=" + distritoID +
                ", fotosFotoID=" + fotosFotoID +
                ", flag=" + flag +
                '}';
    }
}
