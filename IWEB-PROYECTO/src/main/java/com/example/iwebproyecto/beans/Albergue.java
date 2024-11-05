package com.example.iwebproyecto.beans;

public class Albergue {
    private int albergueID;
    private String nombreAlbergue;
    private String nombreEncargado;
    private String apellidoEncargado;
    private int espaciosDisponibles;
    private String anioCreacion;
    private String correoElectronico;
    private String contrasenia;
    private int cantidadAnimales;
    private String urlFacebook;
    private String urlInstagram;
    private String direccion;
    private int distritoID;
    private String puntoAcopioDonaciones;
    private String direccionDonaciones;
    private String nombreContactoDonaciones;
    private String numeroContactoDonaciones;
    private String numeroYape;
    private String numeroPlin;
    private String codigoQR;
    private String estado; /*Estado:'Aprobado', 'Desaprobado'*/
    private int fotosFotoID;
    private String mensaje;

    // Constructor vacío
    public Albergue() {
    }

    // Constructor con todos los campos
    public Albergue(int albergueID, String nombreAlbergue, String nombreEncargado, String apellidoEncargado,
                   int espaciosDisponibles, String anioCreacion, String correoElectronico, String contrasenia,
                   int cantidadAnimales, String urlFacebook, String urlInstagram, String direccion,
                   int distritoID, String puntoAcopioDonaciones, String direccionDonaciones,
                   String nombreContactoDonaciones, String numeroContactoDonaciones,
                   String numeroYape, String numeroPlin, String codigoQR, String estado, int fotosFotoID, String mensaje) {
        this.albergueID = albergueID;
        this.nombreAlbergue = nombreAlbergue;
        this.nombreEncargado = nombreEncargado;
        this.apellidoEncargado = apellidoEncargado;
        this.espaciosDisponibles = espaciosDisponibles;
        this.anioCreacion = anioCreacion;
        this.correoElectronico = correoElectronico;
        this.contrasenia = contrasenia;
        this.cantidadAnimales = cantidadAnimales;
        this.urlFacebook = urlFacebook;
        this.urlInstagram = urlInstagram;
        this.direccion = direccion;
        this.distritoID = distritoID;
        this.puntoAcopioDonaciones = puntoAcopioDonaciones;
        this.direccionDonaciones = direccionDonaciones;
        this.nombreContactoDonaciones = nombreContactoDonaciones;
        this.numeroContactoDonaciones = numeroContactoDonaciones;
        this.numeroYape = numeroYape;
        this.numeroPlin = numeroPlin;
        this.codigoQR = codigoQR;
        this.estado = estado;
        this.fotosFotoID = fotosFotoID;
        this.mensaje = mensaje;
    }

    // Getters y Setters para cada campo

    public int getAlbergueID() {
        return albergueID;
    }

    public void setAlbergueID(int albergueID) {
        this.albergueID = albergueID;
    }

    public String getNombreAlbergue() {
        return nombreAlbergue;
    }

    public void setNombreAlbergue(String nombreAlbergue) {
        this.nombreAlbergue = nombreAlbergue;
    }

    public String getNombreEncargado() {
        return nombreEncargado;
    }

    public void setNombreEncargado(String nombreEncargado) {
        this.nombreEncargado = nombreEncargado;
    }

    public String getApellidoEncargado() {
        return apellidoEncargado;
    }

    public void setApellidoEncargado(String apellidoEncargado) {
        this.apellidoEncargado = apellidoEncargado;
    }

    public int getEspaciosDisponibles() {
        return espaciosDisponibles;
    }

    public void setEspaciosDisponibles(int espaciosDisponibles) {
        this.espaciosDisponibles = espaciosDisponibles;
    }

    public String getAnioCreacion() {
        return anioCreacion;
    }

    public void setAnioCreacion(String anioCreacion) {
        this.anioCreacion = anioCreacion;
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

    public int getCantidadAnimales() {
        return cantidadAnimales;
    }

    public void setCantidadAnimales(int cantidadAnimales) {
        this.cantidadAnimales = cantidadAnimales;
    }

    public String getUrlFacebook() {
        return urlFacebook;
    }

    public void setUrlFacebook(String urlFacebook) {
        this.urlFacebook = urlFacebook;
    }

    public String getUrlInstagram() {
        return urlInstagram;
    }

    public void setUrlInstagram(String urlInstagram) {
        this.urlInstagram = urlInstagram;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getDistritoID() {
        return distritoID;
    }

    public void setDistritoID(int distritoID) {
        this.distritoID = distritoID;
    }

    public String getPuntoAcopioDonaciones() {
        return puntoAcopioDonaciones;
    }

    public void setPuntoAcopioDonaciones(String puntoAcopioDonaciones) {
        this.puntoAcopioDonaciones = puntoAcopioDonaciones;
    }

    public String getDireccionDonaciones() {
        return direccionDonaciones;
    }

    public void setDireccionDonaciones(String direccionDonaciones) {
        this.direccionDonaciones = direccionDonaciones;
    }

    public String getNombreContactoDonaciones() {
        return nombreContactoDonaciones;
    }

    public void setNombreContactoDonaciones(String nombreContactoDonaciones) {
        this.nombreContactoDonaciones = nombreContactoDonaciones;
    }

    public String getNumeroContactoDonaciones() {
        return numeroContactoDonaciones;
    }

    public void setNumeroContactoDonaciones(String numeroContactoDonaciones) {
        this.numeroContactoDonaciones = numeroContactoDonaciones;
    }

    public String getNumeroYape() {
        return numeroYape;
    }

    public void setNumeroYape(String numeroYape) {
        this.numeroYape = numeroYape;
    }

    public String getNumeroPlin() {
        return numeroPlin;
    }

    public void setNumeroPlin(String numeroPlin) {
        this.numeroPlin = numeroPlin;
    }

    public String getCodigoQR() {
        return codigoQR;
    }

    public void setCodigoQR(String codigoQR) {
        this.codigoQR = codigoQR;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getFotosFotoID() {
        return fotosFotoID;
    }

    public void setFotosFotoID(int fotosFotoID) {
        this.fotosFotoID = fotosFotoID;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    // Metodo toString para facilitar la visualización del objeto
    @Override
    public String toString() {
        return "Albergue{" +
                "albergueID=" + albergueID +
                ", nombreEncargado='" + nombreEncargado + '\'' +
                ", apellidoEncargado='" + apellidoEncargado + '\'' +
                ", espaciosDisponibles='" + espaciosDisponibles + '\'' +
                ", anioCreacion='" + anioCreacion + '\'' +
                ", correoElectronico='" + correoElectronico + '\'' +
                ", contrasenia='" + contrasenia + '\'' +
                ", cantidadAnimales" + cantidadAnimales +
                ", urlFacebook='" + urlFacebook + '\'' +
                ", urlInstagram='" + urlInstagram + '\'' +
                ", direccion='" + direccion + '\'' +
                ", distritoID=" + distritoID +
                ", puntoAcopioDonaciones='" + puntoAcopioDonaciones + '\'' +
                ", direccionDonaciones='" + direccionDonaciones + '\'' +
                ", nombreContactoDonaciones='" + nombreContactoDonaciones + '\'' +
                ", numeroContactoDonaciones='" + numeroContactoDonaciones + '\'' +
                ", numeroYape='" + numeroYape + '\'' +
                ", numeroPlin='" + numeroPlin + '\'' +
                ", codigoQR='" + codigoQR + '\'' +
                ", estado='" + estado + '\'' +
                ", fotosFotoID=" + fotosFotoID +
                ", mensaje='" + mensaje + '\'' +
                '}';
    }

}
