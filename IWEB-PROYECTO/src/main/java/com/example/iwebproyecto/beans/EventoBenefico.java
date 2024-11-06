package com.example.iwebproyecto.beans;

public class EventoBenefico {
    private int eventoAlbergueID;
    private String nombre;
    private String fechaEvento;
    private String horaInicio;
    private String horaFin;
    private int albergueID;
    private String tipoDonacion;
    private String descripcionEvento;
    private String invitados;
    private String razonEvento;
    private String estado;
    private int lugarID;
    private int aforo;
    private int entradaMonetaria;
    private String entradaSuministro;
    private int fotos_FotoID;
    private String fechaPublicacion;

    public EventoBenefico() {}

    public EventoBenefico(int eventoAlbergueID, String nombre, String fechaEvento, String horaInicio, String horaFin,
                          int albergueID, String tipoDonacion, String descripcionEvento, String invitados, String razonEvento,
                          String estado, int lugarID, int aforo, int entradaMonetaria, String entradaSuministro, int fotos_FotoID, String fechaPublicacion){
        this.eventoAlbergueID = eventoAlbergueID;
        this.nombre = nombre;
        this.fechaEvento = fechaEvento;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.albergueID = albergueID;
        this.tipoDonacion = tipoDonacion;
        this.descripcionEvento = descripcionEvento;
        this.invitados = invitados;
        this.razonEvento = razonEvento;
        this.estado = estado;
        this.lugarID = lugarID;
        this.aforo = aforo;
        this.entradaMonetaria = entradaMonetaria;
        this.entradaSuministro = entradaSuministro;
        this.fotos_FotoID = fotos_FotoID;
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

    public int getAlbergueID() {
        return albergueID;
    }

    public void setAlbergueID(int albergueID) {
        this.albergueID = albergueID;
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

    public int getLugarID() {
        return lugarID;
    }

    public void setLugarID(int lugarID) {
        this.lugarID = lugarID;
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

    public int getFotos_FotoID() {
        return fotos_FotoID;
    }

    public void setFotos_FotoID(int fotos_FotoID) {
        this.fotos_FotoID = fotos_FotoID;
    }

    public String getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(String fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    @Override
    public String toString() {
        return "EventoBeneficio{" +
                "eventoAlbergueID=" + eventoAlbergueID + '\'' +
                ", nombre='" + nombre + '\'' +
                ", fechaEvento='" + fechaEvento + '\'' +
                ", horaInicio='" + horaInicio + '\'' +
                ", horaFin='" + horaFin + '\'' +
                ", albergueID=" + albergueID + '\'' +
                ", tipoDonacion='" + tipoDonacion + '\'' +
                ", descripcionEvento='" + descripcionEvento + '\'' +
                ", invitados='" + invitados + '\'' +
                ", razonEvento='" + razonEvento + '\'' +
                ", estado='" + estado + '\'' +
                ", lugarID=" + lugarID + '\'' +
                ", aforo=" + aforo + '\'' +
                ", entradaMonetaria=" + entradaMonetaria + '\'' +
                ", entradaSuministro='" + entradaSuministro + '\'' +
                ", fotoID='" + fotos_FotoID + '\'' +
                ", fechaPublicacion='" + fechaPublicacion +
                '}';
    }
}
