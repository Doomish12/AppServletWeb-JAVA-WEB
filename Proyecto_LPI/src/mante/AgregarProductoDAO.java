package mante;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import utils.DatabaseUtil;

public class AgregarProductoDAO {
    public static boolean agregarProducto(String nombre, InputStream imagenInputStream, String descripcion, double precio, int cantidad) {
        Connection conn = null;
        PreparedStatement statement = null;
        boolean success = false;

        try {
            conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO productos (nombre, imagen, descripcion, precio,cantidad) VALUES (?, ?, ?, ?,?)";
            statement = conn.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setBlob(2, imagenInputStream);
            statement.setString(3, descripcion);
            statement.setDouble(4, precio);
            statement.setInt(5, cantidad);
            int rowsInserted = statement.executeUpdate();

            success = (rowsInserted > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.closeStatement(statement);
            DatabaseUtil.closeConnection(conn);
        }

        return success;
    }
    
    
   
    
}

