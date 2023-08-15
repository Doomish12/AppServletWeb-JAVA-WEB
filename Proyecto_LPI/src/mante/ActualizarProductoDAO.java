package mante;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.DatabaseUtil;

public class ActualizarProductoDAO {
    public static boolean actualizarProducto(int id, String nombre, InputStream imagen, String descripcion, double precio, int cantidad) {
        Connection connection = null;
        PreparedStatement statement = null;
        boolean success = false;

        try {
            connection = DatabaseUtil.getConnection();
            String query = "UPDATE productos SET nombre = ?, imagen = ?, descripcion = ?, precio = ?, cantidad= ? WHERE id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, nombre);
            statement.setBlob(2, imagen);
            statement.setString(3, descripcion);
            statement.setDouble(4, precio);
            statement.setInt(5, cantidad);
            statement.setInt(6, id);

            int rowsUpdated = statement.executeUpdate();
            success = (rowsUpdated > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DatabaseUtil.closeResources(connection, statement);
        }

        return success;
    }
}

