package com.example.iwebproyecto.beans;

public class EventoBenefico {
    private int eventoAlbergueID;
    private String nombre;
    private String fechaEvento;
    private String horaInicio;
    private String horaFin;

    private Albergue albergue;

    private String tipoDonacion;
    private String descripcionEvento;
    private String invitados;
    private String razonEvento;
    private String estado;

    private LugarEvento lugar;
    private int aforo;
    private int entradaMonetaria;
    private String entradaSuministro;
    private Foto foto;

    private String fechaPublicacion;

    public EventoBenefico() {}


    public EventoBenefico(int eventoAlbergueID, String nombre, String fechaEvento, String horaInicio, String horaFin, Albergue albergue, String tipoDonacion, String descripcionEvento, String invitados, String razonEvento, String estado, LugarEvento lugar, int aforo, int entradaMonetaria, String entradaSuministro, Foto foto, String fechaPublicacion) {

        this.eventoAlbergueID = eventoAlbergueID;
        this.nombre = nombre;
        this.fechaEvento = fechaEvento;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;

        this.albergue = albergue;

        this.tipoDonacion = tipoDonacion;
        this.descripcionEvento = descripcionEvento;
        this.invitados = invitados;
        this.razonEvento = razonEvento;
        this.estado = estado;

        this.lugar = lugar;
        this.aforo = aforo;
        this.entradaMonetaria = entradaMonetaria;
        this.entradaSuministro = entradaSuministro;
        this.foto = foto;
        this.fechaPublicacion = fechaPublicacion;
    }


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

    public String getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(String fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(String horaFin) {
        this.horaFin = horaFin;
    }



    public String getTipoDonacion() {
        return tipoDonacion;
    }

    public void setTipoDonacion(String tipoDonacion) {
        this.tipoDonacion = tipoDonacion;
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

    public String getRazonEvento() {
        return razonEvento;
    }

    public void setRazonEvento(String razonEvento) {
        this.razonEvento = razonEvento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }



    public int getAforo() {
        return aforo;
    }

    public void setAforo(int aforo) {
        this.aforo = aforo;
    }

    public int getEntradaMonetaria() {
        return entradaMonetaria;
    }

    public void setEntradaMonetaria(int entradaMonetaria) {
        this.entradaMonetaria = entradaMonetaria;
    }

    public String getEntradaSuministro() {
        return entradaSuministro;
    }

    public void setEntradaSuministro(String entradaSuministro) {
        this.entradaSuministro = entradaSuministro;
    }



    public String getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(String fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }


    public Albergue getAlbergue() {
        return albergue;
    }

    public void setAlbergue(Albergue albergue) {
        this.albergue = albergue;
    }

    public LugarEvento getLugar() {
        return lugar;
    }

    public void setLugar(LugarEvento lugar) {
        this.lugar = lugar;
    }

    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;

    }
}
