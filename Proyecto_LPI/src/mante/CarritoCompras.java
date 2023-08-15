package mante;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DatabaseUtil;

public class CarritoCompras {

    public static void insertarProducto(int productId, int cantidad, String imagen, String nombre, double precio) {
        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement statement = conn.prepareStatement(
                        "INSERT INTO carrito (productId, imagen, nombre, cantidad, precio) VALUES (?, ?, ?, ?, ?)")) {
            statement.setInt(1, productId);
            statement.setString(2, imagen);
            statement.setString(3, nombre);
            statement.setInt(4, cantidad);
            statement.setDouble(5, precio);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void eliminarProducto(int productId) {
        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement statement = conn.prepareStatement("DELETE FROM carrito WHERE productId = ?")) {
            statement.setInt(1, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void actualizarCantidadProducto(int productId, int cantidad) {
        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement statement = conn
                        .prepareStatement("UPDATE carrito SET cantidad = ? WHERE productId = ?")) {
            statement.setInt(1, cantidad);
            statement.setInt(2, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void actualizarPrecioProducto(int productId, double precio) {
        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement statement = conn
                        .prepareStatement("UPDATE carrito SET precio = ? WHERE productId = ?")) {
            statement.setDouble(1, precio);
            statement.setInt(2, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static double getPrecioProducto(int productId) {
        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement statement = conn
                        .prepareStatement("SELECT precio FROM carrito WHERE productId = ?")) {
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getDouble("precio");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
    
    public static void actualizarCantidadCarrito(int productId, int cantidad) {
        try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement statement = conn
                        .prepareStatement("UPDATE carrito SET cantidad = cantidad + ? WHERE productId = ?")) {
            statement.setInt(1, cantidad);
            statement.setInt(2, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static Integer getCantidadProducto(int productId) {
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement("SELECT cantidad FROM carrito WHERE productId = ?")) {
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("cantidad");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Retornar null si el producto no existe en el carrito
    }


}
