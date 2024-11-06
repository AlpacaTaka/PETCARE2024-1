package com.example.iwebproyecto.beans;

public class PublicacionMascotaPerdida {
    private int publicacionID;
    private int usuarioID;
    private String descripcion;
    private String nombreContacto;
    private int edad;
    private String raza;
    private String tamanio; /*'Pequeño', 'Mediano', 'Grande'*/
    private String distintivo;
    private String descripcionAdicional;
    private String lugarPerdida;
    private String horaPerdida;
    private String telefonoContacto;
    private int recompensa;
    private String estado;/*'Pendiente', 'Aceptado', 'Rechazado'*/
    private int fotoID;/*Fotos_fotoID*/
    private String fechaPerdida;
    private String especie;
    private String fecha;
    private String nombre;
    private String estadoMascota;
    private String comentario;

    // Constructor vacío
    public PublicacionMascotaPerdida() {
    }

    // Constructor con todos los campos
    public PublicacionMascotaPerdida(int publicacionID, int usuarioID, String descripcion, String nombreContacto,int edad, String raza,
                                    String tamanio, String distintivo, String descripcionAdicional, String lugarPerdida, String horaPerdida,
                                    String telefonoContacto, int recompensa, String estado, int fotoID, String fechaPerdida, String especie, String fecha,
                                    String nombre, String estadoMascota, String comentario) {
        this.publicacionID = publicacionID;
        this.usuarioID = usuarioID;
        this.descripcion = descripcion;
        this.nombreContacto = nombreContacto;
        this.edad = edad;
        this.raza = raza;
        this.tamanio = tamanio;
        this.distintivo = distintivo;
        this.descripcionAdicional = descripcionAdicional;
        this.lugarPerdida = lugarPerdida;
        this.horaPerdida = horaPerdida;
        this.telefonoContacto = telefonoContacto;
        this.recompensa = recompensa;
        this.estado = estado;
        this.fotoID = fotoID;
        this.fechaPerdida = fechaPerdida;
        this.especie = especie;
        this.fecha = fecha;
        this.nombre = nombre;
        this.estadoMascota = estadoMascota;
        this.comentario = comentario;
    }

    public int getPublicacionID() {
        return publicacionID;
    }

    public void setPublicacionID(int publicacionID) {
        this.publicacionID = publicacionID;
    }

    public int getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(int usuarioID) {
        this.usuarioID = usuarioID;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getTamanio() {
        return tamanio;
    }

    public void setTamanio(String tamanio) {
        this.tamanio = tamanio;
    }

    public String getDistintivo() {
        return distintivo;
    }

    public void setDistintivo(String distintivo) {
        this.distintivo = distintivo;
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

    public String getTelefonoContacto() {
        return telefonoContacto;
    }

    public void setTelefonoContacto(String telefonoContacto) {
        this.telefonoContacto = telefonoContacto;
    }

    public String getHoraPerdida() {
        return horaPerdida;
    }

    public void setHoraPerdida(String horaPerdida) {
        this.horaPerdida = horaPerdida;
    }

    public int getRecompensa() {
        return recompensa;
    }

    public void setRecompensa(int recompensa) {
        this.recompensa = recompensa;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFechaPerdida() {
        return fechaPerdida;
    }

    public void setFechaPerdida(String fechaPerdida) {
        this.fechaPerdida = fechaPerdida;
    }

    public int getFotoID() {
        return fotoID;
    }

    public void setFotoID(int fotoID) {
        this.fotoID = fotoID;
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstadoMascota() {
        return estadoMascota;
    }

    public void setEstadoMascota(String estadoMascota) {
        this.estadoMascota = estadoMascota;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    // Metodo toString para facilitar la visualización del objeto
    @Override
    public String toString() {
        return "PublicacionMascotaPerdida{" +
                "publicacionID=" + publicacionID +
                ", usuarioID='" + usuarioID + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", nombreContacto='" + nombreContacto + '\'' +
                ", edad='" + edad +'\'' +
                ", raza='" + raza + '\'' +
                ", tamanio='" + tamanio + '\'' +
                ", distintivo='" + distintivo + '\'' +
                ", descripcionAdicional='" + descripcionAdicional + '\'' +
                ", lugarPerdida='" + lugarPerdida + '\'' +
                ", horaPerdida='" + horaPerdida + '\'' +
                ", telefonoContacto='" + telefonoContacto + '\'' +
                ", recompensa='" + recompensa + '\'' +
                ", estado='" + estado + '\'' +
                ", fotoID=" + fotoID + '\'' +
                ", fechaPerdida='" + fechaPerdida + '\'' +
                ", especie='" + especie + '\'' +
                ", fecha=" + fecha +
                ", nombre='" + nombre + '\'' +
                ", estadoMascota='" + estadoMascota + '\'' +
                ", comentario='" + comentario +
                '}';
    }

}
