package servlet;

import java.io.IOException;
import java.util.List;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Image;
import com.itextpdf.text.BadElementException;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mante.CarritoDAO;
import modelos.CarritoItem;

@WebServlet("/PagoServlet")
public class PagoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int removeProductId = Integer.parseInt(request.getParameter("removeProductId"));

        CarritoDAO carritoDAO = new CarritoDAO();
        boolean success = carritoDAO.eliminarProducto(removeProductId);

        if (success) {
            // Obtener la lista actualizada de elementos del carrito
            List<CarritoItem> carritoItems = carritoDAO.getCarritoItems();
            
            double nuevoTotalPagar = 0; // Variable para almacenar el nuevo total a pagar
            
            // Calcular el nuevo total a pagar sumando los precios de los productos restantes
            for (CarritoItem item : carritoItems) {
                nuevoTotalPagar += item.getPrecio();
            }
            
            // Actualizar el total a pagar en la sesión
            HttpSession session = request.getSession();
            session.setAttribute("totalPagar", nuevoTotalPagar);
            
            // Después de eliminar el producto con éxito
            session.setAttribute("Eliminado", true);
            response.sendRedirect("Pago.jsp");

        } else {
            response.sendRedirect("Principal.jsp");
        }
    }

    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica para generar el PDF y abrirlo en una pestaña del navegador
    	
        generarPDF(request, response);

      
    }

    protected void generarPDF(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los datos del carrito de compras
        CarritoDAO carritoDAO = new CarritoDAO();
        List<CarritoItem> carritoItems = carritoDAO.getCarritoItems();

        double totalPagar = 0;
        // Calcular el total a pagar y realizar otras operaciones necesarias
        for (CarritoItem item : carritoItems) {
            totalPagar += item.getPrecio();
        }

        try {
            // Crear un nuevo documento PDF
            Document document = new Document();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);

            // Configurar el estilo del documento
            document.open();
            
            // Configurar los estilos de fuente
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 24, BaseColor.DARK_GRAY);
           
            Font dataFont = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLUE);

            Font totalFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, BaseColor.RED);

            // Agregar el título al PDF
            Paragraph title = new Paragraph("BOLETA DE PAGO", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            title.setSpacingAfter(20f);
            document.add(title);
            
            String imagePath = "https://img.freepik.com/vector-premium/logotipo-inicial-kc-clavos-plantilla-vector-belleza-spa-cosmeticos-lujo_615068-3965.jpg?w=2000";

            try {
                // Crear una tabla de dos columnas
                PdfPTable table = new PdfPTable(2);
                table.setWidthPercentage(100);

                // Configurar las proporciones de ancho de las columnas
                float[] columnWidths = { 0.3f, 0.7f };
                table.setWidths(columnWidths);

                // Agregar la imagen a la primera columna
                Image image = Image.getInstance(imagePath);
                image.scaleToFit(100, 100);

                PdfPCell imageCell = new PdfPCell(image);
                imageCell.setBorder(Rectangle.NO_BORDER);
                imageCell.setHorizontalAlignment(Element.ALIGN_CENTER); // Centrar la imagen horizontalmente
                imageCell.setVerticalAlignment(Element.ALIGN_MIDDLE); // Centrar la imagen verticalmente
                imageCell.setFixedHeight(80); // Ajustar la altura fija de la celda (ajusta este valor según tu preferencia)
                table.addCell(imageCell);

                // Agregar los datos de la empresa a la segunda columna
                Font subtitleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, BaseColor.BLACK);
                PdfPCell companyInfoCell = new PdfPCell();

                Paragraph companyInfo = new Paragraph();
                companyInfo.setAlignment(Element.ALIGN_CENTER);

                Chunk companyChunk1 = new Chunk("Empresa 'KC_LIBROS'", subtitleFont);
                Chunk companyChunk2 = new Chunk("Av. Principal 123 - Lima", subtitleFont);
                Chunk companyChunk3 = new Chunk("Teléfono: 123456789", subtitleFont);

                companyInfo.add(companyChunk1);
                companyInfo.add(Chunk.NEWLINE);
                companyInfo.add(companyChunk2);
                companyInfo.add(Chunk.NEWLINE);
                companyInfo.add(companyChunk3);

                companyInfoCell.addElement(companyInfo);
                companyInfoCell.setHorizontalAlignment(Element.ALIGN_CENTER); // Centrar el contenido horizontalmente
                companyInfoCell.setVerticalAlignment(Element.ALIGN_MIDDLE); // Centrar el contenido verticalmente
                table.addCell(companyInfoCell);

                // Agregar la tabla al documento
                document.add(table);

                document.add(Chunk.NEWLINE);
            } catch (Exception e) {
                e.printStackTrace();
            }




            
            
            document.addTitle("Boleta de Pago");
            document.addAuthor("Tu Nombre");

       

        

            
       
            
            // Agregar los datos del cliente
            Paragraph customerInfo = new Paragraph();
            customerInfo.setAlignment(Element.ALIGN_LEFT);
            customerInfo.setSpacingBefore(20f);

            Chunk customerChunk2 = new Chunk("Fecha: 1 de julio de 2023", dataFont);

            customerInfo.add(Chunk.NEWLINE);
            customerInfo.add(customerChunk2);

            document.add(customerInfo);

            // Agregar los datos de los productos al PDF
            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100);
            table.setSpacingBefore(20f);
            table.setSpacingAfter(20f);

            // Agregar encabezados de columna
            PdfPCell headerCell1 = new PdfPCell(new Phrase("#", dataFont));
            headerCell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerCell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
            table.addCell(headerCell1);

            PdfPCell headerCell2 = new PdfPCell(new Phrase("Producto", dataFont));
            headerCell2.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerCell2.setBackgroundColor(BaseColor.LIGHT_GRAY);
            table.addCell(headerCell2);

            PdfPCell headerCell3 = new PdfPCell(new Phrase("Precio", dataFont));
            headerCell3.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerCell3.setBackgroundColor(BaseColor.LIGHT_GRAY);
            table.addCell(headerCell3);

            PdfPCell headerCell4 = new PdfPCell(new Phrase("Cantidad", dataFont));
            headerCell4.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerCell4.setBackgroundColor(BaseColor.LIGHT_GRAY);
            table.addCell(headerCell4);

            // Agregar filas de datos
            int contador = 1;
            for (CarritoItem item : carritoItems) {
                PdfPCell dataCell1 = new PdfPCell(new Phrase(String.valueOf(contador), dataFont));
                dataCell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(dataCell1);

                PdfPCell dataCell2 = new PdfPCell(new Phrase(item.getNombre(), dataFont));
                dataCell2.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(dataCell2);

                PdfPCell dataCell3 = new PdfPCell(new Phrase("S/ " + item.getPrecio(), dataFont));
                dataCell3.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(dataCell3);

                PdfPCell dataCell4 = new PdfPCell(new Phrase(String.valueOf(item.getCantidad()), dataFont));
                dataCell4.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(dataCell4);

                contador++;
            }

            document.add(table);

            // Crear una tabla para el total a pagar
            PdfPTable totalTable = new PdfPTable(2);
            totalTable.setWidthPercentage(40);
            totalTable.setHorizontalAlignment(Element.ALIGN_RIGHT);

            // Agregar etiqueta "Total a pagar" a la izquierda
            PdfPCell labelCell = new PdfPCell(new Phrase("Total pagado:", dataFont));
            labelCell.setBorder(Rectangle.NO_BORDER);
            labelCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            labelCell.setPaddingTop(7f); // Espacio inferior
            labelCell.setBackgroundColor(BaseColor.YELLOW);
            totalTable.addCell(labelCell);

            // Agregar el monto total pagado al PDF en una celda con formato personalizado
            PdfPCell totalCell = new PdfPCell();
            totalCell.setBorder(Rectangle.BOX); // Establecer el borde como una caja
            totalCell.setBorderColor(BaseColor.BLACK); // Color de borde negro

            Font totalFontf = FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, BaseColor.RED);
            Paragraph totalParagraph = new Paragraph("S/ " + totalPagar, totalFontf);
            totalParagraph.setAlignment(Element.ALIGN_CENTER); // Alinear el texto al centro
            totalParagraph.setSpacingAfter(10f); // Espacio inferior
            totalParagraph.setPaddingTop(5f); // Espacio superior
            labelCell.setPaddingRight(7f); // Espacio inferior
            totalCell.addElement(totalParagraph);

            totalTable.addCell(totalCell);

            // Ajustar la altura de la celda del precio para que coincida con la celda de la etiqueta
            totalCell.setFixedHeight(labelCell.getHeight());

            // Agregar la tabla del total al documento
            document.add(totalTable);

            document.close();

            // Configurar la respuesta HTTP para mostrar el PDF en una nueva pestaña
            response.setContentType("application/pdf");
            response.setContentLength(baos.size());
            response.setHeader("Content-Disposition", "inline; filename=carrito.pdf");

            // Enviar el contenido del PDF al navegador
            ServletOutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();

        } catch (DocumentException e) {
            e.printStackTrace();
            response.sendRedirect("Principal.jsp");
        }
    }

}
