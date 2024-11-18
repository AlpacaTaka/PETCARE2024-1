package com.example.iwebproyecto.beans;


public class Albergue {
    private int albergueID;
    private String nombreAlbergue;
    private String nombreEncargado;
    private String apellidoEncargado;
    private int espaciosDisponibles;
    private String fechaCreacion;
    private String correoElectronico;
    private String contrasenia;
    private int cantidadAnimales;
    private String urlFacebook;
    private String urlInstagram;
    private String direccion;

    private Distrito distrito;

    private String puntoAcopioDonaciones;
    private String direccionDonaciones;
    private String nombreContactoDonaciones;
    private String numeroContactoDonaciones;
    private String numeroYape;
    private String numeroPlin;
    private String codigoQR;
    private boolean aprobado; /*Estado:'Aprobado', 'Desaprobado'*/

    private Foto foto;
    private String mensaje;
    private boolean eliminado;
    private String fechaRegistrado;
    private String descripcion;


    // Constructor vacío
    public Albergue() {
    }

    // Constructor con todos los campos


    public Albergue(int albergueID, String nombreAlbergue, String nombreEncargado, String apellidoEncargado, int espaciosDisponibles, String fechaCreacion, String correoElectronico, int cantidadAnimales, String urlFacebook, String urlInstagram, String direccion, Distrito distrito, String puntoAcopioDonaciones, String direccionDonaciones, String nombreContactoDonaciones, String numeroContactoDonaciones, String numeroYape, String numeroPlin, String codigoQR, boolean aprobado, Foto foto, String mensaje, boolean eliminado) {

        this.albergueID = albergueID;
        this.nombreAlbergue = nombreAlbergue;
        this.nombreEncargado = nombreEncargado;
        this.apellidoEncargado = apellidoEncargado;
        this.espaciosDisponibles = espaciosDisponibles;
        this.fechaCreacion = fechaCreacion;
        this.correoElectronico = correoElectronico;;
        this.cantidadAnimales = cantidadAnimales;
        this.urlFacebook = urlFacebook;
        this.urlInstagram = urlInstagram;
        this.direccion = direccion;

        this.distrito = distrito;

        this.puntoAcopioDonaciones = puntoAcopioDonaciones;
        this.direccionDonaciones = direccionDonaciones;
        this.nombreContactoDonaciones = nombreContactoDonaciones;
        this.numeroContactoDonaciones = numeroContactoDonaciones;
        this.numeroYape = numeroYape;
        this.numeroPlin = numeroPlin;
        this.codigoQR = codigoQR;
        this.aprobado = aprobado;

        this.foto = foto;

        this.mensaje = mensaje;
        this.eliminado = eliminado;
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




    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }


    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public boolean isAprobado() {
        return aprobado;
    }

    public void setAprobado(boolean aprobado) {
        this.aprobado = aprobado;
    }

    public boolean isEliminado() {
        return eliminado;
    }

    public void setEliminado(boolean eliminado) {
        this.eliminado = eliminado;
    }

    public String getFechaRegistrado() {
        return fechaRegistrado;
    }

    public void setFechaRegistrado(String fechaRegistrado) {
        this.fechaRegistrado = fechaRegistrado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;
    }

    public Distrito getDistrito() {
        return distrito;
    }

    public void setDistrito(Distrito distrito) {
        this.distrito = distrito;
    }

}
