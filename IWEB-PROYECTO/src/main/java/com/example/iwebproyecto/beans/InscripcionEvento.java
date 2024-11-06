package com.example.iwebproyecto.beans;

public class InscripcionEvento {
    private int inscripcionID;
    private int usuarioID;
    private int eventoID;

    public InscripcionEvento() {}

    public InscripcionEvento(int inscripcionID, int usuarioID, int eventoID) {
        this.inscripcionID = inscripcionID;
        this.usuarioID = usuarioID;
        this.eventoID = eventoID;
    }

    public int getInscripcionID() {
        return inscripcionID;
    }

    public void setInscripcionID(int inscripcionID) {
        this.inscripcionID = inscripcionID;
    }

    public int getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(int usuarioID) {
        this.usuarioID = usuarioID;
    }

    public int getEventoID() {
        return eventoID;
    }

    public void setEventoID(int eventoID) {
        this.eventoID = eventoID;
    }
}
