package com.example.iwebproyecto.beans;

public class InscripcionEvento {
    private int inscripcionID;

    private Usuario usuario;
    private EventoBenefico evento;

    public InscripcionEvento() {}

    public InscripcionEvento(int inscripcionID, Usuario usuario, EventoBenefico evento) {
        this.inscripcionID = inscripcionID;
        this.usuario = usuario;
        this.evento = evento;

    }

    public int getInscripcionID() {
        return inscripcionID;
    }

    public void setInscripcionID(int inscripcionID) {
        this.inscripcionID = inscripcionID;
    }


    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public EventoBenefico getEvento() {
        return evento;
    }

    public void setEvento(EventoBenefico evento) {
        this.evento = evento;

    }
}
