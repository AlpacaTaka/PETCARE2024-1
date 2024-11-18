package com.example.iwebproyecto.beans;

import java.time.LocalDate;
import java.time.LocalTime;

public class EventoBenefico {
    private int eventoAlbergueID;
    private String nombre;
    private String tipoDonacion;
    private Integer detalleMonetario;
    private String detalleSuministro;
    private Distrito distrito;
    private LocalDate fechaEvento;
    private LugarEvento lugar;
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private String razonEvento;
    private String descripcionEvento;
    private String invitados;
    private Foto foto;
    private Albergue albergue;
    private boolean aprobado;
    private boolean eliminado;

    // Constructor vacío
    public EventoBenefico() {}

    // Constructor con parámetros
    public EventoBenefico(int eventoAlbergueID, String nombre, String tipoDonacion, Integer detalleMonetario,
                          String detalleSuministro, Distrito distrito, LocalDate fechaEvento, LugarEvento lugar,
                          LocalTime horaInicio, LocalTime horaFin, String razonEvento, String descripcionEvento,
                          String invitados, Foto foto, Albergue albergue, boolean aprobado, boolean eliminado) {
        this.eventoAlbergueID = eventoAlbergueID;
        this.nombre = nombre;
        this.tipoDonacion = tipoDonacion;
        this.detalleMonetario = detalleMonetario;
        this.detalleSuministro = detalleSuministro;
        this.distrito = distrito;
        this.fechaEvento = fechaEvento;
        this.lugar = lugar;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.razonEvento = razonEvento;
        this.descripcionEvento = descripcionEvento;
        this.invitados = invitados;
        this.foto = foto;
        this.albergue = albergue;
        this.aprobado = aprobado;
        this.eliminado = eliminado;
    }

    // Getters y setters
    public int getEventoAlbergueID() {
        return eventoAlbergueID;
    }

    public void setEventoAlbergueID(int eventoAlbergueID) {
        this.eventoAlbergueID = eventoAlbergueID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoDonacion() {
        return tipoDonacion;
    }

    public void setTipoDonacion(String tipoDonacion) {
        this.tipoDonacion = tipoDonacion;
    }

    public Integer getDetalleMonetario() {
        return detalleMonetario;
    }

    public void setDetalleMonetario(Integer detalleMonetario) {
        this.detalleMonetario = detalleMonetario;
    }

    public String getDetalleSuministro() {
        return detalleSuministro;
    }

    public void setDetalleSuministro(String detalleSuministro) {
        this.detalleSuministro = detalleSuministro;
    }

    public Distrito getDistrito() {
        return distrito;
    }

    public void setDistrito(Distrito distrito) {
        this.distrito = distrito;
    }

    public LocalDate getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(LocalDate fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public LugarEvento getLugar() {
        return lugar;
    }

    public void setLugar(LugarEvento lugar) {
        this.lugar = lugar;
    }

    public LocalTime getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
    }

    public LocalTime getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(LocalTime horaFin) {
        this.horaFin = horaFin;
    }

    public String getRazonEvento() {
        return razonEvento;
    }

    public void setRazonEvento(String razonEvento) {
        this.razonEvento = razonEvento;
    }

    public String getDescripcionEvento() {
        return descripcionEvento;
    }

    public void setDescripcionEvento(String descripcionEvento) {
        this.descripcionEvento = descripcionEvento;
    }

    public String getInvitados() {
        return invitados;
    }

    public void setInvitados(String invitados) {
        this.invitados = invitados;
    }

    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;
    }

    public Albergue getAlbergue() {
        return albergue;
    }

    public void setAlbergue(Albergue albergue) {
        this.albergue = albergue;
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
}
