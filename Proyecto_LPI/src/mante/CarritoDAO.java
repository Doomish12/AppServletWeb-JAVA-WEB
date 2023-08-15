package mante;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelos.CarritoItem;
import utils.DatabaseUtil;

public class CarritoDAO {
    private String url = "jdbc:mysql://localhost/libreria?useSSL=false&useTimezone=tarue&serverTimezone=UTC";
    private String user = "root";
    private String password = "MySQL123$";

    public List<CarritoItem> getCarritoItems() {
        List<CarritoItem> carritoItems = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            
            // Consulta SQL
            String sql = "SELECT * FROM carrito";
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int productId = resultSet.getInt("productId");
                Blob imagen = resultSet.getBlob("imagen");
                String nombre = resultSet.getString("nombre");
                int cantidad = resultSet.getInt("cantidad");
                double precio = resultSet.getDouble("precio");

                CarritoItem item = new CarritoItem(id, productId, imagen, nombre, cantidad, precio);
                carritoItems.add(item);
            }
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return carritoItems;
    }
    
    public boolean eliminarProducto(int productId) {
        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement statement = conn.prepareStatement("DELETE FROM carrito WHERE productId = ?")) {
            statement.setInt(1, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }


}
