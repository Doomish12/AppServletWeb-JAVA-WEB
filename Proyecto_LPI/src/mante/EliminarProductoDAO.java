package mante;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import utils.DatabaseUtil;

public class EliminarProductoDAO {
    public static boolean eliminarProducto(int codigo) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            String sql = "DELETE FROM productos WHERE id = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, codigo);
            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
        	DatabaseUtil.closeConnection(conn);
        	DatabaseUtil.closeStatement(pstmt);
        }
    }
}

