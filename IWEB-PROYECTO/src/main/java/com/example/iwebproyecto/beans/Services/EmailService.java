package com.example.iwebproyecto.beans.Services;

import com.sendgrid.*;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class EmailService {

    private static final String SENDGRID_API_KEY = "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"; // Reemplaza con tu API Key

    private String cargarPlantilla(String rutaArchivo) {
        try {
            return new String(Files.readAllBytes(Paths.get(rutaArchivo)));
        } catch (IOException e) {
            System.err.println("Error al cargar la plantilla: " + e.getMessage());
            return null; // Retorna null si no se puede leer el archivo
        }
    }


    private String personalizarPlantilla(String plantilla, String nombreMascota, String emailUsuario) {
        if (plantilla == null) {
            return null; // Si la plantilla es nula, retorna null
        }
        return plantilla
                .replace("{{NOMBRE_MASCOTA}}", nombreMascota)
                .replace("{{EMAIL_USUARIO}}", emailUsuario);
    }

    public void enviarCorreoConfirmacionAdopcion(String emailUsuario, String nombreMascota) {

        Email from = new Email("soportepetcareperu@gmail.com"); // Cambia este correo al remitente válido
        Email to = new Email(emailUsuario); // Correo del destinatario
        String subject = "Confirmación de Inscripción para Adopción";



        // Mensaje de confirmación
        String contenido = "<h1>Gracias por tu interés en adoptar</h1>" +
                "<p>Has solicitado la adopción de <strong>" + nombreMascota + "</strong>.</p>" +
                "<p>En un lapso de 48 horas, el albergue encargado se contactará contigo.</p>";

        Content content = new Content("text/html", contenido); // Usa HTML para formatear el correo
        Mail mail = new Mail(from, subject, to, content);

        SendGrid sg = new SendGrid(SENDGRID_API_KEY);
        Request request = new Request();

        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());
            Response response = sg.api(request);

            System.out.println("Código de respuesta: " + response.getStatusCode());
            System.out.println("Cuerpo de la respuesta: " + response.getBody());
            System.out.println("Encabezados: " + response.getHeaders());
        } catch (IOException e) {
            System.err.println("Error al enviar el correo: " + e.getMessage());
        }
    }
}

