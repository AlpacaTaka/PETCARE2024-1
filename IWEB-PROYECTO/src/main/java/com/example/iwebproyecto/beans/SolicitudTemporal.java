package com.example.iwebproyecto.beans;

public class SolicitudTemporal {
    private int solicitudID;
    private Usuario usuario;
    private int edad;
    private String genero;
    private String celular;
    private int cantidadCuartos;
    private int metrajeVivienda;
    private int tieneMascotas;
    private int cantidadMascota;
    private String tipoMascota;
    private int tieneHijos;
    private int viveSolo;
    private int trabajaRemoto;
    private String nombrePersonaReferencia;
    private String numeroContactoPR;
    private int tiempoTemporal;
    private String inicioTemporal;
    private String finTemporal;
    private String estado;
    private Foto foto;
    private String fecha;
    private String estadoTemporal;
    private String comentario;
    private int numeroRechazos;

    public SolicitudTemporal() {}

    public SolicitudTemporal(int solicitudID, Usuario usuario, int edad, String genero, String celular, int cantidadCuartos, int metrajeVivienda, int tieneMascotas, int cantidadMascota, String tipoMascota, int tieneHijos, int viveSolo, int trabajaRemoto, String nombrePersonaReferencia, String numeroContactoPR, int tiempoTemporal, String inicioTemporal, String finTemporal, String estado, Foto foto, String fecha, String estadoTemporal, String comentario, int numeroRechazos) {
        this.solicitudID = solicitudID;
        this.usuario = usuario;
        this.edad = edad;
        this.genero = genero;
        this.celular = celular;
        this.cantidadCuartos = cantidadCuartos;
        this.metrajeVivienda = metrajeVivienda;
        this.tieneMascotas = tieneMascotas;
        this.cantidadMascota = cantidadMascota;
        this.tipoMascota = tipoMascota;
        this.tieneHijos = tieneHijos;
        this.viveSolo = viveSolo;
        this.trabajaRemoto = trabajaRemoto;
        this.nombrePersonaReferencia = nombrePersonaReferencia;
        this.numeroContactoPR = numeroContactoPR;
        this.tiempoTemporal = tiempoTemporal;
        this.inicioTemporal = inicioTemporal;
        this.finTemporal = finTemporal;
        this.estado = estado;
        this.foto = foto;
        this.fecha = fecha;
        this.estadoTemporal = estadoTemporal;
        this.comentario = comentario;
        this.numeroRechazos = numeroRechazos;
    }

    public int getSolicitudID() {
        return solicitudID;
    }

    public void setSolicitudID(int solicitudID) {
        this.solicitudID = solicitudID;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public int getCantidadCuartos() {
        return cantidadCuartos;
    }

    public void setCantidadCuartos(int cantidadCuartos) {
        this.cantidadCuartos = cantidadCuartos;
    }

    public int getMetrajeVivienda() {
        return metrajeVivienda;
    }

    public void setMetrajeVivienda(int metrajeVivienda) {
        this.metrajeVivienda = metrajeVivienda;
    }

    public int getTieneMascotas() {
        return tieneMascotas;
    }

    public void setTieneMascotas(int tieneMascotas) {
        this.tieneMascotas = tieneMascotas;
    }

    public int getCantidadMascota() {
        return cantidadMascota;
    }

    public void setCantidadMascota(int cantidadMascota) {
        this.cantidadMascota = cantidadMascota;
    }

    public String getTipoMascota() {
        return tipoMascota;
    }

    public void setTipoMascota(String tipoMascota) {
        this.tipoMascota = tipoMascota;
    }

    public int getTieneHijos() {
        return tieneHijos;
    }

    public void setTieneHijos(int tieneHijos) {
        this.tieneHijos = tieneHijos;
    }

    public int getViveSolo() {
        return viveSolo;
    }

    public void setViveSolo(int viveSolo) {
        this.viveSolo = viveSolo;
    }

    public int getTrabajaRemoto() {
        return trabajaRemoto;
    }

    public void setTrabajaRemoto(int trabajaRemoto) {
        this.trabajaRemoto = trabajaRemoto;
    }

    public String getNombrePersonaReferencia() {
        return nombrePersonaReferencia;
    }

    public void setNombrePersonaReferencia(String nombrePersonaReferencia) {
        this.nombrePersonaReferencia = nombrePersonaReferencia;
    }

    public String getNumeroContactoPR() {
        return numeroContactoPR;
    }

    public void setNumeroContactoPR(String numeroContactoPR) {
        this.numeroContactoPR = numeroContactoPR;
    }

    public int getTiempoTemporal() {
        return tiempoTemporal;
    }

    public void setTiempoTemporal(int tiempoTemporal) {
        this.tiempoTemporal = tiempoTemporal;
    }

    public String getInicioTemporal() {
        return inicioTemporal;
    }

    public void setInicioTemporal(String inicioTemporal) {
        this.inicioTemporal = inicioTemporal;
    }

    public String getFinTemporal() {
        return finTemporal;
    }

    public void setFinTemporal(String finTemporal) {
        this.finTemporal = finTemporal;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }


    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstadoTemporal() {
        return estadoTemporal;
    }

    public void setEstadoTemporal(String estadoTemporal) {
        this.estadoTemporal = estadoTemporal;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getNumeroRechazos() {
        return numeroRechazos;
    }

    public void setNumeroRechazos(int numeroRechazos) {
        this.numeroRechazos = numeroRechazos;
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
