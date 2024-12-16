package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.DonacionMonetaria;
import com.example.iwebproyecto.beans.UsuarioDonacionSuministro;
import com.example.iwebproyecto.daos.DonacionesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

@WebServlet(name = "MisDonacionesUsuarioServlet", value = "/MisDonacionesUsuario")
public class MisDonacionesUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        int usuarioId = 7;
        DonacionesDao donacionDao = new DonacionesDao();

        switch (action) {
            case "lista":
                double totalDonado = donacionDao.obtenerTotalDonadoPorUsuario(usuarioId);
                request.setAttribute("totalDonado", totalDonado);
                DonacionesDao donacionesDao = new DonacionesDao();
                ArrayList<UsuarioDonacionSuministro> suministros = donacionesDao.listarDonacionesPorUsuarioConAlbergue(usuarioId);

                // Establecer la lista en los atributos de la solicitud
                request.setAttribute("suministros", suministros);

                request.getRequestDispatcher("/user/misDonaciones.jsp").forward(request, response);
                break;

            case "consultar":
                // Acción para generar y descargar el Excel
                ArrayList<DonacionMonetaria> listaDonaciones = donacionDao.listarDonacionesMonetariasPorUsuario(usuarioId);

                // Configuración para el archivo Excel
                response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                response.setHeader("Content-Disposition", "attachment; filename=\"detalle_donaciones.xlsx\"");

                Workbook workbook = new XSSFWorkbook();
                Sheet sheet = workbook.createSheet("Detalle Donaciones");

                // Crear encabezado
                Row headerRow = sheet.createRow(0);
                String[] headers = {"Fecha", "Nombre del Albergue", "Causa", "Monto Donado"};
                for (int i = 0; i < headers.length; i++) {
                    Cell cell = headerRow.createCell(i);
                    cell.setCellValue(headers[i]);
                }

                // Llenar los datos
                int rowNum = 1;
                for (DonacionMonetaria donacion : listaDonaciones) {
                    Row row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(donacion.getFechaDonacionMonetaria());
                    row.createCell(1).setCellValue(donacion.getAlbergue().getNombreAlbergue());
                    row.createCell(2).setCellValue(donacion.getDonacionSuministrosTitulo());
                    row.createCell(3).setCellValue(donacion.getCantidadMonetaria());
                }

                // Escribir en la respuesta
                try (OutputStream out = response.getOutputStream()) {
                    workbook.write(out);
                }
                workbook.close();
                break;
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

