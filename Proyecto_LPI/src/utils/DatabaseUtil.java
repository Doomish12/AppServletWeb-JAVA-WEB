package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseUtil {
    private static final String DB_URL = "jdbc:mysql://localhost/libreria?useSSL=false&useTimezone=true&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "MySQL123$";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

	public static void closeStatement(Statement stmt) {
		// TODO Auto-generated method stub
		
	}

	public static void closeResultSet(ResultSet rs) {
		// TODO Auto-generated method stub
		
	}

	public static void closeResources(Connection connection, PreparedStatement statement) {
		// TODO Auto-generated method stub
		
	}

	public static void close(Connection conn, PreparedStatement statement) {
		// TODO Auto-generated method stub
		
	}
}
